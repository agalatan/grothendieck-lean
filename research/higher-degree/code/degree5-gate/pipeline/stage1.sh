#!/bin/bash
# rows of one game on a list of t (one process): stage1.sh NAME E1 ETA TAG tlist
cd "$(dirname "$0")"; mkdir -p thresholds/games/$1/out
D5_E1=$2 D5_ETA=$3 OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 ../venv/bin/python rows/rowscan.py thresholds/games/$1/rows_$4.lines $5 > thresholds/games/$1/out/rows_$4.log 2>&1
