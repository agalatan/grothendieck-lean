#!/usr/bin/env python3
"""Caps cache CLI, registry and repository-boundary regressions; no Lean build or real marker writes.

The fixture is a small copy of the identity-tail layout (tools/gen_tail_caps.py): row 00 with two anchor ranges and a
localised node 3 (D, C, two R, N), row 01 with one anchor range, the row assemblies and bridges, CapNodes, and a fake
generator that prints the plan. scripts/test_build_caps_batches.py reuses it (write_layout).
"""
import contextlib
import hashlib
import importlib.util
import io
import json
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch


SCRIPT = Path(__file__).with_name("caps_stamp.py")
NS = "Grothe.LowerAnalytic"
LA = "Grothe/LowerAnalytic/"
REGISTRY = "data/tail-caps/build.json"
PROJECTED = ("format", "rows", "compute_roots", "assembly_roots", "native_declarations_by_root", "pure_roots",
             "direct_hash_roots", "source_sha256")


def fact(imports, name, proposition, extra=""):
    """A generated leaf: its imports, and one native fact inside `namespace Grothe.LowerAnalytic`."""
    return ("".join(f"import {m}\n" for m in imports) + f"\n/-! # fixture leaf `{name}` -/\n\nnamespace {NS}\n\n"
            + extra + f"theorem {name} :\n    {proposition} := by\n  native_decide\n\nend {NS}\n")


def proof(imports, name):
    return "".join(f"import {m}\n" for m in imports) + f"\nnamespace {NS}\n\ntheorem {name} : True := trivial\n\nend {NS}\n"


LEAVES = {  # path -> (declaration, cost in the fake generator's plan)
    LA + "CapRow00/AnchorRange00.lean": ("row00AnchorRange00", 550),
    LA + "CapRow00/AnchorRange01.lean": ("row00AnchorRange01", 335),
    LA + "CapRow01/AnchorRange00.lean": ("row01AnchorRange00", 572),
    LA + "CapPieces/C00x3.lean": ("pieceCover_00x3", 5),
    LA + "CapPieces/R00x3_0.lean": ("pieceRange_00x3_0", 590),
    LA + "CapPieces/R00x3_1.lean": ("pieceRange_00x3_1", 78),
    LA + "CapRow00/Assembly.lean": ("chordsOKRow00", 5),
    LA + "CapRow01/Assembly.lean": ("chordsOKRow01", 6),
}
PROOFS = [LA + "CapCommonFacts.lean", LA + "CapPieces/N00x3.lean", LA + "CapRow00/Assembly.lean",
          LA + "CapRow00/Bridge.lean", LA + "CapRow01/Assembly.lean", LA + "CapRow01/Bridge.lean"]
EXTRA = [LA + "CapNodes.lean", "GrotheCapsKernel.lean", "lean-toolchain", "lake-manifest.json", "lakefile.toml"]
# The computation closure (a): the leaves AnchorRange, C, R, the rows' Data and the quadrature facts.
CLOSURE = ["GrotheCapsKernel.Basic", "Grothe.Shared", "Grothe.Quad", f"{NS}.CapDefs", f"{NS}.CapCommon",
           f"{NS}.CapRow00.Data", f"{NS}.CapRow01.Data", f"{NS}.CapPieces.D00x3", f"{NS}.CapPieces.C00x3",
           f"{NS}.CapPieces.R00x3_0", f"{NS}.CapPieces.R00x3_1", f"{NS}.CapRow00.AnchorRange00",
           f"{NS}.CapRow00.AnchorRange01", f"{NS}.CapRow01.AnchorRange00"] + \
          [f"Grothe.UpperQuad.Facts.GradeBlock{b:02d}" for b in range(12)] + \
          ["Grothe.UpperQuad.Facts.Even", "Grothe.UpperQuad.Facts.Omitted"]
PURE = ["GrotheCapsKernel/Basic.lean", "GrotheCapsKernel.lean", "Grothe/Shared.lean", LA + "CapDefs.lean",
        LA + "CapPieces/D00x3.lean", LA + "CapCommon.lean", LA + "CapRow00/Data.lean", LA + "CapRow01/Data.lean"]


