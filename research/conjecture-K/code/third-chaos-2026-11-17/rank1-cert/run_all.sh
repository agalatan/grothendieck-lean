#!/bin/bash
# claude-b9ee research worker, 17 Nov 2026: replay every script of this folder and write its log.
# Usage: ./run_all.sh [python]   (needs python-flint 0.9.0 and mpmath 1.3.0; light, single core, about 40 s)
# On yo: ./run_all.sh /home/agalatan/claude-b9ee-capslemma/venv/bin/python3
P=${1:-python3}
cd "$(dirname "$0")"
"$P" -c 'import flint, mpmath, platform, sys; print("python", sys.version.split()[0], platform.platform(), "python-flint", flint.__version__, "mpmath", mpmath.__version__)' > env.log
status=0
for s in c01_H c02_D_grid c03_D_near1 c04_Psi n01_floats; do
    /usr/bin/time -p "$P" -I "$s.py" > "$s.log" 2> "$s.time" || status=1
    tail -1 "$s.log"
done
exit $status
