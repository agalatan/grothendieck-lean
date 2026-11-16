#!/bin/sh
# Reviewer's replay driver, stage 1: everything of the package's run_all.sh except the adversarial search.
# Runs the UNMODIFIED package scripts from a private copy ($1), one process at a time, single-threaded.
# usage: replay_stage1.sh <package-copy-dir>
set -e
PK="$1"; PY=/usr/local/bin/python3
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1 VECLIB_MAXIMUM_THREADS=1 NUMEXPR_NUM_THREADS=1 PYTHONDONTWRITEBYTECODE=1
step() { name="$1"; shift; t0=$(date +%s); echo "== $name: start $(date '+%H:%M:%S')"; "$@"; echo "== $name: done in $(( $(date +%s) - t0 )) s"; }
step check_influence_exact sh -c "$PY -I '$PK/scripts/check_influence_exact.py' > '$PK/results/check_influence_exact.log'"
step check_sixth_moment    sh -c "$PY -I '$PK/scripts/check_sixth_moment.py'    > '$PK/results/check_sixth_moment.log'"
step tab                   sh -c "$PY -I '$PK/numerics/tab.py'"
step core                  sh -c "$PY -I '$PK/numerics/core.py' > '$PK/results/core.log'"
step identity              sh -c "$PY -I '$PK/numerics/influence.py' identity > '$PK/results/identity.log' 2> '$PK/results/identity.err'"
step gausslaw              sh -c "$PY -I '$PK/numerics/influence.py' gausslaw > '$PK/results/gausslaw.log' 2> '$PK/results/gausslaw.err'"
step prop10                sh -c "$PY -I '$PK/numerics/influence.py' prop10   > '$PK/results/prop10.log' 2> '$PK/results/prop10.err'"
step scan_tilt             sh -c "$PY -I '$PK/numerics/influence.py' scan tilt > '$PK/results/scan_tilt.log' 2> '$PK/results/scan_tilt.err'"
step scan_raw              sh -c "$PY -I '$PK/numerics/influence.py' scan raw  > '$PK/results/scan_raw.log' 2> '$PK/results/scan_raw.err'"
echo "== stage 1 complete $(date '+%H:%M:%S')"
