#!/usr/bin/env python3
"""Check the coupled two-sign endpoint and both loss coefficients. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from pathlib import Path
import runpy

# The previous endpoint verifier contains the Gaussian moments and the Machin enclosure.
base = runpy.run_path(str(Path(__file__).with_name('verify.py')))
EPS, ETA, TARGET = (base[key] for key in ('EPS', 'ETA', 'TARGET'))
require, wick_moment, payoff = (base[key] for key in ('require', 'wick_moment', 'payoff'))


def check():
    mu_lo, mu_hi = base['mu_bounds']()
    ell, beta = Q('1.28353'), Q('.171585')
    ba, b = Q('-.05314'), Q('-.00687')  # b_B = sqrt(2) b in the normalized Wick basis
    cost = Q('7.4564')
    radial = cost / (2*cost - 1)
    m = ell - 2*beta + 3*ETA*mu_lo/8
    d = beta - 3*ETA*mu_hi/8
    require(m > 0 and d > 0 and cost > 1, 'positive affine minorant and admissible cost')

    def integral_bound(w0, w1, w2):
        require(min(w0, w1, w2) > 0, 'moments of nonzero square')
        return 2*mu_hi/m * (w0 - d*w1**2/(m*w1 + d*w2))

    diag = {ab: integral_bound(*(wick_moment(*ab, n) for n in range(3)))
            for ab in base['QUINTIC']}
    max5 = max(diag.values())
    max_other3 = max(diag[ab] for ab in base['CUBIC'] if ab != (0, 0))

    def affine_square(intercept, slope):
        def moment(n):
            return (intercept**2 * wick_moment(0, 0, n)
                    + 2*intercept*slope * wick_moment(0, 0, n+1)
                    + slope**2 * wick_moment(0, 0, n+2))
        return integral_bound(*(moment(n) for n in range(3)))

    ar, ai = (affine_square(1+ba, -ba-b), affine_square(1+ba, -ba+b))
    remote = (radial*ar + ai)/2 + (ba**2 + 2*b**2)/ETA
    require(ETA*cost*max5 < Q('.99999'), 'full quintic absorption')
    require(EPS*remote < Q('.99998') and EPS*max_other3 < Q('.957'), 'all cubic components absorbed')
    require((1+radial)*diag[0, 0]/2 > 1/EPS, 'deleting the tilt does not pass this diagonal test')
    require((ar+ai)/2+(ba**2+2*b**2)/ETA > 1/EPS, 'isotropic cubic estimate does not pass')
    require(ell > mu_hi and ell > beta/2, 'payoff decreases in t and increases in mu')
    cut = Q('.88425210')
    require(payoff(cut, ell, beta, mu_hi) < TARGET < payoff(cut-Q(1,10**8),ell,beta,mu_lo),
            'crossing is strictly between .88425209 and .88425210')
    print('Absorption: eta*A*Q5 < .99999; e*Qremote < .99998; e*Qother < .957.')
    print('All pairs with .88425210 <= t <= sqrt(pi)/2 satisfy V < 500/701.')
    print('The adjacent lower endpoint fails for this row. Both coefficient negative controls pass.')


if __name__ == '__main__':
    check()
