"""Generate the kernel-proved canonical Haagerup checkpoint modules.

Agent-ID: codex-aa04. Inputs are tracked certificate.json and CanonicalData.lean.
All arithmetic below uses exact Python integers and fractions. The generated
Lean equalities still require proof: generation or --check is not a Lean audit.
No external packages, native prover, or scratch/preflight artifacts are used.
"""
from fractions import Fraction as Q
from pathlib import Path
from textwrap import dedent
import argparse
import json
import re

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "data/haagerup-resolvent/certificate.json"
PARAMETERS = ROOT / "Grothe/Haagerup/CanonicalData.lean"
RELATIVE_DIR = Path("Grothe/Haagerup/CanonicalTrace")
NAMESPACE = "Grothe.HaagerupCanonical.Trace"
MODULE_PREFIX = "Grothe.Haagerup.CanonicalTrace"
FINAL_NAMES = ("coefficient_check", "completed_check", "seed_check", "defect_check")
CONV_BLOCK_SIZE = 5
CONV_BLOCK_THRESHOLD = 2000
NUMERIC_MODULES = 16
WEIGHTED_CAP = Q(10**13)
D = 2**128
ZERO = (0, 0)


def require(condition, message):
    if not condition:
        raise ValueError(message)


def parse_parameters(source):
    """Read the concrete recipe, refusing unsupported structural changes."""
    def parameter(name, typ):
        found = re.findall(r"^def " + name + " : " + typ + r" := ([0-9 /]+)$", source, re.M)
        require(len(found) == 1, f"expected one literal {name} parameter")
        return Q(found[0].replace(" ", ""))

    values = {name: parameter(name, "ℕ") for name in ("start", "order", "cutoff")}
    for name in ("prefixCap", "remainderCap"):
        values[name] = parameter(name, "ℚ")
    for name, expected in (("start", 64), ("order", 10), ("cutoff", 165)):
        require(values[name] == expected,
                f"generator recipe requires {name}={expected}; found {values[name]}")
    require(values["prefixCap"] > 0, "prefixCap must be positive")
    return values


