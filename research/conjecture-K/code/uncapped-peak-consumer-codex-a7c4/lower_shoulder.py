"""Retained six-sector witness using two prices and a shared odd response. Agent-ID: codex-a7c4."""
import importlib.util
import sys
from fractions import Fraction as Q
from functools import cache
from pathlib import Path

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('uncapped', HERE/'verify.py')
base = importlib.util.module_from_spec(spec)
spec.loader.exec_module(base)
P0, P1, ODD = base.PRICE, Q('1.316'), Q('1.28')
LOW, HIGH = Q('.82815'), Q('.8297')
THETA = (P1-ODD)/(P0-ODD)

def prove(polys,nodes,lower=LOW,prices=(P0,P1)):
    H=(base.PI_HI/4-lower**2)/P0**2
    base.require(lower<=HIGH and lower**2>=3*base.PI_HI/14, 'radius assumption')
    base.require(P0 in prices and set(prices)<={P0,P1},'unknown price selection')
    for price in prices:
        base.require(0<base.EPS*price<=1 and 0<=P0-price and H*(P0/price)**2<=Q('.06'),
                     'unsupported trial scale or energy')
    base.require(0<THETA<=1 and THETA*P0+(1-THETA)*ODD==P1,'invalid odd mixture')
    raw=base.make_radial_bound(polys,nodes)
    @cache
    def radial(p,l,h,x,y):
        ratio=(P0/p)**2
        l,h=l*ratio,h*ratio
        # Use separate chords if the transformed box crosses a Stein node.
        cuts=[l,*[u for u in sorted(nodes) if l<u<h],h]
        return max(raw(a,b,x,y) for a,b in zip(cuts,cuts[1:]))

    @cache
    def inputs(p,l,h,x,y):
        ratio=(P0/p)**2
        rh=h*ratio
        # Splitting at all score edges avoids overextending a coefficient.
        edges=sorted({base.U0,Q('.051'),*[a for a,_ in base.CONTENT]})
        cuts=[l*ratio,*[z for z in edges if l*ratio<z<rh],rh]
        scores=[base.score_bounds(a,b,y) for a,b in zip(cuts,cuts[1:])]
        a=max(s[0] for s in scores)
        b=max(s[1] for s in scores)
        k=min(4*rh,rh*(1+base.sqrt_hi(3*y/4)))/2-Q('.0926')
        m=base.EPS*p
        cost=max(t*t-2*m*base.GUIDE*t+2*(m*base.BETA)**2/base.EPS for t in (lower,HIGH))
        return ratio,a,b,k,radial(p,l,h,x,y),cost,m

    def reserve(p,l,h,x,y,v,w,theta):
        ratio,a,b,k,rad,cost,m=inputs(p,l,h,x,y)
        hu,l_v,h_v=ratio*h,ratio*v,ratio*w
        wmax=ratio*(H-l/2-2*v/3)
        base.require(0<theta<=1 and m*theta<=1 and p<=P0 and P0/theta>=p
                     and wmax>=0, 'incorrect signs in the mixed trial')
        odd=theta*P0+(1-theta)*ODD
        inner=rad+(P0-p)*hu+(P0/theta-p)*h_v+max(0,odd-p)*wmax
        vl,vr=l_v/theta**2,h_v/theta**2
        gain=base.shell_gain(a,b,k,vl,vr)
        bmax=max(0,(3*ratio*H/2-3*ratio*l/4-l_v)/theta**2)
        rlo=max(0,base.sqrt_lo(max(0,vl-bmax))-base.RHO*base.sqrt_hi(bmax))
        charge=k+2*vr-Q('.08')*base.DEN
        gain=min(gain,a*a/Q('.23')-Q('.23')*max(0,rlo-a/Q('.23'))**2+
                 2*b*base.sqrt_hi(base.DEN*vr)+charge*(vr if charge>0 else vl))
        inner+=theta*gain
        return base.TARGET-cost-m*inner

    # l,h,v,w are normalized by the original (P0) scale; this is one physical response.
    energy=sorted({Q(0),H,*[e for e in nodes if 0<e<H],base.U0,Q('.051')})
    shape=list(map(Q,'0 .1 .25 .5 1 2 3 4 5 6 8 12 20 30 42'.split()))
    stack=[(l,h,x,y,0) for l,h in zip(energy,energy[1:]) for x,y in zip(shape,shape[1:])]
    least,count=Q(1),0
    while stack:
        l,h,x,y,depth=stack.pop()
        vmax=3*H/2-3*l/4
        # Resolve V exactly with bisection only where a price comparison is too weak.
        vgrid=[Q(0),*[v for v in base.V_CUTS if 0<v<vmax],vmax]
        def covers(v,w,lv):
            nonlocal least
            best=reserve(P0,l,h,x,y,v,w,Q(1))
            if best<=Q(1,10**6) and P1 in prices:
                for theta in (THETA,Q(1)):
                    best=max(best,reserve(P1,l,h,x,y,v,w,theta))
                    if best>Q(1,10**6):break
            if best>Q(1,10**6):
                least=min(least,best)
                return True
            if lv>=2:return False
            m=(v+w)/2
            return covers(v,m,lv+1) and covers(m,w,lv+1)
        if all(covers(v,w,0) for v,w in zip(vgrid,vgrid[1:])):
            count+=1
            continue
        base.require(depth<16,f'unproved shared-response cell {l} {h} {x} {y}')
        if (h-l)*(Q('.4')+y/10)>Q('.001')*(y-x):
            mid=(l+h)/2
            children=[(l,mid,x,y),(mid,h,x,y)]
        else:
            mid=(x+y)/2
            children=[(l,h,x,mid),(l,h,mid,y)]
        stack.extend((*c,depth+1) for c in children)
    return count,least

if __name__=='__main__':
    repo=Path(sys.argv[1]).resolve() if len(sys.argv)>1 else HERE.parents[3]
    polys,nodes=base.read_inputs(repo)
    count, spare = prove(polys,nodes)
    base.require(spare>Q('1.0177')/10**6, 'claimed row clearance')
    print(f'{count} closed energy/shape cells; unrestricted [.82815,.8297].')
    print(f'Physical clearance > {spare*10**12//1}/10^12.')
    for prices, reason in [((P0,), 'unproved shared-response cell'), ((P1,), 'unknown price selection')]:
        try:
            prove(polys,nodes,prices=prices)
        except ValueError as error:
            base.require(str(error).startswith(reason),'wrong rejection')
        else:
            raise ValueError('accepted a corrupted price selection')
    print('Single-price cover fails and unsupported price selection is rejected.')
