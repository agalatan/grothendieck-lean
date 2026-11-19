#!/bin/sh
# Replay everything. Exact part: standard library only. Numerical part: numpy, scipy.
set -e
cd "$(dirname "$0")"
echo "== exact checks (C) =="; python3 -I scripts/check_identities_exact.py | tee results/check_identities_exact.log
cd numerics
echo "== profiles (N) =="; python3 tab.py; python3 prof.py; python3 core.py | tee ../results/core.log
echo "== Wick monomial (N) =="; python3 mono.py 2>/dev/null | tee ../results/mono.log
echo "== two variables (N) =="; python3 twovar.py 44 40 2>/dev/null | tee ../results/twovar.log
echo "== survey of H21(C^2) (N, ~30 min each) =="
python3 survey.py raw  2>/dev/null | tee ../results/survey_raw.log
python3 survey.py tilt 2>/dev/null | tee ../results/survey_tilt.log
python3 fine_eval.py raw  2>/dev/null | tee ../results/fine_eval_raw.log
python3 fine_eval.py tilt 2>/dev/null | tee ../results/fine_eval_tilt.log
