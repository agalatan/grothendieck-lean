#!/bin/bash
# batch 1: F_N = N^(-1/2) sum h3(X_i); cores 0-5 of yo, one case per core, 6 at a time.
cd ~/claude-b9ee-omega3
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
PY=/home/agalatan/claude-b9ee-capslemma/venv/bin/python3
run() { taskset -c $1 $PY run_case.py $2 $3 $4 $5 $6 $7 >> batch1.out 2>> batch1.err; }
run 0 F2  FN:2   60000 64 20 101 &
run 1 F3  FN:3   60000 64 20 102 &
run 2 F4  FN:4   60000 64 20 103 &
run 3 F6  FN:6   60000 64 20 104 &
run 4 F10 FN:10  60000 64 20 105 &
run 5 F20 FN:20  60000 64 20 106 &
wait
run 0 F50  FN:50  60000 64 20 107 &
run 1 F100 FN:100 60000 64 20 108 &
run 2 F300 FN:300 30000 64 20 109 &
run 3 F10b FN:10  60000 64 28 110 &
run 4 F4b  FN:4   60000 256 20 111 &
wait
echo done >> batch1.out
