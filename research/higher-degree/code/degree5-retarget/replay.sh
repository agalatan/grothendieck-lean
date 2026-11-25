#!/bin/bash
# Replays the exact part and rebuilds the tables of the note from the committed result files; compares every output byte for byte
# with the committed one.  Python 3 standard library only; about 15 seconds on one core.  Nothing in this folder is written.
#   usage:  bash replay.sh          (from this folder)
# Not replayed here (N, floating point, run on a droplet; commands in README.md): ceiling/eps_profile.py, ceiling/law_rows.py and
# the allowance program behind theta/thetas.json.
set -u
H="$(cd "$(dirname "$0")" && pwd)"; T="$(mktemp -d)"; ok=1
chk() { if cmp -s "$1" "$2"; then echo "IDENTICAL  $3"; else echo "DIFFERENT  $3"; ok=0; fi; }
cd "$H"
python3 -I exact/retarget_exact.py "$T/exact.json" > "$T/exact.log";            chk "$T/exact.log" exact/retarget_exact.log "exact/retarget_exact.log (envelope, rooms, end ranges; exact)"
chk "$T/exact.json" exact/retarget_exact.json "exact/retarget_exact.json"
python3 -I exact/ridge_direct.py > "$T/ridge.log";                               chk "$T/ridge.log" exact/ridge_direct.log "exact/ridge_direct.log (the direct bound along the ridge of games; exact given the games)"
cp ceiling/eps_profile_K2.json ceiling/eps_profile_K3.json "$T/"; python3 -I ceiling/rescore.py "$T/eps_profile_K2.json" "$T/eps_profile_K3.json" > /dev/null
cmp -s "$T/eps_profile_K2.json" ceiling/eps_profile_K2.json && cmp -s "$T/eps_profile_K3.json" ceiling/eps_profile_K3.json && echo "IDENTICAL  ceiling/eps_profile_K*.json (re-scored on the final pool: no stored game is beaten by a pool row)" || { echo "DIFFERENT  ceiling/eps_profile_K*.json after rescore.py"; ok=0; }
python3 -I ladder.py ceiling/eps_profile_K2.json ceiling/eps_profile_K3.json > "$T/ladder.md"; chk "$T/ladder.md" LADDER.md "LADDER.md (rooms by game and target; the norms are N)"
python3 -I theta/collect_factors.py table > "$T/factors.md";                     chk "$T/factors.md" theta/FACTORS.md "theta/FACTORS.md (table from theta/thetas.json and theta/cells.json; N)"
python3 -I ceiling/law_table.py > "$T/law.md";                                   chk "$T/law.md" ceiling/LAW_ROWS.md "ceiling/LAW_ROWS.md (table from ceiling/law_rows_*.json; N)"
[ $ok = 1 ] && echo "ALL IDENTICAL" || { echo "SOME OUTPUT DIFFERS"; exit 1; }
