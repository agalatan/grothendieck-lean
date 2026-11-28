# Stage 0 (b): does the quintic share depend on the choice of the row?  (N.)   A research worker of claude-b9ee.
# For the Gaussian-optimal row of a game at t, each of the four parameters (l, beta, bA, bB) is moved by +-step; for
# every moved row the Gaussian-ideal value (rows/d5eng2.row_value: the price in room) and the quintic share of the
# exact coupled one-spike model (gate/kappa_h.py's definition: gate/spike2.scan on c in {0.1, 0.3, 0.6, 1} x
# sigma in {0.9, 1, 1.1} sigma*) are recomputed.  Run in the gate folder of the game (it needs rows5.lines):
#   D5_E1=.. D5_ETA=.. python b_detune.py PIPELINE GATE_DIR t step OUT.json [index of the move, to run moves in parallel]
import sys, os, json, math, time
P, GD, t, step, outp = sys.argv[1], sys.argv[2], float(sys.argv[3]), float(sys.argv[4]), sys.argv[5]
sys.path.insert(0, os.path.join(P, 'rows')); sys.path.insert(0, os.path.join(P, 'gate'))
import numpy as np, d5eng2 as D2, spike2 as S2
rows = [json.loads(l) for l in open(os.path.join(GD, 'rows5.lines')) if l.strip()]
base = [r for r in rows if abs(r['t'] - t) < 1e-9][0]
moves = [(None, 0.0)] + [(k, sg * step) for k in ('l', 'beta', 'bA', 'bB') for sg in (1, -1)]
if len(sys.argv) > 6: moves = [moves[int(sys.argv[6])]]
out = []
for k, d in moves:
    rec = dict(base); t0 = time.time()
    if k: rec[k] = base[k] + d
    val, sig, nu, inn = D2.row_value(t, [rec['l'], rec['beta'], rec['bA'], rec['bB']], ret=True)
    rec.update(row=float(val), sig=float(sig), nu5=float(nu))
    if sig <= 1e-6: out.append(dict(move=k, d=d, row=float(val), note='plain branch (sigma* = 0): no one-spike points')); continue
    o = S2.scan(rec, [0.1, 0.3, 0.6, 1.0], [0.9 * sig, sig, 1.1 * sig]); kh = kab = -1
    for q in o['pts']:
        if not all(math.isfinite(v) for v in q['groups'].values()) or q['D'] <= 0: continue
        den = q['D'] + q['Vsl']; h = sum(v for g, v in q['groups'].items() if g not in ('H10/H01', 'const'))
        kh = max(kh, h / den); kab = max(kab, q['groups']['H10/H01'] / den)
    out.append(dict(move=k, d=d, row=float(val), drow=float(val - base['row']), sig=float(sig), nu5=float(nu), kappa_h=kh, kappa_AB=kab, secs=time.time() - t0))
    print(out[-1], flush=True)
json.dump(dict(t=t, step=step, base=base, moves=out), open(outp, 'w'), indent=1)
