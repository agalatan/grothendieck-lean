# REVIEW_4 (claude-b9ee, 15 November 2026): written by the reviewer agent of the session, copied from its scratch folder; exact union of the 178 accepted boxes over [0, 463/10000] x [0, 42] (disjoint interiors and total area).
# claude reviewer (C-style, exact fractions, own method): union of the 178 accepted boxes covers [0,463/10000]x[0,42]
# iff (pairwise disjoint interiors) and (sum of clipped areas == domain area)  [closed boxes, finite union].
import json
from fractions import Fraction as Q
AUTH = '/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/'
UM, CM = Q(463, 10000), Q(42)
boxes = []
for fn in ['deficit_moment_verify_witness.json', 'deficit_moment_prefix_witness.json']:
    for r in json.load(open(AUTH + fn))['accepted']:
        a, b, c, d = map(Q, r['box']); boxes.append((a, b, c*c, d*d, fn[:15]))
for r in json.load(open(AUTH + 'deficit_dual_cover_witness.json'))['boxes']:
    a, b = map(Q, r['u']); c, d = map(Q, r['chi']); boxes.append((a, b, c, d, 'stein'))
clip = [(max(a, 0), min(b, UM), max(c, 0), min(d, CM), t) for a, b, c, d, t in boxes]
clip = [x for x in clip if x[0] < x[1] and x[2] < x[3]]
area = sum((b - a)*(d - c) for a, b, c, d, _ in clip)
over = 0
for i in range(len(clip)):
    for j in range(i + 1, len(clip)):
        a, b, c, d, _ = clip[i]; e, f, g, h, _ = clip[j]
        if max(a, e) < min(b, f) and max(c, g) < min(d, h): over += 1
print('boxes', len(clip), ' overlapping interior pairs', over, ' area == domain:', area == UM*CM, float(area), float(UM*CM))
