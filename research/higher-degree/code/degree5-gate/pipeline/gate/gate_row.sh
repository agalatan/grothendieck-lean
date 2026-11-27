#!/bin/bash
# claude-b9ee worker d5newcap: the cheap per-row gate integrals for row K of rows5.lines (hab, h11c, lawlp_odd, lp_rows).
# usage: D5_E1=.. D5_ETA=.. gate_row.sh PY K [abfin]
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
cd "$(dirname "$0")"; PY=$1; K=$2; mkdir -p out
REC=$(sed -n "${K}p" rows5.lines)
$PY hab.py "$REC" > out/hab_$K.json
$PY h11c.py "$REC" > out/h11c_$K.json
$PY lawlp_odd.py "$REC" out/h11c_$K.json > out/lawodd_$K.json
$PY lp_rows.py $K out/lp_$K.json > out/lp_$K.log
if [ "${3:-}" = "abfin" ]; then $PY abfin.py "$REC" > out/abfin_$K.json; fi
echo "row $K done"
