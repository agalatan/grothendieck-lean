#!/usr/bin/env python3
"""Independent exact rational check of the received six-kernel LP certificates.

This checks only finite arithmetic. Analytic provenance of coefficient errors
and tails is established by the separate interval and energy replays.
"""
from fractions import Fraction as Q
from pathlib import Path
import argparse,json

def rational(record):
    return Q(int(record['numerator']),int(record['denominator']))

def dot(a,b):
    assert len(a)==len(b)
    return sum((x*y for x,y in zip(a,b)),Q(0))

def verify_model(data,relaxed):
    prefix='relaxed_' if relaxed else ''
    C=[[rational(x) for x in row] for row in data['matrix']]
    assert len(C)==data['count'] and all(len(row)==6 for row in C)
    penalties=list(map(rational,data['relaxed_penalties' if relaxed else 'penalties']))
    weights=list(map(rational,data[prefix+'weights_exact']))
    y=list(map(rational,data[prefix+'dual_exact']))
    gamma=rational(data[prefix+'optimal_slope_exact'])
    assert len(penalties)==len(weights)==6 and len(y)==len(C)-1
    assert gamma>0 and all(abs(t)<=1 for t in y)
    assert all(w>0 for w in weights) and sum(weights)==1
    assert all(p<=0 if relaxed else p>=0 for p in penalties)
    residuals=[dot(row,weights) for row in C[1:]]
    score=dot(C[0],weights)-sum(map(abs,residuals))-dot(penalties,weights)
    assert score==gamma
    for residual,dual in zip(residuals,y):
        assert residual*dual==abs(residual)
    rays=[]
    for i in range(6):
        a=C[0][i]-sum((dual*row[i] for dual,row in zip(y,C[1:])),Q(0))
        assert a-penalties[i]==gamma
        # These are the two rays of a real signed coefficient with |weight|=1.
        for orientation in (Q(-1),Q(1)):
            ray=orientation*a-penalties[i]
            assert ray<=gamma
            rays.append(ray)
    if relaxed:
        shown=Q(data['best_possible_coefficient_norm_bound_lower'])
        assert shown<=1/gamma<shown+Q(1,10**40)
        assert Q('1.404898309212694')<1/gamma
    else:
        shown=Q(data['finite_model_exact_optimum_upper'])
        assert shown-Q(1,10**40)<1/gamma<=shown
        assert 1/gamma<Q('1.404898359351155')
        assert [n+1 for n,r in enumerate(residuals) if r==0]==sorted(data['active_modes'])
    print(('RELAXED' if relaxed else 'CONSERVATIVE'),
          'PASS: exact primal, complementarity, all12 signed rays, decimal rounding')

def main():
    if not __debug__:
        raise RuntimeError('Assertions are proof gates; do not use -O.')
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('certificate',type=Path)
    a=p.parse_args();data=json.loads(a.certificate.read_text())
    assert data['status']=='PASS' and data['count']==240 and data['energy_order']==1
    verify_model(data,False);verify_model(data,True)
    explicit=list(map(Q,('0.983543458398378100','0.012416654023174663',
        '0.003031585753026536','0.000593628184609741',
        '0.000016934659448514','0.000397738981362458')))
    assert explicit==list(map(rational,data['supplied_weights_exact']))
    mass=sum(explicit);assert mass==rational(data['supplied_mass_exact'])
    denominator=Q(data['supplied_q0_lower'])-Q(data['supplied_prefix_upper'])-Q(data['supplied_tail_upper'])
    assert denominator>0 and mass/denominator<Q('1.404898359351155')
    print('SUPPLIED WEIGHTS PASS: mass and strict final rational comparison')

if __name__=='__main__':
    main()
