#!/usr/bin/env python3
"""Caps cache CLI and repository-boundary regressions; no Lean build or real marker writes."""
import contextlib
import hashlib
import importlib.util
import io
import json
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch


SCRIPT = Path(__file__).with_name("caps_stamp.py")


class CapsStampTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        (self.root / "scripts").mkdir()
        self.script = self.root / "scripts/caps_stamp.py"
        shutil.copyfile(SCRIPT, self.script)
        self.mark = self.root / ".lake/build/caps-closure.sha"

        # Pin the roots and the hash order independently of the checker.
        rows = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18]
        sources = {f"Grothe/LowerAnalytic/CapRow{k:02d}.lean": "import Mathlib.Tactic Grothe.Shared\n-- body\n"
                   for k in rows}
        sources["Grothe/Shared.lean"] = "-- shared fixture dependency\nimport Mathlib.Data.Real.Basic\n"
        ordered = sorted(sources)
        extra = {
            "Grothe/LowerAnalytic/CapNodes.lean": "-- cap combination fixture\n",
            "GrotheCapsKernel.lean": "-- cap checker library root fixture\n",
            "lean-toolchain": "leanprover/lean4:v4.34.1\n",
            "lake-manifest.json": "{}\n",
            "lakefile.toml": "name = \"fixture\"\n",
        }
        sources.update(extra)
        ordered.extend(extra)
        expected = hashlib.sha256()
        for name in ordered:
            path = self.root / name
            path.parent.mkdir(parents=True, exist_ok=True)
            data = sources[name].encode()
            path.write_bytes(data)
            expected.update(name.encode() + b"\0")
            expected.update(data)
        self.digest = expected.hexdigest()
        self.count = len(ordered)
        self.ordered = ordered

    def run_cli(self, *args):
        return subprocess.run([sys.executable, str(self.script), *args],
                              capture_output=True, text=True, check=False)

    def write_marker(self, digest=None):
        self.mark.parent.mkdir(parents=True, exist_ok=True)
        self.mark.write_text((digest or self.digest) + "\n")

    def activate_fixture(self):
        leaf = "Grothe/LowerAnalytic/CapPieces/C12x140.lean"
        sources = {
            leaf: "import Grothe.Compute\n-- new native computation fixture\n",
            "Grothe/Compute.lean": "import Grothe.Shared\n-- pure dependency\n",
            "Grothe/LowerAnalytic/CapRow12/Assembly.lean": "import Grothe.Bridge\n-- direct assembly fixture\n",
            "Grothe/Bridge.lean": "-- proof layer must remain outside the computation stamp\n",
        }
        for name, source in sources.items():
            path = self.root / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(source)
        roots = [name for name in self.ordered if "/CapRow" in name] + [leaf]
        registry = {
            "format": "caps-bounded-build-v1", "row": 12,
            "compute_roots": roots,
            "direct_hash_roots": ["Grothe/LowerAnalytic/CapNodes.lean", "Grothe/LowerAnalytic/CapRow12/Assembly.lean"],
            "compute_count": 16, "row12_compute_count": 1,
        }
        path = self.root / "data/caps-m/plan/row-certificates/row12-build.json"
        path.parent.mkdir(parents=True)
        path.write_text(json.dumps(registry))
        return path, registry

    def test_digest_is_pinned(self):
        result = self.run_cli("--digest")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(result.stdout, f"sha256 {self.digest}\nfiles {self.count}\n")
        self.assertFalse(self.mark.exists())

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

    def test_source_change_invalidates_marker(self):
        self.write_marker()
        (self.root / "Grothe/Shared.lean").write_text("-- changed\n")
        result = self.run_cli()
        self.assertEqual(result.returncode, 1)
        self.assertIn("current sources", result.stdout)

    def test_lakefile_change_invalidates_marker(self):
        self.write_marker()
        (self.root / "lakefile.toml").write_text("name = \"changed\"\n")
        self.assertEqual(self.run_cli().returncode, 1)

    def test_mismatched_marker_fails(self):
        self.write_marker("0" * 64)
        self.assertEqual(self.run_cli().returncode, 1)

    def test_digest_ignores_mismatched_marker(self):
        self.write_marker("0" * 64)
        before = self.mark.read_bytes()
        result = self.run_cli("--digest")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(result.stdout, f"sha256 {self.digest}\nfiles {self.count}\n")
        self.assertEqual(self.mark.read_bytes(), before)

    def test_mark_records_digest_and_passes_check(self):
        result = self.run_cli("--mark-cache")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(self.mark.read_text(), self.digest + "\n")
        self.assertEqual(self.run_cli("--check-cache").returncode, 0)

    def test_checker_library_root_change_invalidates_marker(self):
        self.write_marker()
        (self.root / "GrotheCapsKernel.lean").write_text("-- changed library root\n")
        self.assertEqual(self.run_cli("--check-cache").returncode, 1)

    def test_missing_project_import_is_an_error(self):
        for namespace in ("Grothe", "GrotheKernel", "GrotheCapsKernel"):
            with self.subTest(namespace=namespace):
                (self.root / "Grothe/Shared.lean").write_text(f"import {namespace}.DoesNotExist\n")
                result = self.run_cli("--digest")
                self.assertEqual(result.returncode, 1)
                self.assertIn("does not exist", result.stdout)

    def test_unsupported_import_syntax_is_an_error(self):
        (self.root / "Grothe/Shared.lean").write_text("import Grothe.A, Grothe.B\n")
        result = self.run_cli("--digest")
        self.assertEqual(result.returncode, 1)
        self.assertIn("unsupported import syntax", result.stdout)

    def test_text_after_the_header_is_not_an_import(self):
        (self.root / "Grothe/Shared.lean").write_text("-- c\n/-! doc\nimport Grothe.Nope\n-/\n")
        self.assertEqual(self.run_cli("--digest").returncode, 0)

    def test_incompatible_and_unknown_options_fail(self):
        for args in [("--digest", "--mark-cache"), ("--check-cache", "--digest"),
                     ("--check-cache", "--mark-cache"), ("--check",), ("--write", "x"),
                     ("--write",), ("--dig",), ("--unknown",), ("unexpected",)]:
            with self.subTest(args=args):
                self.assertEqual(self.run_cli(*args).returncode, 2)
                self.assertFalse(self.mark.exists())


    # Decoupling cases use the same isolated fixture; never write the real marker.

    def test_list_matches_pinned_order_and_is_read_only(self):
        before = sorted(str(path.relative_to(self.root)) for path in self.root.rglob("*"))
        result = self.run_cli("--list")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(result.stdout,
                         "\n".join(self.ordered) + f"\n{self.count} files; sha256 {self.digest}\n")
        self.assertFalse(self.mark.exists())
        self.assertEqual(before, sorted(str(path.relative_to(self.root)) for path in self.root.rglob("*")))

    def test_decoupled_48_module_plus_five_extra_boundary(self):
        data_names = [f"Grothe.Pure{k:02d}" for k in range(32)]
        (self.root / "Grothe/Shared.lean").write_text("import " + " ".join(data_names) + "\n")
        for name in data_names:
            path = self.root.joinpath(*name.split(".")).with_suffix(".lean")
            path.write_text("-- synthetic rational data\n")
        # These roots are hashed directly, but their imports are deliberately not traversed.
        (self.root / "Grothe/LowerAnalytic/CapNodes.lean").write_text("import Grothe.ProofOnly\n")
        (self.root / "GrotheCapsKernel.lean").write_text("import Grothe.UntraversedRootImport\n")
        (self.root / "Grothe/ProofOnly.lean").write_text("-- synthetic soundness proof\n")
        (self.root / "Grothe/AnotherProofOnly.lean").write_text("-- synthetic final proof\n")
        (self.root / "Grothe/UntraversedRootImport.lean").write_text("-- synthetic extra-root dependency\n")
        extra_files = ["Grothe/LowerAnalytic/CapNodes.lean", "GrotheCapsKernel.lean",
                       "lean-toolchain", "lake-manifest.json", "lakefile.toml"]
        computation = sorted([name for name in self.ordered if name.endswith(".lean") and
                              name not in extra_files] +
                             [str(Path(*name.split(".")).with_suffix(".lean")) for name in data_names])
        self.assertEqual(len(computation), 48)
        expected_files = computation + extra_files
        expected_hash = hashlib.sha256()
        for name in expected_files:
            expected_hash.update(name.encode() + b"\0")
            expected_hash.update((self.root / name).read_bytes())
        expected = expected_hash.hexdigest()
        listed = self.run_cli("--list")
        self.assertEqual(listed.returncode, 0, listed.stdout + listed.stderr)
        self.assertEqual(listed.stdout,
                         "\n".join(expected_files) + f"\n53 files; sha256 {expected}\n")
        self.assertEqual(self.run_cli("--digest").stdout, f"sha256 {expected}\nfiles 53\n")
        self.assertEqual(self.run_cli("--mark-cache").returncode, 0)
        for name in ["Grothe/ProofOnly.lean", "Grothe/AnotherProofOnly.lean", "Grothe/UntraversedRootImport.lean"]:
            (self.root / name).write_text("-- changed untraversed proof\n")
        self.assertEqual(self.run_cli("--check-cache").returncode, 0)
        (self.root / "Grothe/LowerAnalytic/CapNodes.lean").write_text("-- changed directly hashed assembly\n")
        self.assertEqual(self.run_cli("--check-cache").returncode, 1)

    def test_multiple_imports_and_inline_comments(self):
        (self.root / "Grothe/Shared.lean").write_text(
            "import Grothe.First Grothe.Second -- import Grothe.NotReal\n")
        for name in ["First", "Second"]:
            (self.root / f"Grothe/{name}.lean").write_text("-- synthetic dependency\n")
        result = self.run_cli("--list")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("Grothe/First.lean\n", result.stdout)
        self.assertIn("Grothe/Second.lean\n", result.stdout)
        self.assertNotIn("NotReal", result.stdout)

    def test_nested_block_comments_in_import_header(self):
        (self.root / "Grothe/Shared.lean").write_text(
            "/- license\n /- nested import Grothe.NotReal -/\n-/\n"
            "import Grothe.First /- inline import Grothe.NotReal -/ Grothe.Second\n")
        for name in ["First", "Second"]:
            (self.root / f"Grothe/{name}.lean").write_text("-- synthetic dependency\n")
        result = self.run_cli("--list")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("Grothe/First.lean\n", result.stdout)
        self.assertIn("Grothe/Second.lean\n", result.stdout)
        self.assertNotIn("NotReal", result.stdout)

    def test_missing_second_project_import_fails_closed(self):
        (self.root / "Grothe/Shared.lean").write_text("import Mathlib.Tactic Grothe.DoesNotExist\n")
        result = self.run_cli("--digest")
        self.assertEqual(result.returncode, 1)
        self.assertIn("does not exist", result.stdout)

    def test_pinned_lean_module_and_public_meta_import_header(self):
        (self.root / "Grothe/Shared.lean").write_text("module\npublic meta import Grothe.Child\n")
        (self.root / "Grothe/Child.lean").write_text("-- synthetic dependency\n")
        result = self.run_cli("--list")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("Grothe/Child.lean\n", result.stdout)

    def test_unterminated_import_header_comment_fails_closed(self):
        (self.root / "Grothe/Shared.lean").write_text("/- unterminated\nimport Grothe.Nope\n")
        result = self.run_cli("--digest")
        self.assertEqual(result.returncode, 1)
        self.assertIn("unterminated block comment", result.stdout)

    def test_empty_import_fails_closed(self):
        (self.root / "Grothe/Shared.lean").write_text("import\n")
        result = self.run_cli("--digest")
        self.assertEqual(result.returncode, 1)
        self.assertIn("unsupported import syntax", result.stdout)

    def test_list_is_exclusive_with_other_modes(self):
        for args in [("--list", "--digest"), ("--list", "--mark-cache"), ("--list", "--check-cache")]:
            with self.subTest(args=args):
                self.assertEqual(self.run_cli(*args).returncode, 2)
                self.assertFalse(self.mark.exists())

    def test_import_has_no_cli_or_marker_side_effects(self):
        spec = importlib.util.spec_from_file_location("caps_marker_fixture", self.script)
        module = importlib.util.module_from_spec(spec)
        output = io.StringIO()
        with patch.object(sys, "argv", [str(self.script), "--unknown"]), \
                contextlib.redirect_stdout(output), contextlib.redirect_stderr(output):
            spec.loader.exec_module(module)
        self.assertEqual(output.getvalue(), "")
        self.assertFalse(self.mark.exists())
        self.assertEqual(module.digest(), (self.digest, self.count))

    def test_activated_compute_closure_and_direct_assembly_are_hashed(self):
        path, _ = self.activate_fixture()
        result = self.run_cli("--list")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        names = result.stdout.splitlines()[:-1]
        self.assertIn("Grothe/LowerAnalytic/CapPieces/C12x140.lean", names)
        self.assertIn("Grothe/Compute.lean", names)
        self.assertIn("Grothe/LowerAnalytic/CapRow12/Assembly.lean", names)
        self.assertIn(str(path.relative_to(self.root)), names)
        self.assertNotIn("Grothe/Bridge.lean", names)
        self.assertEqual(len(names), len(set(names)))
        expected = hashlib.sha256()
        for name in names:
            expected.update(name.encode() + b"\0" + (self.root / name).read_bytes())
        self.assertEqual(result.stdout.splitlines()[-1], f"{len(names)} files; sha256 {expected.hexdigest()}")

    def test_activated_leaf_dependency_assembly_and_registry_changes_invalidate(self):
        path, _ = self.activate_fixture()
        before = self.run_cli("--digest").stdout
        for name in ["Grothe/LowerAnalytic/CapPieces/C12x140.lean", "Grothe/Compute.lean",
                     "Grothe/LowerAnalytic/CapRow12/Assembly.lean", str(path.relative_to(self.root))]:
            with self.subTest(name=name):
                target = self.root / name
                saved = target.read_bytes()
                target.write_bytes(saved + (b" " if name.endswith(".json") else b"-- changed\n"))
                result = self.run_cli("--digest")
                self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
                self.assertNotEqual(result.stdout, before)
                target.write_bytes(saved)
        (self.root / "Grothe/Bridge.lean").write_text("-- unrelated proof edit\n")
        self.assertEqual(self.run_cli("--digest").stdout, before)

    def test_activated_assembly_without_registry_fails_closed(self):
        path, _ = self.activate_fixture()
        path.unlink()
        result = self.run_cli("--digest")
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("requires", result.stdout)

    def test_activated_registry_rejects_bad_roots_and_census(self):
        path, registry = self.activate_fixture()
        bad = [dict(registry, compute_roots=registry["compute_roots"] + [registry["compute_roots"][-1]]),
               dict(registry, compute_roots=registry["compute_roots"][:-1] + ["../escape.lean"]),
               dict(registry, compute_roots=registry["compute_roots"][:-1] + ["Mathlib/Data/Real/Basic.lean"]),
               dict(registry, compute_roots=registry["compute_roots"][1:]),
               dict(registry, compute_count=15), dict(registry, direct_hash_roots=[])]
        for value in bad:
            with self.subTest(value=value):
                path.write_text(json.dumps(value))
                result = self.run_cli("--digest")
                self.assertNotEqual(result.returncode, 0)
                self.assertIn("FAIL:", result.stdout)

    def test_activated_registry_rejects_malformed_json(self):
        path, _ = self.activate_fixture()
        path.write_text("{")
        result = self.run_cli("--digest")
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("cannot read", result.stdout)


class RepositoryBoundaryTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        spec = importlib.util.spec_from_file_location("repository_caps_marker", SCRIPT)
        cls.caps = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(cls.caps)

    def test_heavy_computation_closures_exclude_the_proof_layer(self):
        proof_modules = {
            "NodeCaps", "Reduction", "WitnessCap", "Bridge", "RowCheck", "CapRows", "CapAssembly", "CapHull",
            "CapLinAlg", "CapPiece", "CapCheckSound", "CapGridOK", "CapTablesMk", "CapCover",
            "CapConstr", "CapPieceNodes",
        }
        piece_dir = SCRIPT.parent.parent / "Grothe/LowerAnalytic/CapPieces"
        pieces = ["Grothe.LowerAnalytic.CapPieceRange"] + [
            f"Grothe.LowerAnalytic.CapPieces.{path.stem}"
            for path in sorted(piece_dir.glob("*.lean")) if path.stem.startswith(("C", "R"))
        ]
        for layer, roots in (("rows", self.caps.TOPS), ("pieces", pieces)):
            with self.subTest(layer=layer):
                forbidden = [module for module in self.caps.closure(roots)
                             if module.rsplit(".", 1)[-1] in proof_modules
                             or module.startswith("Grothe.Lower.Cert.")]
                self.assertEqual(forbidden, [])

    def test_one_target_contains_the_node_caps(self):
        # one build target: the root Grothe imports the node-cap rows and their assembly (no separate caps target);
        # Activated row12 is in the one target; pending rows13-15 remain excluded.
        ordinary = set(self.caps.closure(["Grothe"]))
        self.assertTrue(set(self.caps.TOPS) <= ordinary)
        self.assertIn("Grothe.LowerAnalytic.CapNodes", ordinary)
        activated, direct = self.caps.activated_sources()
        self.assertTrue(set(activated) <= ordinary)
        self.assertIn("Grothe/LowerAnalytic/CapRow12/Assembly.lean", direct)
        self.assertIn("Grothe.LowerAnalytic.CapRow12.Assembly", ordinary)
        pieces = {module.rsplit(".", 1)[-1] for module in ordinary
                  if module.startswith("Grothe.LowerAnalytic.CapPieces.")}
        self.assertEqual(len(pieces), 1458)
        self.assertTrue(all(name.startswith(("C12x", "D12x", "N12x", "R12x")) for name in pieces))

    def test_cap_checker_library_is_independent_of_other_project_libraries(self):
        modules = self.caps.closure(["GrotheCapsKernel"])
        self.assertTrue(all(module == "GrotheCapsKernel" or module.startswith("GrotheCapsKernel.")
                            for module in modules))
        self.assertEqual(set(modules), {"GrotheCapsKernel", "GrotheCapsKernel.Basic",
                                       "GrotheCapsKernel.CapPoly", "GrotheCapsKernel.CapCheck"})

    def test_all_activated_compute_leaves_are_pinned_without_analytic_imports(self):
        roots, direct = self.caps.activated_sources()
        self.assertEqual(len(roots), 1322)
        self.assertEqual(len(set(roots) - set(self.caps.TOPS)), 1307)
        computation = set(self.caps.closure(roots))
        self.assertNotIn("Grothe.LowerAnalytic.CapRow12.Assembly", computation)
        self.assertFalse(any(module.startswith("Grothe.LowerAnalytic.CapPieces.N12x") for module in computation))
        self.assertNotIn("Grothe.Lower.Bridge", computation)
        files = set(self.caps.source_files())
        self.assertTrue(set(direct) <= files)
        self.assertIn(self.caps.BUILD_REGISTRY, files)


if __name__ == "__main__":
    unittest.main()
