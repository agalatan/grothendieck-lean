#!/usr/bin/env python3
"""Recompute the exact private cell-head witnesses locally. Agent-ID: codex-a7c4.

This can take hours. It builds only the named pure computation modules, never the full
repository. The generated intervals are untrusted until their closed Lean checks pass.
"""

import argparse
import platform
import subprocess
from pathlib import Path


MODULES = [
    "CertificateInputs", "CellEncoding", "CellData", "CellCompute", "RadialCompute",
    "CellHeadCompute", "HeadCompute", "RootData",
]


def command(root: Path, output: Path) -> list[str]:
    suffix = ".dylib" if platform.system() == "Darwin" else ".so"
    library = root / ".lake/build/lib"
    plugins = [library / ("libgrothe_" + name + suffix)
               for name in ["GrotheCapsKernel", "GrotheKernel", "GrotheQuadKernel"]]
    plugins += [library / "lean" / ("grothe_Grothe_UpperReplacement_" + name + suffix)
                for name in MODULES]
    for path in plugins:
        if not path.is_file():
            raise FileNotFoundError(f"Required local native library is missing: {path}")
    args = ["lake", "env", "lean"]
    for path in plugins:
        args.extend(["--plugin", str(path)])
    return args + ["--run", "tools/private_upper_head.lean", str(output)]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-dir", type=Path, default=Path(".lake/private-upper-head"))
    parser.add_argument("--skip-build", action="store_true",
                        help="Use already built local computation libraries")
    parser.add_argument("--check-program", action="store_true",
                        help="Elaborate the IO program and print its usage, without the long calculation")
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[1]
    if not args.skip_build:
        subprocess.run(["lake", "build", "Grothe.Upper.Data"] +
                       ["Grothe.UpperReplacement." + name + ":dynlib" for name in MODULES],
                       cwd=root, check=True)
    output = args.output_dir.resolve()
    cmd = command(root, output)
    if args.check_program:
        cmd[-1] = "--help"
    subprocess.run(cmd, cwd=root, check=True)


if __name__ == "__main__":
    main()
