import sys, json, glob
W = sys.argv[1]; rows = []
for t in sys.argv[2:]:
    fl = sorted(glob.glob(f'{W}/final_{t}_*.json')); assert fl, t
    rows.append(dict(t=t, pkl=f'{W}/newpkl3_{t}.pkl', rebank=fl))
json.dump(dict(eps="149/200", rows=rows), open(f'{W}/spec_d.json', 'w'), indent=1); print(json.dumps(rows, indent=1))
