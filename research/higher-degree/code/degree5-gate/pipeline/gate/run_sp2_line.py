# run spike2.scan for line k of rows5.lines (avoids JSON quoting through ssh)
import sys, os, json, time; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import spike2 as S2
k = int(sys.argv[1]); rec = json.loads(open(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'rows5.lines')).read().split('\n')[k - 1])
cs = [float(x) for x in sys.argv[3].split(',')]; sigs = [float(x) for x in sys.argv[4].split(',')]
t0 = time.time(); o = S2.scan(rec, cs, sigs); o['secs'] = time.time() - t0
json.dump(o, open(sys.argv[2], 'w'), indent=1)
best = max(o['pts'], key=lambda p: p['excess'])
print('t=%.3f S5=%.9f s*=%.4f best excess %+.3e at c=%.2f sig=%.3f [%.0fs]' % (rec['t'], o['S5'], o['sstar'], best['excess'], best['c'], best['sig'], o['secs']))
