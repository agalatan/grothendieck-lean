#!/bin/bash
J=/root/claude-b9ee-r37/pkg/grothendieck-real-stein-radius-20261021/radius_certificates.json
for i in 0 1 2 3 4 5 6 7 8 9 10 11 12; do
  nice -n 19 /root/venv/bin/python -I /root/claude-b9ee-r37/mine/indep_arb.py $J $i || echo "ROW $i FAIL"
done
echo INDEP_DONE
