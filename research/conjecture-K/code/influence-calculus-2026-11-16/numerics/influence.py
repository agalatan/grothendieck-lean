"""Influence calculus for the content: numerics for NOTE2.md (label N throughout).

  python3 influence.py identity          Theorem 6 on five two-variable cubics, with exact shadows (Corollary 6.1)
  python3 influence.py gausslaw          Theorem 9 with the shadows of the Gaussian and Wick-monomial laws, against 11.49
  python3 influence.py scan raw|tilt     Theorem 9 with each cubic's own law: five families and 400 random cubics
  python3 influence.py search            adversarial search (tilt 3/5): largest T9/D and largest min(T9, gamma*delta)/D
  python3 influence.py prop10            the constant of Proposition 10 against the Bessel value of sB^2 (Gaussian law)

Peak row, profiles h = g (raw) and h_{3/5} = (g - g0) - (3/5)(j0 - j) (tilt), from tab_peak.npz (run tab.py first).
T9 denotes the law-level bound of Theorem 9:
   max over 0<=l1<=2u, 0<=l2<=u, l1^2+l2^2<=(3/4)delta of (sqrt(l1) sA + sqrt(l2) sB)^2,
   sA = sd[(vh)'(V)],  sB = ||V h'(V)||_2.
"""
import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, json
from scipy import integrate
from scipy.optimize import minimize
from core import gv, jv, g0, j0, phi, B, G as Gs, J as Js
from twovar import Grid, FAMILIES
GAMMA={0.009:251/5000,0.012:121/2500,0.015:467/10000,0.018:451/10000,0.02:441/10000,0.025:1859/43200,0.03:3/80,0.035:71/2000,0.04:17/500,0.044:13/400,0.0463:13/400}  # ledger 11.49
def prof(lab):
    """h and h' (in the variable v) for the raw and tilted profiles."""
    sq=lambda v: np.sqrt(np.maximum(v,1e-14))
    if lab=="raw": return gv, (lambda v: Gs(sq(v),1)/(2*sq(v)))
    return (lambda v:(gv(v)-g0)-0.6*(j0-jv(v))), (lambda v:(Gs(sq(v),1)+0.6*Js(sq(v),1))/(2*sq(v)))
def cap(u,dl,sA,sB):
    """Theorem 9: maximise sqrt(l1) sA + sqrt(l2) sB under l1<=2u, l2<=u, l1^2+l2^2<=(3/4) delta; returns the square."""
    L=np.sqrt(0.75*dl); th=np.linspace(0,np.pi/2,20001)
    return float(np.max(np.sqrt(np.minimum(L*np.cos(th),2*u))*sA+np.sqrt(np.minimum(L*np.sin(th),u))*sB)**2)
def evaluate(gr,c,u,lab,Bu,exact_shadows=False):
    h,hp=prof(lab); q,dX,dXb,dY,dYb=gr.cubic(c,u); X,Y=gr.X,gr.Y; V=abs(q)**2
    hv=h(V); cv=np.array([gr.E(np.conj(X)*q*hv),gr.E(np.conj(Y)*q*hv)]); C2=float(np.sum(abs(cv)**2))
    psi=hv+V*hp(V); m=gr.E(psi).real
    sA=np.sqrt(gr.E((psi-m)**2).real); sB=np.sqrt(gr.E((V*hp(V))**2).real)
    dl=gr.E(V*V).real-2*u*u; D=Bu-gr.E(phi(V)).real
    I1=np.array([[gr.E(a*np.conj(b)) for b in (dX,dY)] for a in (dX,dY)]); I2=np.array([[gr.E(np.conj(a)*b) for b in (dXb,dYb)] for a in (dXb,dYb)])
    l1=np.linalg.eigvalsh(I1)[-1]; l2=np.linalg.eigvalsh(I2)[-1]
    out=dict(chi=dl/u**2,C2=C2,D=D,dl=dl,l1=l1,l2=l2,sA=sA,sB=sB,T9=cap(u,dl,sA,sB),T9infl=(np.sqrt(l1)*sA+np.sqrt(l2)*sB)**2)
    if exact_shadows:
        A=gr.proj(psi.astype(complex),(1,1)); Bv=gr.proj(q*q*hp(V),(2,0))
        D1=[gr.proj(np.conj(dX),(1,1)),gr.proj(np.conj(dY),(1,1))]; D2=[gr.proj(dXb,(2,0)),gr.proj(dYb,(2,0))]
        rep=np.array([np.vdot(D1[j],A)+np.vdot(D2[j],Bv) for j in range(2)])
        out.update(rep_err=float(np.linalg.norm(rep-cv)/np.sqrt(C2)),T6=(np.sqrt(l1)*np.linalg.norm(A)+np.sqrt(l2)*np.linalg.norm(Bv))**2,
                   P11V2=float(np.sum(abs(gr.proj(V.astype(complex),(1,1)))**2)),nA2=float(np.linalg.norm(A)**2),nB2=float(np.linalg.norm(Bv)**2))
    return out
