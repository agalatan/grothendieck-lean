"""Phase-sensitive response geometry from the two unit disks. Agent-ID: codex-a7c4."""
import importlib.util
from fractions import Fraction as Q
from pathlib import Path

spec = importlib.util.spec_from_file_location('radial_weights', Path(__file__).with_name('verify.py'))
weights = importlib.util.module_from_spec(spec)
spec.loader.exec_module(weights)
P0 = Q(2500,1891)
EVEN_FRACTIONS = {Q('.1'): Q('.56'), Q('.2'): Q('.46'), Q('.3'): Q('.38'), Q('.4'): Q('.31')}


def even_fraction(r, moments, ia, ib, fraction):
    """Check the real 2-by-2 Gram minor, including the conjugate A/B cross term."""
    (m0l,m0h), (m1l,m1h), (m2l,m2h), _ = moments
    z = r*r
    h0l,h0h = (1+2*z)*m0l-2*r, (1+2*z)*m0h-2*r
    h1l,h1h = m1l-z*h0h, m1h-z*h0l
    h2l,h2h = m2l-z*h1h, m2h-z*h1l
    aa = h2l-2*h1h+h0l-fraction*ia
    bb = h2l/2-fraction*ib
    cross = max(abs(h2h-h1l), abs(h2l-h1h))
    weights.require(aa>0 and bb>0 and 2*aa*bb>cross**2, 'uncertified even Gram minor')
    return fraction


def checked_rows(t0):
    """Outward rows valid simultaneously at every visible amplitude t ≥ t0."""
    weights.require(0<=t0<=1, 'amplitude outside [0,1]')
    result = []
    for r,fraction in EVEN_FRACTIONS.items():
        j,i1,i0,ia,ib,inu = weights.checked_row(r,weights.RADII[r])
        _,moments = weights.smooth_moments(r)
        eta = even_fraction(r,moments,ia,ib,fraction)
        alpha = t0**2/(i1**2+t0**2)
        remote_weight = 1-alpha*(1+2*r*r)/2
        weights.require(remote_weight>0 and 1-alpha*eta/2>0, 'nonpositive effective coefficient')
        result.append((j, i1, remote_weight*i0+alpha*r,
                       (1-alpha*eta/2)*ia, (1-alpha*eta/2)*ib, inu))
    return result


def verify():
    t0,remote,even,odd = map(Q, ('.825','.05','.001','.03'))
    before = [weights.checked_row(r,weights.RADII[r]) for r in EVEN_FRACTIONS]
    after = checked_rows(t0)
    def old_slack(row):
        j,i1,i0,ia,ib,_ = row
        return j-t0**2/i1-P0**2*(remote/i0+even/(2*ia)+even/(2*ib)+odd/i1)
    weights.require(min(map(old_slack,before))>Q('.001'), 'old response comparison')
    caps_even, caps_odd = [], []
    for j,i1,i0,ia,ib,inu in after:
        weights.require(ia>ib>0 and i1>=inu>0, 'sector order')
        remaining = (j-t0*t0/i1)/P0**2-remote/i0
        caps_even.append(ia*remaining)
        caps_odd.append(i1*remaining)
    weights.require(min(caps_even)<Q('.02554') and min(caps_odd)<Q('.0245'),
                    'phase-sensitive energy cuts')
    excess = max(t0*t0/i1+P0**2*(remote/i0+even/ia+odd/i1)-j
                 for j,i1,i0,ia,_,_ in after)
    weights.require(excess>Q('.01293'), 'joint-cell exclusion')
    eps, t, e = Q('.752'), Q('.826'), Q('.04')
    physical_even = min(ia*(eps**2*(j-t*t/i1)-e/i0)
                        for j,i1,i0,ia,_,_ in checked_rows(t))
    weights.require(physical_even<Q('.03168'), 'physical even-energy cap')
    r = Q('.3')
    _,moments = weights.smooth_moments(r)
    _,_,_,ia,ib,_ = weights.checked_row(r,weights.RADII[r])
    try:
        even_fraction(r,moments,ia,ib,Q(1))
    except ValueError as error:
        weights.require(str(error)=='uncertified even Gram minor','wrong rejection')
    else:
        raise ValueError('accepted an excessive even-sector discount')
    weights.require(checked_rows(Q(0))==before,'zero-amplitude limit')
    print('Four two-disk rows and both joint energy caps passed.')
    print('The old four ellipsoids admit the excluded test point. Excessive even discount rejected.')


if __name__=='__main__':
    verify()
