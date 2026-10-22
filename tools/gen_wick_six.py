"""Generate Grothe/LowerAnalytic/WickSix.lean (the sixth cumulant of a cubic chaos, `Chaos3.wick6`).

Two stages, because the per-term lemmas must follow the exact nesting order that `simp` produces
when it expands each tensor term:

  python3 tools/gen_wick_six.py forms scratch/WickSixForms.lean
  lake env lean scratch/WickSixForms.lean > /tmp/forms.txt
  python3 tools/gen_wick_six.py gen /tmp/forms.txt Grothe/LowerAnalytic/WickSix.lean

Stage `forms` writes a scratch file printing (`trace_state`) the expansion of the 43 terms
6^6 * (tensor term) (V, Q with one pairing of S, <D,U>, ||U||^2 and T3 with every choice of
pairings).  Stage `gen` parses each printed nested sum (the order of the nine summation indices and
the six kernel factors), reads off the multigraph (edge k joins the two factors containing the
k-th index), canonicalises it by brute force over vertex relabellings and emits
`w6term_*: 6^6 * term = gsum (phiC F) <canonical> []`, closed by `gsum_iso` (relabelling checked
by decide) and the macro `w6close`; the final theorem combines them with the moment theorems of
WickGraphData.lean.
"""
import sys, re, itertools

