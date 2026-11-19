#!/bin/bash
# batch 6: eps*Q + sqrt(1-eps^2) F_N mixtures with finite CLT sums (N = 30)
cd ~/claude-b9ee-omega3
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
PY=/home/agalatan/claude-b9ee-capslemma/venv/bin/python3
cores=(${1//,/ }); nc=${#cores[@]}
cases=("Mh3_03 mix:0.3:h3:30" "Mh3_05 mix:0.5:h3:30" "Mh3_07 mix:0.7:h3:30" "Mh3_09 mix:0.9:h3:30" "MxHe_05 mix:0.5:x1He2x2:30" "MxHe_08 mix:0.8:x1He2x2:30" "Mxyz_05 mix:0.5:x1x2x3:30" "Mxyz_08 mix:0.8:x1x2x3:30")
i=0
for c in "${cases[@]}"; do
  set -- $c
  core=${cores[$((i % nc))]}
  taskset -c $core $PY run_case.py $1 $2 40000 64 20 $((600+i)) >> batch6.out 2>> batch6.err &
  i=$((i+1))
  if [ $((i % nc)) -eq 0 ]; then wait; fi
done
wait
echo done >> batch6.out
