#!/usr/bin/env python3
"""Exact replay of repaired finite-model laws; standard-library Python only."""
import argparse
from fractions import Fraction as Q
import hashlib
import importlib.util
import json
from math import comb, factorial
from pathlib import Path
import sys
if sys.flags.optimize:
    raise SystemExit("Exact repair replay refuses Python -O/-OO: assertions are proof checks.")
sys.dont_write_bytecode = True


def module(name, path):
    spec=importlib.util.spec_from_file_location(name,path)
    mod=importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument("laws",nargs="+",type=Path)
    ap.add_argument("--source-repo",type=Path,default=Path(__file__).resolve().parents[1],
                    help="isolated replay root containing tools/fresh_barrier_frozen_countermodel.py")
    ap.add_argument("--max-degree",default=6,type=int)
    ap.add_argument("--out",required=True,type=Path)
    args=ap.parse_args()
    S=module("fresh_spectral",Path(__file__).with_name("fresh_barrier_radial_spectral.py"))
    try:
        S.validate_degree(args.max_degree)
    except ValueError as exc:
        ap.error(str(exc))
    frozen=args.source_repo/"tools/fresh_barrier_frozen_countermodel.py"
    if not frozen.is_file():
        ap.error(f"frozen verifier is missing: {frozen}")
    V=module("frozen_old_verify",frozen)
    out={"format":"fresh-barrier-repair-replay/v1",
         "scope":"Exact finite table/cut and moment-matrix checks only; no realizability or endpoint theorem.",
         "max_degree":args.max_degree,
         "frozen_verifier_path":str(frozen),
         "frozen_verifier_sha256":hashlib.sha256(frozen.read_bytes()).hexdigest(),
         "frozen_original_source_sha256":V.ORIGINAL_SOURCE_SHA256,
         "H21_benchmark_scope":"Imposed extra inequalities only; no universal sharp-bound theorem is proved here.",
         "laws":[]}
    for path in args.laws:
        raw=path.read_bytes()
        d=json.loads(raw)
        old=V.verify(d)
        moments=[sum(Q(z["weight"])*Q(z["v"])**(2*i) for z in d["support"])
                 for i in range(args.max_degree+1)]
        tests=S.probe(moments,args.max_degree)
        assert all(b["psd_exact"] for r in tests for b in r["blocks"]),path
        # Extra imposed benchmark ceilings; no universal upper-bound theorem is claimed.
        caps=[sum(Q(comb(2*i,j))*(-2)**(2*i-j)*factorial(i+j)
                   for j in range(2*i+1))/2**i for i in range(args.max_degree+1)]
        assert all(a<=b for a,b in zip(moments,caps))
        damaged=json.loads(raw)
        damaged["support"][0]["weight"]=str(Q(damaged["support"][0]["weight"])+Q(1,10**8))
        try:
            V.verify(damaged)
        except AssertionError:
            tamper_rejected=True
        else:
            raise AssertionError("Damaged normalization was accepted")
        rec={"path":str(path),"sha256":hashlib.sha256(raw).hexdigest(),
             "index":d["index"],"old_finite_model":old,"spectral_tests":tests,
             "moments":list(map(str,moments)),"moments_decimal":list(map(float,moments)),
             "H21_benchmark_ceiling_values_imposed_as_extra":list(map(str,caps)),
             "below_all_H21_benchmark_ceiling_values":True,
             "universal_sharp_moment_bound_proved_here":False,
             "tampered_weight_rejected":tamper_rejected}
        out["laws"].append(rec)
        print("PASS",d["index"],"score",old["score_float"],
              "spectral blocks",sum(len(r["blocks"]) for r in tests),flush=True)
    args.out.write_text(json.dumps(out,indent=2)+"\n")


if __name__=="__main__":
    main()
