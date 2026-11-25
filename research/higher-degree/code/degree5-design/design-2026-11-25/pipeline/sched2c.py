# Stage 2c scheduler (claude-b9ee worker d5newcap, 16 Nov 2026): runs run_row2c.py for every row of ROWS.json, at most
# JOBS rows at a time with PROCS processes each (JOBS * PROCS = the core budget), Stein rows first (they are the long
# ones).  One log per row in out/logs/.  Rows whose record files exist are skipped, so the script can be re-run.
#   python3 -I sched2c.py ROWS.json JOBS PROCS [--only TAG,TAG] [--stein-procs N]
import sys, os, json, subprocess, time
HERE = os.path.dirname(os.path.abspath(__file__)); OUT = os.path.join(HERE, 'out'); LOGS = os.path.join(OUT, 'logs'); os.makedirs(LOGS, exist_ok=True)
spec = json.load(open(sys.argv[1])); jobs = int(sys.argv[2]); procs = int(sys.argv[3])
only = sys.argv[sys.argv.index('--only') + 1].split(',') if '--only' in sys.argv else None
sprocs = int(sys.argv[sys.argv.index('--stein-procs') + 1]) if '--stein-procs' in sys.argv else procs
rows = [r for r in spec['rows'] if (only is None or r['tag'] in only)]
def done(r):
    f = 'recS_%s.json' if r['kind'] == 'stein' else 'rec_%s.json'
    return os.path.exists(os.path.join(OUT, f % r['tag']))
queue = sorted([r for r in rows if not done(r)], key=lambda r: (r['kind'] != 'stein', r['t']))
budget = jobs * procs; used = 0; running = []; t0 = time.time(); failed = []
env = dict(os.environ, OMP_NUM_THREADS='1', OPENBLAS_NUM_THREADS='1', MKL_NUM_THREADS='1', RAYON_NUM_THREADS='1')
print('rows to run: %s' % ', '.join(r['tag'] for r in queue), flush=True)
while queue or running:
    for pr, r, n in list(running):
        if pr.poll() is not None:
            running.remove((pr, r, n)); used -= n
            ok = pr.returncode == 0 and done(r)
            if not ok: failed.append(r['tag'])
            print('[%6.0fs] row %s %s (exit %d); running %d, queued %d' % (time.time() - t0, r['tag'], 'done' if ok else 'FAILED', pr.returncode, len(running), len(queue)), flush=True)
    while queue:
        n = sprocs if queue[0]['kind'] == 'stein' else procs
        if used + n > budget and running: break
        r = queue.pop(0)
        log = open(os.path.join(LOGS, 'row_%s.log' % r['tag']), 'a')
        pr = subprocess.Popen([sys.executable, '-I', os.path.join(HERE, 'run_row2c.py'), sys.argv[1], r['tag'], str(n)], stdout=log, stderr=subprocess.STDOUT, env=env)
        running.append((pr, r, n)); used += n
        print('[%6.0fs] row %s started (%s, %d processes)' % (time.time() - t0, r['tag'], r['kind'], n), flush=True)
    time.sleep(5)
print('ALL ROWS DONE' if not failed else 'FAILED ROWS: %s' % ', '.join(failed), '(%.0fs)' % (time.time() - t0), flush=True)
sys.exit(1 if failed else 0)
