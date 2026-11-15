# Agent ID: codex-a713. Independent heat/Bessel calculation; no project code imported.
import json
from pathlib import Path
import numpy as np
from scipy.integrate import quad
from scipy.special import i0e, i1e
U = 0.0463
A = 699/1250
B = 179/1250

def kd(t, v):
    r2 = t*(A+B*t)**2
    x = r2/(2*v)
    return np.sqrt(np.pi)*v**(-1.5)*(-0.5*i0e(x) + x*(i0e(x)-i1e(x)))

def calc(tol):
    bb, e1 = quad(lambda t: 0.5*np.exp(-t)*kd(t,U), 0, np.inf, epsabs=tol, epsrel=tol, limit=400)
    ap, e2 = quad(lambda t: 0.5*(t-1)*np.exp(-t)*kd(t,U), 0, np.inf, epsabs=tol, epsrel=tol, limit=400)
    return {'epsabs_epsrel':tol, 'B_second':bb, 'B_second_quad_error':e1,
            'A_prime':ap,'A_prime_quad_error':e2,
            'wick_ratio_slope_per_structured_energy':128*ap*ap/(-42*bb),
            'wick_ratio_slope_per_structured_fraction':U*128*ap*ap/(-42*bb),
            'wick_D_per_energy_squared':-bb*42/4,
            'wick_C_squared_per_energy_cubed':ap*ap*128/4}

out=[calc(t) for t in (1e-9,1e-11,2e-13)]
print(json.dumps(out,indent=2))
Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n')
