#!/bin/sh
# Replay everything. Exact part: standard library only. Numerical part: numpy, scipy.
set -e
cd "$(dirname "$0")"
echo "== exact checks (C) =="
python3 -I scripts/check_influence_exact.py | tee results/check_influence_exact.log
python3 -I scripts/check_sixth_moment.py    | tee results/check_sixth_moment.log
echo "== profiles (N) =="
python3 -I numerics/tab.py
python3 -I numerics/core.py | tee results/core.log
echo "== Theorem 6 and Corollary 6.1 (N) =="
python3 -I numerics/influence.py identity 2>/dev/null | tee results/identity.log
echo "== Theorem 9 (N) =="
python3 -I numerics/influence.py gausslaw  2>/dev/null | tee results/gausslaw.log
python3 -I numerics/influence.py prop10    2>/dev/null | tee results/prop10.log
python3 -I numerics/influence.py scan tilt 2>/dev/null | tee results/scan_tilt.log
python3 -I numerics/influence.py scan raw  2>/dev/null | tee results/scan_raw.log
echo "== adversarial search, tilt (N, about 40 minutes) =="
python3 -I numerics/influence.py search    2>/dev/null | tee results/search.log
echo "== v2: Stein-energy identity (C) and searches (N) =="
python3 -I scripts/check_stein_energy_exact.py | tee results/check_stein_energy_exact.log
python3 -I scripts/check_fourth.py | tee results/check_fourth.log
python3 -I scripts/sup_influence.py | tee results/sup_influence.log
for k in L H; do for n in 3 4; do python3 -I scripts/sup_fast.py $k $n 6 1; done; done | tee results/sup_fast_a.log
for k in M l1 l2; do for n in 3 4; do python3 -I scripts/sup_fast.py $k $n 6 2; done; done | tee results/sup_fast_b.log
rm -f results/argmax_*.npy
echo "== v2: Theorem 9 with 1/2, and the corner family (N) =="
python3 -I numerics/half.py   2>/dev/null | tee results/half.log
python3 -I numerics/corner.py 2>/dev/null | tee results/corner.log
