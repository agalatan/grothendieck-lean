"""Retained six-sector witness using two prices and a shared odd response. Agent-ID: codex-a7c4."""
import importlib.util
import json
import re
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

EXTENSION_LOW = Q('.826')
INNER_LEFT, INNER_RIGHT = Q('.1'), Q(27)
HARMONIC_THETA = P0*(P1-ODD)/(P1*(P0-ODD))


def read_extended_content(repo):
    """Read the published lower energies and rounded score bounds in 11.49 and 11.62."""
    src = repo/'research/conjecture-K/sources'
    legacy = src/'received-2026-11-15-tilted-sector/deficit_structure_refine_results.txt'
    records = [json.loads(line) for line in legacy.read_text().splitlines()]
    selected = [r for r in records if r.get('tag') == '015']
    base.require(len(selected) == 1, 'missing or duplicate 11.49 score row')
    row = selected[0]
    lo, hi = map(Q, row['u'])
    gamma = Q(row['rounded_content_coefficient'])
    base.require(row['passed'] is True and lo == Q('.015') and hi == base.U0
                 and 0 < Q(row['content_coefficient']) <= gamma, 'invalid 11.49 score row')

    # The 11.62 proof publishes exact fractions, matching decimals, and a directed
    # angular upper bound in the four-column table of section 1.
    proof = (src/'ab-sector-2026-11-15-codex-91d4/route2/a_content/A_CONTENT_PROOF.md').read_text()
    upper = re.search(r'lower endpoint and `([\d/]+)`', proof)
    base.require(upper is not None and Q(upper[1]) == base.U0, 'invalid 11.62 energy domain')
    wanted = {Q('.008'), Q('.0375'), Q('.042')}
    rows = {}
    table_row = r'^\| `([\d/]+)=(\.[\d]+)` \| `([\d/]+)=(\.[\d]+)` \| `[\d/]+` \| `(\.[\d]+)` \|$'
    for fields in re.findall(table_row, proof, re.MULTILINE):
        energy, energy_decimal, coefficient, coefficient_decimal, angular = map(Q, fields)
        if energy in wanted:
            base.require(energy not in rows and energy == energy_decimal
                         and coefficient == coefficient_decimal and 0 < angular <= coefficient,
                         'invalid 11.62 score row')
            rows[energy] = coefficient
    base.require(rows.keys() == wanted, 'missing 11.62 score row')
    return base.CONTENT + tuple(sorted([(lo, gamma), *rows.items()]))


# Default rows are also consumed by the weighted shoulder.
EXTENDED_CONTENT = read_extended_content(HERE.parents[3])


def add_stein_rows(repo,nodes):
    old = json.loads((HERE/'duals.json').read_bytes())
    extra = json.loads((HERE/'extension_duals.json').read_bytes())
    base.require(len(extra)==3, 'supplementary Stein inventory')
    source = repo/'research/conjecture-K/code/peak-window-codex-a7c4/verify.py'
    raw,caps,_ = base.load('extension_window',source).read_public_inputs(repo)
    knots = list(map(Q,old['knots']))
    augmented = {u:list(rows) for u,rows in nodes.items()}
    for row in extra:
        u = Q(row['v'])
        base.require(u==Q(3,50) and raw.check_stein_node(row,knots,caps),'invalid supplementary Stein row')
        augmented.setdefault(u,[]).append(tuple(map(Q,row['coefficients'])))
    damaged = dict(extra[0],coefficients=['0',*extra[0]['coefficients'][1:]])
    base.require(not raw.check_stein_node(damaged,knots,caps),'accepted corrupt supplementary Stein row')
    return augmented

