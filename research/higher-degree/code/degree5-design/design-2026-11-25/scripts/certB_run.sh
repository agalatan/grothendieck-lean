#!/bin/bash
# task B: plain covers of the 26 rows with rho0 = 2287/2500, then the variant with the linear-in-s radius bound; cores 22-25
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1 RAYON_NUM_THREADS=1
PY=$HOME/claude-b9ee-degree5/venv/bin/python
for d in certB_const certB_lin; do
  cd $HOME/claude-b9ee-degree5/design/$d
  taskset -c 22-25 $PY -I sched2c.py rows2c.json 1 4 > out/sched.log 2>&1
  $PY -I assemble2c.py rows2c.json > out/assemble2c.log 2>&1
  taskset -c 22-25 $PY -I replay2c_all.py out/rows2c_final.json 4 --caps 0 > out/replay2c.log 2>&1
done
