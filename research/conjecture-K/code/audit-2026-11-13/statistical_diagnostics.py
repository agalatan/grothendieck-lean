#!/usr/bin/env python3
"""Small saved-data integrity, bias and structural checks. Agent-ID: codex-a713.

No new samples or optimization. Jackknife diagnostics do not make confidence
intervals rigorous or account for undiscovered maxima.
"""
import sys, os
sys.dont_write_bytecode = True
for key in ('VECLIB_MAXIMUM_THREADS','OPENBLAS_NUM_THREADS','OMP_NUM_THREADS'):
    os.environ[key] = '1'
from pathlib import Path
ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT))
import json, hashlib
import numpy as np
from moments import rotate_to_driver


def records(path):
    return [json.loads(line) for line in path.read_text().splitlines()]


def main():
    cells = []
    validation_checks = []
    for n in range(2, 7):
        validation_path = ROOT/f'validation_peak_n{n}_polar_p19_r8_summary.json'
        if validation_path.exists():
            for s in json.loads(validation_path.read_text()):
                if not s['complete']:
                    continue
                with np.load(s['tensor']) as a:
                    c = a['coefficients'].astype(complex)
                    energy_error = float(np.vdot(c,c).real)-s['u']
                assert hashlib.sha256(c.tobytes()).hexdigest() == s['digest']
                assert abs(energy_error) < 1e-13
                assert s['replicates']==8 and s['total_points']==2**22
                assert s['D'] > 0 and np.isfinite(s['R'])
                validation_checks.append(dict(n=n,u=s['u'],tensor=s['tensor'],
                    digest=s['digest'],energy_error=energy_error,hash_verified=True))
        source = ROOT/f'holdout_cv_peak_n{n}_summary.json'
        if not source.exists():
            continue
        replicates = records(ROOT/f'holdout_cv_peak_n{n}.jsonl')
        for s in json.loads(source.read_text()):
            if not s['complete']:
                continue
            rr = [r for r in replicates if r['tensor']==s['tensor']
                  and r['digest']==s['digest'] and r['seed_family']==s['seed_family']
                  and 2**r['power']==s['points_per_replicate']]
            rr = list({r['replicate']:r for r in rr}.values())
            assert len(rr) == 8
            C = np.array([np.array(r['C_real'])+1j*np.array(r['C_imag']) for r in rr])
            D = np.array([r['D'] for r in rr])
            b = len(rr); cm = C.mean(axis=0); dm = D.mean()
            ratio = np.vdot(cm, cm).real/dm
            leave_c = (C.sum(axis=0)-C)/(b-1)
            leave_d = (D.sum()-D)/(b-1)
            leave_r = (abs(leave_c)**2).sum(axis=1)/leave_d
            bias = (b-1)*(leave_r.mean()-ratio)
            numerator_bias = (abs(C-cm)**2).sum()/((b-1)*b)
            with np.load(s['tensor']) as a:
                c = a['coefficients'].astype(complex)
                energy = float(np.vdot(c,c).real)
            assert hashlib.sha256(c.tobytes()).hexdigest() == s['digest']
            assert np.max(abs(c-np.array(s['coefficients_real'])-1j*np.array(s['coefficients_imag']))) < 1e-15
            assert abs(ratio-s['R']) < 1e-14
            assert abs(energy-s['u']) < 1e-13
            assert abs(sum(s['content_shares'])-1) < 1e-12
            v = np.array(s['wick_direction_real'])+1j*np.array(s['wick_direction_imag'])
            cp,W = rotate_to_driver(c,s['indices'],v)
            cr = W.conj()@cm
            phase = cp[0]/abs(cp[0])
            xp = np.zeros((n-1,n-1), complex)
            for z,(i,j,k) in zip(cp,s['indices']):
                if i==0 and j>0 and k>0:
                    xp[j-1,k-1] = z/(phase*np.sqrt(s['u']))
            re = (xp+xp.conj().T)/2
            im = (xp-xp.conj().T)/(2j)
            xp_energy = np.vdot(xp,xp).real
            cells.append(dict(n=n,u=s['u'],tensor=s['tensor'],digest=s['digest'],
                coefficient_energy=energy,energy_error=energy-s['u'],
                R=float(ratio),SE=s['SE'],jackknife_bias=float(bias),
                jackknife_bias_in_SE=float(bias/s['SE']),
                jackknife_corrected_R=float(ratio-bias),
                estimated_squared_content_bias=float(numerator_bias),
                estimated_numerator_bias_in_ratio=float(numerator_bias/dm),
                content_shares_original=s['content_shares'],
                content_shares_wick_frame=(abs(cr)**2/np.vdot(cr,cr).real).tolist(),
                shell_weights=s['shell_weights_in_wick_frame'],
                xp_imaginary_Hermitian_energy_fraction=float(np.vdot(im,im).real/xp_energy) if xp_energy else 0.,
                xp_real_Hermitian_eigenvalues=np.linalg.eigvalsh(re).tolist(),
                xp_imaginary_Hermitian_eigenvalues=np.linalg.eigvalsh(im).tolist(),
                selected_tensor_hash_verified=True))
    out=dict(agent='codex-a713',status='Numerical saved-data checks; exact moment formulas are evaluated in float64.',
             cells=cells,completed_cells=len(cells),
             validation_endpoints_checked=len(validation_checks),
             max_validation_energy_error=max((abs(s['energy_error']) for s in validation_checks),default=None),
             validation_hash_checks=validation_checks,
             max_absolute_jackknife_bias_in_SE=max((abs(s['jackknife_bias_in_SE']) for s in cells),default=None),
             max_absolute_energy_error=max((abs(s['energy_error']) for s in cells),default=None))
    (ROOT/'STATISTICAL_DIAGNOSTICS.json').write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps({k:v for k,v in out.items() if k not in ('cells','validation_hash_checks')}))


if __name__=='__main__':
    main()
