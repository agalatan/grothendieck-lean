#!/bin/bash
# Copy the small result files of the gate pipeline (a mirror of the droplet folder ~/claude-b9ee-gate/pkg) into results/ (issue #713).
# usage: collect.sh PKG        (PKG = the mirror, e.g. handoff/degree5-gate-2026-11-25/pkg)
set -e; P=$1; R="$(cd "$(dirname "$0")" && pwd)/results"; mkdir -p "$R"
cp1() { [ -s "$1" ] && mkdir -p "$(dirname "$2")" && cp "$1" "$2" || true; }
for g in gA gB gC; do
  cp1 "$P/thresholds/games/$g/rows_all.lines" "$R/$g/rows_all.lines"
  cp1 "$P/thresholds/games/$g/band5.json" "$R/$g/band5.json"
  cp1 "$P/thresholds/games/$g/band5.out" "$R/$g/band5.out"
  cp1 "$P/thresholds/games/$g/out/kappa.log" "$R/$g/kappa.log"
  for f in "$P"/margins/${g}_t*.json; do cp1 "$f" "$R/$g/margins/$(basename "$f")"; done
done
for g in gA gB gC gA1 gA2; do cp1 "$P/law/law_$g.lines" "$R/$g/law.lines"; cp1 "$P/law/lawhi_$g.lines" "$R/$g/lawhi.lines"; done
for g in gA gB; do
  cp1 "$P/s4_$g.json" "$R/$g/s4.json"
  for f in "$P"/thresholds/games/$g/out/r4_theta6_1_F*.json; do cp1 "$f" "$R/$g/theta6/$(basename "$f")"; done
done
# the per-row gate outputs (gate_*/out) stay in the handoff archive; gate.md has their tables
cp1 "$P/gate_summary.md" "$R/gate.md"   # made on yo by mkgate_summary.sh (collect_gate.py needs numpy)
du -sh "$R"
