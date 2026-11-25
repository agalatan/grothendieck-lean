#!/bin/bash
# Stage 2c: the conditional certificate "K5 => V <= 500/701" for the game of game.json, end to end.
# claude-b9ee worker d5newcap, 16 Nov 2026.   Run it INSIDE this folder's copy on the compute machine:
#
#   bash launch2c.sh ROWS.json CORES [PROCS_PER_ROW] [PY]      e.g.  bash launch2c.sh rows2c.json 44 8 /root/venv/bin/python
#
# It starts ONE background job in its own process group (AGENTS.md section 12) and returns at once:
#   job.pid            the process-group id   (stop everything:  kill -- -$(cat job.pid) ;  check:  pgrep -g $(cat job.pid))
#   out/launch.log     the progress (one line per row started/finished, then the assembly and the replay)
#   out/logs/row_TAG.log, out/assemble2c.log, out/replay2c.log
# Steps: (0) checks (python modules, g++, game.json, the small-t node files); (1) g++ psi5; (2) rows: caps -> float LP
# target -> plain cover -> Stein cover (sched2c.py; rows already done are skipped, so a stopped run can be relaunched);
# (3) assemble2c.py; (4) the single replay replay2c_all.py (all node caps, all boxes, the small-t certificate, the
# envelope).  The final line of out/launch.log is "STAGE 2C: ALL PASS" or "STAGE 2C: FAILED ...".
# For a test: D5_REPLAY_ARGS="--caps 400 --no-target" replays a random sample of the node caps and does not require B < target.
set -u
cd "$(dirname "$0")"
ROWS=${1:?rows file}; CORES=${2:?number of cores}; PROCS=${3:-8}; PY=${4:-python3}
JOBS=$(( CORES / PROCS )); [ "$JOBS" -ge 1 ] || { echo "CORES < PROCS_PER_ROW"; exit 1; }
mkdir -p out/logs
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1 RAYON_NUM_THREADS=1
# ---- (0) checks, in the foreground (fail early)
$PY -I - <<'PYEOF' || { echo "prerequisite check failed"; exit 1; }
import sys
import numpy, scipy, flint, cvxpy, clarabel
print('python', sys.version.split()[0], 'numpy', numpy.__version__, 'scipy', scipy.__version__, 'flint', flint.__version__, 'cvxpy', cvxpy.__version__, 'clarabel', clarabel.__version__)
import cvxpy as cp
x = cp.Variable(); cp.Problem(cp.Minimize(x), [x >= 1]).solve(solver='CLARABEL', max_threads=1)     # the option used by stein2.py
PYEOF
command -v g++ > /dev/null || { echo "g++ missing"; exit 1; }
$PY -I -c "
import sys, os, json; sys.path.insert(0, '.')
import gamecfg as G
fine, coarse = G.nu_nodes()
spec = json.load(open('$ROWS'))
print('game eps1 = %s eta = %s rho = %s target %s; %d nu-nodes; %d rows (%d Stein)' % (G.EPS1, G.ETA, G.RHO, G.TARGET, len(set(fine + coarse)), len(spec['rows']), sum(r['kind'] == 'stein' for r in spec['rows'])))
if G.SMALL_T:
    import glob
    n = sum(len(glob.glob(os.path.join(G.SMALL_T.get('dir', 'smallt'), d, 'node_*.json'))) for d in G.SMALL_T.get('out_dirs', ['out']))
    assert n > 0, 'small_t is set in game.json but there are no node files'
    print('small-t bound %s t^2 + %s: %d node files' % (G.SMALL_T['a'], G.SMALL_T['b'], n))
" || { echo "configuration check failed"; exit 1; }
if [ -f job.pid ] && pgrep -g "$(cat job.pid)" > /dev/null 2>&1; then echo "a stage-2c job is already running here (job.pid)"; exit 1; fi
# ---- (1)-(4) in the background, own process group
cat > out/run_all.sh <<RUNEOF
#!/bin/bash
cd "$(pwd)"
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1 RAYON_NUM_THREADS=1
echo "[\$(date '+%F %T')] stage 2c started: rows $ROWS, $JOBS rows at a time x $PROCS processes"
g++ -O2 -ffp-contract=off -o psi5 psi5.cpp || { echo "STAGE 2C: FAILED (g++)"; exit 1; }
$PY -I sched2c.py $ROWS $JOBS $PROCS || { echo "STAGE 2C: FAILED (rows; see out/logs)"; exit 1; }
echo "[\$(date '+%F %T')] rows done"
$PY -I assemble2c.py $ROWS > out/assemble2c.log 2>&1 || { echo "STAGE 2C: FAILED (assemble; see out/assemble2c.log)"; exit 1; }
echo "[\$(date '+%F %T')] assembled:"; grep -E "^B = " out/assemble2c.log
$PY -I replay2c_all.py out/rows2c_final.json $CORES ${D5_REPLAY_ARGS:---smallt} > out/replay2c.log 2>&1
tail -4 out/replay2c.log
if tail -1 out/replay2c.log | grep -q "^ALL PASS"; then echo "[\$(date '+%F %T')] STAGE 2C: ALL PASS"; else echo "[\$(date '+%F %T')] STAGE 2C: FAILED (replay; see out/replay2c.log)"; fi
RUNEOF
bash -c 'set -m; nohup bash out/run_all.sh >> out/launch.log 2>&1 & echo $! > job.pid'
sleep 1
echo "started: process group $(cat job.pid); progress in $(pwd)/out/launch.log"
