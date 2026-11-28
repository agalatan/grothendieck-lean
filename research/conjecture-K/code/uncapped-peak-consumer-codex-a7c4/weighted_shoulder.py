"""All-shape lower-shoulder cover with absorbed even repricing and optional radial pruning. Agent-ID: codex-a7c4."""
import importlib.util
import sys
from fractions import Fraction as Q
from math import ceil
from functools import cache
from pathlib import Path

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('lower_shoulder', HERE/'lower_shoulder.py')
shoulder = importlib.util.module_from_spec(spec)
spec.loader.exec_module(shoulder)
base = shoulder.base
P0, P1, ODD = shoulder.P0, shoulder.P1, shoulder.ODD
LOW, HIGH = Q('.8255'), shoulder.LOW
TRIAL_PRICES = (P0, Q('1.318'), P1, Q('1.317'), Q('1.319'), Q('1.32'), Q('1.31'))


def checked_rows():
    weights = base.load('weighted_response', HERE.parent/'radial-response-weights-codex-a7c4/verify.py')
    radii = tuple(map(Q, ('.1','.2','.3','.4')))
    base.require(set(radii).issubset(weights.RADII), 'missing smooth response weight')
    rows = [weights.checked_row(r, weights.RADII[r]) for r in radii]
    for j,i1,i0,ia,ib,inu in rows:
        base.require(ia>ib>0 and i1>=inu>0 and min(i0,j)>0, 'incorrect sector ordering')
    return rows


def geometry_bounds(rows,H,lower,l,v):
    # All coordinates in this function are normalized by (epsilon * P0)^2.
    remaining=H-l/2-2*v/3
    upper_b=3*H/2-3*l/4-v
    upper_v=3*H/2-3*l/4
    for j,i1,i0,ia,ib,_ in rows:
        budget=(j-lower**2/i1)/P0**2-l/i0
        upper_v=min(upper_v,ia*budget)
        slack=budget-v/ia
        remaining=min(remaining,i1*slack)
        upper_b=min(upper_b,slack/(1/ib-1/ia))
    return (v<=upper_v),max(0,upper_v),max(0,remaining),max(0,upper_b)


