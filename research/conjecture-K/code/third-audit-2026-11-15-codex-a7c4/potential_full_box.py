"""Full-box replay using the sharper certified kernel bounds.

Agent-ID: codex-a7c4. Refs #400. Run with python3 -I.
Reuses the audited fixed-point arithmetic and disk heights from the second
audit, read-only. New scalar bounds are checked afresh; POTENTIAL.md supplies
the analytic implication. No writes unless --write-result is supplied.
"""
import argparse
from fractions import Fraction as Q
import importlib.util
import json
from pathlib import Path
import sys

if not __debug__:
    raise RuntimeError('Assertions must be enabled; do not use -O.')
sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parent


def load(name, path):
    spec = importlib.util.spec_from_file_location(name,path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


old = load('previous_disjoint',ROOT.parent/'reaudit-2026-11-15-codex-a7c4'/'remote_disjoint_cost.py')
new = load('new_kernel',ROOT/'potential_bounds.py')
ONE = old.ONE
TARGET = Q(197,100)


def potential(layers, dlo, dhi):
    clo,chi = old.rat(147,125)
    bound = 0
    for mass,radius,inner,outer in layers:
        z = old.down(dlo*inner,ONE)
        m = min(radius,old.down(17*z,20))
        integral = old.up(chi*(radius-m),ONE)+old.up(1773*(old.sqrt_up(z*z+m*m)-z),1000)
        if dhi is not None:
            far = old.up(38*dhi*outer,25*ONE)
            excess = max(0,radius-far)
            integral -= old.down((clo-ONE)*excess*excess,ONE*radius)
        bound += mass*integral
    return old.up(2*bound,ONE)+old.up(ONE,5000)


def profile(cells, lo, hi):
    layers = old.disks(cells,lo,hi)
    tail = potential(layers,ONE,None)
    if Q(tail,ONE) >= TARGET:
        return None
    accepted = [(ONE,None,tail)]
    pending = [(0,ONE)]
    while pending:
        a,b = pending.pop()
        bound = potential(layers,a,b)
        if Q(bound,ONE) < TARGET:
            accepted.append((a,b,bound))
        elif b-a <= ONE//4096:
            return None
        else:
            mid = (a+b)//2
            pending.extend([(a,mid),(mid,b)])
    cursor = 0
    for a,b in sorted((a,b) for a,b,_ in accepted if b is not None):
        assert a==cursor and b>a
        cursor = b
    assert cursor==ONE
    return accepted


def verify():
    new.verify()
    old.scalar_checks()  # Retains the conservative 1/5000 tail enclosure.
    cells = old.radial_cells()
    endpoints = (old.rat(2,15)[0],old.rat(4,19)[1])
    pending = [(*endpoints,0)]
    accepted = []
    while pending:
        lo,hi,depth = pending.pop()
        result = profile(cells,lo,hi)
        if result is not None:
            accepted.append((lo,hi,result))
        else:
            assert depth<11,'Sharper full-box potential not certified'
            mid = (lo+hi)//2
            pending.extend([(lo,mid,depth+1),(mid,hi,depth+1)])
    cursor = endpoints[0]
    for lo,hi,_ in sorted(accepted):
        assert lo==cursor and hi>lo
        cursor = hi
    assert cursor==endpoints[1]
    worst = max(v for _,_,cc in accepted for _,_,v in cc)
    assert Q(worst,ONE)<TARGET
    cost = Q(25,19)-TARGET/(2*Q(19,25))
    assert cost==Q(3,152)
    return {'agent_id':'codex-a7c4','status':'PASS',
            'profile_range':['2/15','4/19'],'scale_range':'[0,infinity)',
            'profile_intervals':len(accepted),
            'scale_intervals':sum(len(cc) for _,_,cc in accepted),
            'normalized_kernel_upper':str(Q(worst,ONE)),
            'strict_target':str(TARGET),'uniform_shell_cost_lower':str(cost),
            'kernel_constant':'147/125','kernel_far_w_over_r2_coefficient':'2/5',
            'disk_far_factor':'38/25','reused_tail_upper':'1/5000',
            'scope':'All shifts, scales and application profiles; reuses audited disk-height and fixed-point helpers.'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write-result',action='store_true')
    args = parser.parse_args()
    data = json.dumps(verify(),indent=2)+'\n'
    if args.write_result:
        ROOT.joinpath('potential_full_box_result.json').write_text(data)
    print(data,end='')


if __name__=='__main__':
    main()
