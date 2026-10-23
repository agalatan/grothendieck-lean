#!/usr/bin/env python3
"""Standard-library negative tests for the portable barrier replay entry points."""
import argparse
import ast
import importlib.util
import json
from pathlib import Path
import subprocess
import sys
import tempfile

if sys.flags.optimize:
    raise SystemExit("Negative proof-check tests refuse Python -O/-OO.")


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--out",required=True,type=Path)
    args=ap.parse_args()
    here=Path(__file__).resolve().parent
    repo=here.parent
    scripts=[here/name for name in (
        "fresh_barrier_radial_spectral.py","fresh_barrier_repair.py",
        "fresh_barrier_verify_repairs.py","fresh_barrier_frozen_countermodel.py",
        "fresh_barrier_moment_extension.py")]
    checks=[]
    for path in scripts+[Path(__file__).resolve()]:
        ast.parse(path.read_text(),filename=str(path))
        for flag in ("-O","-OO"):
            r=subprocess.run([sys.executable,"-B","-I",flag,str(path),"--help"],
                capture_output=True,text=True)
            if r.returncode==0 or "refuse" not in (r.stdout+r.stderr).lower():
                raise RuntimeError(f"Optimization guard failed: {path.name} {flag}")
            checks.append({"script":path.name,"case":flag,"rejected":True})
    args.out.parent.mkdir(parents=True,exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="negative-tests-",dir=args.out.parent) as tmp:
        out=Path(tmp)/"forbidden-result.json"
        dummy=Path(tmp)/"not-a-law.json"
        for name,prefix in (
            ("fresh_barrier_radial_spectral.py",[]),
            ("fresh_barrier_verify_repairs.py",[str(dummy)]),
            ("fresh_barrier_repair.py",[str(dummy)])):
            for degree in ("-1","0","1"):
                cmd=[sys.executable,"-B","-I",str(here/name),*prefix,
                     "--max-degree",degree,"--out",str(out)]
                r=subprocess.run(cmd,capture_output=True,text=True)
                if r.returncode==0 or out.exists() or "at least 2" not in r.stderr:
                    raise RuntimeError(f"Degree validation failed: {name} {degree}")
                checks.append({"script":name,"case":"degree="+degree,"rejected":True})
        for key,value in (("--vmax","nan"),("--vmax","inf"),("--vmax","0"),
                          ("--iterations","0")):
            r=subprocess.run([sys.executable,"-B","-I",str(here/"fresh_barrier_repair.py"),
                str(dummy),key,value,"--out",str(out)],capture_output=True,text=True)
            if r.returncode==0 or out.exists() or "error:" not in r.stderr:
                raise RuntimeError(f"Discovery argument validation failed: {key} {value}")
            checks.append({"script":"fresh_barrier_repair.py","case":key+"="+value,"rejected":True})
        for degree in ("0","1","2","3"):
            name="fresh_barrier_moment_extension.py"
            r=subprocess.run([sys.executable,"-B","-I",str(here/name),
                "--max-degree",degree,"--out",str(out)],capture_output=True,text=True)
            if r.returncode==0 or out.exists() or "at least 4" not in r.stderr:
                raise RuntimeError(f"Extension degree validation failed: {degree}")
            checks.append({"script":name,"case":"degree="+degree,"rejected":True})
        r=subprocess.run([sys.executable,"-B","-I",str(here/"fresh_barrier_moment_extension.py"),
            "--base","1,1,3/2,4","--out",str(out)],capture_output=True,text=True)
        if r.returncode==0 or out.exists() or "must satisfy M2 and M3" not in r.stderr:
            raise RuntimeError("Extension accepted a base with invalid M2")
        checks.append({"script":"fresh_barrier_moment_extension.py",
            "case":"M3-positive base with invalid M2","rejected":True})
    spec=importlib.util.spec_from_file_location("fresh_spectral",scripts[0])
    S=importlib.util.module_from_spec(spec)
    sys.dont_write_bytecode=True
    spec.loader.exec_module(S)
    for matrix in ([],[[1,2]],[[1,2],[3,4]]):
        try:
            S.psd_or_witness(matrix)
        except ValueError:
            checks.append({"script":scripts[0].name,"case":"malformed/non-symmetric matrix","rejected":True})
        else:
            raise RuntimeError("Malformed PSD input was accepted")
    result={"format":"fresh-barrier-negative-tests/v1","all_pass":True,"checks":checks}
    args.out.write_text(json.dumps(result,indent=2)+"\n")
    print("PASS",len(checks),"negative entry-point and matrix checks")


if __name__=="__main__":
    main()
