#!/bin/bash
# batch 3: perturbations of h3 (2 and 3 variables), CRN with h3 as control variate; cores 5 and 7.
cd ~/claude-b9ee-omega3
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
PY=/home/agalatan/claude-b9ee-capslemma/venv/bin/python3
list=$(cat tensor_list.txt)
i=0
for nm in $list; do
  core=$([ $((i % 2)) -eq 0 ] && echo 5 || echo 7)
  taskset -c $core $PY run_pair.py $nm $nm.npy 40000 64 20 $((300+i)) >> batch3.out 2>> batch3.err &
  i=$((i+1))
  if [ $((i % 2)) -eq 0 ]; then wait; fi
done
wait
echo done >> batch3.out
