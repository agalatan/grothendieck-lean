import sys; import os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import d5, numpy as np, json, math
from math import factorial
from scipy.special import eval_genlaguerre
from scipy.integrate import quad
rows=[json.loads(l) for l in open('/Users/alingalatan/workspaces/grothe/research/higher-degree/code/degree5-content/rows5.lines') if l.strip()]
z,w=d5.zgrid(npan=80,nth=256); T=np.abs(z)**2; p1=1/d5.E1; p2=1/d5.ETA
def e_ab(a,b):
    if a>=b: v=(-1)**b*factorial(b)*z**(a-b)*eval_genlaguerre(b,a-b,T)
    else: v=(-1)**a*factorial(a)*np.conj(z)**(b-a)*eval_genlaguerre(a,b-a,T)
    return v/math.sqrt(factorial(a)*factorial(b))
first=[(1,0),(0,1),(2,1),(1,2),(3,0)]
allh=[(a,b) for a in range(4) for b in range(3) if (a,b)!=(3,2)]   # 11 sectors other than e32
Efirst=np.array([e_ab(*ab) for ab in first]); Eall=np.array([e_ab(*ab) for ab in allh]+[e_ab(3,2)])
Bodd=np.array([z,1j*z,np.conj(z),1j*np.conj(z)])
rng=np.random.default_rng(2)
Sgrid=np.concatenate([np.linspace(0,1.2,25),np.linspace(1.3,6,48)])
for rec in rows:
    if rec['t'] not in (0.79,0.8,0.81,0.82,0.85,0.886,0.7): continue
    B=d5.base(z,rec['l'],rec['beta'],rec['nu5']); Dz=d5.Dz(z,rec['bA'],rec['bB'])
    l,b,nu=rec['l'],rec['beta'],rec['nu5']
    g=lambda t:l+b*(t-2)+nu*(t*t-6*t+6)/math.sqrt(12)
    zc1=d5.E1*quad(lambda t:math.sqrt(t)*math.exp(-t)/abs(g(t)),0,60,limit=200)[0]
    gmin=min(g(t) for t in np.linspace(0,60,6001))
    odd=[];qf=[];qa=[]
    for s in Sgrid:
        M=np.zeros((4,4))
        for A in (B+s*Dz,B-s*Dz):
            a=np.abs(A); Im_=np.imag(Bodd*np.conj(A/a)[None,:]); M+=(Im_*(w/(2*a))[None,:])@Im_.T
        odd.append(np.linalg.eigvalsh((M+M.T)/2)[-1]/p1)
        for E,store in ((Efirst,qf),(Eall,qa)):
            N=np.zeros((len(E),len(E)),complex)
            for A in (B+s*Dz,B-s*Dz): N+=(E*(w/(2*np.abs(A)))[None,:])@np.conj(E).T
            store.append(np.linalg.eigvalsh((N+N.conj().T)/2)[-1]/p2)
    # finite amplitude odd: sup of [E|A+ + O| + |A- - O| - |A+| - |A-|]/(p1 |x|^2)
    fa=0
    for trial in range(600):
        s=abs(rng.normal())*0.5 if trial%3 else 0.0
        x=rng.standard_normal(4); x/=np.linalg.norm(x); tau=math.exp(rng.uniform(math.log(0.02),math.log(3))); O=(tau*x)@Bodd
        Ap,Am=B+s*Dz,B-s*Dz
        fa=max(fa,((np.abs(Ap+O)+np.abs(Am-O)-np.abs(Ap)-np.abs(Am))@w)/(p1*tau*tau))
    io=int(np.argmax(odd)); i1=int(np.argmax(qf)); i2=int(np.argmax(qa))
    print('t=%.3f  Z=eps1 E|z|/|g| (1-D quad) %.5f, min g %.3f | odd ratio: max over s in [0,6] %.4f at s=%.2f (s=0: %.4f); finite-amplitude random search max %.4f | quintic first-order majorant/p2 max %.4f at s=%.2f | all 12 h-side sectors majorant/p2 max %.4f at s=%.2f'%(rec['t'],zc1,gmin,odd[io],Sgrid[io],odd[0],fa,qf[i1],Sgrid[i1],qa[i2],Sgrid[i2]),flush=True)
