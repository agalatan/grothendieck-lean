import sys; import os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import d5, numpy as np, json, math
R='/Users/alingalatan/workspaces/grothe/research/higher-degree/code/degree5-content/'
rows=[json.loads(l) for l in open(R+'rows5.lines') if l.strip()]
z,w=d5.zgrid(npan=80,nth=256); p1=1/d5.E1
Bodd=np.array([z,1j*z,np.conj(z),1j*np.conj(z)])
for rec in [r for r in rows if r['t'] in (0.81,0.82,0.85,0.886)]:
    B=d5.base(z,rec['l'],rec['beta'],rec['nu5']); Dz=d5.Dz(z,rec['bA'],rec['bB'])
    O=(np.array([0.3,-0.2,0.1,0.25]))@Bodd; s=0.37
    print('row %.3f symmetry check E|A- - O| vs E|A+ - O|: %.10f %.10f'%(rec['t'],np.abs(B-s*Dz-O)@w,np.abs(B+s*Dz-O)@w))
    out=[]; S=np.concatenate([np.linspace(0,1.5,31),np.linspace(1.6,6,23)])
    for s in S:
        A=B+s*Dz; a=np.abs(A); c=Bodd*np.conj(A/a)[None,:]; u=np.real(c); v=np.imag(c)
        Mt=(u*(w/(2*a))[None,:])@u.T+(v*(w/a)[None,:])@v.T; Mv=(v*(w/a)[None,:])@v.T
        out.append((np.linalg.eigvalsh((Mt+Mt.T)/2)[-1]/p1,np.linalg.eigvalsh((Mv+Mv.T)/2)[-1]/p1))
    i=int(np.argmax([o[0] for o in out]))
    print('   secant form E[(u^2/2+v^2)/|A+|]: lam_max/p1 at s=0: %.4f; max over s: %.4f at s=%.2f; (second-order alone at that s: %.4f); values at s=.1,.2,.4,.8: %s'%(out[0][0],out[i][0],S[i],out[i][1],' '.join('%.4f'%out[j][0] for j in (2,4,8,16))))
