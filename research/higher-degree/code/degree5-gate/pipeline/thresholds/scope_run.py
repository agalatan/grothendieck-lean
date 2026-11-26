#!/usr/bin/env python3
"""Run stages of command lines on a fixed set of cores, one process per core (taskset), each stage after the previous one.
claude-b9ee worker d5newcap, 17 Nov 2026.   usage: scope_run.py CORES(e.g. 24-31) STAGEFILE [STAGEFILE ...]
A stage file holds one command per line (run with bash -c in this folder); output goes to LOGDIR/<stage>_<n>.log."""
import sys, os, subprocess, time
here = os.path.dirname(os.path.abspath(__file__)); a, b = sys.argv[1].split('-'); cores = list(range(int(a), int(b) + 1))
logdir = os.environ.get('LOGDIR', os.path.join(here, 'games', 'scope_logs')); os.makedirs(logdir, exist_ok=True)
for sf in sys.argv[2:]:
    cmds = [l.strip() for l in open(sf) if l.strip() and not l.startswith('#')]; free = list(cores); running = {}; i = 0; t0 = time.time()
    while i < len(cmds) or running:
        while free and i < len(cmds):
            c = free.pop(0); log = open(os.path.join(logdir, '%s_%d.log' % (os.path.basename(sf), i)), 'w')
            p = subprocess.Popen(['taskset', '-c', str(c), 'bash', '-c', cmds[i]], cwd=here, stdout=log, stderr=subprocess.STDOUT); running[p.pid] = (p, c, i, log); i += 1
        time.sleep(2)
        for pid in list(running):
            p, c, n, log = running[pid]
            if p.poll() is not None:
                log.close(); free.append(c); del running[pid]; print('[%5.0fs] %s job %d done (exit %d) on core %d' % (time.time() - t0, os.path.basename(sf), n, p.returncode, c), flush=True)
    print('STAGE %s DONE (%.0fs)' % (os.path.basename(sf), time.time() - t0), flush=True)