HEAD = 'import Grothe.LowerAnalytic.WickGraphData\n\n/-!\n# The sixth cumulant of a cubic chaos\n\n`Chaos3.wick6`: for a cubic chaos `F` with kernel `f = ∂³F/6` and a Gaussian expectation `E`,\n\n  `κ₆(F)/46656 = 135/2 T₃ − 20 V + 135/2 Q + 165/2 ⟨D, U⟩ + 45 ‖U‖²`,\n\nthe field `wick6` of `TensorFacts`.  The moments `E F²`, `E F⁴`, `E F⁶` are sums over closed\ncubic multigraphs (`wg2_moment`, `wg4_moment`, `wg6_moment` of `WickGraphData.lean`); the\ndisconnected graphs factor (`gsum_wg6_69`, …) and cancel in `κ₆`, leaving the six connected\ncubic multigraphs on six vertices (`wg6_72` … `wg6_77`) with the weights `45/2, 45, 15, 90, 60, 10`.\nOn the tensor side each of the five contractions is expanded through `S = (C₀ + C₁ + C₂)/3`\n(the three pairings `w6C` of `C`) into `1 + 3 + 3 + 9 + 27` multigraph sums (`w6term_*`): each is\nunfolded into the nested sum of the graph read off its index structure (`w6close`), and\nidentified with its canonical form by a `decide`-checked relabelling (`gsum_iso`).\n-/\n\nnamespace Grothe.LowerAnalytic\n\nopen MvPolynomial\n\nnoncomputable section\n\nvariable {ι : Type*} [Fintype ι]\n\n/-! ### The pairings of `S` -/\n\nsection patterns\n\nvariable (f : ι → ι → ι → ℝ)\n\n/-- The three pairings `C_{ab,cd}`, `C_{ac,bd}`, `C_{ad,bc}` whose mean is `S`. -/\ndef w6C : Fin 3 → ι → ι → ι → ι → ℝ\n  | 0 => fun a b c d => kerC f a b c d\n  | 1 => fun a b c d => kerC f a c b d\n  | 2 => fun a b c d => kerC f a d b c\n\n/-- `U` with `S` replaced by one pairing. -/\ndef w6U (p : Fin 3) (a b c : ι) : ℝ := ∑ d, ∑ e, w6C f p a b d e * f d e c\n\n/-- `Q` with `S` replaced by one pairing. -/\ndef w6Q (p : Fin 3) : ℝ := ∑ a, ∑ b, ∑ c, ∑ d, kerG f a b * w6C f p a b c d * kerG f c d\n\n/-- `⟨D, U⟩` with `S` replaced by one pairing. -/\ndef w6DU (p : Fin 3) : ℝ := ∑ a, ∑ b, ∑ c, kerD f a b c * w6U f p a b c\n\n/-- `‖U‖²` with the two copies of `S` replaced by pairings. -/\ndef w6U2 (p q : Fin 3) : ℝ := ∑ a, ∑ b, ∑ c, w6U f p a b c * w6U f q a b c\n\n/-- `T₃` with the three copies of `S` replaced by pairings. -/\ndef w6T3 (p q r : Fin 3) : ℝ :=\n  ∑ a, ∑ b, ∑ c, ∑ d, ∑ e, ∑ g, w6C f p a b e g * w6C f q e g c d * w6C f r c d a b\n\nlemma kerS_eq_w6C (a b c d : ι) :\n    kerS f a b c d = (w6C f 0 a b c d + w6C f 1 a b c d + w6C f 2 a b c d) / 3 := rfl\n\nlemma kerU_eq_w6U (a b c : ι) :\n    kerU f a b c = (w6U f 0 a b c + w6U f 1 a b c + w6U f 2 a b c) / 3 := by\n  simp only [kerU, w6U, ← Finset.sum_add_distrib, Finset.sum_div]\n  refine Finset.sum_congr rfl fun d _ => Finset.sum_congr rfl fun e _ => ?_\n  rw [kerS_eq_w6C]; ring\n\nlemma tenQ_eq_w6Q : tenQ f = (w6Q f 0 + w6Q f 1 + w6Q f 2) / 3 := by\n  simp only [tenQ, w6Q, ← Finset.sum_add_distrib, Finset.sum_div]\n  iterate 4 refine Finset.sum_congr rfl fun _ _ => ?_\n  rw [kerS_eq_w6C]; ring\n\nlemma tenDU_eq_w6DU : tenDU f = (w6DU f 0 + w6DU f 1 + w6DU f 2) / 3 := by\n  simp only [tenDU, w6DU, ← Finset.sum_add_distrib, Finset.sum_div]\n  iterate 3 refine Finset.sum_congr rfl fun _ _ => ?_\n  rw [kerU_eq_w6U]; ring\n\nlemma tenU2_eq_w6U2 : tenU2 f = (w6U2 f 0 0 + w6U2 f 0 1 + w6U2 f 0 2 + w6U2 f 1 0 + w6U2 f 1 1\n    + w6U2 f 1 2 + w6U2 f 2 0 + w6U2 f 2 1 + w6U2 f 2 2) / 9 := by\n  simp only [tenU2, w6U2, ← Finset.sum_add_distrib, Finset.sum_div]\n  iterate 3 refine Finset.sum_congr rfl fun _ _ => ?_\n  rw [kerU_eq_w6U]; ring\n\nlemma tenT3_eq_w6T3 : tenT3 f = (∑ p, ∑ q, ∑ r, w6T3 f p q r) / 27 := by\n  simp only [Fin.sum_univ_three]\n  simp (config := { maxSteps := 4000000 }) only [tenT3, kerS2, w6T3, ← Finset.sum_add_distrib,\n    Finset.sum_div, Finset.sum_mul]\n  iterate 6 refine Finset.sum_congr rfl fun _ _ => ?_\n  rw [kerS_eq_w6C, kerS_eq_w6C, kerS_eq_w6C]; ring\n\nend patterns\n\n/-! ### The tensor terms as multigraph sums -/\n\n/-- Close `6⁶ · (nested sum of kernels) = gsum (phiC F) es` once both sides are nested sums in the\nsame order: unfold the graph sum, go under the nine sums, write every kernel through the multiset\nof its indices and normalise the multisets. -/\nmacro "w6close" : tactic => `(tactic| (\n  simp only [gsum_cons, gsum_nil]\n  simp only [phiC, Fin.prod_univ_six]\n  simp only [addE_apply, Fin.isValue, Fin.reduceEq, ite_true, ite_false, List.nil_append,\n    List.cons_append, List.append_nil]\n  iterate 9 refine Finset.sum_congr rfl fun _ _ => ?_\n  simp only [cw3_eq, cubicKernel_eq_cwm]\n  simp only [Multiset.cons_swap]\n  ring))\n\nsection terms\n\nvariable (F : MvPolynomial ι ℝ)\n\n'

