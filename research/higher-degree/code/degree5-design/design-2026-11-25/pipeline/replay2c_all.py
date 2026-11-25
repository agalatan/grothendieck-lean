# One replay checker for the stage-2c certificate (claude-b9ee worker d5newcap, 16 Nov 2026; from cert2b/replay2b_all.py).  [C]
#   python3 -I replay2c_all.py out/rows2c_final.json NPROC [--caps all|N] [--smallt] [--only TAG:KIND]
# For every row of the spec:
#   (1) caps: recompute every node cap with psi5 (fresh run) and check  new upper end + tail <= stored cap;
#   (2) each cover of the row: tiling of [nu_min, nu_max] x [0, sig_max] x [0, XMAX] by the boxes (exact volume and
#       pairwise disjointness; nu-interval ends are cap nodes), every box re-verified: polynomial boxes (law2: both
#       majorants, exact segment and tail tests, exact Bernstein bound) or Stein boxes (stein2: both Stein majorants at
#       c = sa^2 and c = sb^2 by interval cells and the exact polynomial tail, exact Bernstein bound with the Stein
#       term), each bound <= the stored one; G+ = max stored bound; C_r = 2 beta^2/eps1 + G+ must equal the record;
#   (3) the envelope (exact): on [0, t1] the direct small-t bound V <= a t^2 + b (smallt/, an input re-run by --smallt);
#       on [t1, 886227/10^6] min over the rows (final constants: Stein where present); B = the larger maximum; per
#       active piece the room TARGET - max.
# The game, the radius input and the target are those of game.json (gamecfg.py) and must equal the spec's.
import sys, os, json, time, random
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
os.environ.setdefault('OMP_NUM_THREADS', '1')
from fractions import Fraction as F
from multiprocessing import Pool
import gamecfg as G
import law2 as law
import stein2 as st
import caps2 as CP
from envelope import envelope, SQRTPI_2_UP

ROW = None
def init(c):
    global ROW
    ROW = law.Row(c)

def check_box(b):
    if b.get('stein'):
        return st.check_box_stein(ROW, b)
    nu0, nu1, sa, sb, xa, xb = (F(v) for v in b['box'])
    a0 = [F(v) for v in b['a0']]; a1 = [F(v) for v in b['a1']]
    ok0, _ = law.verify_majorant(ROW, nu0, a0); ok1, _ = law.verify_majorant(ROW, nu1, a1)
    bd = law.box_bound(ROW, nu0, nu1, a0, a1, sa, sb, xa, xb)
    return ok0 and ok1 and bd <= F(b['bound'])

def replay_caps(capsf, nproc, sample):
    d = json.load(open(capsf))
    row = {k: F(v) for k, v in d['row'].items()}; tail = F(d['tail'])
    nodes = [(F(s), F(nu), F(c)) for nu, lst in d['caps'].items() for s, c in lst]
    if sample != 'all':
        random.seed(2026); nodes = random.sample(nodes, min(int(sample), len(nodes)))
    res = CP.compute(row, [(s, nu) for s, nu, _ in nodes], nproc=nproc)
    got = {(r[0], r[1]): r[3] for r in res}
    assert len(got) == len(nodes)
    return all(got[(s, nu)] + tail <= c for s, nu, c in nodes), len(nodes)

def tiling(row, boxes, sig_max):
    nus = row.nus
    region = (nus[-1] - nus[0]) * sig_max * law.XMAX
    B = [tuple(F(v) for v in b['box']) for b in boxes]
    vol = F(0)
    for (n0, n1, a, b, c, d) in B:
        assert n0 in row.caps and n1 in row.caps and n0 < n1
        assert nus[0] <= n0 and n1 <= nus[-1] and 0 <= a < b <= sig_max and 0 <= c < d <= law.XMAX
        vol += (n1 - n0) * (b - a) * (d - c)
    if vol != region: return False
    Bf = [tuple(float(v) for v in x) for x in B]
    order = sorted(range(len(B)), key=lambda i: Bf[i][0])
    for ii, i in enumerate(order):
        for j in order[ii + 1:]:
            if Bf[j][0] >= Bf[i][1] + 1e-12: break            # sorted by nu0: no later box overlaps i in nu
            pf, qf = Bf[i], Bf[j]
            if max(pf[2], qf[2]) > min(pf[3], qf[3]) + 1e-12 or max(pf[4], qf[4]) > min(pf[5], qf[5]) + 1e-12:
                continue                                       # clearly separated in sigma or x (float prefilter)
            p, q = B[i], B[j]
            if max(p[0], q[0]) < min(p[1], q[1]) and max(p[2], q[2]) < min(p[3], q[3]) and max(p[4], q[4]) < min(p[5], q[5]):
                return False
    return True

