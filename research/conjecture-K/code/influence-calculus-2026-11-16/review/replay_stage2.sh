#!/bin/sh
# Reviewer's replay driver, stage 2: the adversarial search of the package (influence.py search), unmodified,
# from the private copy ($1); single process, single thread.  It writes results/search.log and results/t9_search.json
# inside the copy.
set -e
PK="$1"; PY=/usr/local/bin/python3
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1 VECLIB_MAXIMUM_THREADS=1 NUMEXPR_NUM_THREADS=1 PYTHONDONTWRITEBYTECODE=1
t0=$(date +%s); echo "== search: start $(date '+%H:%M:%S')"
$PY -I "$PK/numerics/influence.py" search > "$PK/results/search.log" 2> "$PK/results/search.err"
echo "== search: done in $(( $(date +%s) - t0 )) s ($(date '+%H:%M:%S'))"
