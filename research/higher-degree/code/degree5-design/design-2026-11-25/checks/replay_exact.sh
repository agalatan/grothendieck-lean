#!/bin/bash
# Replays the exact (rational-arithmetic) parts of the design from the committed row constants and compares every output, byte for
# byte, with the committed one.  Python standard library only; a few seconds on one core.  Nothing in this folder is written:
# the scripts run on copies in a temporary directory.
#   usage:  bash checks/replay_exact.sh          (from design-2026-11-25/)
# codex-a7c4's replay for piece 7 (checks/codex_a7c4_piece7_replay.py) reads a commit with git: run it from the repository root.
# Not replayed here: the law-layer covers behind the row constants (pipeline/replay2c_all.py; the cover files and node caps are
# outside the repository, see INVENTORY.md), and every floating-point search.
set -u
H="$(cd "$(dirname "$0")/.." && pwd)"; T="$(mktemp -d)"; ok=1
chk() { if cmp -s "$1" "$2"; then echo "IDENTICAL  $3"; else echo "DIFFERENT  $3"; ok=0; fi; }
cd "$H"
python3 -I scripts/direct_bound_exact.py > "$T/direct.log";                         chk "$T/direct.log" direct_bound_exact.log "direct_bound_exact.log"
for c in certB_const certB_lin; do
  cp -R "$c" "$T/$c"; cp pipeline/assemble2c.py pipeline/envelope.py pipeline/gamecfg.py "$T/$c/"
  (cd "$T/$c" && python3 -I assemble2c.py rows2c.json > "$T/asm_$c.log" 2>&1);      chk "$T/asm_$c.log" "$c/out/assemble2c.log" "$c/out/assemble2c.log"
  chk "$T/$c/out/rows2c_final.json" "$c/out/rows2c_final.json" "$c/out/rows2c_final.json"
  python3 -I scripts/envelope_design.py "$T/$c" > "$T/env_$c.log";                  chk "$T/env_$c.log" "$c/out/envelope_design.log" "$c/out/envelope_design.log"
  chk "$T/$c/out/envelope_design.json" "$c/out/envelope_design.json" "$c/out/envelope_design.json"
done
python3 -I scripts/envelope_design.py "$T/certB_const" tables/fin_table.design.json > "$T/env_fin.log"
chk "$T/env_fin.log" certB_const/out/envelope_design_fin.log "certB_const/out/envelope_design_fin.log (the 21 pieces of D*)"
chk "$T/certB_const/out/envelope_design_fin_table.json" certB_const/out/envelope_design_fin_table.json "certB_const/out/envelope_design_fin_table.json"
python3 -I scripts/assembly_constants.py tables/fin_table.json certB_const/out/envelope_design_fin_table.json tables/g078 > "$T/ac.md"
chk "$T/ac.md" ASSEMBLY_CONSTANTS.md "ASSEMBLY_CONSTANTS.md"
python3 -I scripts/margins_table.py margins > "$T/margins.md";                      chk "$T/margins.md" margins/MARGINS_TABLE.md "margins/MARGINS_TABLE.md (table from the stored scans; the scans are N)"
python3 -I checks/theta_table.py > "$T/theta.md";                                   chk "$T/theta.md" tables/THETA_TABLE.md "tables/THETA_TABLE.md (table from fin_table.json; the allowances are N)"
python3 -I checks/rows_table.py > "$T/rowst.md";                                    chk "$T/rowst.md" tables/ROWS_TABLE.md "tables/ROWS_TABLE.md (the float rows of the design beside the rational rows)"
python3 -I checks/zero_content_budget.py "$T/zcb.json" > "$T/zcb.log";            chk "$T/zcb.log" checks/zero_content_budget.log "checks/zero_content_budget.log (the zero-content pairs on every piece; exact)"
chk "$T/zcb.json" tables/zero_content_budget.json "tables/zero_content_budget.json"
python3 -I checks/repairs_summary.py > "$T/rep.md";                                chk "$T/rep.md" tables/REPAIRS.md "tables/REPAIRS.md (summary of the stored outputs of the two repairs; N)"
python3 -I checks/theta_table.py tables/funded/fin_table_fundFull.json > "$T/thf.md"; chk "$T/thf.md" tables/funded/THETA_TABLE_fundFull.md "tables/funded/THETA_TABLE_fundFull.md"
python3 -I checks/rows_compare.py > "$T/rows.log";                                  chk "$T/rows.log" checks/rows_compare.log "checks/rows_compare.log"
[ $ok = 1 ] && echo "ALL IDENTICAL" || { echo "SOME OUTPUT DIFFERS"; exit 1; }
