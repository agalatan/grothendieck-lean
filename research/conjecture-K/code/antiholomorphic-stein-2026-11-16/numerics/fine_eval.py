"""Re-evaluate the survey maximisers on a finer grid, with all checks and the per-component cosines.  Label N.
Usage: python3 fine_eval.py raw|tilt [nl nt]"""
import sys, json, numpy as np
from twovar import Grid, analyse, kprime_table, phi_transform_table, H
mode=sys.argv[1]; nl,nt=(int(sys.argv[2]),int(sys.argv[3])) if len(sys.argv)>3 else (44,40)
d=json.load(open(f"../results/survey_{mode}.json")); gr=Grid(nl,nt)
for u,r in d["results"].items():
    u=float(u); c=np.array(r["argmax_re"])+1j*np.array(r["argmax_im"])
    out=analyse(gr,c,u,H[mode],kprime_table(H[mode],u),True,phi_transform_table(u))
    dl,D=out["delta"],out["D"]
    print(f"{mode} u={u}: survey value {r['max_projbound_over_D']:.5f}; fine grid {nl}x{nt}: projbound/D={out['Omega']*dl/D:.5f}, C^2/D={out['C2']/D:.5f}, chi={out['chi']:.3f}, loss x{out['Omega']*dl/out['C2']:.2f}, D/delta={D/dl:.4f}")
    print(f"     checks: Thm3 {out['thm3_err']:.1e}, delta identity {out['delta_identity_err']:.1e}, D vs Thm5 {abs(D-out['D_thm5'])/D:.1e}; cosines {', '.join(f'{k}:{v:.2f}' for k,v in out['cosines'].items())}")
