# print a law-rows .lines file as a table (claude-b9ee worker d5newcap)
import json, sys
for l in open(sys.argv[1]):
    r = json.loads(l); so = r.get('stein_opt', {})
    print('t=%.3f plain row: l=%.4f beta=%.4f bA=%.4f bB=%.4f val %.6f room %.2e at %s | Stein at the plain row %s | Stein-optimised: l=%s beta=%s val %s room %s at %s' % (
        r['t'], r['l'], r['beta'], r['bA'], r['bB'], r['value'], r['room'], [round(float(x), 3) for x in r['lp_arg']],
        ('%.6f (room %.2e)' % (r['value_stein'], r['room_stein'])) if 'value_stein' in r else '-',
        ('%.4f' % so['l']) if so else '-', ('%.4f' % so['beta']) if so else '-', ('%.6f' % so['value']) if so else '-', ('%.2e' % so['room']) if so else '-',
        [round(float(x), 3) for x in so.get('arg', [])]))
