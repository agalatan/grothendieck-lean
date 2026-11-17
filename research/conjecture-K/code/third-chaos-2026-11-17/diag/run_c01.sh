#!/bin/bash
# claude-b9ee: psi grid, k = 200 .. 40000 (u = 0.2 .. 40), four processes pinned to cores 0-3; contour cross-check every 10th point.
cd ~/claude-b9ee-diagsum
P=./venv/bin/python
taskset -c 0 $P -I c01_psi_grid.py 200 10200 grid_a.txt real &
taskset -c 1 $P -I c01_psi_grid.py 10200 20200 grid_b.txt real &
taskset -c 2 $P -I c01_psi_grid.py 20200 30200 grid_c.txt real &
taskset -c 3 $P -I c01_psi_grid.py 30200 40001 grid_d.txt real &
wait
taskset -c 0 $P -I c01_psi_grid.py 200 20200 xgrid_a.txt contour 10 &
taskset -c 1 $P -I c01_psi_grid.py 20200 40001 xgrid_b.txt contour 10 &
wait
cat grid_a.txt grid_b.txt grid_c.txt grid_d.txt > psi_grid.txt
cat xgrid_a.txt xgrid_b.txt > psi_grid_contour.txt
wc -l psi_grid.txt psi_grid_contour.txt
