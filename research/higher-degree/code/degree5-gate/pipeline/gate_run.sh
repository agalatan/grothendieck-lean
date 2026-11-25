#!/bin/bash
# gate_run.sh G E1 ETA MODE k1,k2,...   (no quotes on the command line: xargs strips them)
cd $HOME/claude-b9ee-gate/pkg/gate_$1 && D5_E1=$2 D5_ETA=$3 bash run_gate_all.sh /home/agalatan/claude-b9ee-gate/venv/bin/python - "$(echo $5 | tr , " ")" $4
