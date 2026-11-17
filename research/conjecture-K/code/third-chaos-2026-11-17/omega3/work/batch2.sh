#!/bin/bash
# batch 2: diagonal sums sum lam_i h3(X_i), unequal weights, n = 2..6 (normalised in run_case.py)
cd ~/claude-b9ee-omega3
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
PY=/home/agalatan/claude-b9ee-capslemma/venv/bin/python3
run() { taskset -c $1 $PY run_case.py $2 $3 $4 $5 $6 $7 >> batch2.out 2>> batch2.err; }
cases=(
"D2a diag:1,0.15" "D2b diag:1,0.3" "D2c diag:1,0.5" "D2d diag:1,0.7" "D2e diag:1,0.85"
"D3a diag:1,0.7,0.4" "D3b diag:1,0.5,0.5" "D3c diag:1,1,0.3" "D3d diag:1,0.3,0.3"
"D4a diag:1,0.8,0.6,0.4" "D4b diag:1,1,1,0.3" "D4c diag:1,0.3,0.3,0.3"
"D5a diag:1,0.8,0.64,0.512,0.41" "D5b diag:1,0.5,0.5,0.5,0.5"
"D6a diag:1,0.8,0.64,0.512,0.41,0.328" "D6b diag:1,0.9,0.4,0.35,0.2,0.1" "D6c diag:1,0.4,0.4,0.4,0.4,0.4"
)
i=0
for c in "${cases[@]}"; do
  set -- $c
  cs=(0 1 3 4); core=${cs[$((i % 4))]}
  run $core $1 $2 40000 64 20 $((200+i)) &
  i=$((i+1))
  if [ $((i % 4)) -eq 0 ]; then wait; fi
done
wait
echo done >> batch2.out
