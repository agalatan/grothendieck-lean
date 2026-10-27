#!/usr/bin/env python3
"""Replay archived q0 interval aggregation; not a Lean proof of the inputs."""
if not __debug__:
    raise SystemExit('optimized Python is unsupported: checks must remain enabled')
from pathlib import Path
import hashlib,json,sys,tempfile,subprocess

root=Path(__file__).resolve().parents[2]
data=(root/'data/q0_cert/receipts.json').read_bytes()
assert hashlib.sha256(data).hexdigest()=='1a6a0c7b9e7cf6745cea7ee5173ea0da8377b345a12e95d81512950f5b493903'
archive=json.loads(data)
assert archive['schema']==1 and archive['run']==40560868692
assert archive['source_commit']=='d00f9dab53ea553dac22636fb16387f8f87d4bef'
rows=archive['receipts']
assert len(rows)==456 and [r['first'] for r in rows]==list(range(-220,236))
verification=root/'data/q0_cert/verification'
summary=json.loads((verification/'summary.json').read_text())
assert summary['status']==0 and summary['kind']=='script'
assert summary['shard']==0 and summary['nshards']==1
assert summary['sha']==archive['source_commit']
assert summary['run']=='https://github.com/agalatan/grothendieck-lean/actions/runs/40560868692'
checkpoint=json.loads((verification/'checkpoint.json').read_text())
assert checkpoint['status']=='all_receipts_aggregated'
assert checkpoint['finished_count']==456 and checkpoint['failed_count']==0
assert checkpoint['finished_indices']==list(range(-220,236)) and checkpoint['failure'] is None
with tempfile.TemporaryDirectory(prefix='grothe-q0-replay-') as tmp:
 folder=Path(tmp)
 for row in rows:
  (folder/f"q0-m{row['first']}.json").write_text(json.dumps(row)+'\n')
 result=subprocess.run([sys.executable,str(root/'tools/q0_cert/softened_q0_aggregate.py'),str(folder)],
                       text=True,capture_output=True,check=True)
 expected=(verification/'aggregate.txt').read_text().strip()
 assert result.stdout.strip()==expected
 print(result.stdout,end='')
 print('PASS: archived hosted result reproduced by exact rational aggregation.')
 print('The 456 Arb intervals and written analytic premises are not kernel-checked Lean proofs.')
