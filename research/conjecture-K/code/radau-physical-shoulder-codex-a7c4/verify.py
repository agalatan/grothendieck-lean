"""One fixed p0 trial on an energy/shape region, for all response sectors. Agent-ID: codex-a7c4."""
import importlib.util
import sys
from fractions import Fraction as Q
from pathlib import Path

HERE = Path(__file__).resolve().parent
CLEARANCE = Q(1, 10**9)
AMPLITUDES = (Q('.824'), Q('.8255'))
V_GRID = tuple(map(Q, ('0 .001 .003 .0035 .0038 .0039 .00393 .003945 .003956 .003963 '
                       '.00398 .00401 .0041 .0044 .005 .007 .012 .022 .03 .037').split()))


def load(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def prove_box(make_margin, u0, u1, x0, x1, vmax):
    vgrid = sorted({vmax, *(v for v in V_GRID if v < vmax)})

    def even_layers(margin):
        if margin(Q('.003956'), Q('.003956')) <= CLEARANCE:
            return None
        layers = [(l,h,0) for l,h in zip(vgrid,vgrid[1:])]
        count, least, length = 0, Q(1), Q(0)
        while layers:
            l,h,depth = layers.pop()
            value = margin(l,h)
            if value > CLEARANCE:
                count += 1
                least = min(least,value)
                length += h-l
                continue
            mid = (l+h)/2
            if margin(mid,mid) <= CLEARANCE or depth >= 19:
                return None
            layers.extend(((l,mid,depth+1),(mid,h,depth+1)))
        if length != vmax:
            raise ValueError('incomplete even energy interval')
        return count,least

    todo = [(u0,u1,x0,x1,0)]
    rows, count, least, area = 0, 0, Q(1), Q(0)
    while todo:
        l,h,x,y,depth = todo.pop()
        result = even_layers(make_margin(l,h,x,y))
        if result is not None:
            covered, value = result
            rows += 1
            count += covered
            least = min(least,value)
            area += (h-l)*(y-x)
            continue
        if depth >= 34:
            raise ValueError(f'open physical cell {l} {h} {x} {y}')
        # These two scores select an axis only. Both closed children are checked.
        if (h-l)*1600 > y-x:
            m = (l+h)/2
            todo.extend(((l,m,x,y,depth+1),(m,h,x,y,depth+1)))
        else:
            m = (x+y)/2
            todo.extend(((l,h,x,m,depth+1),(l,h,m,y,depth+1)))
    if area != (u1-u0)*(x1-x0):
        raise ValueError('incomplete energy/shape rectangle')
    return rows,count,least


def main(repo):
    code = repo/'research/conjecture-K/code'
    rc = load('published_continuation',code/'uncapped-peak-consumer-codex-a7c4/radial_continuation.py')
    shoulder = rc.load_shoulder()
    base = shoulder.base
    polys,nodes = base.read_inputs(repo)
    nodes = shoulder.add_stein_rows(repo,nodes)
    outgoing,old_ceiling = rc.checked_continuation(repo,base)
    raw = load('raw_peak',code/'raw-content-2026-11-17-gemini-5331/verify_raw_content.py')
    a,b = Q(699,1250),Q(179,1250)
    ds,_ = raw.compute_deficit_moments_and_rice_poly(
        a,b,raw.single_pole_integrals(a,b),raw.single_pole_integrals(a,3*b))
    gauss = load('radau_curvature',HERE/'radau.py')
    radau,roots,weights = gauss.checked_bound(ds)
    base.require(len(roots)==3 and len(weights)==4 and 0<base.MU<=1,'fixed trial')
    base.require(weights[0] <= Q('.3773395892') and radau.mixture_max <= Q('.103425386036'),
                 'Radau upper prices')
    old = base.make_radial_bound(polys,nodes,continuation=outgoing,chord_curvature=old_ceiling)
    new = base.make_radial_bound(polys,nodes,continuation=outgoing,
                                 chord_curvature=lambda l,k:min(old_ceiling(l,k),radau(l,k)))
    visible = max(map(base.constant,AMPLITUDES))

    def make_margin(radial,l,h,x,y):
        base.require(base.U0 <= l < h <= Q('.051') and 0 <= x < y <= 42,
                     'peak radial score interval')
        score,error = base.score_bounds(l,h,y)
        k0 = min(4*h,h*(1+base.sqrt_hi(3*y/4)))/2-Q('.0926')
        price = radial(l,h,x,y)
        def margin(v,w):
            return base.TARGET-visible-base.MU*(price+base.shell_gain(score,error,k0,v,w))
        return margin

    smooth = load('published_weights',code/'radial-response-weights-codex-a7c4/verify.py')
    j,i1,i0,ia,ib,_ = smooth.checked_row(Q('.3'),smooth.RADII[Q('.3')])
    base.require(ia >= ib > 0, 'even-sector ordering')
    lower_t,upper_t = AMPLITUDES
    base.require(lower_t**2 >= 3*base.PI_HI/14 and upper_t**2 < smooth.PI_LO/4,
                 'visible amplitude assumptions for the physical row')

    def vmax_from_row(u):
        return ia*((j-lower_t**2/i1)/base.PRICE**2-u/i0)

    # Test both sides of the cutoff using the pure A term in the original ellipsoid.
    # With V=.035 this one constraint still admits the energy. With V=.037 it excludes it.
    probe_u = Q('.0506109')
    for probe_v,permitted in ((Q('.035'),True),(Q('.037'),False)):
        lhs = lower_t**2/i1 + base.PRICE**2*(probe_u/i0+probe_v/ia)
        base.require((probe_v <= vmax_from_row(probe_u)) == permitted and (lhs <= j) == permitted,
                     'two-sided smooth energy control')
    area = Q(0)
    for lo,hi,xmin,vmax,claim in (
            ('.0463','.0485','5.6','.04',4640),
            ('.0485','.0506109','5.6','.04',221568),
            ('.0506109','.051','5.46875','.037',1016)):
        l,h,x,v=map(Q,(lo,hi,xmin,vmax))
        base.require(0 <= vmax_from_row(l) < v,
                     'even energy exceeds the search interval')
        area += (h-l)*(42-x)
        rows,count,least=prove_box(lambda l,h,x,y:make_margin(new,l,h,x,y),l,h,x,Q(42),v)
        base.require(least>Q(claim,10**12),'whole-box physical clearance')
        print(f'u=[{lo},{hi}], chi=[{xmin},42]: {rows} rectangles, {count} shell cells, '
              f'physical clearance > {claim}/10^12, all feasible even/odd energies.')

    base.require(area == Q('.171131069375'), 'normalized physical region size')

    l,h,x,y,v,w=map(Q,('10365121/204800000','5182561/102400000','175/32',
                        '716801/131072','8237/2048000','131793/32768000'))
    before=make_margin(old,l,h,x,y)(v,w)
    after=make_margin(new,l,h,x,y)(v,w)
    base.require(before < -Q(21,10**12) and after > Q(1098781,10**12),
                 'strict residual control')
    print('Previously negative cell: old < -21/10^12, new > 1098781/10^12.')
    print('The smooth-energy control retains V=.035 and excludes V=.037 at u=.0506109.')
    damaged=ds.copy()
    damaged[3]=-damaged[3]
    try:
        gauss.checked_bound(damaged)
    except ValueError as e:
        base.require(str(e)=='positive Hankel pivot','unexpected corrupted-moment rejection')
    else:
        raise ValueError('accepted a negative Laplace moment')
    print('A corrupted third peak derivative was rejected.')


if __name__=='__main__':
    repo = Path(sys.argv[1]).resolve() if len(sys.argv)>1 else HERE.parents[3]
    main(repo)
