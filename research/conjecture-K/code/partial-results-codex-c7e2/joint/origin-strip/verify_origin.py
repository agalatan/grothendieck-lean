# codex-c7e2-research/joint/origin-strip/verify_origin.py
"""Agent-ID codex-c7e2. Fresh C++ interval replay plus independent Fraction audit.
Run: python verify_origin.py --repo /path/to/grothendieck-lean
Use --audit-only to audit the receipt, which alone does not reprove integrals.
"""
import argparse, hashlib, json, math, re, shutil, subprocess, sys, tempfile
from fractions import Fraction as F
from pathlib import Path

HERE=Path(__file__).resolve().parent
RES=F(61585,16777216)
PAT=re.compile(r'PASS MATRIX w=\[([^,]+),([^\]]+)\] s=\[([^,]+),([^\]]+)\] reserve=(\S+) cells=(\d+)((?: \[[^,]+,[^\]]+\]){6})\n')
SOURCES=['directional-matrix-codex-a7c4/radial_matrix.cpp','compact-joint-2026-11-15/potential_integral.cpp','compact-joint-2026-11-15/hessian_integral.cpp','tilted-sector-2026-11-15/secant_verify.cpp','tilted-sector-2026-11-15/theta_verify.cpp','tilted-sector-2026-11-15/localization_circle.hpp','adaptive-cover-codex-a7c4/shift_curvature.cpp','compact-joint-2026-11-15/strip_check.py','progress-2026-11-15-codex-a7c4/joint_target_tail.py']

def audit(rows):
    assert [r['i'] for r in rows]==list(range(17))
    assert RES>F(481,8*128**2)+F(1,10**6)
    rho=F(5053,10000);pc=F(2500,1891)-F(463,5000)
    qa=pc-F(67,100)-F(2,25)*rho**2
    qb=pc-F(67,100)*rho**2-F(2,25);cross=-F(59,100)*rho
    min_diag=None;min_det=None
    for row in rows:
        assert row['returncode']==0
        m=PAT.fullmatch(row['stdout']);assert m
        hx=lambda x:F(float.fromhex(x))
        wl,wh,sl,sh,rs=map(hx,m.group(1,2,3,4,5))
        assert wl==wh==F(row['i'],128) and sl==0 and sh==F(1,256) and rs==RES
        assert 104<=int(m[6])<=100001
        bounds=[tuple(map(hx,p)) for p in re.findall(r'\[([^,]+),([^\]]+)\]',m[7])]
        assert len(bounds)==6 and all(l<=h for l,h in bounds)
        for j in (0,3):
            aa=qa+wl**2/2-rs-bounds[j][1]
            bb=qb+wl**2/2-rs-bounds[j+2][1]
            cc=max(abs(cross-bounds[j+1][0]),abs(cross-bounds[j+1][1]))
            det=aa*bb-cc**2
            assert aa>0 and bb>0 and det>0
            min_diag=min(aa,bb,min_diag) if min_diag is not None else min(aa,bb)
            min_det=min(det,min_det) if min_det is not None else det
    return {'status':'PASS exact endpoint PSD and step-1/128 cover audit','points':17,
            'region':'0<=|w|<=1/8; sqrt(S)<=1/256; all complex directions',
            'min_diagonal':str(min_diag),'min_determinant':str(min_det)}

def main():
    ap=argparse.ArgumentParser();ap.add_argument('--repo',type=Path,required=True);ap.add_argument('--audit-only',action='store_true');args=ap.parse_args()
    code=args.repo/'research/conjecture-K/code'
    expected=json.loads((HERE/'source_hashes.json').read_text())
    assert {s:hashlib.sha256((code/s).read_bytes()).hexdigest() for s in SOURCES}==expected
    if not args.audit_only:
        cc=shutil.which('clang++') or shutil.which('g++');assert cc
        with tempfile.TemporaryDirectory(prefix='codex-c7e2-joint-') as td:
            out=Path(td)
            text=(code/'tilted-sector-2026-11-15/secant_verify.cpp').read_text().replace('int main(','int inherited_secant_main(')
            for name in ('theta_verify.cpp','localization_circle.hpp'):
                text=text.replace(f'#include "{name}"',f'#include "{code/"tilted-sector-2026-11-15"/name}"')
            (out/'inherited_secant.hpp').write_text(text)
            text=(code/'compact-joint-2026-11-15/hessian_integral.cpp').read_text();(out/'normalized_base.hpp').write_text(text[:text.index('std::array<J2,6> hk')])
            text=(code/'compact-joint-2026-11-15/potential_integral.cpp').read_text();(out/'potential_base.hpp').write_text(text[:text.index('bool positive_gap(')])
            flags=[cc,'-O2','-std=c++17','-frounding-math','-ffp-contract=off','-fno-fast-math','-I',str(out)]
            for name,src in [('radial_new',HERE/'radial_new.cpp'),('shift_curvature',code/'adaptive-cover-codex-a7c4/shift_curvature.cpp')]:
                subprocess.run(flags+[str(src),'-o',str(out/name)],check=True)
                for bad in ('-DNDEBUG','-ffast-math'):
                    assert subprocess.run(flags+[bad,'-fsyntax-only',str(src)],capture_output=True).returncode!=0
            shift=subprocess.run([str(out/'shift_curvature')],capture_output=True,text=True,check=True).stdout
            assert shift.startswith('PASS SHIFT CURVATURE ') and shift.endswith(' constant=480\n')
            for s in SOURCES[-2:]:subprocess.run([sys.executable,'-I',str(code/s)],check=True,capture_output=True)
            rows=[]
            for i in range(17):
                r=subprocess.run([str(out/'radial_new'),str(i/128),str(i/128),'0',str(1/256),str(float(RES)),'100000'],capture_output=True,text=True)
                rows.append({'i':i,'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr})
                assert r.returncode==0,r.stdout
            (HERE/'origin_replay.json').write_text(json.dumps(rows,indent=2))
    result=audit(json.loads((HERE/'origin_replay.json').read_text()))
    (HERE/'origin_audit.json').write_text(json.dumps(result,indent=2))
    print(json.dumps(result,indent=2))

if __name__=='__main__':main()