def layout_files():
    files = {
        "lakefile.toml": 'name = "grothe"\n[[lean_lib]]\nname = "GrotheCapsKernel"\nprecompileModules = true\n',
        "lake-manifest.json": "{}\n",
        "lean-toolchain": "leanprover/lean4:v4.34.1\n",
        "GrotheCapsKernel.lean": "import GrotheCapsKernel.Basic\n",
        "GrotheCapsKernel/Basic.lean": "-- the checker library fixture\n",
        "Grothe/Shared.lean": "-- shared fixture dependency\nimport Mathlib.Data.Real.Basic\n",
        "Grothe/Quad.lean": "-- the quadrature fixture dependency\n",
        LA + "CapDefs.lean": "import GrotheCapsKernel.Basic\nimport Grothe.Shared\n"
                             "-- the checks that native_decide evaluates, in a comment only\n",
        LA + "CapCommon.lean": "import Grothe.LowerAnalytic.CapDefs\n-- capNu, capGrids\n",
        LA + "Bridge.lean": "-- the lower-bound proof layer (CI's probe appends a comment here)\n",
        LA + "Soundness.lean": "import Grothe.LowerAnalytic.Bridge\n-- the soundness chain\n",
        LA + "CapCommonFacts.lean": "import Grothe.LowerAnalytic.Soundness\nimport Grothe.LowerAnalytic.CapCommon\n",
        "Grothe/Lower/RowData01.lean": "-- the Stein row 01\n",
        "Grothe/Lower/RowData02.lean": "-- the Stein row 02\n",
        LA + "CapPieces/D00x3.lean": f"/-! # Pieces of node 3 of row 0 -/\n\nnamespace {NS}\n\n"
                                     f'def pieceNode_00x3 : List String := ["1;2;3"]\n\nend {NS}\n',
        LA + "CapPieces/C00x3.lean": fact([f"{NS}.CapDefs", f"{NS}.CapPieces.D00x3"], "pieceCover_00x3",
                                          "pieceCoverFastOK pieceNode_00x3 = true"),
        LA + "CapPieces/N00x3.lean": proof([f"{NS}.CapCommonFacts", f"{NS}.CapRow00.Data", f"{NS}.CapPieces.C00x3",
                                            f"{NS}.CapPieces.R00x3_0", f"{NS}.CapPieces.R00x3_1"], "nodeCap_00x3"),
        LA + "CapNodes.lean": "".join(f"import {NS}.CapRow{k}.Assembly\nimport {NS}.CapRow{k}.Bridge\n"
                                      for k in ("00", "01")) + f"import {NS}.Soundness\n",
        "data/axioms/native.txt": "# fixture\nGrothe.Other.fact._native.native_decide.ax_1_1\n",
        "data/tail-caps/native.txt": "".join(sorted(f"{NS}.{name}._native.native_decide.ax_1_1\n"
                                                    for name, _ in LEAVES.values())),
    }
    for j, (lo, hi) in enumerate(((0, 7), (7, 12))):
        files[LA + f"CapPieces/R00x3_{j}.lean"] = fact(
            [f"{NS}.CapRow00.Data", f"{NS}.CapPieces.D00x3"], f"pieceRange_00x3_{j}",
            f"pieceRangeOKNu ε capNu capRow00 capR00 pieceNode_00x3 {lo} {hi} = true")
    for k, ranges, nodes in (("00", [(0, "7"), (7, "capRow00.nodeList.length")], [f"{NS}.CapPieces.N00x3"]),
                             ("01", [(0, "capRow01.nodeList.length")], [])):
        files[LA + f"CapRow{k}/Data.lean"] = f"import {NS}.CapCommon\n-- the cap data of row {k}\n"
        for j, (lo, hi) in enumerate(ranges):
            files[LA + f"CapRow{k}/AnchorRange{j:02d}.lean"] = fact(
                [f"{NS}.CapRow{k}.Data"], f"row{k}AnchorRange{j:02d}",
                f"rangeOKNu ε capNu capRow{k} capR{k} capChords{k} (parseRecsNu capRecs{k}) capGrids\n"
                f"      capExcl{k} {lo} {hi} = true")
        files[LA + f"CapRow{k}/Assembly.lean"] = fact(
            [f"{NS}.CapCommonFacts", f"{NS}.CapRow{k}.Data"] +
            [f"{NS}.CapRow{k}.AnchorRange{j:02d}" for j in range(len(ranges))] + nodes,
            f"chordsOKRow{k}", f"chordOKLow capRow{k}.nodeList capChords{k} = true",
            extra=f"theorem vertexCapsRow{k} : True := trivial\n\n")
        files[LA + f"CapRow{k}/Bridge.lean"] = proof([f"{NS}.CapRow{k}.Data", f"Grothe.Lower.RowData{int(k) + 1:02d}"],
                                                     f"capBridge{k}")
    for b in range(12):
        files[f"Grothe/UpperQuad/Facts/GradeBlock{b:02d}.lean"] = "import Grothe.Quad\n-- quad block fact\n"
    files["Grothe/UpperQuad/Facts/Even.lean"] = "import Grothe.Quad\n-- quad even fact\n"
    files["Grothe/UpperQuad/Facts/Omitted.lean"] = "import Grothe.Quad\n-- quad omitted fact\n"
    plan = {path[:-5].replace("/", "."): cost for path, (_, cost) in LEAVES.items()}
    plan.update({f"{NS}.CapPieces.N00x3": 2, f"{NS}.CapRow00.Bridge": 2, f"{NS}.CapRow01.Bridge": 2})
    files["tools/gen_tail_caps.py"] = generator(plan)
    return files


