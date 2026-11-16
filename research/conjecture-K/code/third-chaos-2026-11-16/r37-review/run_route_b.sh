#!/bin/bash
J=/root/claude-b9ee-r37/pkg/grothendieck-real-stein-radius-20261021/radius_certificates.json
for i in 0 1 2 3 4 5 6 7 8 9 10 11 12; do
  nice -n 19 /root/venv/bin/python -I /root/claude-b9ee-r37/mine/route_b.py $J $i 400 40 800 60 || echo "ROW $i ERROR"
done
echo ROUTEB_DONE
