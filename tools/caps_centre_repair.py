#!/usr/bin/env python3
"""Research repairs for positive centre-piece cap increases, without changing capPad.

Re-solve exported exact matrices, then (only if an increase remains) partition
finite constraint intervals at their rational midpoints. The recipe, grid,
enclosure and N matrix stay unchanged. This is search output, not a Lean
verification or a claim that any returned increase is minimal. A finer grid
needs a fresh Lean export; this tool never approximates one from old matrices.
Explicit research grids use index 3 and must record grid_spec = [nP, nQ, step]
with positive integer dimensions and an exact positive rational step.

Example (one export and its solved results):
  python3 tools/caps_centre_repair.py EXPORT.jsonl SOLVED.json \
    --agent-id codex-15b7 --output-dir data/caps-m/plan/repairs --max-depth 1

Each piece has an atomic checkpoint. Re-running identical inputs resumes saved
exactly checked attempts; changed inputs/configuration fail closed. No Lean
modules, row data, capPad or cover data are changed.
"""
from __future__ import annotations

import argparse
import copy
from datetime import datetime, timezone
from fractions import Fraction as F
import hashlib
import itertools
import json
import os
from pathlib import Path
import sys
import tempfile

sys.path.insert(0, str(Path(__file__).resolve().parent))
import caps_lmi

SCHEMA = 2
DIM = 13
CAUTION = "Research search output; not Lean verification; no minimality claim."


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def load_exports(path):
    """Read exact JSONL matrices while closing the input even on invalid data."""
    with Path(path).open() as stream:
        for line in stream:
            if not line.strip():
                continue
            d = json.loads(line)
            d["N"] = [[F(x) for x in row] for row in d["N"]]
            for c in d["cons"]:
                for name in ("A", "B"):
                    c[name] = [[F(x) for x in row] for row in c[name]]
                for name in ("lo", "lam", "mu"):
                    c[name] = F(c[name])
                c["hi"] = None if c["hi"] is None else F(c["hi"])
            yield d


def bounds(d):
    return [[str(c["lo"]), None if c["hi"] is None else str(c["hi"])]
            for c in d["cons"]]


def validate_matrix(m):
    if len(m) != DIM or any(len(row) != DIM for row in m):
        raise ValueError("expected a 13 by 13 matrix")
    if any(m[i][j] != m[j][i] for i in range(DIM) for j in range(DIM)):
        raise ValueError("matrix must be exactly symmetric")


def research_grid_spec(d):
    """Validate/canonicalise an explicitly exported research grid, never infer it."""
    if d.get("grid") != 3:
        return None
    spec = d.get("grid_spec")
    if not isinstance(spec, list) or len(spec) != 3:
        raise ValueError("research grid 3 needs grid_spec [nP, nQ, step]")
    nP, nQ, step = spec
    if any(type(n) is not int or n <= 0 for n in (nP, nQ)):
        raise ValueError("research grid dimensions must be positive natural numbers")
    if isinstance(step, bool) or not isinstance(step, (str, int, F)):
        raise ValueError("research grid step must be an exact positive rational")
    step = F(step)
    if step <= 0:
        raise ValueError("research grid step must be an exact positive rational")
    return [nP, nQ, str(step)]


def validate_export(d):
    if d.get("encl") is not True or d.get("polyOK") is not True:
        raise ValueError("export enclosure and polynomial checks must both hold")
    if type(d.get("grid")) is not int or d["grid"] not in (0, 1, 2, 3):
        raise ValueError("unknown exported grid")
    research_grid_spec(d)
    F(d["capPad"])
    validate_matrix(d["N"])
    for c in d["cons"]:
        if c["hi"] is not None and c["lo"] > c["hi"]:
            raise ValueError("constraint interval is reversed")
        validate_matrix(c["A"])
        validate_matrix(c["B"])


