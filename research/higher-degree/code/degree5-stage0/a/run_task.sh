#!/bin/bash
# one task of stage 0 (a):  run_task.sh NAME E1 ETA T CLASS   -> out/NAME__CLASS__T.json (+ .err)
cd "$(dirname "$0")"; mkdir -p out
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1 RAYON_NUM_THREADS=1
tag=$(echo "$5" | tr ':/' '__'); f=out/$1__${tag}__$4
[ -s $f.json ] && exit 0
mkdir $f.lock 2>/dev/null || exit 0        # another queue is running this task
case "$5" in E*) export S0_P0FROM=out/$1__plain_KOUL3__$4.json S0_TOL=1e-5 S0_ROUNDS=8;; esac
../venv/bin/python rows0.py $2 $3 $4 $5 > $f.json 2> $f.err
