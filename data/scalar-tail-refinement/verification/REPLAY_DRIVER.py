#!/usr/bin/env python3
"""Bounded replay of the pinned public non-regeneration certificate stages."""
import argparse
from datetime import datetime,timezone
import hashlib,json,os
from pathlib import Path
import subprocess,sys,time


def sha(path):return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--root',type=Path,required=True)
    p.add_argument('--manifest',type=Path,required=True);p.add_argument('--out',type=Path,required=True)
    p.add_argument('--logs',type=Path,required=True);p.add_argument('--resume',type=Path)
    args=p.parse_args();root=args.root.resolve();manifest=json.loads(args.manifest.read_text())
    for entry in manifest['files']:
        path=(root/entry['path']).resolve()
        if not path.is_relative_to(root) or sha(path)!=entry['sha256']:
            raise ValueError('upstream source pin mismatch: '+entry['path'])
    import flint,numpy
    result=dict(status='PINNED_UPSTREAM_NONREGENERATION_REPLAY',complete=False,
        utc_started=datetime.now(timezone.utc).isoformat(),commit=manifest['commit'],
        source_sha256=sha(__file__),manifest_sha256=sha(args.manifest),
        versions=dict(python=sys.version,flint=flint.__version__,numpy=numpy.__version__),
        coefficient_tables_regenerated=False,stages=[])
    previous={}
    if args.resume:
        prior=json.loads(args.resume.read_text())
        if prior['manifest_sha256']!=result['manifest_sha256']:raise ValueError('resume manifest differs')
        previous={row['script']:row for row in prior['stages'] if row.get('returncode')==0}
    args.logs.mkdir(parents=True,exist_ok=True)
    def save():args.out.write_text(json.dumps(result,indent=2)+'\n')
    stages=['support_compression_certificate/complex_upper_convex_2e6_polynomial_certificate.py',
            'support_compression_certificate/complex_upper_saha_visible_energy_refinement.py',
            'audit_sparse6_altgroups.py','audit_best7_final_arithmetic.py']
    for relative in stages:
        if relative in previous:
            row=previous[relative];log=Path(row['log'])
            if log.exists() and sha(log)==row['log_sha256']:
                result['stages'].append(dict(row,resumed=True));save();continue
        script=root/relative;log=args.logs/(script.stem+'.log');start=time.monotonic()
        row=dict(script=relative,source_sha256=sha(script),log=str(log.resolve()))
        try:
            with log.open('w') as output:
                run=subprocess.run([sys.executable,str(script)],cwd=script.parent,
                    stdout=output,stderr=subprocess.STDOUT,timeout=115,check=False,
                    env=os.environ|dict(OPENBLAS_NUM_THREADS='1',OMP_NUM_THREADS='1',MKL_NUM_THREADS='1'))
            row['returncode']=run.returncode
        except subprocess.TimeoutExpired:row.update(returncode=124,timeout_seconds=115)
        row.update(seconds=time.monotonic()-start,log_sha256=sha(log))
        result['stages'].append(row);save();print(json.dumps(row),flush=True)
        if row['returncode']!=0:return 1
    result['complete']=True;save();print('ALL PINNED NON-REGENERATION STAGES PASS',flush=True)
    return 0


if __name__=='__main__':raise SystemExit(main())
