#!/bin/bash
# final design candidates of the present game at the tilt (2/5, 3/20): low pieces with covering rows, upper pieces with the rows of the min-envelope
cd $HOME/claude-b9ee-degree5/design
PY=../venv/bin/python; W=$PWD/work/g078
export D5_E1=0.78 D5_ETA=0.0779 TILT=0.4,0.15 MODELS=glob CS=4 GAME_LINK=g078design
export KAPPA_CONST="0.84:0.8472,0.845:0.8441,0.85:0.8406,0.855:0.8372,0.86:0.82,0.865:0.82,0.87:0.82,0.875:0.82,0.88:0.82,0.886:0.82"
EN=c0.60,c0.70,c0.78,c0.85,c0.92
DMIN=0.0 DMAX=0.13 TOPK=2 ROOMMIN=2e-4 $PY scripts/design_final.py $W certB_const margins m078b work/finL 500/701 "649/1000,67/100,69/100,71/100,73/100,3/4,77/100,79/100,81/100" $EN finL
UP=$($PY - <<P
import json
from fractions import Fraction as F
d = json.load(open("certB_const/out/envelope_design.json")); ps = [p for p in d["envelope"] if not p["tag"].endswith("L") and float(p["tag"]) >= 0.81]
a = [F(81, 100)] + [F(p["a"]) for p in ps if float(p["tag"]) >= 0.82] + [F(886227, 10**6)]
print(",".join(str(x) for x in a)); print(",".join("%.4f:%s" % (float(x), "+".join(t for t in [p["tag"] for p in ps if abs(F(p["a"]) - x) < F(1, 10**9) or (x == F(81, 100) and p["tag"] == "0.810")])) for x in a[:-1]))
P
)
A2=$(echo "$UP" | head -n 1); ON=$(echo "$UP" | tail -n 1)
echo "upper pieces: $A2"; echo "rows: $ON"
ONLY_ROWS="$ON" ROOMMIN=1e-5 $PY scripts/design_final.py $W certB_const margins m078b work/finU 500/701 "$A2" $EN finU
