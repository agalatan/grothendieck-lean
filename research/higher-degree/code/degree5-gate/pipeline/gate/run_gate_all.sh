#!/bin/bash
# claude-b9ee worker d5newcap: the model gate for the rows of rows5.lines (game from D5_E1, D5_ETA).
# usage: run_gate_all.sh PY CORE "k1 k2 ..." [spike]      CORE: taskset core (yo) or "-" (no pinning)
#   without "spike": zero core, crude majorant, and per row hab, h11c, lawlp_odd, lp_rows (abfin on rows 4, 7, 9, 17)
#   with "spike":    the exact coupled one-spike model (spike2.py) on the reduced grid
#                    c in {0.1, 0.3, 0.6, 1} x sigma in {0.5, 0.9, 1, 1.1} sigma*  (plus sigma = 0.03, 0.06, 0.16 on the plain row)
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1 VECLIB_MAXIMUM_THREADS=1
cd "$(dirname "$0")"; PY=$1; CORE=$2; ROWS=$3; MODE=${4:-cheap}; mkdir -p out
RUN=""; [ "$CORE" != "-" ] && RUN="taskset -c $CORE"
if [ "$MODE" = "cheap" ]; then
  $RUN $PY zero_core.py > out/zero_core.log 2>&1
  $RUN $PY crude_h.py > out/crude_h.log 2>&1
  for k in $ROWS; do
    case " 4 7 9 17 " in *" $k "*) AB=abfin;; *) AB="";; esac
    $RUN bash gate_row.sh $PY $k $AB >> out/gate_rows.log 2>&1
  done
  echo DONE >> out/gate_rows.log
else
  for k in $ROWS; do
    SIG=$($PY -c "
import json
r = json.loads(open('rows5.lines').read().split('\n')[$k - 1]); s = r['sig']
print(','.join('%.5f' % (f * s) for f in (0.5, 0.9, 1.0, 1.1)) if s > 1e-6 else '0.03,0.06,0.1,0.16')")
    $RUN $PY run_sp2_line.py $k out/sp2_$k.json 0.1,0.3,0.6,1 $SIG >> out/sp2.log 2>&1
  done
  echo DONE >> out/sp2.log
fi
