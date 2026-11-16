#!/bin/sh
# Reviewer's replay of the NEW parts of package-v2 (unmodified scripts, private copy $1), one process, one thread.
# The copy must have the delivered logs moved to results_delivered/ and an empty results/.
# stage "a": the exact check, the pairing-formula check, the profile table, half.py, corner.py   (about 2 minutes)
# stage "b": the searches sup_influence.py and sup_fast.py                                      (about 25 minutes)
# usage: replay_v2.sh <package-v2-copy-dir> a|b
PK="$1"; ST="$2"; PY="/usr/local/bin/python3 -I -B"
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1 VECLIB_MAXIMUM_THREADS=1 NUMEXPR_NUM_THREADS=1
step() { name="$1"; shift; t0=$(date +%s); echo "== $name: start $(date '+%H:%M:%S')"; "$@"; echo "== $name: exit $? after $(( $(date +%s) - t0 )) s"; }
if [ "$ST" = a ]; then
step check_stein_energy_exact sh -c "$PY '$PK/scripts/check_stein_energy_exact.py' > '$PK/results/check_stein_energy_exact.log' 2>&1"
step check_fourth             sh -c "$PY '$PK/scripts/check_fourth.py' > '$PK/results/check_fourth.log' 2>&1"
step tab                      sh -c "$PY '$PK/numerics/tab.py'"
step half                     sh -c "$PY '$PK/numerics/half.py' > '$PK/results/half.log' 2> '$PK/results/half.err'"
step corner                   sh -c "$PY '$PK/numerics/corner.py' > '$PK/results/corner.log' 2> '$PK/results/corner.err'"
else
step sup_influence            sh -c "$PY '$PK/scripts/sup_influence.py' > '$PK/results/sup_influence.log' 2>&1"
step sup_fast_a               sh -c "for k in L H; do for n in 3 4; do $PY '$PK/scripts/sup_fast.py' \$k \$n 6 1; done; done > '$PK/results/sup_fast_a.log' 2>&1"
step sup_fast_b               sh -c "for k in M l1 l2; do for n in 3 4; do $PY '$PK/scripts/sup_fast.py' \$k \$n 6 2; done; done > '$PK/results/sup_fast_b.log' 2>&1"
fi
echo "== stage $ST done $(date '+%H:%M:%S')"