def ofq(q):
    """Outward interval for q at the kernel's 128-bit scale."""
    scaled = Q(q) * D
    return (scaled.numerator // scaled.denominator,
            -((-scaled.numerator) // scaled.denominator))


def neg(interval):
    return -interval[1], -interval[0]


def add(left, right):
    """Match addL, retaining its exact zero-padding convention."""
    out = []
    for i in range(max(len(left), len(right))):
        a = left[i] if i < len(left) else ZERO
        b = right[i] if i < len(right) else ZERO
        out.append((a[0] + b[0], a[1] + b[1]))
    return out


def mul(a, b):
    products = [x * y for x in a for y in b]
    return min(products) // D, -((-max(products)) // D)


def conv(left, right):
    """Exact convI order, including its zero coefficients for an empty RHS."""
    out = []
    for coefficient in reversed(left):
        shifted = [ZERO] + out
        out = shifted if coefficient == ZERO else add(
            [mul(coefficient, value) for value in right], shifted)
    return out


def conv_with_tail(left, right, tail):
    """The exact convI recursion with a literal result for the unprocessed suffix."""
    out = list(tail)
    for coefficient in reversed(left):
        shifted = [ZERO] + out
        out = shifted if coefficient == ZERO else add(
            [mul(coefficient, value) for value in right], shifted)
    return out


def norm(intervals):
    return sum(max(-lo, hi, 0) for lo, hi in intervals)


def render_blocks(data, parameters):
    """Build declaration blocks with all literal values derived from inputs."""
    require(data["seed_power"] == 17, "generator recipe requires seed_power=17")
    start, order, cutoff = (int(parameters[name]) for name in ("start", "order", "cutoff"))
    require(start == 64 and order == 10, "combined-seed budget requires start=64 and order=10")
    seed_power = data["seed_power"]
    last_coefficient = start + order
    pl = [Q(value) for value in data["P"]]
    rl = [Q(value) for value in data["R"]]
    # Match gen_haagerup_power.py's canonical R list exactly.
    while rl and rl[-1] == 0:
        rl.pop()
    require(len(pl) == 21 and len(rl) == 65,
            "generator recipe requires the current 21/65 coefficient list lengths")
    p, r = [ofq(q) for q in pl], [ofq(q) for q in rl]
    a = [ZERO] + conv(p, p)
    y = list(map(neg, conv(r, a)))
    coeff = [Q(1)]
    for k in range(last_coefficient):
        coeff.append(coeff[-1] * Q((2*k+1)**2, 4*(k+1)*(k+2)))
    delta = {(0, k): coeff[k] for k in range(start, last_coefficient + 1)}
    for j in range(1, order + 1):
        for k in range(start, last_coefficient + 1 - j):
            delta[j, k] = delta[j-1, k] - delta[j-1, k+1]
    ds = [delta[j, start] for j in range(order + 1)]
    corr = {order: []}
    for j in range(order - 1, -1, -1):
        corr[j] = add([ofq(ds[j])], conv(y, corr[j+1]))[:cutoff]
    head = {start: conv(r, corr[0])}
    for k in range(start - 1, -1, -1):
        head[k] = add([ofq(coeff[k])], conv(a, head[k+1]))[:cutoff]
    completed = conv(p, head[0])
    power = {0: [ofq(1)]}
    for n in range(1, seed_power + 1):
        power[n] = conv(p, power[n-1])
    seed_product = conv(r, power[seed_power])
    inverse_d = add([ofq(1)], list(map(neg, a)))
    inverse_product = conv(r, inverse_d)
    defect = add([ofq(1)], list(map(neg, inverse_product)))
    require(len(a) == 2 * len(p) and len(head[0]) == cutoff and
            len(completed) == len(p) + cutoff - 1, "unexpected interval-list shape")
    require(norm(add(completed, [neg(ofq(pl[0]))])) <= ofq(parameters["prefixCap"])[0],
            "completed prefix exceeds prefixCap")
    require(norm(seed_product) <= ofq(data["seed_cap"])[0], "seed exceeds seed_cap")
    require(norm(defect) <= ofq(data["defect_cap"])[0], "inverse defect exceeds defect_cap")
    weighted_budget = (Q(21, 20)*sum(abs(c)*Q(5, 3)**j for j, c in enumerate(coeff[:start])) +
                       9*Q(21, 20)*Q(5, 3)**start*sum(abs(d)*15**j for j, d in enumerate(ds[:order])) + 1)
    eta = Q(data["defect_cap"])
    remainder_budget = (Q(1,16)*ds[order] + eta*sum(ds[:order]))/(1-eta)
    require(weighted_budget <= WEIGHTED_CAP, "weighted completion budget exceeds cap")
    require(remainder_budget <= parameters["remainderCap"], "alternating remainder budget exceeds cap")

    sections = {"core": [], "bindings": [], "checks": []}
    section = "core"
    progress_count = 0

    def emit(source):
        sections[section].append(source.strip() + "\n\n")

    def progress(label):
        nonlocal progress_count
        progress_count += 1
        emit(f'''run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace {progress_count}: reached {label}"
  out.flush''')

    def rat_literal(value):
        value = Q(value)
        numerator = f"({value.numerator} : Rat)"
        return numerator if value.denominator == 1 else f"{numerator} / {value.denominator}"

    def interval_def(name, values):
        require(all(lo <= hi for lo, hi in values), f"invalid interval in {name}")
        body = ",\n".join(f"  ⟨{lo}, {hi}⟩" for lo, hi in values)
        emit(f"def {name} : List Ival := [\n{body}]" if values else
             f"def {name} : List Ival := []")

    def rat_def(name, value):
        emit(f"def {name} : Rat := {rat_literal(value)}")

    def rat_list_def(name, values):
        emit(f"def {name} : List Rat := [\n  " + ",\n  ".join(map(rat_literal, values)) + "]")

    def lemma(name, typ, proof="decide +kernel", report=True):
        indent = "\n".join("  " + line for line in proof.splitlines())
        emit(f"theorem {name} :\n    {typ} := by\n{indent}")
        if report:
            progress(name)

    def convolution_lemma(name, typ, left_name, right_name, left, right):
        """Bound each kernel computation to five left coefficients without regrouping arithmetic."""
        if len(left) * len(right) <= CONV_BLOCK_THRESHOLD:
            lemma(name, typ)
            return
        stem = name + "_conv"
        chunks = [left[i:i + CONV_BLOCK_SIZE] for i in range(0, len(left), CONV_BLOCK_SIZE)]
        count = len(chunks)
        states = {count: []}
        for i in range(count - 1, -1, -1):
            states[i] = conv_with_tail(chunks[i], right, states[i + 1])
        require(states[0] == conv(left, right), "blocked convolution changed exact arithmetic")
        emit(f"def {stem}_suffix{count} : List Ival := []")
        interval_def(f"{stem}_result{count}", [])
        lemma(f"{stem}_suffixEq{count}",
              f"convI {stem}_suffix{count} {right_name} = {stem}_result{count}",
              "rfl", report=False)
        for i in range(count - 1, -1, -1):
            interval_def(f"{stem}_block{i}", chunks[i])
            emit(f"def {stem}_suffix{i} : List Ival := {stem}_block{i} ++ {stem}_suffix{i+1}")
            interval_def(f"{stem}_result{i}", states[i])
            lemma(f"{stem}_blockStep{i}",
                  f"convWithTail {stem}_block{i} {right_name} {stem}_result{i+1} = {stem}_result{i}",
                  report=False)
            # Keep this local progress command inside its declaration block so
            # the stable primary/helper grouping does not change.
            sections[section][-1] += (
                'run_cmd do\n  let out ← IO.getStdout\n'
                f'  out.putStrLn "Canonical convolution: reached {stem}_blockStep{i}"\n'
                '  out.flush\n\n')
            lemma(f"{stem}_suffixEq{i}",
                  f"convI {stem}_suffix{i} {right_name} = {stem}_result{i}",
                  f"exact convBlockGlue {stem}_suffixEq{i+1} {stem}_blockStep{i}",
                  report=False)
        lemma(f"{stem}_input", f"{left_name} = {stem}_suffix0", report=False)
        lemma(f"{stem}_eq", f"convI {left_name} {right_name} = {stem}_result0",
              f"exact (congrArg (fun left => convI left {right_name}) {stem}_input).trans {stem}_suffixEq0",
              report=False)
        lemma(name, typ, f"rw [{stem}_eq] <;> decide +kernel")

    emit(dedent('''
    deriving instance DecidableEq for Ival

    theorem auxiliaryGlue {n k : Nat} {r s : Rat} {rs : List Rat}
        (hs : r * (((2*k+1)^2 : Nat) : Rat) / ((4*(k+1)*(k+2) : Nat) : Rat) = s)
        (h : haagAux n (k+1) s = rs) :
        haagAux (n+1) k r = r :: rs := by
      rw [haagAux, hs, h]

    theorem correctionGlue {N : Nat} {Y : List Ival} {r : Rat}
        {rs : List Rat} {s t : List Ival}
        (h : hornerI N Y rs = s)
        (hs : (addL [ofRatI r] (convI Y s)).take N = t) :
        hornerI N Y (r :: rs) = t := by
      rw [hornerI, h]
      exact hs

    theorem headGlue {N : Nat} {Y tail : List Ival} {r : Rat}
        {rs : List Rat} {s t : List Ival}
        (h : hornerWithTailI N Y tail rs = s)
        (hs : (addL [ofRatI r] (convI Y s)).take N = t) :
        hornerWithTailI N Y tail (r :: rs) = t := by
      rw [hornerWithTailI, h]
      exact hs

    theorem powerGlue {p s t : List Ival} {n : Nat}
        (h : polyPowI p n = s) (hs : convI p s = t) :
        polyPowI p (n+1) = t := by
      rw [polyPowI, h]
      exact hs'''))
    progress("core_glue")

    for k, value in enumerate(coeff):
        rat_def(f"c{k}", value)
    lemma("one_eq_c0", "(1 : Rat) = c0", report=False)
    for k in range(last_coefficient):
        lemma(f"coefficientStep{k}",
              f"c{k} * (((2*{k}+1)^2 : Nat) : Rat) / ((4*({k}+1)*({k}+2) : Nat) : Rat) = c{k+1}")
    emit(f"def weights{start} : List Rat := []")
    for k in range(start - 1, -1, -1):
        emit(f"def weights{k} : List Rat := c{k} :: weights{k+1}")
    lemma(f"auxiliaryEq{start}", f"haagAux 0 {start} c{start} = weights{start}", "rfl", report=False)
    for k in range(start - 1, -1, -1):
        lemma(f"auxiliaryEq{k}", f"haagAux {start-k} {k} c{k} = weights{k}",
              f"exact auxiliaryGlue coefficientStep{k} auxiliaryEq{k+1}", report=False)
    lemma("weights_core", f"haagList {start} = weights0",
          f"change haagAux {start} 0 1 = weights0\n"
          f"exact (congrArg (haagAux {start} 0) one_eq_c0).trans auxiliaryEq0")
    lemma("weights_take", f"weights0.take {start} = weights0", "rfl", report=False)
    for k in range(start, last_coefficient + 1):
        emit(f"def d0_{k} : Rat := c{k}")
    for j in range(1, order + 1):
        for k in range(start, last_coefficient + 1 - j):
            rat_def(f"d{j}_{k}", delta[j, k])
            lemma(f"differenceStep{j}_{k}", f"d{j-1}_{k} - d{j-1}_{k+1} = d{j}_{k}", report=False)
        progress(f"difference_order_{j}")
    emit(f"def correctionWeights{order} : List Rat := []")
    for j in range(order - 1, -1, -1):
        emit(f"def correctionWeights{j} : List Rat := d{j}_{start} :: correctionWeights{j+1}")
    def horner_majorant(radius, names):
        result = "0"
        for name in reversed(names):
            result = f"(Rat.abs {name} + ({radius})*({result}))"
        return result

    head_majorant = horner_majorant("5/3", [f"c{k}" for k in range(start)])
    difference_majorant = horner_majorant("15", [f"d{j}_{start}" for j in range(order)])
    weighted_literal = (f"(21/20)*{head_majorant} + "
                        f"(9*((21/20)*(5/3)^{start}))*{difference_majorant} + 1")
    remainder_sum = " + ".join(f"d{j}_{start}" for j in range(order))
    remainder_literal = f"((1/16)*d{order}_{start} + defectCapQ*({remainder_sum}))/(1-defectCapQ)"
    lemma("weighted_literal_ok", f"{weighted_literal} ≤ 10^13")

    rat_list_def("plQ", pl)
    rat_list_def("rlQ", rl)
    rat_def("slopeQ", pl[0])
    rat_def("prefixCapQ", parameters["prefixCap"])
    rat_def("seedCapQ", data["seed_cap"])
    rat_def("defectCapQ", data["defect_cap"])
    lemma("remainder_literal_ok", f"{remainder_literal} ≤ {parameters['remainderCap']}")
    for name, values in (("pI", p), ("rI", r), ("ratioA", a), ("ratioY", y)):
        interval_def(name, values)
    lemma("p_interval_eq", "plQ.map ofRatI = pI")
    lemma("r_interval_eq", "rlQ.map ofRatI = rI")
    convolution_lemma("ratioA_step", "zeroI :: convI pI pI = ratioA", "pI", "pI", p, p)
    convolution_lemma("ratioY_step", "(convI rI ratioA).map negI = ratioY", "rI", "ratioA", r, a)
    interval_def(f"correction{order}", corr[order])
    lemma(f"correctionEq{order}",
          f"hornerI {cutoff} ratioY correctionWeights{order} = correction{order}", "rfl", report=False)
    for j in range(order - 1, -1, -1):
        interval_def(f"correction{j}", corr[j])
        convolution_lemma(f"correctionStep{j}",
              f"(addL [ofRatI d{j}_{start}] (convI ratioY correction{j+1})).take {cutoff} = correction{j}",
              "ratioY", f"correction{j+1}", y, corr[j+1])
        lemma(f"correctionEq{j}", f"hornerI {cutoff} ratioY correctionWeights{j} = correction{j}",
              f"exact correctionGlue correctionEq{j+1} correctionStep{j}", report=False)
    interval_def("tailI", head[start])
    convolution_lemma("tail_step", "convI rI correction0 = tailI", "rI", "correction0", r, corr[0])
    emit(f"def head{start} : List Ival := tailI")
    lemma(f"headEq{start}",
          f"hornerWithTailI {cutoff} ratioA tailI weights{start} = head{start}", "rfl", report=False)
    for k in range(start - 1, -1, -1):
        interval_def(f"head{k}", head[k])
        convolution_lemma(f"headStep{k}",
              f"(addL [ofRatI c{k}] (convI ratioA head{k+1})).take {cutoff} = head{k}",
              "ratioA", f"head{k+1}", a, head[k+1])
        lemma(f"headEq{k}", f"hornerWithTailI {cutoff} ratioA tailI weights{k} = head{k}",
              f"exact headGlue headEq{k+1} headStep{k}", report=False)
    interval_def("completedI", completed)
    convolution_lemma("final_step", "convI pI head0 = completedI", "pI", "head0", p, head[0])
    lemma("completed_literal_ok",
          "decide (absSum (addL completedI [negI (ofRatI slopeQ)]) ≤ ofRatLo prefixCapQ) = true")

    interval_def("power0", power[0])
    lemma("powerEq0", "polyPowI pI 0 = power0")
    for n in range(1, seed_power + 1):
        interval_def(f"power{n}", power[n])
        convolution_lemma(f"powerStep{n}", f"convI pI power{n-1} = power{n}",
              "pI", f"power{n-1}", p, power[n-1])
        lemma(f"powerEq{n}", f"polyPowI pI {n} = power{n}",
              f"exact powerGlue powerEq{n-1} powerStep{n}", report=False)
    interval_def("seedI", seed_product)
    convolution_lemma("seed_product_step", f"convI rI power{seed_power} = seedI",
                      "rI", f"power{seed_power}", r, power[seed_power])
    lemma("seed_literal_ok", "decide (absSum seedI ≤ ofRatLo seedCapQ) = true")
    for name, values in (("inverseD", inverse_d), ("inverseProduct", inverse_product), ("defectI", defect)):
        interval_def(name, values)
    lemma("inverseD_step", "addL [ofRatI 1] (ratioA.map negI) = inverseD")
    convolution_lemma("inverseProduct_step", "convI rI inverseD = inverseProduct", "rI", "inverseD", r, inverse_d)
    lemma("defect_step", "addL [ofRatI 1] (inverseProduct.map negI) = defectI")
    lemma("defect_literal_ok", "decide (absSum defectI ≤ ofRatLo defectCapQ) = true")

    section = "bindings"
    emit(dedent('''
    theorem rat_abs_binding (q : Rat) : |q| = Rat.abs q := by
      unfold Rat.abs
      split_ifs with h
      · exact abs_of_nonneg h
      · exact abs_of_nonpos (le_of_not_ge h)

    theorem coefficientGlue {k : Nat} {r s : Rat}
        (h : Grothe.haagR k = r)
        (hs : r * (((2*k+1)^2 : Nat) : Rat) / ((4*(k+1)*(k+2) : Nat) : Rat) = s) :
        Grothe.haagR (k+1) = s := by
      rw [Grothe.haagR, h, hs]

    theorem differenceGlue {m k : Nat} {u v w : Rat}
        (hu : iterDiff m Grothe.haagR k = u)
        (hv : iterDiff m Grothe.haagR (k+1) = v)
        (hw : u-v = w) : iterDiff (m+1) Grothe.haagR k = w := by
      rw [iterDiff_succ_apply, hu, hv, hw]'''))
    progress("source_glue")
    lemma("coefficientEq0", "Grothe.haagR 0 = c0", "exact one_eq_c0", report=False)
    for k in range(last_coefficient):
        lemma(f"coefficientEq{k+1}", f"Grothe.haagR {k+1} = c{k+1}",
              f"exact coefficientGlue coefficientEq{k} coefficientStep{k}", report=False)
    progress("coefficient_bindings")
    lemma("weights_binding", "haagList Grothe.HaagerupCanonical.start = weights0",
          f"change haagList {start} = weights0\nexact weights_core")
    for k in range(start, last_coefficient + 1):
        lemma(f"differenceEq0_{k}", f"iterDiff 0 Grothe.haagR {k} = d0_{k}",
              f"exact coefficientEq{k}", report=False)
    for j in range(1, order + 1):
        for k in range(start, last_coefficient + 1 - j):
            lemma(f"differenceEq{j}_{k}", f"iterDiff {j} Grothe.haagR {k} = d{j}_{k}",
                  f"exact differenceGlue differenceEq{j-1}_{k} differenceEq{j-1}_{k+1} differenceStep{j}_{k}",
                  report=False)
    progress("difference_bindings")
    iter_list = ", ".join(f"iterDiff {j} Grothe.haagR {start}" for j in range(order))
    diff_rules = ", ".join(f"differenceEq{j}_{start}" for j in range(order))
    lemma("differences_binding", "Grothe.HaagerupCanonical.differences = correctionWeights0",
          f"change [{iter_list}] = correctionWeights0\nrw [{diff_rules}]\nrfl")
    lemma("pl_binding", "Grothe.HaagerupPower.pl = plQ")
    lemma("rl_binding", "Grothe.HaagerupPower.rl = rlQ")
    lemma("p_binding", "Grothe.HaagerupPower.pl.map ofRatI = pI",
          "exact (congrArg (List.map ofRatI) pl_binding).trans p_interval_eq", report=False)
    lemma("r_binding", "Grothe.HaagerupPower.rl.map ofRatI = rI",
          "exact (congrArg (List.map ofRatI) rl_binding).trans r_interval_eq", report=False)
    lemma("slope_binding", "Grothe.HaagerupPower.slope = slopeQ")
    lemma("prefixCap_binding", "Grothe.HaagerupCanonical.prefixCap = prefixCapQ")
    lemma("seedCap_binding", "Grothe.HaagerupPower.seedCap = seedCapQ")
    lemma("defectCap_binding", "Grothe.HaagerupPower.defectCap = defectCapQ")
    lemma("completed_binding",
          "completedHeadI Grothe.HaagerupCanonical.cutoff Grothe.HaagerupCanonical.start\n"
          "      Grothe.HaagerupPower.pl Grothe.HaagerupPower.rl\n"
          "      (haagList Grothe.HaagerupCanonical.start) Grothe.HaagerupCanonical.differences = completedI",
          "rw [weights_binding, differences_binding]\n"
          f"change completedHeadI {cutoff} {start} Grothe.HaagerupPower.pl Grothe.HaagerupPower.rl\n"
          "  weights0 correctionWeights0 = completedI\n"
          "simp only [completedHeadI, p_binding, r_binding, ratioA_step, ratioY_step,\n"
          "  weights_take, correctionEq0, tail_step, headEq0, final_step]")
    lemma("seed_binding",
          "convI (Grothe.HaagerupPower.rl.map ofRatI)\n"
          "      (polyPowI (Grothe.HaagerupPower.pl.map ofRatI) Grothe.HaagerupPower.seedPower) = seedI",
          f"simp only [p_binding, r_binding, Grothe.HaagerupPower.seedPower, powerEq{seed_power}, seed_product_step]")
    lemma("defect_binding", "resolventDefectI Grothe.HaagerupPower.pl Grothe.HaagerupPower.rl = defectI",
          "simp only [resolventDefectI, p_binding, r_binding, ratioA_step, inverseD_step,\n"
          "  inverseProduct_step, defect_step]")

    section = "checks"
    lemma("coefficient_check",
          "Grothe.HaagerupCanonical.weightedBudget ≤ 10^13 ∧\n"
          "      Grothe.HaagerupCanonical.remainderBudget ≤ Grothe.HaagerupCanonical.remainderCap",
          "constructor\n"
          "· unfold Grothe.HaagerupCanonical.weightedBudget\n"
          "  rw [weights_binding, differences_binding]\n"
          "  simpa only [Grothe.HaagerupCanonical.majorantQ, Grothe.HaagerupCanonical.start,\n"
          "    " + ", ".join([f"weights{k}" for k in range(start+1)] +
                            [f"correctionWeights{j}" for j in range(order+1)]) +
          ", rat_abs_binding] using weighted_literal_ok\n"
          "· unfold Grothe.HaagerupCanonical.remainderBudget\n"
          "  simp only [Grothe.HaagerupCanonical.order, Grothe.HaagerupCanonical.start,\n"
          "    Finset.sum_range_succ, Finset.sum_range_zero, zero_add,\n"
          f"    {diff_rules}, differenceEq{order}_{start}, defectCap_binding]\n"
          "  exact remainder_literal_ok")
    emit("#print axioms coefficient_check")
    lemma("completed_check",
          "completedHeadOK Grothe.HaagerupCanonical.cutoff Grothe.HaagerupCanonical.start\n"
          "      Grothe.HaagerupPower.pl Grothe.HaagerupPower.rl (haagList Grothe.HaagerupCanonical.start)\n"
          "      Grothe.HaagerupCanonical.differences Grothe.HaagerupPower.slope\n"
          "      Grothe.HaagerupCanonical.prefixCap = true",
          "unfold completedHeadOK\nrw [completed_binding, slope_binding, prefixCap_binding]\n"
          "exact completed_literal_ok")
    emit("#print axioms completed_check")
    lemma("seed_check",
          "seedNormOK Grothe.HaagerupPower.pl Grothe.HaagerupPower.rl\n"
          "      Grothe.HaagerupPower.seedPower Grothe.HaagerupPower.seedCap = true",
          "unfold seedNormOK\nrw [seed_binding, seedCap_binding]\nexact seed_literal_ok")
    emit("#print axioms seed_check")
    lemma("defect_check",
          "resolventNormOK Grothe.HaagerupPower.pl Grothe.HaagerupPower.rl Grothe.HaagerupPower.defectCap = true",
          "unfold resolventNormOK\nrw [defect_binding, defectCap_binding]\nexact defect_literal_ok")
    emit("#print axioms defect_check")
    return sections, progress_count


def render_convolution_module():
    """Core-only proof that continuation blocks preserve the original recursion."""
    return dedent('''
    import Grothe.Haagerup.CanonicalArithmetic

    /-!
    Agent-ID: codex-aa04. Exact continuation blocks for interval convolution.
    Regenerate with tools/gen_haagerup_canonical_check.py.
    -/

    namespace Grothe.HaagerupCanonical.Trace

    open GrotheKernel

    def convWithTail : List Ival → List Ival → List Ival → List Ival
      | [], _, tail => tail
      | a :: front, rhs, tail =>
        if a.lo == 0 && a.hi == 0 then
          zeroI :: convWithTail front rhs tail
        else
          addL (rhs.map (mulI a)) (zeroI :: convWithTail front rhs tail)

    theorem convI_append (front suffix rhs : List Ival) :
        convI (front ++ suffix) rhs =
          convWithTail front rhs (convI suffix rhs) := by
      induction front with
      | nil => rfl
      | cons a front ih =>
        exact congrArg (fun tail =>
          if a.lo == 0 && a.hi == 0 then zeroI :: tail
          else addL (rhs.map (mulI a)) (zeroI :: tail)) ih

    theorem convBlockGlue {front suffix rhs s t : List Ival}
        (h : convI suffix rhs = s) (hs : convWithTail front rhs s = t) :
        convI (front ++ suffix) rhs = t :=
      (convI_append front suffix rhs).trans
        ((congrArg (convWithTail front rhs) h).trans hs)

    end Grothe.HaagerupCanonical.Trace
    ''').lstrip()


def render(data, parameters):
    """Separate literal data, independent arithmetic proofs, and recurrence assembly.

    A numerical equality uses only the literal definitions and generic interval
    operations. Its proof does not need any other numerical equality. Keeping
    these facts in sibling modules lets Lake check them concurrently; the cheap
    recurrence proofs are assembled after every numerical module is available.
    """
    sections, expected_progress = render_blocks(data, parameters)
    shared, numeric, assembly = [], [], []
    previous_owner = shared
    for block in sections["core"]:
        require("Grothe.HaagerupPower" not in block and "Grothe.haagR" not in block and
                "iterDiff" not in block and "Grothe.HaagerupCanonical." not in block,
                "arithmetic chunk depends on the analytic layer")
        if block.startswith("run_cmd do\n"):
            require(previous_owner, "progress marker has no preceding declaration")
            previous_owner[-1] += block
            continue
        if block.startswith("def ") or block.startswith("deriving instance "):
            previous_owner = shared
        elif re.search(r" := by\n  decide \+kernel\n", block):
            previous_owner = numeric
        else:
            require(block.startswith("theorem "), "unexpected arithmetic declaration block")
            previous_owner = assembly
        previous_owner.append(block)

    theorem_names = set(re.findall(r"^theorem (\w+)\b", "".join(sections["core"]), re.M))
    for block in numeric:
        names = re.findall(r"^theorem (\w+)\b", block, re.M)
        require(len(names) == 1, "a numeric block must contain exactly one theorem")
        references = set(re.findall(r"\b[A-Za-z_]\w*\b", block)) & theorem_names
        require(references <= set(names), "numeric proof depends on another proof")
    for block in shared:
        if block.startswith("def "):
            require(not (set(re.findall(r"\b[A-Za-z_]\w*\b", block)) & theorem_names),
                    "literal definition depends on a proof")

    # Estimate arithmetic work from the literal convolution dimensions. The
    # partition changes scheduling only: every declaration body is kept intact.
    lengths = {}
    for block in shared:
        literal = re.match(r"def (\w+) : List Ival := \[", block)
        if literal:
            lengths[literal.group(1)] = block.count("⟨")

    def work(block):
        products = re.findall(r"\b(?:convWithTail|convI) (\w+) (\w+)", block)
        return max([50] + [lengths.get(left, 1) * lengths.get(right, 1)
                           for left, right in products])

    numeric_groups = [[] for _ in range(NUMERIC_MODULES)]
    loads = [0] * NUMERIC_MODULES
    for index in sorted(range(len(numeric)), key=lambda i: (-work(numeric[i]), i)):
        target = min(range(NUMERIC_MODULES), key=lambda i: (loads[i], i))
        numeric_groups[target].append((index, numeric[index]))
        loads[target] += work(numeric[index])
    require(all(numeric_groups), "empty numerical proof module")
    numeric_groups = [[block for _, block in sorted(group)] for group in numeric_groups]

    output = {RELATIVE_DIR / "Convolution.lean": render_convolution_module()}

    def module(leaf, role, imports, blocks, analytic=False):
        opened = "open GrotheKernel" + (" Grothe.Upper.FiniteDifference" if analytic else "")
        header = "\n".join(f"import {name}" for name in imports + ["Lean.Elab.Command"]) + f'''

/-!
Agent-ID: codex-aa04. Literal checkpoints for the canonical Haagerup bound.
{role}
Regenerate with tools/gen_haagerup_canonical_check.py.

Each arithmetic step is proved from literal inputs and assembled through
the defining recurrences. Progress identifiers are stable across parallel modules.
-/

set_option Elab.async false
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace {NAMESPACE}

{opened}

'''
        output[RELATIVE_DIR / (leaf + ".lean")] = header + "".join(blocks) + f"end {NAMESPACE}\n"

    module("Shared", "Shared literal definitions and generic recurrence lemmas.",
           [MODULE_PREFIX + ".Convolution"], shared)
    for i, blocks in enumerate(numeric_groups):
        module(f"Numeric{i:02d}", "Independent kernel arithmetic; no other numerical module is imported.",
               [MODULE_PREFIX + ".Shared"], blocks)
    module("Assembly", "Assemble the independent equalities using the defining recurrences.",
           [f"{MODULE_PREFIX}.Numeric{i:02d}" for i in range(NUMERIC_MODULES)], assembly)
    module("Bindings", "Bind the arithmetic literals to the mathematical source definitions.",
           [MODULE_PREFIX + ".Assembly", "Grothe.Haagerup.CanonicalData"],
           sections["bindings"], analytic=True)
    module("Checks", "The four final checks, with every literal tied to the source data.",
           [MODULE_PREFIX + ".Bindings"], sections["checks"], analytic=True)

    rendered = "".join(output.values())
    declarations = re.findall(r"^(?:def|theorem) (\w+)", rendered, re.M)
    require(len(declarations) == len(set(declarations)), "duplicate declaration")
    progress = [int(n) for n in re.findall(r"Canonical trace (\d+):", rendered)]
    require(sorted(progress) == list(range(1, expected_progress + 1)), "progress identifiers changed")
    require(tuple(name for block in sections["checks"]
                  for name in re.findall(r"^theorem (\w+)", block, re.M)) == FINAL_NAMES,
            "unexpected final checker order")
    return output


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true",
                        help="compare generated modules byte-for-byte without writing")
    parser.add_argument("--output-dir", type=Path, default=ROOT,
                        help="root containing Grothe/Haagerup/CanonicalTrace (default: repository)")
    args = parser.parse_args(argv)
    try:
        data = json.loads(DATA.read_text(encoding="utf-8"))
        parameters = parse_parameters(PARAMETERS.read_text(encoding="utf-8"))
        output = render(data, parameters)
        destination = args.output_dir.resolve()
        found = {path.relative_to(destination) for path in (destination / RELATIVE_DIR).rglob("*.lean")}
        extra = found - set(output)
        require(not extra, "unexpected trace modules: " + ", ".join(str(p) for p in sorted(extra)))
        if args.check:
            stale = [str(name) for name, text in output.items()
                     if not (destination/name).is_file() or
                     (destination/name).read_bytes() != text.encode()]
            require(not stale, "generated canonical trace modules are missing/stale: " + ", ".join(stale))
            print(f"PASS byte-for-byte canonical trace modules ({len(output)})")
        else:
            (destination / RELATIVE_DIR).mkdir(parents=True, exist_ok=True)
            for name, text in output.items():
                path = destination / name
                content = text.encode("utf-8")
                if not path.is_file() or path.read_bytes() != content:
                    path.write_bytes(content)
            print(f"Wrote {len(output)} canonical trace modules under {destination / RELATIVE_DIR}")
    except (OSError, ValueError, KeyError, TypeError) as error:
        parser.exit(1, f"error: {error}\n")


if __name__ == "__main__":
    main()