def generator(plan, exit_code=0):
    """A fake tools/gen_tail_caps.py: prints the plan in the generator's format."""
    return ("import sys\n" + f"PLAN = {json.dumps(plan)}\n" +
            "for module, cost in PLAN.items():\n    print(f'{cost:6d} s  {module}')\n" +
            "print(f'{len(PLAN)} modules, {sum(PLAN.values())} s estimated (one process on yo)')\n" +
            "print('gen_tail_caps --check: 3161 files reproduce byte for byte')\n" + f"sys.exit({exit_code})\n")


def write_layout(root):
    for name, text in layout_files().items():
        path = Path(root) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text)


def load(path, name="caps_stamp_fixture"):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


class CapsStampTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name).resolve()
        (self.root / "scripts").mkdir()
        self.script = self.root / "scripts/caps_stamp.py"
        shutil.copyfile(SCRIPT, self.script)
        self.mark = self.root / ".lake/build/caps-closure.sha"
        write_layout(self.root)
        result = self.run_cli("--write-registry")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.registry = self.root / REGISTRY
        self.files = [path for m in sorted(CLOSURE) for path in [m.replace(".", "/") + ".lean"]] + EXTRA + \
            sorted(PROOFS) + [REGISTRY]
        self.digest = self.expected_digest()

    def expected_digest(self):
        """The hash, computed independently of the script: (a), (b), then the registry's projection (c)."""
        value = json.loads(self.registry.read_text())
        h = hashlib.sha256()
        for name in self.files:
            h.update(name.encode() + b"\0")
            h.update((json.dumps({k: value[k] for k in PROJECTED}, sort_keys=True, separators=(",", ":")) + "\n").encode()
                     if name == REGISTRY else (self.root / name).read_bytes())
        return h.hexdigest()

    def run_cli(self, *args):
        return subprocess.run([sys.executable, str(self.script), *args], capture_output=True, text=True, check=False)

    def write(self, name, text):
        path = self.root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text)

    def append(self, name, text="-- changed\n"):
        path = self.root / name
        path.write_text(path.read_text() + text)

    def write_marker(self, digest=None):
        self.mark.parent.mkdir(parents=True, exist_ok=True)
        self.mark.write_text((digest or self.digest) + "\n")

    def assertFails(self, *args, message=""):
        result = self.run_cli(*(args or ("--digest",)))
        self.assertEqual(result.returncode, 1, result.stdout + result.stderr)
        self.assertTrue(result.stdout.startswith("FAIL: "), result.stdout)
        self.assertRegex(result.stdout, message)
        return result

    # --- the CLI and the marker

    def test_digest_is_pinned(self):
        result = self.run_cli("--digest")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(result.stdout, f"sha256 {self.digest}\nfiles {len(self.files)}\n")
        self.assertFalse(self.mark.exists())

    def test_list_matches_pinned_order_and_is_read_only(self):
        before = sorted((str(p.relative_to(self.root)), p.stat().st_mtime_ns) for p in self.root.rglob("*"))
        result = self.run_cli("--list")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(result.stdout, "\n".join(self.files) + f"\n{len(self.files)} files; sha256 {self.digest}\n")
        self.assertEqual(before, sorted((str(p.relative_to(self.root)), p.stat().st_mtime_ns)
                                        for p in self.root.rglob("*")))

    def test_missing_marker_fails_closed(self):
        for args in [(), ("--check-cache",)]:
            with self.subTest(args=args):
                result = self.run_cli(*args)
                self.assertEqual(result.returncode, 1)
                self.assertIn("no verified node-cap build", result.stdout)
                self.assertFalse(self.mark.exists())

    def test_current_marker_passes_default_and_explicit_check(self):
        self.write_marker()
        before = self.mark.read_bytes()
        for args in [(), ("--check-cache",)]:
            with self.subTest(args=args):
                result = self.run_cli(*args)
                self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
                self.assertIn("verified for the current sources", result.stdout)
                self.assertEqual(self.mark.read_bytes(), before)

    def test_mismatched_marker_fails(self):
        self.write_marker("0" * 64)
        self.assertEqual(self.run_cli().returncode, 1)

    def test_digest_ignores_mismatched_marker(self):
        self.write_marker("0" * 64)
        before = self.mark.read_bytes()
        result = self.run_cli("--digest")
        self.assertEqual(result.stdout, f"sha256 {self.digest}\nfiles {len(self.files)}\n")
        self.assertEqual(self.mark.read_bytes(), before)

    def test_mark_records_digest_and_passes_check(self):
        result = self.run_cli("--mark-cache")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(self.mark.read_text(), self.digest + "\n")
        self.assertEqual(self.run_cli("--check-cache").returncode, 0)

    def test_incompatible_and_unknown_options_fail(self):
        for args in [("--digest", "--mark-cache"), ("--check-cache", "--digest"), ("--check-cache", "--mark-cache"),
                     ("--write-registry", "--digest"), ("--check",), ("--write", "x"), ("--write",), ("--dig",),
                     ("--unknown",), ("unexpected",), ("--list", "--digest"), ("--list", "--mark-cache")]:
            with self.subTest(args=args):
                self.assertEqual(self.run_cli(*args).returncode, 2)
                self.assertFalse(self.mark.exists())

    def test_import_has_no_cli_or_marker_side_effects(self):
        output = io.StringIO()
        with patch.object(sys, "argv", [str(self.script), "--unknown"]), \
                contextlib.redirect_stdout(output), contextlib.redirect_stderr(output):
            module = load(self.script)
        self.assertEqual(output.getvalue(), "")
        self.assertFalse(self.mark.exists())
        self.assertEqual(module.digest(), (self.digest, len(self.files)))

    # --- the registry

    def test_registry_records_the_layout(self):
        value = json.loads(self.registry.read_text())
        self.assertEqual(value["format"], "caps-bounded-build-v3")
        self.assertEqual(value["generator"], "python3 scripts/caps_stamp.py --write-registry")
        self.assertEqual(value["rows"], [0, 1])
        self.assertEqual(value["compute_roots"], sorted(LEAVES))
        self.assertEqual(value["assembly_roots"], [LA + "CapRow00/Assembly.lean", LA + "CapRow01/Assembly.lean"])
        self.assertEqual(value["native_declarations_by_root"], {p: [f"{NS}.{n}"] for p, (n, _) in LEAVES.items()})
        self.assertEqual(value["pure_roots"], PURE)
        self.assertEqual(value["direct_hash_roots"], sorted(PROOFS))
        self.assertEqual(value["leaf_cost_seconds"], {p: cost for p, (_, cost) in LEAVES.items()})
        pinned = sorted(set(LEAVES) | set(PURE) | set(PROOFS) | set(EXTRA))
        self.assertEqual(value["source_sha256"], {p: hashlib.sha256((self.root / p).read_bytes()).hexdigest()
                                                  for p in pinned})
        self.assertEqual(value["derived_counts"], {
            "rows": 2, "anchor_ranges": 3, "covers": 1, "piece_ranges": 2, "assemblies": 2, "localised_nodes": 1,
            "compute_roots": 8, "native_facts": 8, "pure_roots": 8, "direct_hash_roots": 6, "pinned_sources": 24})
        self.assertEqual(self.registry.read_text(), json.dumps(value, indent=2, sort_keys=True) + "\n")

    def test_write_registry_is_reproducible(self):
        before = self.registry.read_bytes()
        result = self.run_cli("--write-registry")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("8 compute roots (8 native facts)", result.stdout)
        self.assertEqual(self.registry.read_bytes(), before)
        self.assertEqual(self.run_cli("--digest").stdout, f"sha256 {self.digest}\nfiles {len(self.files)}\n")

    def test_proof_layer_edits_leave_the_digest_unchanged(self):
        # CI's probe appends a comment to Grothe/LowerAnalytic/Bridge.lean; the soundness chain, the Stein rows of the
        # bridges and the analytic imports of the assemblies are not followed.
        self.write_marker()
        for name in (LA + "Bridge.lean", LA + "Soundness.lean", "Grothe/Lower/RowData01.lean",
                     "data/axioms/native.txt"):
            self.append(name, "\n-- CI scratch probe\n")
        result = self.run_cli("--check-cache")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)

    def test_pinned_source_change_fails_until_the_registry_is_regenerated(self):
        registry = self.registry.read_bytes()
        for name in sorted(set(LEAVES) | set(PURE) | set(PROOFS) | set(EXTRA)):
            with self.subTest(name=name):
                saved = (self.root / name).read_bytes()
                self.append(name, "\n-- changed\n" if name.endswith(".lean") else "\n")
                self.assertFails(message=re.escape(f"does not match the sources (source_sha256: changed {name})"))
                if name in (LA + "CapPieces/R00x3_0.lean", LA + "CapDefs.lean", LA + "CapRow00/Bridge.lean",
                            "lakefile.toml"):
                    self.assertEqual(self.run_cli("--write-registry").returncode, 0)
                    result = self.run_cli("--digest")
                    self.assertEqual(result.returncode, 0, result.stdout)
                    self.assertNotEqual(result.stdout.split()[1], self.digest)
                (self.root / name).write_bytes(saved)
                self.registry.write_bytes(registry)
        self.assertEqual(self.run_cli("--digest").stdout.split()[1], self.digest)

    def test_quadrature_closure_is_hashed_but_not_registered(self):
        self.append("Grothe/Quad.lean")
        result = self.run_cli("--digest")
        self.assertEqual(result.returncode, 0, result.stdout)
        self.assertNotEqual(result.stdout.split()[1], self.digest)

    def test_missing_or_malformed_registry_fails(self):
        self.registry.write_text("{")
        self.assertFails(message="invalid JSON")
        self.registry.write_text('{"format": "caps-bounded-build-v3", "format": "x"}')
        self.assertFails(message="duplicate JSON key")
        self.registry.unlink()
        self.assertFails(message=re.escape("missing data/tail-caps/build.json; generate it with"))
        self.assertFails("--check-cache", message="missing data/tail-caps/build.json")

    def test_registry_tampering_fails(self):
        original = json.loads(self.registry.read_text())

        def tamper(change, message):
            value = json.loads(json.dumps(original))
            change(value)
            self.registry.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")
            self.assertFails(message=message)

        tamper(lambda v: v.update(format="caps-bounded-build-v2"), "format caps-bounded-build-v3 expected")
        tamper(lambda v: v.update(extra=1), "fields")
        tamper(lambda v: v.pop("scope"), "fields")
        tamper(lambda v: v["compute_roots"].pop(), "compute_roots: new")       # the sources hold one more root
        tamper(lambda v: v["compute_roots"].append(LA + "CapPieces/R00x3_2.lean"), "compute_roots: gone")
        tamper(lambda v: v["assembly_roots"].pop(), "assembly_roots")
        tamper(lambda v: v["native_declarations_by_root"].update({LA + "CapPieces/C00x3.lean": [f"{NS}.x"]}),
               "native_declarations_by_root: changed")
        tamper(lambda v: v["pure_roots"].reverse(), "pure_roots: the order differs")
        tamper(lambda v: v["direct_hash_roots"].pop(), "direct_hash_roots")
        tamper(lambda v: v["source_sha256"].update({LA + "CapDefs.lean": "0" * 64}), "source_sha256: changed")
        tamper(lambda v: v.update(rows=[0, 1, 2]), "rows")
        tamper(lambda v: v["derived_counts"].update(rows=3), "derived_counts")
        tamper(lambda v: v.update(generator="python3 elsewhere.py"), "generator")
        tamper(lambda v: v["leaf_cost_seconds"].pop(LA + "CapPieces/C00x3.lean"), "leaf_cost_seconds")
        for bad in (0, -5, 1.5, True, "5"):
            tamper(lambda v: v["leaf_cost_seconds"].update({LA + "CapPieces/C00x3.lean": bad}), "leaf_cost_seconds")
        self.registry.write_text(json.dumps(original, indent=1, sort_keys=True) + "\n")
        self.assertFails(message="canonical form")

    def test_generator_failure_or_disagreement_blocks_the_registry(self):
        before = self.registry.read_bytes()
        plan = {p[:-5].replace("/", "."): c for p, (_, c) in LEAVES.items()}
        plan.update({f"{NS}.CapPieces.N00x3": 2, f"{NS}.CapRow00.Bridge": 2, f"{NS}.CapRow01.Bridge": 2})
        for text, message in ((generator(plan, exit_code=1), "--plan --check failed"),
                              (generator({k: v for k, v in plan.items() if "R00x3_1" not in k}), "plan and the sources"),
                              (generator(dict(plan, **{f"{NS}.CapPieces.R00x3_2": 9})), "plan and the sources")):
            with self.subTest(message=message):
                self.write("tools/gen_tail_caps.py", text)
                self.assertFails("--write-registry", message=message)
                self.assertEqual(self.registry.read_bytes(), before)

    # --- the layout checks (fail closed)

    def assertLayoutFails(self, message):
        """The digest fails, and so does the registry's regeneration (the sources themselves are refused)."""
        self.assertFails(message=message)
        self.assertFails("--write-registry", message=message)

    def test_stray_or_unregistered_caps_modules_fail(self):
        for name in (LA + "CapPieces/R00x3_2.lean", LA + "CapRow05.lean", LA + "CapRow01/AnchorRange01.lean",
                     LA + "CapRow00/Extra/Deep.lean"):
            with self.subTest(name=name):
                self.write(name, "-- not imported by the row's assembly or node theorem\n")
                self.assertLayoutFails("not reached from Grothe/LowerAnalytic/CapNodes.lean")
                (self.root / name).unlink()
        self.assertEqual(self.run_cli("--digest").returncode, 0)

    def test_capnodes_must_assemble_contiguous_rows_with_bridges(self):
        nodes = LA + "CapNodes.lean"
        text = (self.root / nodes).read_text()
        for broken, message in ((text.replace(f"import {NS}.CapRow01.Bridge\n", ""), "CapRowKK.Bridge"),
                                (text.replace(f"import {NS}.CapRow00.Assembly\n", ""), "K = 00, 01"),
                                (text + f"import {NS}.CapPieces.N00x3\n", "other than the row assemblies"),
                                (f"import {NS}.Soundness\n", "K = 00, 01")):
            with self.subTest(message=message):
                self.write(nodes, broken)
                self.assertLayoutFails(message)
        self.write(nodes, text)
        self.write(LA + "CapPieces/N00x3.lean", (self.root / LA / "CapPieces/N00x3.lean").read_text().replace(
            "import Grothe.LowerAnalytic.CapCommonFacts\n", f"import {NS}.CapRow07.Data\nimport {NS}.CapCommonFacts\n"))
        self.write(LA + "CapRow07/Data.lean", f"import {NS}.CapCommon\n")
        self.assertLayoutFails("belongs to row 7")

    def test_missing_caps_module_fails(self):
        (self.root / LA / "CapPieces/R00x3_1.lean").unlink()
        self.assertLayoutFails("R00x3_1 is imported but .* does not exist")

    def test_hidden_native_facts_fail(self):
        hidden = f"\nnamespace {NS}\ntheorem hidden : True := by native_decide\nend {NS}\n"
        for name in (LA + "CapPieces/D00x3.lean", LA + "CapRow00/Data.lean", LA + "CapCommon.lean",
                     LA + "CapDefs.lean", "Grothe/Shared.lean", LA + "CapPieces/N00x3.lean", LA + "CapRow01/Bridge.lean",
                     LA + "CapCommonFacts.lean"):
            with self.subTest(name=name):
                saved = (self.root / name).read_bytes()
                self.append(name, hidden)
                self.assertLayoutFails("native fact")
                (self.root / name).write_bytes(saved)

    def test_comment_and_string_mentions_are_not_facts(self):
        self.append(LA + "CapDefs.lean", '/- native_decide /- nested -/ -/\n-- native_decide\ndef s := "native_decide"\n')
        self.assertEqual(self.run_cli("--write-registry").returncode, 0)
        self.assertEqual(self.run_cli("--digest").returncode, 0)

    def test_leaf_facts_are_exactly_the_expected_ones(self):
        leaf = LA + "CapPieces/R00x3_0.lean"
        text = (self.root / leaf).read_text()
        second = f"\nnamespace {NS}\ntheorem more : True := by native_decide\nend {NS}\n"
        for broken, message in ((text.replace("pieceRange_00x3_0", "pieceRange_00x3_9"), "expected exactly one"),
                                (text.replace("pieceRangeOKNu ε capNu capRow00", "pieceRangeOKNu ε capNu capRow01"),
                                 "expected exactly one"),
                                (text.replace("pieceRangeOKNu ε capNu capRow00 capR00 pieceNode_00x3 0 7 = true", "True"),
                                 "expected exactly one"),
                                (text.replace("native_decide", "decide"), "expected exactly one"),
                                (text.replace("theorem pieceRange", "private theorem pieceRange"), "private"),
                                (text.replace(f"namespace {NS}", "namespace Other").replace(f"end {NS}", "end Other"),
                                 "sole `namespace"),
                                (text.replace("native_decide", "native_decide\n  native_decide"), "more than one"),
                                (text + second, "sole `namespace"),
                                (text.replace("  native_decide", "  sorry"), "sorry"),
                                (text + "\naxiom cheat : False\n", "axiom")):
            with self.subTest(message=message, broken=broken[-80:]):
                self.write(leaf, broken)
                self.assertLayoutFails(message)
        self.write(leaf, text)
        self.assertEqual(self.run_cli("--digest").returncode, 0)

    def test_native_facts_must_be_listed(self):
        tail, axioms = self.root / "data/tail-caps/native.txt", self.root / "data/axioms/native.txt"
        listed = tail.read_text()
        tail.write_text(listed + f"{NS}.extra._native.native_decide.ax_1_1\n")
        self.assertLayoutFails("native.txt and the leaves' native facts differ")
        tail.write_text("".join(listed.splitlines(keepends=True)[1:]))
        self.assertLayoutFails("native.txt and the leaves' native facts differ")
        tail.unlink()   # merged into data/axioms/native.txt: still accepted
        self.assertLayoutFails("listed in neither")
        axioms.write_text(axioms.read_text() + listed)
        self.assertEqual(self.run_cli("--write-registry").returncode, 0)
        self.assertEqual(self.run_cli("--digest").returncode, 0)

    def test_leaves_must_be_independent(self):
        self.write(LA + "CapPieces/R00x3_1.lean", f"import {NS}.CapPieces.R00x3_0\n" +
                   (self.root / LA / "CapPieces/R00x3_1.lean").read_text())
        self.assertLayoutFails(r"dependent native leaves: Grothe\.LowerAnalytic\.CapPieces\.R00x3_1 imports")

    def test_computation_closure_excludes_the_caps_proof_layer(self):
        self.write(LA + "CapDefs.lean", f"import {NS}.CapCommonFacts\n" + (self.root / LA / "CapDefs.lean").read_text())
        self.assertLayoutFails("project import cycle|proof module")

    def test_checker_library_imports_only_itself(self):
        self.write("GrotheCapsKernel/Basic.lean", "import Grothe.Quad\n-- the checker library fixture\n")
        self.assertLayoutFails("GrotheCapsKernel imports another project library")

    def test_symlinked_source_fails(self):
        path = self.root / LA / "CapPieces/C00x3.lean"
        path.rename(self.root / "C00x3.lean")
        path.symlink_to(self.root / "C00x3.lean")
        self.assertLayoutFails("symlink")

    # --- import header parsing (on the quadrature dependency, which is hashed but not registered)

    def test_missing_project_import_is_an_error(self):
        for namespace in ("Grothe", "GrotheKernel", "GrotheCapsKernel", "GrotheQuadKernel", "GrotheQuadExtKernel"):
            with self.subTest(namespace=namespace):
                self.write("Grothe/Quad.lean", f"import {namespace}.DoesNotExist\n")
                self.assertFails(message="does not exist")

    def test_missing_second_project_import_fails_closed(self):
        self.write("Grothe/Quad.lean", "import Mathlib.Tactic Grothe.DoesNotExist\n")
        self.assertFails(message="does not exist")

    def test_unsupported_import_syntax_is_an_error(self):
        for header in ("import Grothe.A, Grothe.B\n", "import\n", "import Grothe.Shared; import Grothe.Quad\n"):
            with self.subTest(header=header):
                self.write("Grothe/Quad.lean", header)
                self.assertFails(message="unsupported import syntax")

    def test_text_after_the_header_is_not_an_import(self):
        self.write("Grothe/Quad.lean", "-- c\n/-! doc\nimport Grothe.Nope\n-/\n")
        self.assertEqual(self.run_cli("--digest").returncode, 0)

    def test_multiple_imports_and_inline_comments(self):
        self.write("Grothe/Quad.lean", "import Grothe.First Grothe.Second -- import Grothe.NotReal\n")
        for name in ["First", "Second"]:
            self.write(f"Grothe/{name}.lean", "-- synthetic dependency\n")
        result = self.run_cli("--list")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("Grothe/First.lean\n", result.stdout)
        self.assertIn("Grothe/Second.lean\n", result.stdout)
        self.assertNotIn("NotReal", result.stdout)

    def test_nested_block_comments_in_import_header(self):
        self.write("Grothe/Quad.lean", "/- license\n /- nested import Grothe.NotReal -/\n-/\n"
                                       "import Grothe.First /- inline import Grothe.NotReal -/ Grothe.Second\n")
        for name in ["First", "Second"]:
            self.write(f"Grothe/{name}.lean", "-- synthetic dependency\n")
        result = self.run_cli("--list")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("Grothe/First.lean\n", result.stdout)
        self.assertIn("Grothe/Second.lean\n", result.stdout)
        self.assertNotIn("NotReal", result.stdout)

    def test_pinned_lean_module_and_public_meta_import_header(self):
        self.write("Grothe/Quad.lean", "module\npublic meta import Grothe.Child\n")
        self.write("Grothe/Child.lean", "-- synthetic dependency\n")
        result = self.run_cli("--list")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("Grothe/Child.lean\n", result.stdout)

    def test_unterminated_import_header_comment_fails_closed(self):
        self.write("Grothe/Quad.lean", "/- unterminated\nimport Grothe.Nope\n")
        self.assertFails(message="unterminated block comment")

    def test_unterminated_lean_comment_is_not_silently_pure(self):
        module = load(self.script)
        with self.assertRaises(module.ClosureError):
            module.lean_code("/- native_decide")
        self.write(LA + "CapDefs.lean", (self.root / LA / "CapDefs.lean").read_text() + '\ndef s := "native_decide\n')
        self.assertLayoutFails("unterminated Lean comment or string")