TAIL_TEMPLATE = '\nend terms\n\n/-! ### Factorisation of the disconnected graphs -/\n\nsection factor\n\nvariable (F : MvPolynomial ι ℝ)\n\n/-- Unfold a closed graph sum into nested sums of products of the constants `cw`. -/\nmacro "w6unfold" : tactic => `(tactic| (\n  simp only [gsum_cons, gsum_nil]\n  simp only [phiC, Fin.prod_univ_six, Fin.prod_univ_four, Fin.prod_univ_two]\n  simp only [addE_apply, Fin.isValue, Fin.reduceEq, ite_true, ite_false, List.nil_append,\n    List.cons_append, List.append_nil]))\n\nlemma gsum_wg4_15 : gsum (phiC F) wg4_15 (fun _ => []) = gsum (phiC F) wg2_3 (fun _ => []) ^ 2 := by\n  simp only [wg4_15, wg2_3]\n  w6unfold\n  simp only [sq, Finset.sum_mul, Finset.mul_sum]\n  iterate 6 refine Finset.sum_congr rfl fun _ _ => ?_\n  ring\n\nlemma gsum_wg6_69 : gsum (phiC F) wg6_69 (fun _ => []) = gsum (phiC F) wg2_3 (fun _ => []) ^ 3 := by\n  simp only [wg6_69, wg2_3]\n  w6unfold\n  simp only [pow_succ, pow_zero, one_mul, Finset.sum_mul, Finset.mul_sum]\n  iterate 9 refine Finset.sum_congr rfl fun _ _ => ?_\n  ring\n\nlemma gsum_wg6_70 : gsum (phiC F) wg6_70 (fun _ => [])\n    = gsum (phiC F) wg2_3 (fun _ => []) * gsum (phiC F) wg4_16 (fun _ => []) := by\n  simp only [wg6_70, wg2_3, wg4_16]\n  w6unfold\n  simp only [Finset.sum_mul]\n  simp only [Finset.mul_sum]\n  iterate 9 refine Finset.sum_congr rfl fun _ _ => ?_\n  ring\n\nlemma gsum_wg6_71 : gsum (phiC F) wg6_71 (fun _ => [])\n    = gsum (phiC F) wg2_3 (fun _ => []) * gsum (phiC F) wg4_17 (fun _ => []) := by\n  simp only [wg6_71, wg2_3, wg4_17]\n  w6unfold\n  simp only [Finset.sum_mul]\n  simp only [Finset.mul_sum]\n  iterate 9 refine Finset.sum_congr rfl fun _ _ => ?_\n  ring\n\nend factor\n\n/-! ### The sixth cumulant -/\n\nvariable [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} {F : MvPolynomial ι ℝ}\n\n/-- **The sixth cumulant of a cubic chaos** (the field `wick6`):\n`κ₆/46656 = 135/2 T₃ − 20 V + 135/2 Q + 165/2 ⟨D,U⟩ + 45 ‖U‖²` for the kernel `f = ∂³F/6`. -/\ntheorem Chaos3.wick6 (hE : IsGaussianExpectation E) (hF : Chaos3 F) :\n    (E (F ^ 6) - 15 * E (F ^ 4) * E (F ^ 2) + 30 * E (F ^ 2) ^ 3) / 46656\n      = 135 / 2 * tenT3 (cubicKernel F) - 20 * tenV (cubicKernel F)\n        + 135 / 2 * tenQ (cubicKernel F) + 165 / 2 * tenDU (cubicKernel F)\n        + 45 * tenU2 (cubicKernel F) := by\n  rw [wg6_moment hE hF, wg4_moment hE hF, wg2_moment hE hF]\n  rw [gval_full hE hF wg2_3 (by decide), gval_full hE hF wg4_15 (by decide),\n    gval_full hE hF wg4_16 (by decide), gval_full hE hF wg4_17 (by decide),\n    gval_full hE hF wg6_69 (by decide), gval_full hE hF wg6_70 (by decide),\n    gval_full hE hF wg6_71 (by decide), gval_full hE hF wg6_72 (by decide),\n    gval_full hE hF wg6_73 (by decide), gval_full hE hF wg6_74 (by decide),\n    gval_full hE hF wg6_75 (by decide), gval_full hE hF wg6_76 (by decide),\n    gval_full hE hF wg6_77 (by decide)]\n  rw [gsum_wg4_15, gsum_wg6_69, gsum_wg6_70, gsum_wg6_71]\n  rw [tenT3_eq_w6T3, tenQ_eq_w6Q, tenDU_eq_w6DU, tenU2_eq_w6U2]\n  simp only [Fin.sum_univ_three]\n%s\n  linear_combination %s\n\nend\n\nend Grothe.LowerAnalytic\n'

TERMS = [("V", "tenV (cubicKernel F)", "tenV, kerG")]
TERMS += [("Q%d" % p, "w6Q (cubicKernel F) %d" % p, "w6Q, w6C, kerC, kerG") for p in range(3)]
TERMS += [("DU%d" % p, "w6DU (cubicKernel F) %d" % p, "w6DU, w6U, kerD, w6C, kerC, kerG") for p in range(3)]
TERMS += [("U2%d%d" % (p, q), "w6U2 (cubicKernel F) %d %d" % (p, q), "w6U2, w6U, w6C, kerC")
          for p in range(3) for q in range(3)]
