#!/bin/sh
# Runs the reviewer's own checks, one process at a time, single-threaded (about 8 minutes).
# usage: run_review.sh <review-dir> <package-copy-dir (replayed: needs numerics/tab_peak.npz, results/, results_delivered/)>
RV="$1"; PK="$2"; PY="/usr/local/bin/python3 -I -B"
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1 VECLIB_MAXIMUM_THREADS=1 NUMEXPR_NUM_THREADS=1
step() { name="$1"; shift; t0=$(date +%s); echo "== $name: start $(date '+%H:%M:%S')"; "$@"; echo "== $name: exit $? after $(( $(date +%s) - t0 )) s"; }
step exact     sh -c "$PY '$RV/exact_wickbasis.py' > '$RV/exact_wickbasis.log' 2>&1"
step numerics  sh -c "$PY '$RV/own_numerics.py' '$RV' '$PK/numerics/tab_peak.npz' '$PK/results_delivered/t9_search.json' '$PK/results/t9_search.json' > '$RV/own_numerics.log' 2>&1"
step lawlevel  sh -c "$PY '$RV/own_lawlevel.py' '$RV' > '$RV/own_lawlevel.log' 2>&1"
step scan      sh -c "$PY '$RV/own_scan.py' '$RV' '$PK/results_delivered/t9_search.json' > '$RV/own_scan.log' 2>&1"
step small     sh -c "$PY '$RV/small_checks.py' '$RV' > '$RV/small_checks.log' 2>&1"
echo "== all done $(date '+%H:%M:%S')"