def rebound_constraint(c, lo, hi):
    """Derive Cons.sMat's exact unit-lambda/unit-mu matrices on [lo, hi].

    For old bounds l,h, B = Q-lE and A = -U+(l+h)Q-lhE.
    Thus B' = B+(l-lo)E and
    A' = A+(lo+hi-l-h)B+(lo-l)(l-hi)E.
    This is a full interval restriction, with no symmetry/folded-domain shortcut.
    """
    l, h = c["lo"], c["hi"]
    lo, hi = F(lo), F(hi)
    if h is None or not (l <= lo <= hi <= h):
        raise ValueError("new finite interval must be contained in the old interval")
    out = copy.deepcopy(c)
    shift = lo + hi - l - h
    out["A"] = [[c["A"][i][j] + shift * c["B"][i][j]
                 for j in range(DIM)] for i in range(DIM)]
    out["A"][0][0] += (lo - l) * (l - hi)
    out["B"][0][0] += l - lo
    out["lo"], out["hi"] = lo, hi
    return out


def partition(d, max_constraints=2):
    """Return a complete Cartesian 2/4-child midpoint partition, or no split.

    Choose up to two finite non-degenerate constraints, prioritising intervals
    crossing zero, then width. Every selected interval is covered in full by its
    two closed halves. Unselected constraints, recipe, N and grid are unchanged.
    """
    if max_constraints not in (1, 2):
        raise ValueError("split one or two constraints at a time")
    eligible = [i for i, c in enumerate(d["cons"])
                if c["hi"] is not None and c["lo"] < c["hi"]]
    eligible.sort(key=lambda i: (not (d["cons"][i]["lo"] < 0 < d["cons"][i]["hi"]),
                                 -(d["cons"][i]["hi"] - d["cons"][i]["lo"]), i))
    selected = eligible[:max_constraints]
    if not selected:
        return [], None
    cuts = [{"constraint": i, "lo": str(d["cons"][i]["lo"]),
             "mid": str((d["cons"][i]["lo"] + d["cons"][i]["hi"]) / 2),
             "hi": str(d["cons"][i]["hi"])} for i in selected]
    children = []
    for choices in itertools.product((0, 1), repeat=len(selected)):
        child = copy.deepcopy(d)
        for i, side in zip(selected, choices):
            c = d["cons"][i]
            mid = (c["lo"] + c["hi"]) / 2
            child["cons"][i] = rebound_constraint(c, c["lo"] if side == 0 else mid,
                                                  mid if side == 0 else c["hi"])
        children.append(child)
    metadata = {"kind": "closed_cartesian_midpoint_partition", "cuts": cuts,
                "child_choices": [list(x) for x in itertools.product((0, 1), repeat=len(selected))],
                "children_bounds": [bounds(child) for child in children],
                "coverage": "Each full parent interval equals the union of its two closed halves; "
                            "all Cartesian choices are present; other constraints are unchanged."}
    return children, metadata


def ldl_pivots(m):
    """Exact rational LDL transcript, using the checker's zero-pivot convention."""
    a = [row[:] for row in m]
    pivots = []
    for k in range(len(a)):
        p = a[k][k]
        if p < 0 or (p == 0 and any(a[i][k] != 0 for i in range(k + 1, len(a)))):
            return None
        pivots.append(str(p))
        if p:
            for i in range(k + 1, len(a)):
                q = a[i][k] / p
                if q:
                    for j in range(k + 1, len(a)):
                        a[i][j] -= q * a[k][j]
    return pivots


def checked_solution(d, candidate):
    """Return a serialisable exact feasible certificate, or None for invalid proposals."""
    if not candidate or candidate.get("status") not in ("pass", "fixed", "cap_up"):
        return None
    try:
        up = F(candidate.get("cap_up") or "0")
        raw_lm = candidate["lm"]
        if up < 0 or len(raw_lm) != len(d["cons"]):
            return None
        lm = [(F(a), F(b)) for a, b in raw_lm]
        if any(a < 0 or b < 0 or (c["hi"] is None and a != 0)
               for c, (a, b) in zip(d["cons"], lm)):
            return None
        N = [row[:] for row in d["N"]]
        N[0][0] += up
        K = caps_lmi.kmat(N, d["cons"], lm)
        pivots = ldl_pivots(K)
        if pivots is None or not caps_lmi.ldl_ok(K):
            return None
        return {"status": "fixed" if up == 0 else "cap_up", "cap_up": str(up),
                "cap_up_float": float(up), "lm": [[str(a), str(b)] for a, b in lm],
                "exact_ldl_ok": True, "ldl_pivots": pivots}
    except (KeyError, TypeError, ValueError, ZeroDivisionError):
        return None