def cmd_identity():
    gr=Grid(44,40)
    for u in [0.02,0.0463]:
        Bu=B(u)
        for lab in ["raw","tilt"]:
            for name,c in FAMILIES.items():
                r=evaluate(gr,c,u,lab,Bu,True)
                print(f"{lab:4s} u={u} {name[:24]:24s} chi={r['chi']:5.1f} | Thm 6 rel.err {r['rep_err']:.1e} | C2/D={r['C2']/r['D']:.4f} | Cor 6.1 (exact shadows)/D={r['T6']/r['D']:.4f} (x{r['T6']/r['C2']:.2f}) | l1/u={r['l1']/u:.2f} l2/u={r['l2']/u:.2f} | ||P11V||^2/delta={r['P11V2']/r['dl']:.3f} | (l1^2+l2^2)/||P11V||^2={(r['l1']**2+r['l2']**2)/r['P11V2']:.3f} | Bessel loss: sA^2/|A|^2={r['sA']**2/r['nA2']:.1f} sB^2/|B|^2={r['sB']**2/r['nB2']:.1f}")
PTS=[0,0.5,1,2,3,4,6,8,12,20,45]
def Er(f): return sum(integrate.quad(lambda r: f(r)*np.exp(-r),a,b,limit=400,epsabs=1e-14,epsrel=1e-11)[0] for a,b in zip(PTS[:-1],PTS[1:]))
def cmd_gausslaw():
    for lab in ["tilt","raw"]:
        h,hp=prof(lab)
        print(f"{lab}: h'(0)={float(hp(1e-12)):.4f}, h'(0.05)={float(hp(0.05)):.4f}, h'(0.2)={float(hp(0.2)):.4f}")
        for u in [0.009,0.02,0.03,0.0463]:
            for law,Vf,chis in [("Gaussian law",lambda r:u*r,[1,2,4,8,12,16,24]),("monomial law",lambda r:u*r*(r-2)**2/2,[42])]:
                psi=lambda r: h(Vf(r))+Vf(r)*hp(Vf(r)); m=Er(psi)
                sA=np.sqrt(Er(lambda r:(psi(r)-m)**2)); sB=np.sqrt(Er(lambda r:(Vf(r)*hp(Vf(r)))**2))
                row="; ".join(f"chi={c}: {cap(u,c*u*u,sA,sB)/(c*u*u):.4f}" for c in chis)
                print(f"   u={u} {law}: sA={sA:.4f} sB={sB:.4f} | T9/delta: {row}"+(f" | 11.49: gamma={GAMMA[u]:.4f}" if lab=="tilt" else ""))
def cmd_scan(lab):
    gr=Grid(28,24); rng=np.random.default_rng(5)
    for u in [0.02,0.0463]:
        Bu=B(u); g=GAMMA[u]
        for name,c in FAMILIES.items():
            r=evaluate(gr,c,u,lab,Bu)
            print(f"{lab} u={u} {name[:24]:24s} chi={r['chi']:5.1f} C2/D={r['C2']/r['D']:.4f} T9/D={r['T9']/r['D']:.4f} T9/delta={r['T9']/r['dl']:.4f}"+(f" | 11.49: gamma*delta/D={g*r['dl']/r['D']:.4f}" if lab=="tilt" else ""))
        R=[evaluate(gr,(lambda x:x[:6]+1j*x[6:])(rng.standard_normal(12)*np.exp(0.8*rng.standard_normal(12))),u,lab,Bu) for _ in range(400)]
        chi=np.array([r['chi'] for r in R]); t9=np.array([r['T9']/r['D'] for r in R]); tr=np.array([r['C2']/r['D'] for r in R]); Dd=np.array([r['D']/r['dl'] for r in R])
        assert np.all(t9>=tr)
        print(f"{lab} u={u} 400 random cubics: chi in [{chi.min():.1f},{chi.max():.1f}], D/delta in [{Dd.min():.3f},{Dd.max():.3f}]; C2/D max {tr.max():.4f}; T9/D min {t9.min():.4f} median {np.median(t9):.4f} max {t9.max():.4f} (chi={chi[t9.argmax()]:.1f})")
        if lab=="tilt":
            gd=g/Dd; mn=np.minimum(t9,gd)
            print(f"    11.49 on the same cubics: gamma*delta/D max {gd.max():.4f} (chi={chi[gd.argmax()]:.1f}); min(T9, gamma*delta)/D max {mn.max():.4f} (chi={chi[mn.argmax()]:.1f}); T9 < gamma*delta on {100*np.mean(t9<gd):.0f}% of them")
        for lo,hi in [(8,16),(16,24),(24,43)]:
            s=(chi>=lo)&(chi<hi)
            print(f"    chi in [{lo},{hi}): n={s.sum()}, T9/D max {t9[s].max():.4f}, C2/D max {tr[s].max():.4f}"+(f", gamma*delta/D max {(g/Dd[s]).max():.4f}" if lab=="tilt" else ""))
