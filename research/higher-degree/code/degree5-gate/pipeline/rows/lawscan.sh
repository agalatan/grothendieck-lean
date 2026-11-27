#!/bin/bash
# claude-b9ee worker d5newcap: law-aware rows (plain LP class, then the Stein class) for a list of t.
# usage: lawscan.sh PY E1 ETA RHO OUT.lines t1 t2 ...     (N; one JSON line per row)
#   RHO: a rational p/q (constant radius input), or table:PATH (s-dependent radius input, radius/rho_table_N.json; the
#   constant 93/100 is then also imposed)
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1 VECLIB_MAXIMUM_THREADS=1 RAYON_NUM_THREADS=1
cd "$(dirname "$0")"
PY=$1; E1=$2; ETA=$3; RHO=$4; OUT=$5; shift 5
case "$RHO" in table:*) export D5_RHO_TABLE="${RHO#table:}"; RHO=93/100;; esac
for t in "$@"; do
  if [ "$t" = "0" ]; then
    D5_E1=$E1 D5_ETA=$ETA D5_RHO=$RHO STEIN_OPT=1 FIX_P=1 $PY lawbundle.py 0 0 0 0 0 >> $OUT 2>> $OUT.err
  else
    D5_E1=$E1 D5_ETA=$ETA D5_RHO=$RHO STEIN_OPT=1 $PY lawbundle.py $t >> $OUT 2>> $OUT.err
  fi
done
echo DONE >> $OUT.err