def repair_piece(d, baseline, *, max_depth=1, max_constraints=2, margin=1e-9,
                 attempts=None, checkpoint=None, solve=None):
    """Re-solve a positive piece and, as needed, its complete interval partitions."""
    validate_export(d)
    if not (0 <= max_depth <= 4):
        raise ValueError("max depth must be between zero and four")
    if max_constraints not in (1, 2):
        raise ValueError("split one or two constraints at a time")
    original = checked_solution(d, baseline)
    if original is None or F(original["cap_up"]) <= 0:
        raise ValueError("baseline must be a positive, exact feasible cap increase")
    if margin <= 0:
        raise ValueError("solver margin must be positive")
    attempts = {} if attempts is None else attempts
    solve = caps_lmi.solve_piece if solve is None else solve

    def visit(cell, path, depth, fallback):
        saved = attempts.get(path)
        if saved is not None:
            if saved.get("bounds") != bounds(cell):
                raise ValueError("checkpoint bounds do not match this partition")
            best = checked_solution(cell, saved.get("solution"))
            if saved.get("solution") is not None and best is None:
                raise ValueError("checkpoint's exact certificate is invalid")
        else:
            candidates = []
            old = checked_solution(cell, fallback)
            if old is not None:
                candidates.append(old)
            # The old multiplier vector can already prove zero on a child.
            zero = checked_solution(cell, {"status": "fixed", "cap_up": "0", "lm": fallback["lm"]})
            if zero is not None:
                candidates.append(zero)
            error = None
            if zero is None:
                try:
                    proposed = solve(cell, margin)
                    found = checked_solution(cell, proposed)
                    if found is not None:
                        candidates.append(found)
                    else:
                        error = (proposed or {}).get("error", "solver returned no exact feasible certificate")
                except Exception as exc:  # Record failed searches; retain any exact feasible fallback.
                    error = f"{type(exc).__name__}: {exc}"
            best = min(candidates, key=lambda s: F(s["cap_up"])) if candidates else None
            attempts[path] = {"bounds": bounds(cell), "solution": best, "search_error": error}
            if checkpoint is not None:
                checkpoint(attempts)
        result = {"path": path, "bounds": bounds(cell), "attempt": attempts[path],
                  "status": "fail" if best is None else best["status"],
                  "cap_up": None if best is None else best["cap_up"], "chosen": "unsplit"}
        if (best is not None and F(best["cap_up"]) == 0) or depth == max_depth:
            return result
        children, metadata = partition(cell, max_constraints)
        if not children:
            return result
        # An inherited multiplier vector need not remain feasible after interval
        # rebounding. Failure of an intermediate unsplit search must not prune
        # smaller cells that may have their own exact certificates. An ancestor
        # fallback is only a source of candidate multipliers: every candidate is
        # checked again on the actual child's matrices before it can be used.
        results = [visit(child, f"{path}/{i}", depth + 1, best if best is not None else fallback)
                   for i, child in enumerate(children)]
        result["partition"] = {**metadata, "children": results}
        if all(r["cap_up"] is not None for r in results):
            up = max(F(r["cap_up"]) for r in results)
            if best is None or up < F(best["cap_up"]):
                result.update(status="fixed" if up == 0 else "cap_up", cap_up=str(up), chosen="partition")
        return result

    return visit(d, "root", 0, original)


