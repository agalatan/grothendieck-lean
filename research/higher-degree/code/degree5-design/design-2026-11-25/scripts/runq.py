#!/usr/bin/env python3
"""Run the command lines of a file on a fixed set of cores, one process per core (taskset).  usage: runq.py LO-HI CMDFILE LOGDIR
(after thresholds/scope_run.py of the NEWCAP folder)."""
import sys, os, subprocess, time
a, b = sys.argv[1].split('-'); cores = list(range(int(a), int(b) + 1)); sf = sys.argv[2]; logdir = sys.argv[3]; os.makedirs(logdir, exist_ok=True)
cmds = [l.strip() for l in open(sf) if l.strip() and not l.startswith('#')]; free = list(cores); running = {}; i = 0; t0 = time.time()
while i < len(cmds) or running:
    while free and i < len(cmds):
        c = free.pop(0); log = open(os.path.join(logdir, '%s_%d.log' % (os.path.basename(sf), i)), 'w')
        p = subprocess.Popen(['taskset', '-c', str(c), 'bash', '-c', cmds[i]], stdout=log, stderr=subprocess.STDOUT); running[p.pid] = (p, c, i, log); i += 1
    time.sleep(2)
    for pid in list(running):
        p, c, n, log = running[pid]
        if p.poll() is not None:
            log.close(); free.append(c); del running[pid]; print('[%5.0fs] job %d done (exit %d) on core %d: %s' % (time.time() - t0, n, p.returncode, c, cmds[n][:150]), flush=True)
print('ALL DONE (%.0fs)' % (time.time() - t0), flush=True)
