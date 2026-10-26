#!/usr/bin/env python3
"""Exact algebra/coverage/certificate regressions; no optimizer or Lean build."""
import contextlib
import copy
from fractions import Fraction as F
import itertools
import io
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))
import caps_centre_repair as repair


def matrix():
    return [[F(0) for _ in range(13)] for _ in range(13)]


def cons(lo, hi, u):
    """Independent literal Cons.sMat unit-multiplier formula."""
    lo, hi = F(lo), F(hi)
    A, B = matrix(), matrix()
    A[0][0] = -lo * hi
    B[0][0] = -lo
    for i, ui in enumerate(u, 1):
        A[0][i] = A[i][0] = (lo + hi) * ui / 2
        B[0][i] = B[i][0] = ui / 2
        for j, uj in enumerate(u, 1):
            A[i][j] = -ui * uj
    return {"lo": lo, "hi": hi, "lam": F(0), "mu": F(0), "A": A, "B": B}


def exported(constraints, N=None):
    return {"k": 12, "i": 140, "j": 0, "grid": 2, "capPad": "1/100000000000",
            "encl": True, "polyOK": True, "ok": False,
            "N": matrix() if N is None else N, "cons": constraints}


class RepairTests(unittest.TestCase):
    def test_rebound_matches_cons_smat_for_asymmetric_rational_intervals(self):
        u = [F(2, 3), F(-7, 11), F(5, 13)] + [F(0)] * 9
        c = cons(F(-7, 5), F(13, 7), u)
        for lo, hi in [(F(-7, 5), F(0)), (F(0), F(13, 7)),
                       (F(-1, 3), F(2, 5)), (F(1, 2), F(1, 2))]:
            got = repair.rebound_constraint(c, lo, hi)
            expected = cons(lo, hi, u)
            self.assertEqual(got["A"], expected["A"])
            self.assertEqual(got["B"], expected["B"])
        self.assertEqual(c["lo"], F(-7, 5))

    def test_cartesian_partition_covers_parent_including_midpoint_and_corners(self):
        c1 = cons(F(-3, 1000), F(3, 1000), [F(1)] + [F(0)] * 11)
        c2 = cons(F(1, 5), F(7, 5), [F(0), F(1)] + [F(0)] * 10)
        d = exported([c1, c2])
        children, metadata = repair.partition(d)
        self.assertEqual(len(children), 4)
        self.assertEqual(metadata["child_choices"], [[0, 0], [0, 1], [1, 0], [1, 1]])
        samples = [[c["lo"], (3*c["lo"]+c["hi"])/4, (c["lo"]+c["hi"])/2,
                    (c["lo"]+3*c["hi"])/4, c["hi"]] for c in d["cons"]]
        for point in itertools.product(*samples):
            self.assertTrue(any(all(c["lo"] <= x <= c["hi"] for c, x in zip(ch["cons"], point))
                                for ch in children))
        for child in children:
            self.assertEqual(child["N"], d["N"])
            self.assertEqual(child["grid"], d["grid"])
            self.assertEqual(child["capPad"], d["capPad"])

    def test_partition_retains_other_constraints_and_covers_negative_half(self):
        c = cons(-1, 1, [F(1)] + [F(0)] * 11)
        children, _ = repair.partition(exported([c]), 1)
        self.assertEqual([(x["cons"][0]["lo"], x["cons"][0]["hi"]) for x in children],
                         [(F(-1), F(0)), (F(0), F(1))])
        self.assertEqual(c["lo"], -1)

    def test_exact_zero_child_certificate_removes_positive_parent_increase(self):
        # N(y)=y^2. A parent proposal adds 1, while both children admit zero
        # with zero multipliers. Exercise complete partition aggregation with
        # an optimizer fixture that returns a weaker positive root proposal.
        N = matrix()
        N[1][1] = 1
        d = exported([cons(-1, 1, [F(1)] + [F(0)] * 11)], N)
        baseline = {"status": "cap_up", "cap_up": "1", "lm": [["1", "0"]]}
        calls = []
        def solver(cell, margin):
            calls.append(repair.bounds(cell))
            if cell["cons"][0]["lo"] == -1 and cell["cons"][0]["hi"] == 1:
                return baseline
            return {"status": "fixed", "cap_up": "0", "lm": [["0", "0"]]}
        result = repair.repair_piece(d, baseline, solve=solver)
        self.assertEqual(result["status"], "fixed")
        self.assertEqual(result["cap_up"], "0")
        self.assertEqual(result["chosen"], "partition")
        self.assertEqual(len(result["partition"]["children"]), 2)
        for child in result["partition"]["children"]:
            self.assertTrue(child["attempt"]["solution"]["exact_ldl_ok"])

    def test_no_false_zero_from_invalid_solver_or_one_bad_child(self):
        N = matrix()
        N[0][0] = F(-1)
        d = exported([cons(-1, 1, [F(1)] + [F(0)] * 11)], N)
        baseline = {"status": "cap_up", "cap_up": "2", "lm": [["0", "0"]]}
        def invalid_solver(cell, margin):
            return {"status": "fixed", "cap_up": "0", "lm": [["0", "0"]]}
        result = repair.repair_piece(d, baseline, solve=invalid_solver)
        self.assertEqual(result["status"], "cap_up")
        self.assertEqual(result["cap_up"], "2")
        self.assertTrue(all(child["cap_up"] == "2" for child in result["partition"]["children"]))

    def test_rejects_negative_multipliers_zero_pivot_coupling_and_wrong_lm_count(self):
        d = exported([cons(-1, 1, [F(1)] + [F(0)] * 11)])
        for lm in [[], [["-1", "0"]], [["0", "-1"]]]:
            self.assertIsNone(repair.checked_solution(d, {"status": "fixed", "cap_up": "0", "lm": lm}))
        d["N"][0][1] = d["N"][1][0] = F(1)
        self.assertIsNone(repair.checked_solution(d, {"status": "fixed", "cap_up": "0", "lm": [["0", "0"]]}))

    def test_rejects_invalid_or_expanded_bounds(self):
        c = cons(-1, 1, [F(1)] + [F(0)] * 11)
        for lo, hi in [(1, -1), (-2, 0), (0, 2)]:
            with self.assertRaises(ValueError):
                repair.rebound_constraint(c, lo, hi)
        c["hi"] = None
        with self.assertRaises(ValueError):
            repair.rebound_constraint(c, 0, 1)

    def test_resume_replays_exact_attempts_without_solver(self):
        N = matrix()
        N[0][0] = F(-1)
        d = exported([cons(-1, 1, [F(1)] + [F(0)] * 11)], N)
        baseline = {"status": "cap_up", "cap_up": "2", "lm": [["0", "0"]]}
        attempts = {}
        result = repair.repair_piece(d, baseline, attempts=attempts,
                                     solve=lambda cell, margin: baseline)
        saved = copy.deepcopy(attempts)
        def forbidden(cell, margin):
            raise AssertionError("completed attempts must be reused")
        self.assertEqual(repair.repair_piece(d, baseline, attempts=attempts, solve=forbidden), result)
        self.assertEqual(saved, attempts)
        attempts["root"]["solution"]["cap_up"] = "0"
        with self.assertRaises(ValueError):
            repair.repair_piece(d, baseline, attempts=attempts, solve=forbidden)

    def test_atomic_checkpoint_round_trip_leaves_no_temporary_file(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "piece.json"
            repair.atomic_json(path, {"state": "in_progress", "attempts": {}})
            repair.atomic_json(path, {"state": "complete", "cap_up": "0"})
            self.assertEqual(json.loads(path.read_text()), {"state": "complete", "cap_up": "0"})
            self.assertEqual([p.name for p in Path(tmp).iterdir()], ["piece.json"])

    def test_cli_resumes_atomic_piece_and_rejects_changed_configuration(self):
        N = matrix()
        N[0][0] = F(-1)
        d = exported([cons(-1, 1, [F(1)] + [F(0)] * 11)], N)
        baseline = {"k": 12, "i": 140, "j": 0, "grid": 2,
                    "status": "cap_up", "cap_up": "2", "lm": [["0", "0"]]}
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            source, solved, out = root / "export.jsonl", root / "solved.json", root / "repairs"
            source.write_text(json.dumps(d, default=str) + "\n")
            solved.write_text(json.dumps([baseline]))
            args = [str(source), str(solved), "--output-dir", str(out),
                    "--agent-id", "codex-fixture", "--max-depth", "0"]
            with contextlib.redirect_stdout(io.StringIO()), patch.object(repair.caps_lmi, "solve_piece",
                                                                        return_value=baseline) as solver:
                repair.main(args)
                solver.assert_called_once()
            result_path = out / "repair_centre_12x140_j0_g2.json"
            state = json.loads(result_path.read_text())
            self.assertEqual(state["state"], "complete")
            self.assertEqual(state["capPad_unchanged"], d["capPad"])
            self.assertEqual(state["result"]["cap_up"], "2")
            with contextlib.redirect_stdout(io.StringIO()), patch.object(repair.caps_lmi, "solve_piece") as solver:
                repair.main(args)
                solver.assert_not_called()
            with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
                with self.assertRaises(SystemExit) as raised:
                    repair.main(args[:-1] + ["1"])
            self.assertEqual(raised.exception.code, 2)


if __name__ == "__main__":
    unittest.main()
