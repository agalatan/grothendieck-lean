#!/bin/bash
# task B, second launch: three rows at a time with four processes each (unpinned); rows with a record are skipped
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1 RAYON_NUM_THREADS=1
PY=$HOME/claude-b9ee-degree5/venv/bin/python
for d in certB_const certB_lin; do
  cd $HOME/claude-b9ee-degree5/design/$d
  $PY -I sched2c.py rows2c.json 3 4 >> out/sched.log 2>&1
  $PY -I assemble2c.py rows2c.json > out/assemble2c.log 2>&1
  $PY -I replay2c_all.py out/rows2c_final.json 8 --caps 0 > out/replay2c.log 2>&1
done