def prove(polys, nodes, rows, lower=LOW, prices=TRIAL_PRICES, *, high=HIGH, odd_price=None):
    H=(base.PI_HI/4-lower**2)/P0**2
    base.require(0<=lower<=high<=HIGH and lower**2>=3*base.PI_HI/14 and H>0, 'radius assumption')
    base.require(prices and prices[0]==P0 and all(ODD<=p<=P0 for p in prices),'unknown price selection')
    for price in prices:
        base.require(0<base.EPS*price<=1 and 0<=P0-price,
                     'unsupported trial scale or energy')
    @cache
    def geometry(l,v):
        return geometry_bounds(rows,H,lower,l,v)

    @cache
    def odd_cost(price, upper_energy, upper_shape):
        if odd_price is None:
            return ODD
        u = upper_energy*(P0/price)**2
        bound = odd_price(u, upper_shape)
        base.require(0 < bound <= ODD, 'unsupported odd-arm price')
        return bound

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
        edges=sorted({base.U0,Q('.051'),Q('.06'),*[a for a,_ in shoulder.EXTENDED_CONTENT]})
        cuts=[l*ratio,*[z for z in edges if l*ratio<z<rh],rh]
        scores=[]
        for a,b in zip(cuts,cuts[1:]):
            if b<=Q('.06'):
                scores.append(base.score_bounds(a,b,y,shoulder.EXTENDED_CONTENT))
            else:
                slope=base.sqrt_hi(Q('.0325'))+Q('1.04')*(base.sqrt_hi(b)-base.sqrt_lo(base.U0))
                delta=b*b*y
                common=min(Q('.139')*base.sqrt_hi(b),base.sqrt_hi(Q('2.8')*delta*base.sqrt_hi(delta)),
                           slope*base.sqrt_hi(delta),Q('.02')+Q('.26')*(b-base.U0))
                error=min(Q('.0035')*base.sqrt_hi(b),base.sqrt_hi(Q('.03')*delta*base.sqrt_hi(delta)))
                scores.append((common+base.RHO*error/base.DEN,error/base.DEN))
        a=max(s[0] for s in scores)
        b=max(s[1] for s in scores)
        k=min(4*rh,rh*(1+base.sqrt_hi(3*y/4)))/2-Q('.0926')
        m=base.EPS*p
        cost=max(t*t-2*m*base.GUIDE*t+2*(m*base.BETA)**2/base.EPS for t in (lower,high))
        return ratio,a,b,k,radial(p,l,h,x,y),cost,m

    def reserve(p,l,h,x,y,v,w,theta, *, absorb_even=True):
        ratio,a,b,k,rad,cost,m=inputs(p,l,h,x,y)
        hu,l_v,h_v=ratio*h,ratio*v,ratio*w
        feasible,_,upper_w,upper_b=geometry(l,v)
        base.require(feasible,'infeasible reserve')
        wmax=ratio*upper_w
        base.require(0<theta<=1 and m*theta<=1 and p<=P0 and P0/theta>=p
                     and wmax>=0, 'incorrect signs in the mixed trial')
        odd=1/(theta/P0+(1-theta)/odd_cost(p,h,y))
        inner=rad+(P0-p)*hu+(P0/theta-p)*h_v+max(0,odd-p)*wmax
        vl,vr=l_v/theta**2,h_v/theta**2
        bmax=min(vr,ratio*upper_b/theta**2)
        rlo=max(0,base.sqrt_lo(max(0,vl-bmax))-base.RHO*base.sqrt_hi(bmax))

        def shell(k0):
            charge=k0+2*vr-Q('.08')*base.DEN
            two_square=(a*a/Q('.23')-Q('.23')*max(0,rlo-a/Q('.23'))**2+
                        2*b*base.sqrt_hi(base.DEN*vr)+charge*(vr if charge>0 else vl))
            return min(base.shell_gain(a,b,k0,vl,vr),two_square)

        # V = theta^2 z in joint-arm units. Absorb its known linear price
        # into the same quadratic shell before choosing signed endpoints.
        gain=theta*shell(k)
        if absorb_even:
            shifted=k+P0-theta*p
            gain=min(gain,theta*shell(shifted)-(P0/theta-p)*h_v)
        inner+=gain
        return base.TARGET-cost-m*inner

    # l,h,v,w are normalized by the original (P0) scale; this is one physical response.
    energy=sorted({Q(0),H,*[e for e in nodes if 0<e<H],base.U0,Q('.051')})
    shape=list(map(Q,'0 .1 .25 .5 1 2 3 4 5 6 8 12 20 27 30 42'.split()))
    stack=[]
    for l,h in zip(energy,energy[1:]):
        feasible,vmax,_,_=geometry(l,Q(0))
        if not feasible:continue
        grid=[Q(0),*[z for z in base.V_CUTS if z<vmax],vmax]
        stack.extend((l,h,x,y,v,w,0) for x,y in zip(shape,shape[1:]) for v,w in zip(grid,grid[1:]))
    count=0
    least=Q(1)
    accepted=Q(1,10**7)
    if lower==LOW and rows and Q('1.318') in prices:
        # Same feasible cell, price and tilt. Only the treatment of the even charge changes.
        trial=(Q('1.318'),Q(11287,256000),Q(28229,640000),Q(1,80),Q(3,160),
               Q(9,16000),Q(19,32000),Q(296875,327523))
        absorbed=reserve(*trial)
        separate=reserve(*trial,absorb_even=False)
        base.require(separate<=accepted<absorbed, 'even repricing control failed')
    while stack:
        l,h,x,y,v,w,depth=stack.pop()
        feasible,vmax,_,_=geometry(l,v)
        if not feasible:continue
        w=min(w,vmax)
        best=reserve(P0,l,h,x,y,v,w,Q(1))
        for p in prices[1:]:
            if best>accepted:break
            if h*(P0/p)**2>Q('.07'):continue
            b=odd_cost(p,h,y)
            theta0=P0*(p-b)/(p*(P0-b))
            for theta in (theta0,Q(1),Q('.96')):
                if theta<=0:continue
                best=max(best,reserve(p,l,h,x,y,v,w,theta))
                if best>accepted:break
        if best>accepted:
            least=min(best,least)
            count+=1
            continue
        base.require(depth<44,f'unproved 3D cell {l} {h} {x} {y} {v} {w} {best}')
        # These scores select an axis only; both closed children are proved.
        du=(h-l)*(Q('.4')+y/10)
        dx=Q('.001')*(y-x)
        dv=Q('.15')*(w-v)+Q('.004')*(base.sqrt_hi(w)-base.sqrt_lo(v))
        if dv>du and dv>dx:
            m=(v+w)/2
            children=[(l,h,x,y,v,m),(l,h,x,y,m,w)]
        elif du>dx:
            m=(l+h)/2
            children=[(l,m,x,y,v,w),(m,h,x,y,v,w)]
        else:
            m=(x+y)/2
            children=[(l,h,x,m,v,w),(l,h,m,y,v,w)]
        stack.extend((*c,depth+1) for c in children)
    base.require(count>0, 'empty physical cover')
    return count,least

if __name__=='__main__':
    repo=Path(sys.argv[1]).resolve() if len(sys.argv)>1 else HERE.parents[3]
    polys,nodes=base.read_inputs(repo)
    nodes=shoulder.add_stein_rows(repo,nodes)
    rows = checked_rows()
    H=(base.PI_HI/4-LOW**2)/P0**2
    control=(H,LOW,Q('.043'),Q('.045'))
    base.require(geometry_bounds([], *control)[0] and not geometry_bounds(rows, *control)[0],
                 'removing the smooth weights should admit this infeasible shell')
    leaves,margin=prove(polys,nodes,rows)
    base.require(margin>Q(100068,10**12), 'physical clearance')
    print(f'{leaves} closed cells for all shapes [0,42] and amplitudes [.8255,.82815].')
    lower_trillionths = ceil(margin*10**12)-1
    print(f'Physical clearance > {lower_trillionths}/10^12.')
    print('Checked the three supplemental models and the weight-removal control.')
