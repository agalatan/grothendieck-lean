#!/bin/bash
# finer tilt grid for the rows 0.79 and 0.82, after the coarse scan
while kill -0 $(cat tilt.pid) 2>/dev/null; do sleep 10; done
cd /home/agalatan/claude-b9ee-degree5/design/margins
(OMP_NUM_THREADS=1 ../../venv/bin/python ../scripts/margin_tilt.py rows078.lines 0.79 tiltfine078_t0.79.json 0.78 0.3,0.4,0.5 0.1,0.15,0.2,0.25 > tiltfine078_t0.79.log 2>&1 &)
OMP_NUM_THREADS=1 ../../venv/bin/python ../scripts/margin_tilt.py rows078.lines 0.82 tiltfine078_t0.82.json 0.78 0.3,0.4,0.5 0.1,0.15,0.2,0.25 > tiltfine078_t0.82.log 2>&1