def prove(polys,nodes,lower=LOW,prices=(P0,P1),extension=False,repo=None):
    high = LOW if extension else HIGH
    if extension:
        base.require(lower == EXTENSION_LOW, 'wrong extension amplitude')
    content = read_extended_content(repo or HERE.parents[3]) if extension else base.CONTENT
    balanced = HARMONIC_THETA if extension else THETA
    clearance = Q(1,10**8 if extension else 10**6)
    H=(base.PI_HI/4-lower**2)/P0**2
    base.require(lower<=high and lower**2>=3*base.PI_HI/14, 'radius assumption')
    base.require(P0 in prices and set(prices)<={P0,P1},'unknown price selection')
    for price in prices:
        base.require(0<base.EPS*price<=1 and 0<=P0-price and H*(P0/price)**2<=Q('.06'),
                     'unsupported trial scale or energy')
    base.require(0<THETA<=1 and THETA*P0+(1-THETA)*ODD==P1,'invalid odd mixture')
    base.require(0<HARMONIC_THETA<=1 and 1/(HARMONIC_THETA/P0+(1-HARMONIC_THETA)/ODD)==P1,
                 'invalid harmonic mixture')
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
        edges=sorted({base.U0,Q('.051'),*[a for a,_ in content]})
        cuts=[l*ratio,*[z for z in edges if l*ratio<z<rh],rh]
        scores=[base.score_bounds(a,b,y,content) for a,b in zip(cuts,cuts[1:])]
        a=max(s[0] for s in scores)
        b=max(s[1] for s in scores)
        k=min(4*rh,rh*(1+base.sqrt_hi(3*y/4)))/2-Q('.0926')
        m=base.EPS*p
        cost=max(t*t-2*m*base.GUIDE*t+2*(m*base.BETA)**2/base.EPS for t in (lower,high))
        return ratio,a,b,k,radial(p,l,h,x,y),cost,m

    def reserve(p,l,h,x,y,v,w,theta):
        ratio,a,b,k,rad,cost,m=inputs(p,l,h,x,y)
        hu,l_v,h_v=ratio*h,ratio*v,ratio*w
        wmax=ratio*(H-l/2-2*v/3)
        base.require(0<theta<=1 and m*theta<=1 and p<=P0 and P0/theta>=p
                     and wmax>=0, 'incorrect signs in the mixed trial')
        odd=1/(theta/P0+(1-theta)/ODD) if extension else theta*P0+(1-theta)*ODD
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
    if extension:
        shape=[INNER_LEFT,*[x for x in shape if INNER_LEFT<x<INNER_RIGHT],INNER_RIGHT]
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
            if best<=clearance and P1 in prices:
                for theta in (balanced,Q(1)):
                    best=max(best,reserve(P1,l,h,x,y,v,w,theta))
                    if best>clearance:break
            if best>clearance:
                least=min(least,best)
                return True
            if lv>=(5 if extension and depth>=4 else 2):return False
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

def check_outer_shapes(repo):
    adaptive=base.load('outer_shapes',HERE.parent/'uncapped-six-sector-codex-a7c4/adaptive.py')
    source=adaptive.fixed.inputs(repo)
    outer = []
    for mixed,slabs,filename,high,expected in [
        (True,adaptive.LOW,'adaptive-low.json',Q('.833'),372985),
        (False,adaptive.REGIONS,'adaptive.json',Q('.8393'),14774073),
    ]:
        matches = [i for i,slab in enumerate(slabs) if Q(slab[0]) == EXTENSION_LOW]
        base.require(len(matches) == 1, 'missing or duplicate exterior amplitude')
        index = matches[0]
        outer.append(adaptive.shape_interval(slabs[index], mixed))
        base.require(EXTENSION_LOW<=LOW<=high, 'outer certificate does not span extension')
        data=json.loads((adaptive.HERE/filename).read_bytes())
        _,gap=adaptive.run(source,data[index],slabs[index],mixed)
        base.require(gap>Q(expected,10**12), 'outer shape clearance')
    verify_shape_partition(outer[0], (INNER_LEFT, INNER_RIGHT), outer[1])


def verify_shape_partition(low, middle, high):
    base.require(low[0] == 0 and low[1] == middle[0] and middle[1] == high[0]
                 and high[1] == 42 and all(a < b for a,b in (low,middle,high)),
                 'extension shape intervals do not partition [0,42]')

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

    new_nodes=add_stein_rows(repo,nodes)
    count,spare=prove(polys,new_nodes,lower=EXTENSION_LOW,extension=True,repo=repo)
    base.require(spare>Q(1,10**8),'middle shape clearance')
    check_outer_shapes(repo)
    print(f'{count} middle-shape cells; physical clearance > {spare*10**12//1}/10^12.')
    print('Closed outer shape ranges replayed; unrestricted [.826,.82815].')
    energy=Q(3,50)
    for i in range(len(new_nodes[energy])):
        subset=dict(new_nodes)
        subset[energy]=new_nodes[energy][:i]+new_nodes[energy][i+1:]
        try:
            prove(polys,subset,lower=EXTENSION_LOW,extension=True,repo=repo)
        except ValueError as error:
            base.require(str(error).startswith('unproved shared-response cell'),'wrong missing-data control')
        else:
            raise ValueError('single-row deletion unexpectedly covers extension')
    print('Corrupt dual rejected; omitting any one of the three supplementary rows fails coverage.')