class RepositoryBoundaryTests(unittest.TestCase):
    """The real repository: the committed registry matches the sources, and the hashed sets have the intended shape."""

    @classmethod
    def setUpClass(cls):
        cls.caps = load(SCRIPT, "repository_caps_stamp")
        cls.digest, cls.files = cls.caps.stamp(cls.caps.ROOT)
        cls.view = cls.caps.load_registry(cls.caps.Sources(cls.caps.ROOT))

    def test_registry_matches_the_sources(self):
        self.assertRegex(self.digest, "^[0-9a-f]{64}$")
        self.assertEqual(self.files[-1], self.caps.REGISTRY)
        self.assertEqual(len(self.files), len(set(self.files)))

    def test_computation_closure_excludes_the_proof_layer(self):
        proof_modules = {
            "NodeCaps", "Reduction", "WitnessCap", "Bridge", "RowCheck", "CapRows", "CapRowsNu", "CapAssembly",
            "CapLinAlg", "CapPiece", "CapPieceNu", "CapCheckSound", "CapCheckNuSound", "CapGridOK", "CapTablesMk",
            "CapCover", "CapConstr", "CapPieceNodes", "CapNodeNu", "CapCommonFacts", "RowGaussian", "CapNodes",
        }
        leaves = [p[:-5].replace("/", ".") for p in self.view["compute_roots"] if p not in self.view["assembly_roots"]]
        data = [f"Grothe.LowerAnalytic.CapRow{row:02d}.Data" for row in self.view["rows"]]
        computation = self.caps.closure(leaves + data)
        forbidden = [m for m in computation if m.rsplit(".", 1)[-1] in proof_modules
                     or m.startswith("Grothe.Lower.Cert.") or re.search(r"\.CapPieces\.N\d|\.Assembly$|\.Bridge$", m)]
        self.assertEqual(forbidden, [])
        self.assertEqual(sorted(p[:-5].replace("/", ".") for p in self.view["pure_roots"] + self.view["compute_roots"]
                                if p not in self.view["assembly_roots"]),
                         sorted(computation + ["GrotheCapsKernel"]))
        self.assertNotIn("Grothe/LowerAnalytic/Bridge.lean", self.files)   # CI's probe file

    def test_assemblies_nodes_and_bridges_are_hashed_directly(self):
        direct = set(self.view["direct_hash_roots"])
        self.assertTrue(set(self.view["assembly_roots"]) <= direct <= set(self.files))
        self.assertEqual(len(self.view["assembly_roots"]), len(self.view["rows"]))
        self.assertTrue(all(re.search(r"/(CapPieces/N\d\dx\d+|CapRow\d\d/(Assembly|Bridge)|CapCommonFacts)\.lean$", p)
                            for p in direct))
        self.assertTrue(set(self.caps.EXTRA) <= set(self.files))

    def test_one_target_contains_the_node_caps(self):
        # one build target: the generated root Grothe.lean imports every caps module (no separate caps target)
        root = Path(self.caps.ROOT)
        ordinary = set(self.caps.imports_of(root / "Grothe.lean"))
        caps = {p[:-5].replace("/", ".") for p in self.view["compute_roots"] + self.view["direct_hash_roots"]
                + self.view["pure_roots"] if p.startswith("Grothe/")}
        self.assertEqual(sorted(caps - ordinary), [])
        self.assertIn("Grothe.LowerAnalytic.CapNodes", ordinary)
        self.assertTrue(set(self.caps.QUAD_TOPS) <= ordinary)

    def test_cap_checker_library_is_independent_of_other_project_libraries(self):
        self.assertEqual(set(self.caps.closure(["GrotheCapsKernel"])),
                         {"GrotheCapsKernel", "GrotheCapsKernel.Basic", "GrotheCapsKernel.CapPoly",
                          "GrotheCapsKernel.CapCheck", "GrotheCapsKernel.CapCheckNu"})

    def test_every_leaf_fact_is_a_listed_native_fact(self):
        listed = {line.strip() for name in (self.caps.TAIL_NATIVE, self.caps.AXIOMS_NATIVE)
                  if (Path(self.caps.ROOT) / name).exists()
                  for line in (Path(self.caps.ROOT) / name).read_text().splitlines()}
        facts = {d + self.caps.NATIVE_SUFFIX for ds in self.view["native_declarations_by_root"].values() for d in ds}
        self.assertEqual(sorted(facts - listed), [])
        self.assertEqual(len(facts), len(self.view["compute_roots"]))


class ChangeFilterTests(unittest.TestCase):
    """Every pinned source and every caps script activates the proof check (LEAN_PATHS of lean.yml)."""

    def test_every_pinned_source_and_script_matches_lean_paths(self):
        root = Path(__file__).resolve().parents[1]
        workflow = (root / ".github/workflows/lean.yml").read_text()
        pattern = re.search(r"LEAN_PATHS='([^']+)'", workflow).group(1)
        registry = json.loads((root / REGISTRY).read_text())
        pinned = set(registry["source_sha256"]) | {
            "scripts/caps_stamp.py", "scripts/test_caps_stamp.py", "scripts/build_caps_batches.py",
            "scripts/test_build_caps_batches.py", "scripts/caps_coexist.py", "data/axioms/native.txt"}
        self.assertEqual(sorted(path for path in pinned if not re.search(pattern, path)), [])


if __name__ == "__main__":
    unittest.main()