TERMS += [("T3%d%d%d" % (p, q, r), "w6T3 (cubicKernel F) %d %d %d" % (p, q, r), "w6T3, w6C, kerC")
          for p in range(3) for q in range(3) for r in range(3)]

# canonical forms of the six connected cubic multigraphs on six vertices (WickGraphData.lean)
NAMES = {((0,1),(0,1),(0,2),(1,3),(2,4),(2,4),(3,5),(3,5),(4,5)): 'wg6_74',
         ((0,1),(0,1),(0,2),(1,2),(2,3),(3,4),(3,5),(4,5),(4,5)): 'wg6_72',
         ((0,1),(0,1),(0,2),(1,3),(2,3),(2,4),(3,5),(4,5),(4,5)): 'wg6_73',
         ((0,1),(0,1),(0,2),(1,3),(2,4),(2,5),(3,4),(3,5),(4,5)): 'wg6_75',
         ((0,1),(0,2),(0,3),(1,2),(1,4),(2,5),(3,4),(3,5),(4,5)): 'wg6_76',
         ((0,1),(0,2),(0,3),(1,4),(1,5),(2,4),(2,5),(3,4),(3,5)): 'wg6_77'}


def norm(es):
    return tuple(sorted((min(a, b), max(a, b)) for a, b in es))


def canon(es, N=6):
    best = None; bp = None
    for p in itertools.permutations(range(N)):
        k = norm([(p[a], p[b]) for a, b in es])
        if best is None or k < best:
            best = k; bp = p
    return best, bp


def coef(nm):
    if nm == 'V': return '20 / 46656'
    if nm.startswith('Q'): return '-(45 / 2) / 46656'
    if nm.startswith('DU'): return '-(55 / 2) / 46656'
    if nm.startswith('U2'): return '-5 / 46656'
    return '-(5 / 2) / 46656'


def forms(path):
    pat = HEAD.split('/-! ### The tensor terms as multigraph sums -/')[0]
    body = 'variable (F : MvPolynomial ι ℝ)\n\n'
    for nm, t, u in TERMS:
        body += 'example : 6 ^ 6 * %s = 0 := by\n  simp only [%s, Finset.sum_mul, Finset.mul_sum]\n  trace_state; sorry\n\n' % (t, u)
    open(path, 'w').write(pat + body + 'end\n\nend Grothe.LowerAnalytic\n')


def gen(formsfile, path):
    txt = open(formsfile).read()
    blocks = []
    for part in txt.split('⊢')[1:]:
        body = part.split('=\n')[0]
        blocks.append((re.findall(r'∑ (\w+),', body), re.findall(r'cubicKernel F (\w+) (\w+) (\w+)', body)))
    assert len(blocks) == len(TERMS)
    out = []
    for (nm, t, u), (vs, fs) in zip(TERMS, blocks):
        assert len(vs) == 9 and len(fs) == 6
        es = []
        for v in vs:
            occ = [i for i, f in enumerate(fs) for x in f if x == v]
            assert len(occ) == 2 and occ[0] != occ[1]
            es.append((occ[0], occ[1]))
        c, p = canon(es)
        target = NAMES[c]
        out.append('''lemma w6term_%s : 6 ^ 6 * %s = gsum (phiC F) %s (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![%s])
    (es := (%s : List (Fin 6 × Fin 6))) (es' := %s) (by decide +kernel)]
  simp only [%s, Finset.sum_mul, Finset.mul_sum]
  w6close
''' % (nm, t, target, ', '.join(map(str, p)), '[' + ', '.join('(%d, %d)' % e for e in es) + ']', target, u))
    haves = '\n'.join('  have h%s := w6term_%s F' % (nm, nm) for nm, _, _ in TERMS)
    lc = ' + '.join('(%s) * h%s' % (coef(nm), nm) for nm, _, _ in TERMS)
    open(path, 'w').write(HEAD + '\n'.join(out) + TAIL_TEMPLATE % (haves, lc))


if __name__ == '__main__':
    if sys.argv[1] == 'forms':
        forms(sys.argv[2])
    else:
        gen(sys.argv[2], sys.argv[3])