def replay_cover(capsf, coverf, nproc):
    init(capsf); row = ROW
    cov = json.load(open(coverf)); boxes = cov['boxes']
    assert not cov['failed'] and not cov['unfinished']
    sig_max = F(cov['sig_max'])
    assert sig_max * row.kappa >= row.lip * law.RHO
    assert row.nus[0] <= -law.ETA and row.nus[-1] >= law.ETA
    okt = tiling(row, boxes, sig_max)
    with Pool(nproc, initializer=init, initargs=(capsf,)) as pool:
        ok = all(pool.map(check_box, boxes, chunksize=2))
    Gp = max(F(b['bound']) for b in boxes)
    return okt and ok, Gp, row, len(boxes), sum(1 for b in boxes if b.get('stein'))

def env_report(name, rows, small, target):
    if small:
        a, b, t1 = F(small['a']), F(small['b']), F(small['t1_final'])
        direct_max = a * t1 * t1 + b
    else:
        t1 = F(0); direct_max = None
    B, tb, pieces = envelope([(l, C) for _, l, C in rows], t1, SQRTPI_2_UP)
    assert pieces[0][0] == t1 and pieces[-1][1] == SQRTPI_2_UP, 'the rows do not cover [t1, 886227/10^6]'
    Btot = B if direct_max is None else max(B, direct_max)
    use_rows = direct_max is None or B >= direct_max
    print('%s: B = %.10f (%s) at t = %.5f; room %s - B = %.4e' % (name, float(Btot), 'rows' if use_rows else 'small-t bound',
          float(tb) if use_rows else float(t1), str(target), float(target - Btot)))
    if small:
        print('  small-t bound %s t^2 + %s on [0, %.6f]: max %.9f  room %.4e' % (small['a'], small['b'], float(t1), float(direct_max), float(target - direct_max)))
    for a_, b_, i in pieces:
        t_r, l, C = rows[i]
        m = max(a_ * a_ - 2 * l * a_ + C, b_ * b_ - 2 * l * b_ + C)
        print('  row %s active on [%.5f, %.5f]: max %.9f  room %.4e' % (t_r, float(a_), float(b_), float(m), float(target - m)))
    return Btot

def replay_smallt(small, nproc):
    """(0) the direct small-t bound: re-run its own replay (smallt/reverify.py, every certificate of the node files) in
    nproc processes and its exact assembly (smallt/assemble.py); check (1 - eta'_d) t^2 + N <= a t^2 + b on
    [0, 886227/10^6] exactly (eta'_d = the double used by the certificates)."""
    import subprocess, glob as _g
    here = os.path.dirname(os.path.abspath(__file__)); sdir = os.path.join(here, small.get('dir', 'smallt'))
    dirs = [os.path.join(sdir, d) for d in small.get('out_dirs', ['out'])]
    files = sorted(f for d in dirs for f in _g.glob(os.path.join(d, 'node_*.json')))
    if not files: return False, 'no node files'
    env = dict(os.environ, D5_GAME=G._PATH)
    procs = [subprocess.Popen([sys.executable, '-I', os.path.join(sdir, 'reverify.py'), str(k), str(nproc)] + files,
                              stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, env=env) for k in range(nproc)]
    tot = bad = 0
    for p in procs:
        out = p.communicate()[0]
        last = [l for l in out.splitlines() if l.startswith('REPLAY')]
        if p.returncode != 0 or not last: return False, 'reverify failed: ' + out[-300:]
        w = last[-1].split(); tot += int(w[2]); bad += int(w[4])
    out = subprocess.run([sys.executable, '-I', os.path.join(sdir, 'assemble.py'), small['etap']] + dirs, capture_output=True, text=True, env=env)
    if out.returncode != 0: return False, 'assemble failed: ' + (out.stdout + out.stderr)[-300:]
    asm = json.load(open(os.path.join(dirs[0], 'assembled.json')))
    etap = F(*asm['etap']); N = F(*asm['N']); a, b = F(small['a']), F(small['b'])
    ok = bad == 0 and tot > 0 and etap >= G.ETA and N + max(1 - etap - a, F(0)) * SQRTPI_2_UP ** 2 <= b
    return ok, '%d certificates, %d problems; N = %.9f; eta_d = %.17g >= eta: %s; (1 - eta_d) - a = %.1e' % (tot, bad, float(N), float(etap), etap >= G.ETA, float(1 - etap - a))

