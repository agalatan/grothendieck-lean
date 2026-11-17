#!/bin/bash
# batch 5: multilinear cubics (sparse engine); cores given as $1 (comma list), runs sequentially per core slot
cd ~/claude-b9ee-omega3
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
PY=/home/agalatan/claude-b9ee-capslemma/venv/bin/python3
cores=(${1//,/ })
cases=(
"X1X2X3 e3:3" "e3_4 e3:4" "e3_5 e3:5" "e3_6 e3:6" "e3_7 e3:7" "e3_8 e3:8" "e3_10 e3:10"
"Fano fano:+++++++" "FanoS fano:++++++-"
"mlG6a mlG:6:1" "mlG6b mlG:6:2" "mlS6a mlS:6:3" "mlG8a mlG:8:4" "mlS8a mlS:8:5" "mlG10a mlG:10:6" "mlS10a mlS:10:7" "mlG10b mlG:10:8"
)
nc=${#cores[@]}
i=0
for c in "${cases[@]}"; do
  set -- $c
  core=${cores[$((i % nc))]}
  taskset -c $core $PY run_case.py $1 $2 20000 64 20 $((500+i)) >> batch5.out 2>> batch5.err &
  i=$((i+1))
  if [ $((i % nc)) -eq 0 ]; then wait; fi
done
wait
echo done >> batch5.out
