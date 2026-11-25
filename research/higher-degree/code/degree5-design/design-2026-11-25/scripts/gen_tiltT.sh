#!/bin/bash
# three low pieces at the tilt (3/10, 1/10), for comparison with the tilt (2/5, 3/20)
cd $HOME/claude-b9ee-degree5/design
export D5_E1=0.78 D5_ETA=0.0779 TILT=0.3,0.1 MODELS=glob CS=4 GAME_LINK=g078design
ONLY_ROWS="0.6490:0.76,0.6900:0.78,0.7100:0.79" ROOMMIN=2e-4 ../venv/bin/python scripts/design_final.py $PWD/work/g078 certB_const margins m078c work/finT 500/701 "649/1000,67/100,69/100,71/100,73/100" c0.60,c0.70,c0.78,c0.85 finT