if __name__ == '__main__':
    spec = json.load(open(sys.argv[1])); nproc = int(sys.argv[2])
    sample = sys.argv[sys.argv.index('--caps') + 1] if '--caps' in sys.argv else 'all'
    here = os.path.dirname(os.path.abspath(sys.argv[1]))
    g = spec['game']
    assert (F(g['eps1']), F(g['eta']), F(g['rho']), F(g['target'])) == (G.EPS1, G.ETA, G.RHO, G.TARGET), 'spec and game.json differ'
    print('game: eps1 = %s, eta = %s, radius input rho = %s, target %s' % (G.EPS1, G.ETA, G.RHO, G.TARGET), flush=True)
    T0 = time.time(); allok = True; final = []
    small = spec.get('small_t')
    if small and '--smallt' in sys.argv:
        oks, msg = replay_smallt(small, nproc)
        allok &= oks
        print('direct small-t bound V <= %s t^2 + %s: %s (%s, %.0fs)' % (small['a'], small['b'], 'PASS' if oks else 'FAIL', msg, time.time() - T0), flush=True)
    elif small:
        print('direct small-t bound V <= %s t^2 + %s: NOT replayed in this run (use --smallt)' % (small['a'], small['b']), flush=True)
    only = sys.argv[sys.argv.index('--only') + 1].split(':') if '--only' in sys.argv else None   # TAG:KIND
    for r in spec['rows']:
        tag = r['tag']; capsf = os.path.join(here, 'caps_%s.json' % tag)
        Cfin = F(r['C_stein']) if 'C_stein' in r else F(r['C_plain'])
        if only and tag != only[0]:
            row = law.Row(capsf); final.append((tag, row.l, Cfin)); continue        # replayed in another part of the run
        t0 = time.time(); msg = 'row %s:' % tag
        if not only:
            okc, nc = replay_caps(capsf, nproc, sample); allok &= okc
            msg += ' caps %d %s' % (nc, 'PASS' if okc else 'FAIL')
        row = None
        for kind in ('plain', 'stein'):
            cf = r['covers'].get(kind)
            if not cf or (only and kind != only[1]): continue
            okl, Gp, row, nb, ns = replay_cover(capsf, os.path.join(here, cf), nproc)
            C = 2 * row.beta ** 2 / law.EPS1 + Gp
            same = (C == F(r['C_' + kind])); allok &= okl and same
            msg += ' | %s %d boxes (%d Stein) %s, C %.10f %s' % (kind, nb, ns, 'PASS' if okl else 'FAIL', float(C), 'matches' if same else 'DIFFERS')
        if row is None: row = law.Row(capsf)
        assert ','.join(str(v) for v in (row.l, row.beta, row.bA, row.bB)) == r['row'], 'row parameters differ from the spec'
        final.append((tag, row.l, Cfin))
        print(msg + ' (%.0fs)' % (time.time() - t0), flush=True)
    Btot = env_report('envelope (final constants)', final, small, G.TARGET)
    if '--no-target' not in sys.argv: allok &= (Btot < G.TARGET)       # --no-target: tests with a few rows only
    print('B < target: %s' % (Btot < G.TARGET))
    print('ALL PASS' if allok else 'SOME CHECK FAILED', '(%.0fs)' % (time.time() - T0), flush=True)
