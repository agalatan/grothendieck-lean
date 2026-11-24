import sys; import os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import d5, numpy as np, json, math
rows=[json.loads(l) for l in open('/Users/alingalatan/workspaces/grothe/research/higher-degree/code/degree5-content/rows5.lines') if l.strip()]
z,w=d5.zgrid(npan=80,nth=256); T=np.abs(z)**2; p1=1/d5.E1; p2=1/d5.ETA
e10=z; e01=np.conj(z); e21=z*(T-2)/math.sqrt(2); e12=np.conj(e21); e30=z**3/math.sqrt(6); e11=d5.e11(z); e20=d5.e20(z)
def Mreal(Bm,As,signs):
    M=np.zeros((len(Bm),len(Bm)))
    for A,sg in zip(As,signs):
        a=np.abs(A); Im_=np.imag(sg*Bm*np.conj(A/a)[None,:]); M+=(Im_*(w/(2*a))[None,:])@Im_.T
    return (M+M.T)/2
print('t | zero-core eps1 E|z|/|g| | odd {zQ, zbarP} pointwise ratio s=0,0.1,0.2 | A/B untilted ratio s=0,0.2,0.5 | quintic elementary majorant/p2 (max over s<=1.2) | quintic exact 2nd variation/p2 at s=0')
for rec in rows:
    if rec['t'] not in (0.7,0.78,0.8,0.81,0.82,0.85,0.886): continue
    B=d5.base(z,rec['l'],rec['beta'],rec['nu5']); Dz=d5.Dz(z,rec['bA'],rec['bB'])
    g=np.real(B/z); zc=d5.E1*float(w@(np.abs(z)/np.abs(g)))
    odd=[]; ab=[]
    for s in (0,0.1,0.2):
        odd.append(np.linalg.eigvalsh(Mreal(np.array([e10,1j*e10,e01,1j*e01]),(B+s*Dz,B-s*Dz),(1,1)))[-1]/p1)
    for s in (0,0.2,0.5):
        ab.append(np.linalg.eigvalsh(Mreal(np.array([e11,1j*e11,e20,1j*e20]),(B+s*Dz,B-s*Dz),(1,-1)))[-1]/p1)
    E=np.array([e10,e01,e21,e12,e30]); cr=0
    for s in np.linspace(0,1.2,13):
        M=np.zeros((5,5),complex)
        for A in (B+s*Dz,B-s*Dz): M+=(E*(w/(2*np.abs(A)))[None,:])@np.conj(E).T
        cr=max(cr,np.linalg.eigvalsh((M+M.conj().T)/2)[-1]/p2)
    Bq=[]; 
    for e in E: Bq+=[e,1j*e]
    qx=np.linalg.eigvalsh(Mreal(np.array(Bq),(B,B),(1,1)))[-1]/p2
    print('%.3f | %.4f | %s | %s | %.3f | %.3f'%(rec['t'],zc,' '.join('%.4f'%x for x in odd),' '.join('%.3f'%x for x in ab),cr,qx),flush=True)
