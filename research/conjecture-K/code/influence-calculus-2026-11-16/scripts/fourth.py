"""E|q|^4 for q = sum T[a,b,j] :y_a y_b ybar_j: by Wick pairings (label N; exact formula, float evaluation).
Legs: factors 0,1 = q (y,y,ybar), factors 2,3 = conj q (ybar,ybar,y). Each y-leg pairs with a ybar-leg of another factor."""
import itertools, numpy as np
YL=[(0,0),(0,1),(1,0),(1,1),(2,2),(3,2)]     # (factor, slot) of y-legs
BL=[(0,2),(1,2),(2,0),(2,1),(3,0),(3,1)]     # ybar-legs
def _classes():
    cnt={}
    for perm in itertools.permutations(range(6)):
        if any(YL[i][0]==BL[perm[i]][0] for i in range(6)): continue
        lab={}
        for i in range(6):
            L="abcdef"[i]; lab[YL[i]]=L; lab[BL[perm[i]]]=L
        # canonicalise the two y-slots of q and the two ybar-slots of conj q (symmetric), and relabel letters
        subs=[]
        for f in range(4):
            s=[lab[(f,0)],lab[(f,1)]]; s.sort(); subs.append("".join(s)+lab[(f,2)])
        # canonical relabelling by first appearance
        m={}; out=[]
        for s in subs:
            t=""
            for ch in s:
                if ch not in m: m[ch]="abcdef"[len(m)]
                t+=m[ch]
            out.append(t)
        key=",".join(out); cnt[key]=cnt.get(key,0)+1
    return cnt
CLASSES=_classes()
def E4(T):
    Tc=np.conj(T); return float(np.real(sum(c*np.einsum(k+"->",T,T,Tc,Tc,optimize=True) for k,c in CLASSES.items())))
def u_of(T): return 2*float(np.sum(abs(T)**2))
def delta(T): u=u_of(T); return E4(T)-2*u*u
