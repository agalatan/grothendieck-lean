#!/usr/bin/env python3
"""Certify a strict full-score obstruction for one radial charge-one channel.

The accompanying proof uses a rank-one perturbation of the certified normalized
Hankel operator. Arb encloses the sole integral bound and elementary Gaussian
moments. The resulting score ceiling applies to two arbitrary radial maps,
their scalar OU contractions and probability mixtures; it is not a new bound
for the full all-dimensional complex Grothendieck constant.
"""
import argparse
from fractions import Fraction as F
import json
from pathlib import Path
import sys

from flint import arb, acb, ctx

sys.path.insert(0,str(Path(__file__).resolve().parent))
from fresh_upper_hankel_certificate import certificate


def gaussian_moment(n):
    """Integral_0^infinity r^n exp(-3*r²/2)dr, by exact Gamma recursion."""
    a=arb(3)/2
    if n%2:
        k=(n-1)//2
        factorial=1
        for j in range(1,k+1):factorial*=j
        return arb(factorial)/(2*a**(k+1))
    k=n//2
    gamma=arb.pi().sqrt()
    for j in range(k):gamma*=arb(2*j+1)/2
    return gamma/(2*a**k*a.sqrt())


def main():
    if not __debug__:raise SystemExit('Reject -O/-OO: exact acceptance requires assertions')
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--bits',type=int,default=160)
    ap.add_argument('--mesh',type=int,default=50)
    ap.add_argument('--out',type=Path,required=True)
    args=ap.parse_args()
    assert args.bits>=64 and args.mesh>0
    hs=certificate(mesh=args.mesh,radius=6,bits=args.bits)
    H=arb(hs['HS_squared_upper_enclosure'])
    assert H<arb(7)/4
    # H-1<3/4<(7/8)^2, so the normalized operator on h-perp
    # has norm at most rho=7/8. h=sqrt(V)/sqrt(gamma).
    rho=F(7,8);B=F(25,2);t=F(1,400)
    assert F(3,4)<rho*rho
    assert 4*t*B==1-rho
    assert rho+2*t*B==F(15,16)
    assert 1-t*B==F(31,32)>F(15,16)
    # zeta=||mu*psi2/sqrt(V)||². Use C(r)>=c/(1+r)^3.
    # r²*(L_2^1(r²))² = 9r²-18r⁴+12r⁶-3r⁸+r¹⁰/4.
    base={2:F(9),4:F(-18),6:F(12),8:F(-3),10:F(1,4)}
    poly={}
    for n,a in base.items():
        for j,b in enumerate([1,3,3,1]):poly[n+j]=poly.get(n+j,F(0))+a*b
    integral=sum((arb(a.numerator)/a.denominator)*gaussian_moment(n) for n,a in sorted(poly.items()))
    c=(arb(2)/arb.pi()).sqrt()*(-arb(1)/2).exp()/3
    zeta_upper=arb(2)*integral/(3*c)
    assert zeta_upper>0 and zeta_upper<arb(B.numerator)/B.denominator
    # gamma = integral cos²(theta)/sqrt(1+sin²(theta)) dtheta.
    # The standard parameter convention is K(m), E(m), hence 2K(-1)-E(-1).
    gamma_complex=2*acb(-1).elliptic_k()-acb(-1).elliptic_e()
    assert gamma_complex.imag.is_zero()
    gamma=gamma_complex.real
    phase_e2=3*arb.pi()/256
    full_score_ceiling=gamma-phase_e2/400
    incumbent=arb(355973576656604491)/500000000000000000
    assert 0<full_score_ceiling<incumbent
    assert full_score_ceiling<arb(711866621)/10**9
    result={
        'status':'PASS_STRICT_ONE_COORDINATE_FULL_SCORE_OBSTRUCTION',
        'scope':__doc__, 'precision_bits':args.bits,
        'normalized_Hankel_HS_certificate':hs,
        'orthogonal_operator_norm_bound':str(rho),
        'coefficient_feature_norm_squared_upper_enclosure':str(zeta_upper),
        'rational_feature_norm_bound':str(B),'perturbation_t':str(t),
        'multiplier_rule':'lambda_k=(-1)^k, except lambda_2=199/200',
        'phase_coefficient_energy_k2':str(phase_e2),
        'gamma_dagger':str(gamma),'strict_score_loss':str(phase_e2/400),
        'full_score_ceiling':str(full_score_ceiling),
        'rational_score_ceiling':'711866621/1000000000',
        'incumbent_reciprocal_score':str(incumbent),
        'separation_below_incumbent':str(incumbent-full_score_ceiling),
        'restricted_reciprocal_floor':str(1/full_score_ceiling),
        'global_Grothendieck_endpoint_changed':False,
        'paper_proof_obligations':['Hankel realization, positive normalization and exact eigenfunction from BILINEAR_HANKEL_OBSTRUCTION.md.',
            'The rank-one perturbation Schur bound for Q-2*t*u*u*, using ||Q on h-perp||<=rho, ||u||²<=B and 4*t*B<=1-rho.',
            'The actual class is a single ordinary Gaussian channel, charge-one per response, scalar OU contractions and probability mixtures. Multigrade latent channels, general preprocessing and higher Gaussian dimensions are not covered.']}
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:result[k]for k in ['status','coefficient_feature_norm_squared_upper_enclosure','gamma_dagger','full_score_ceiling','separation_below_incumbent','restricted_reciprocal_floor']},indent=2))


if __name__=='__main__':main()
