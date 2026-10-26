"""Regenerate the moment tables with moments_full.py and compare them with the stored files (exact JSON equality).
usage: check_moments.py TOOLSDIR"""
import sys, os, json
sys.path.insert(0, sys.argv[1]); import moments_full as MF
d = sys.argv[1]; rad = MF.radial(1600); tl = MF.tail(); ok = True
for nq in (256, 1024):
    S = json.load(open(os.path.join(d, f'moments_1600_{nq}.json'))); ang = MF.angular(nq)
    good = (S['rad'] == [[MF.ff(v) for v in r] for r in rad] and S['tail'] == [MF.ff(v) for v in tl] and S['ang'] == [[MF.ff(v) for v in a] for a in ang] and S['NR'] == 1600 and S['NQ'] == nq)
    print(f"moments_1600_{nq}.json: {'identical to the regenerated enclosures' if good else 'MISMATCH'}"); ok &= good
print('MOMENTS CHECK PASS' if ok else 'MOMENTS CHECK FAIL'); sys.exit(0 if ok else 1)
