#!/bin/bash
# Concatenates the outputs of the scripts of this folder into RESULTS.txt (no number is typed by hand; each block names its source file).
# usage: bash scripts/collect_results.sh      (from the design folder)
D="$(cd "$(dirname "$0")/.." && pwd)"; cd "$D"; O=RESULTS.txt
blk() { echo; echo "################################################################################"; echo "# $1"; echo "# source: $2"; echo "################################################################################"; }
{
echo "Degree-5 design worker of claude-b9ee, 25 November 2026: script outputs (labels: exact / C / N as stated per block)."
blk "A. Exact assembly of the stored certificate of ledger 4.17 (exact)" "A_reproduce/assemble2b_rerun.log (last table)"
sed -n '/### final: Stein family/,$p' A_reproduce/assemble2b_rerun.log
blk "A. Full replay of ledger 4.17: every node cap recomputed, every cover box re-verified (C)" "A_reproduce/replay2b_rerun.log"
grep -c "PASS" A_reproduce/replay2b_rerun.log | sed 's/^/lines with PASS: /'; grep "^row" A_reproduce/replay2b_rerun.log | cut -c1-170; grep "^envelope\|ALL PASS\|small-t bound" A_reproduce/replay2b_rerun.log
blk "B. Direct bound of ledger 4.18 (a) and the t = 0 cap on lambda_1, per radius and target (exact)" "direct_bound_exact.log"
cat direct_bound_exact.log
blk "B. Law layer with rho0 = 2287/2500: exact envelope and rooms (C; plain covers, no Stein family)" "certB_const/out/assemble2c.log, certB_const/out/envelope_design.log"
cat certB_const/out/assemble2c.log; cat certB_const/out/envelope_design.log
blk "B. Replay of the covers with rho0 = 2287/2500 (C; node caps not recomputed here: they are those of block A)" "certB_const/out/replay2c.log"
tail -n 4 certB_const/out/replay2c.log
if [ -f certB_lin/out/assemble2c.log ]; then
blk "B (variant). Law layer with rho0 = 2287/2500 and E|q| <= (sqrt(pi)/2)(1 + (26449/5000000) s)||q||_2 (C; boxes re-verified by replay2c_all.py, node caps those of block A)" "certB_lin/out/assemble2c.log, certB_lin/out/envelope_design.log, certB_lin/out/replay2c.log"
cat certB_lin/out/assemble2c.log; cat certB_lin/out/envelope_design.log 2>/dev/null; tail -n 4 certB_lin/out/replay2c.log
fi
blk "B. Float law-class direct bounds V <= (1 - eta') t^2 + N(eta') with rho0 = 2287/2500, without and with the linear-in-s bound (N)" "smallt/nscan_*.log"
grep -H "^eta" smallt/nscan_*.log
blk "C. A/B secant margins by row and tilt (N; mu_glob is an upper bound of the infimum)" "margins/MARGINS_TABLE.md"
cat margins/MARGINS_TABLE.md
for f in table_g078 table_g078pub table_g078lap table_g077; do
blk "C. Allowances under the three margin models, the record's tilt (2/5, 3/10) (N): $f" "work/$f.md"
cat work/$f.md
done
blk "D. Candidates and the chosen design D*: tilt (2/5, 3/20), constant margin = second-order value (N; rooms exact)" "work/fin_table.md"
cat work/fin_table.md
blk "D. Exact rooms of D* at the targets 1/1.402, 1/1.40195, 1/1.4021 (exact given the certified row constants)" "certB_const/out/envelope_design_fin.log"
sed -n '/^design/,$p' certB_const/out/envelope_design_fin.log
blk "D. Constants of D* in the notation of ASSEMBLY.md" "ASSEMBLY_CONSTANTS.md"
cat ASSEMBLY_CONSTANTS.md
[ -f work/finT_table.md ] && { blk "D. Three low pieces at the tilt (3/10, 1/10) (N)" "work/finT_table.md"; cat work/finT_table.md; }
[ -f work/half_table.txt ] && { blk "D. Sensitivity to the room: allowance with the whole room and with half of it (N)" "work/half_table.txt"; cat work/half_table.txt; }
[ -f work/g078b_table.txt ] && { blk "D. Present game, three narrow pieces of the record at the tilt (2/5, 3/20) (N)" "work/g078b_table.txt"; cat work/g078b_table.txt; }
[ -f work/g077b_table.txt ] && { blk "D. Game (1, -0.77, 0.05), three covers at the tilt (2/5, 3/20) (N; not certified)" "work/g077b_table.txt"; cat work/g077b_table.txt; }
} > $O
wc -l $O
