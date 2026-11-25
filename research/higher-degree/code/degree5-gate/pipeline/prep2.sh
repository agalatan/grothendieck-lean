#!/bin/bash
# after stage 1: merge the rows of gA, gB, make one gate folder per game, write the stage-2 command file
cd "$(dirname "$0")"; PY=$HOME/claude-b9ee-gate/venv/bin/python
TS=0.70,0.72,0.74,0.76,0.78,0.79,0.80,0.81,0.82,0.83,0.84,0.845,0.85,0.855,0.86,0.865,0.87,0.875,0.88,0.886
SEL=0.80,0.82,0.84,0.845,0.85,0.855
game() { case $1 in gA) echo "0.8493 0.2827 10000/14025";; gB) echo "0.82 0.194 10000/14025";; gC) echo "0.78 0.0779 500/701";; esac; }
mkgate() {  # NAME: gate folder with the rows of the game
  rm -rf gate_$1; cp -R gate gate_$1; rm -rf gate_$1/out gate_$1/regress
  $PY - <<P
import json
rows = sorted([json.loads(l) for l in open('thresholds/games/$1/rows_all.lines') if l.strip()], key=lambda r: r['t'])
assert len(rows) == 20, len(rows)
open('gate_$1/rows5.lines', 'w').write('\n'.join(json.dumps({k: r[k] for k in ('t', 'l', 'beta', 'bA', 'bB', 'sig', 'nu5', 'branch', 'row', 'plain', 'driver')}) for r in rows) + '\n')
P
}
if [ "$1" = "merge" ]; then
  for g in gA gB; do cat thresholds/games/$g/rows_lo.lines thresholds/games/$g/rows_hi.lines > thresholds/games/$g/rows_all.lines; mkgate $g; done
  mkdir -p margins law; : > s2.txt
  set -- $(game gC)
  echo "bash stage1.sh gC $1 $2 all $TS && cp thresholds/games/gC/rows_all.lines thresholds/games/gC/rows_all.lines.bak; cd thresholds && ALLOW_PY=$PY ALLOW_TS=$TS D5_TARGET=$3 $PY band5.py gC $1 $2 $SEL > games/gC/band5.out 2>&1" >> s2.txt
  for g in gA gB; do set -- $(game $g)
    echo "cd thresholds && ALLOW_PY=$PY ALLOW_TS=$TS D5_TARGET=$3 $PY band5.py $g $1 $2 $SEL > games/$g/band5.out 2>&1" >> s2.txt
    echo "cd gate_$g && D5_E1=$1 D5_ETA=$2 bash run_gate_all.sh $PY - '11 12 13 14 15 16 17 18 19 20' spike" >> s2.txt
    echo "cd gate_$g && D5_E1=$1 D5_ETA=$2 bash run_gate_all.sh $PY - '7 9 5 3 1 2 4 6 8 10' spike" >> s2.txt
  done
  for g in gA gB; do set -- $(game $g)
    echo "cd gate_$g && D5_E1=$1 D5_ETA=$2 bash run_gate_all.sh $PY - '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20'" >> s2.txt
    echo "LAW_NUS=0,0.005,0.01,0.015,0.02,0.025,0.03,0.04 bash rows/lawscan.sh $PY $1 $2 2287/2500 ../law/law_$g.lines 0 0.05 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5 0.55 0.6 0.65 0.7 > law/law_$g.out 2>&1" >> s2.txt
    for t in 0.82 0.85 0.80 0.84 0.86 0.87 0.76 0.88; do echo "OMP_NUM_THREADS=1 $PY design/margin_scan.py gate_$g/rows5.lines $t margins/${g}_t$t.json 0.4,0.15 $1 > margins/${g}_t$t.log 2>&1" >> s2.txt; done
  done
  set -- $(game gC)
  echo "bash rows/lawscan.sh $PY $1 $2 2287/2500 ../law/law_gC.lines 0 0.1 0.25 0.3 0.4 0.5 0.6 > law/law_gC.out 2>&1" >> s2.txt
  wc -l s2.txt
fi
