import sys; import os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import d5, numpy as np, json, math
R='/Users/alingalatan/workspaces/grothe/research/higher-degree/code/degree5-content/'
rows=[json.loads(l) for l in open(R+'rows5.lines') if l.strip()]
z,w=d5.zgrid(npan=80,nth=256); p1=1/d5.E1
Bodd=np.array([z,1j*z,np.conj(z),1j*np.conj(z)])
for rec in [r for r in rows if r['t']>=0.81]:
    B=d5.base(z,rec['l'],rec['beta'],rec['nu5']); Dz=d5.Dz(z,rec['bA'],rec['bB'])
    S=np.linspace(0,2,81); vals=[]
    for s in S:
        A=B+s*Dz; a=np.abs(A); c=Bodd*np.conj(A/a)[None,:]; u=np.real(c); v=np.imag(c)
        Mt=(u*(w/(2*a))[None,:])@u.T+(v*(w/a)[None,:])@v.T
        vals.append(np.linalg.eigvalsh((Mt+Mt.T)/2)[-1]/p1)
    vals=np.array(vals); i=int(np.argmax(vals)); above=S[vals>=1]
    print('row %.3f: s=0: %.4f; max %.4f at s=%.3f; >= 1 on s in %s'%(rec['t'],vals[0],vals[i],S[i],('[%.3f, %.3f]'%(above.min(),above.max()) if len(above) else 'nowhere')))