def cmd_search():
    gr=Grid(28,24); rng=np.random.default_rng(11); lab="tilt"; res={}
    vec=lambda x:x[:6]+1j*x[6:]
    for u in [0.02,0.0463]:
        Bu=B(u); g=GAMMA[u]
        f1=lambda x:(lambda r: r['T9']/r['D'])(evaluate(gr,vec(x),u,lab,Bu))
        f2=lambda x:(lambda r: min(r['T9'],g*r['dl'])/r['D'])(evaluate(gr,vec(x),u,lab,Bu))
        for name,f in [("T9/D",f1),("min(T9,gamma*delta)/D",f2)]:
            best=(0,None)
            for s in range(3):
                starts=[rng.standard_normal(12)*np.exp(0.8*rng.standard_normal(12)) for _ in range(25)]
                x0=max(starts,key=f); o=minimize(lambda x:-f(x),x0,method="Nelder-Mead",options={"maxiter":350,"xatol":1e-5,"fatol":1e-8})
                if -o.fun>best[0]: best=(-o.fun,o.x)
            r=evaluate(gr,vec(best[1]),u,lab,Bu)
            res[f"{u}|{name}"]=dict(value=best[0],chi=r['chi'],C2_over_D=r['C2']/r['D'],coef_re=vec(best[1]).real.tolist(),coef_im=vec(best[1]).imag.tolist())
            print(f"tilt u={u}: largest {name} found = {best[0]:.4f} at chi={r['chi']:.1f} (C2/D there {r['C2']/r['D']:.4f}; 11.49 there: gamma*delta/D={g*r['dl']/r['D']:.4f})",flush=True)
    json.dump(res,open(os.path.join(os.path.dirname(os.path.abspath(__file__)),"..","results","t9_search.json"),"w"),indent=1)
def cmd_prop10():
    # k' = E h'(. + u tau), k'' = (k' - h')/u; Proposition 10: ||B_h||^2 <= (sup|(v k')'|^2 + sup|v k''|^2/2) delta
    for lab in ["tilt","raw"]:
        h,hp=prof(lab)
        for u in [0.02,0.0463]:
            vs=np.concatenate([[1e-10],np.linspace(1e-3,2.5,400)**2,np.linspace(2.5,6,60)[1:]**2])
            kp=np.array([Er(lambda r: float(hp(v+u*r))) for v in vs]); hv=np.array([float(hp(v)) for v in vs])
            kpp=(kp-hv)/u; a1=np.max(abs(kp+vs*kpp)); a2=np.max(abs(vs*kpp)); c=a1*a1+a2*a2/2
            sB2=Er(lambda r:(u*r*float(hp(u*r)))**2)
            print(f"{lab} u={u}: sup|(v k')'|={a1:.4f}, sup|v k''|={a2:.4f}, Prop 10: ||B_h||^2 <= {c:.4f}*delta; Bessel (Gaussian law): sB^2={sB2:.3e} = {sB2/u**2:.4f}*u^2, so Prop 10 is the smaller for chi < {sB2/u**2/c:.2f}")
if __name__=="__main__":
    c=sys.argv[1]
    if c=="identity": cmd_identity()
    elif c=="gausslaw": cmd_gausslaw()
    elif c=="scan": cmd_scan(sys.argv[2])
    elif c=="search": cmd_search()
    elif c=="prop10": cmd_prop10()
