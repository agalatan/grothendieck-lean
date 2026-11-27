# The allowance of a band row as a function of the energy, computed as the content worker did (CONTENT_LEMMA_D5.md 12.1,
# content5/code/r4_theta.py; this is that script with the row data read from a file instead of r4lib.ROWS).   N.
#   theta_room(u) = the largest theta for which the law-layer test of 11.4 (b) (hypothesis ||c_X||^2 <= theta delta Omhat_X;
#   with (F), the Stein layer, the cap and (R1) at t_lo, kappa_AB = 0.82, tilt and pointwise mu) stays inside the row's room
#   AT THE ENERGY u (maximum over chi);  theta_0(u) = the same with no excess.  Bracketing by doubling, then linear
#   interpolation (the excess is convex in theta for fixed weights, so interpolation is on the safe side).
# claude-b9ee worker d5newcap, 16 Nov 2026.
#   usage (cwd = the game folder with rows5.lines, out/prof_<k>.npz and band_rows.json):
#       D5_E1=.. D5_ETA=.. r4_theta2.py k u1,u2,... chi1,chi2,... [tag]
#   band_rows.json: {"tilt": [s, t], "rows": {"<k>": {"t": "0.80", "mu": .., "tlo": .., "room": ..}}}
import sys, os, json, warnings; warnings.filterwarnings('ignore')
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, rowlib as R, lawstein as LS, combo as C, combo3 as C3, rice as RI, t4lib as T4
KAPPA = 0.82      # the study's kappa_AB (= 1 - 0.18, the old game's quintic share); overridden by the env KAPPA_AB or the row's 'kappa' in band_rows.json

def excess(row, U, u, chis, theta, mu, profs, kprofs, tlo, kappa=None):
    vals = []
    for chi in chis:
        best, aux = C3.solve_point_t4(row, U, u, chi, theta, mu, (KAPPA if kappa is None else kappa), profs, kprofs, tlo)
        if best is None or best == 'fail': continue
        vals.append((best[0] / (4 * mu), chi))
    return max(vals) if vals else (None, None)

def crossing(f, level, th0):
    """theta with f(theta) = level: bracket by doubling/halving from th0 (at most 6 steps), then interpolate."""
    pts = {}; th = th0
    for _ in range(7):
        v = f(th)
        if v is None: return None, pts
        pts[th] = v
        lo = [t_ for t_ in pts if pts[t_] <= level]; hi = [t_ for t_ in pts if pts[t_] > level]
        if lo and hi: break
        th = th * 2 if not hi else th / 2
    lo = [t_ for t_ in pts if pts[t_] <= level]; hi = [t_ for t_ in pts if pts[t_] > level]
    if not lo or not hi: return (max(pts) if not hi else min(pts)), pts
    a, b = max(lo), min(hi)
    return a + (b - a) * (level - pts[a]) / (pts[b] - pts[a]), pts

def refine(f, level, pts, tol=0.03, nmax=5):
    """sharpen the crossing found by crossing(): regula falsi on the bracket in pts (the excess is convex and increasing in
    theta, so the chord's crossing lies below the true one and the iterates increase to it).  Returns (theta, lo, hi)."""
    lo = [t_ for t_ in pts if pts[t_] is not None and pts[t_] <= level]; hi = [t_ for t_ in pts if pts[t_] is not None and pts[t_] > level]
    if not lo or not hi: return None, None, None
    a, b = max(lo), min(hi)
    for _ in range(nmax):
        if b - a <= tol * a: break
        x = a + (b - a) * (level - pts[a]) / (pts[b] - pts[a]); x = min(max(x, a + 0.02 * (b - a)), b - 0.02 * (b - a))
        v = f(x)
        if v is None: break
        pts[x] = v
        if v <= level: a = x
        else: b = x
    return a + (b - a) * (level - pts[a]) / (pts[b] - pts[a]), a, b

if __name__ == '__main__':
    k = int(sys.argv[1]); fr = sys.argv[2].split(','); chis = [float(x) for x in sys.argv[3].split(',')]      # an energy 'c0.8' means 0.8 of the response cap
    tag = sys.argv[4] if len(sys.argv) > 4 else ''
    cfg = json.load(open(os.environ.get('BAND_ROWS', 'band_rows.json'))); rw = cfg['rows'][str(k)]; s, t = cfg['tilt']
    tl, mu, tlo, room = rw['t'], rw['mu'], rw['tlo'], rw['room']
    kap = float(os.environ['KAPPA_AB']) if os.environ.get('KAPPA_AB') else float(rw.get('kappa', KAPPA))
    row = R.Row('out/prof_%d.npz' % k); profs = C.prof_derivs(row, s, t); U = LS.ugrid(); ucap = 4 * RI.E1 ** 2 * 0.432306903 * (0.886762780 - tlo); out = []
    th_start = float(rw.get('theta_start', 1.0))
    for f in fr:
        u = (min(float(f[1:]), 0.999) * ucap) if f.startswith('c') else min(float(f) * row.ustar, 0.999 * ucap)
        f = u / row.ustar; kprofs = (T4.Profile(profs[0], u), T4.Profile(profs[2], u)); cache = {}
        def fmax(th):
            if th not in cache: cache[th] = excess(row, U, u, chis, th, mu, profs, kprofs, tlo, kap)
            return cache[th][0]
        th_room, pts = crossing(fmax, room, th_start * max(1.0, (1.0 / max(f, 0.2)) ** 2))
        th_zero = None
        if pts:
            lo = [t_ for t_ in pts if pts[t_] <= 0]; hi = [t_ for t_ in pts if pts[t_] > 0]
            if lo and hi: a, b = max(lo), min(hi); th_zero = a + (b - a) * (0 - pts[a]) / (pts[b] - pts[a])
            elif lo: th_zero = max(lo)
        coarse = dict(pts)
        ref_room = ref_zero = None
        if os.environ.get('R4_REFINE', '1') == '1' and pts:
            ref_room = refine(fmax, room, pts)[0]; ref_zero = refine(fmax, 0.0, pts)[0] if os.environ.get('R4_ZERO', '1') == '1' else None
        out.append(dict(ufrac=u / row.ustar, ucapfrac=u / ucap, u=u, theta_room=th_room, theta_zero=th_zero, theta_room_ref=ref_room, theta_zero_ref=ref_zero,
                        pts={str(a): b for a, b in pts.items()}, chis={str(a): cache[a][1] for a in cache}))
        print('t=%s kappa_AB=%.3f u/cap=%.3f u/u*=%.3f: theta_room %s | theta_0 %s | refined: %s | %s | evaluations %s' % (tl, kap, u / ucap, u / row.ustar, 'none (no response law)' if th_room is None else '%.3f' % th_room,
              'n/a' if th_zero is None else '%.3f' % th_zero, '-' if ref_room is None else '%.3f' % ref_room, '-' if ref_zero is None else '%.3f' % ref_zero,
              ', '.join('%.3g: %+.2e (chi %s)' % (a, pts[a], cache[a][1]) for a in sorted(pts))), flush=True)
    json.dump(dict(k=k, t=tl, mu=mu, tlo=tlo, room=room, kappa=kap, exact_deriv=bool(getattr(row, 'exact', False) and os.environ.get('SPLINE_DERIV', '0') != '1'), tilt=[s, t], ustar=row.ustar, ucap=ucap, e1=RI.E1, pts=out), open('out/r4_theta_%d%s.json' % (k, tag), 'w'), indent=1)
