#!/bin/bash
# Stage 0 (b): all games in parallel (7 processes at most per game).
cd "$(dirname "$0")"
bash b_game.sh gC 0.78 0.0779 500/701 &
bash b_game.sh gA 0.8493 0.2827 10000/14025 &
bash b_game.sh gA1 0.84896 0.2818 10000/14025 &
bash b_game.sh gA2 0.848 0.2795 10000/14025 &
bash b_game.sh g84 0.84 0.2552 10000/14025 &
bash b_game.sh g83 0.83 0.2241 10000/14025 &
wait; echo ALLDONE >> logs/done.log