def atomic_json(path, data):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, temporary = tempfile.mkstemp(prefix=path.name + ".", suffix=".tmp", dir=path.parent)
    try:
        with os.fdopen(fd, "w") as stream:
            json.dump(data, stream, indent=2, sort_keys=True)
            stream.write("\n")
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, path)
    finally:
        if os.path.exists(temporary):
            os.unlink(temporary)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("export", type=Path)
    parser.add_argument("solved", type=Path)
    parser.add_argument("--agent-id", required=True)
    parser.add_argument("--output-dir", type=Path, default=Path("data/caps-m/plan/repairs"))
    parser.add_argument("--max-depth", type=int, choices=range(5), default=1)
    parser.add_argument("--split-constraints", type=int, choices=(1, 2), default=2)
    parser.add_argument("--margin", default="1e-9", help="scaled solver margin, not capPad")
    parser.add_argument("--piece", action="append", default=[], metavar="K:I:J",
                        help="restrict positive solved pieces; may be repeated")
    parser.add_argument("--limit", type=int, help="maximum number of selected pieces")
    args = parser.parse_args(argv)
    try:
        margin = F(args.margin)
        if margin <= 0 or (args.limit is not None and args.limit < 1):
            raise ValueError("margin and limit must be positive")
        wanted = {tuple(map(int, text.split(":"))) for text in args.piece}
        if any(len(key) != 3 for key in wanted):
            raise ValueError("--piece must have form K:I:J")
        exports = {}
        for d in load_exports(args.export):
            validate_export(d)
            key = (d["k"], d["i"], d["j"], d["grid"])
            if key in exports:
                raise ValueError(f"duplicate exported piece {key}")
            exports[key] = d
        baselines = {}
        for r in json.loads(args.solved.read_text()):
            if r.get("status") != "cap_up" or F(r.get("cap_up") or "0") <= 0:
                continue
            key = (r["k"], r["i"], r["j"], r["grid"])
            if wanted and key[:3] not in wanted:
                continue
            if key in baselines or key not in exports:
                raise ValueError(f"duplicate solved piece or missing export {key}")
            baselines[key] = r
        found = {key[:3] for key in baselines}
        if wanted - found:
            raise ValueError(f"requested pieces have no positive solved result: {sorted(wanted - found)}")
        config = {"max_depth": args.max_depth, "split_constraints": args.split_constraints,
                  "margin": str(margin), "strategy": "full_interval_cartesian_midpoints"}
        fingerprint = {"schema": SCHEMA, "export_sha256": digest(args.export),
                       "solved_sha256": digest(args.solved), "tool_sha256": digest(__file__),
                       "caps_lmi_sha256": digest(caps_lmi.__file__), "config": config}
        for key in sorted(baselines)[:args.limit]:
            d, baseline = exports[key], baselines[key]
            path = args.output_dir / f"repair_centre_{key[0]}x{key[1]}_j{key[2]}_g{key[3]}.json"
            if path.exists():
                state = json.loads(path.read_text())
                if state.get("fingerprint") != fingerprint or state.get("piece") != list(key):
                    raise ValueError(f"checkpoint input/configuration mismatch: {path}")
            else:
                state = {"fingerprint": fingerprint, "agent_id": args.agent_id, "piece": list(key),
                         "capPad_unchanged": d["capPad"], "baseline_cap_up": baseline["cap_up"],
                         "caution": CAUTION, "attempts": {}}
                if key[3] == 3:
                    # The complete input (including raw grid_spec and matrices)
                    # is bound by fingerprint.export_sha256; retain a readable
                    # exact grid description alongside that full-file digest.
                    state["grid_spec"] = research_grid_spec(d)

            def save(attempts):
                state.update(state="in_progress", attempts=attempts,
                             updated_at_utc=datetime.now(timezone.utc).isoformat())
                atomic_json(path, state)

            save(state["attempts"])
            result = repair_piece(d, baseline, max_depth=args.max_depth,
                                  max_constraints=args.split_constraints, margin=float(margin),
                                  attempts=state["attempts"], checkpoint=save)
            state.update(state="complete", result=result,
                         updated_at_utc=datetime.now(timezone.utc).isoformat())
            atomic_json(path, state)
            print(f"{key[0]}:{key[1]}/{key[2]} g{key[3]}: {result['status']} "
                  f"cap increase {result['cap_up']} ({result['chosen']}); {path}")
        print(CAUTION)
    except (OSError, ValueError, KeyError, TypeError) as exc:
        parser.exit(2, f"error: {exc}\n")


if __name__ == "__main__":
    main()
