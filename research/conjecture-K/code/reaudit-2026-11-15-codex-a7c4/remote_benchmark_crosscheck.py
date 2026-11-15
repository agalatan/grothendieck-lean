"""Independent direct-Rice Arb check of the peak Gaussian benchmark.

Agent-ID: codex-a7c4. Refs #398. Run python3 -I remote_benchmark_crosscheck.py
[--dependency-dir DIR]. Unlike the original benchmark, this keeps I_1 and
does not integrate it by parts. No original code is imported.
"""
import argparse
import json
from pathlib import Path
import sys

if not __debug__:
    raise RuntimeError('Assertions must be enabled; do not use -O.')

parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('--dependency-dir', type=Path)
parser.add_argument('--write-result',action='store_true',help='Explicitly update the saved result JSON.')
args=parser.parse_args()
sys.dont_write_bytecode=True
if args.dependency_dir:
    sys.path.insert(0,str(args.dependency_dir.resolve(strict=True)))
from flint import arb,acb,ctx
ctx.prec=160
a=arb(699)/1250
b=arb(179)/1250
p=arb(2500)/1891
T=64


def direct(v, derivative=False):
    def integrand(t, analytic):
        # For integer orders 0,1, exp(-z) I_n(z) is entire; no branch guard is needed.
        x=t*(a+b*t)**2/v
        z=x/2
        i0=z.bessel_i(0,scaled=True)
        if derivative is True:
            value=i0
        elif derivative in ['a','b']:
            value=t*(a+b*t)*(i0+z.bessel_i(1,scaled=True))
            if derivative=='b':
                value*=t
        else:
            value=(1+x)*i0+x*z.bessel_i(1,scaled=True)
        return (-t).exp()*value
    value=acb(0)
    for k in range(256):
        value+=acb.integral(integrand,arb(k)/4,arb(k+1)/4,
                            rel_tol=arb('1e-24'),abs_tol=arb('1e-24'),eval_limit=100000)
    if derivative is True:
        value=value.real*arb.pi().sqrt()/(2*v.sqrt())-p
        tail=arb.pi().sqrt()/(2*v.sqrt())*arb(-T).exp()
    elif derivative in ['a','b']:
        value=value.real*arb.pi().sqrt()/v.sqrt()
        tail=2*arb(-T).exp()*((T+1) if derivative=='a' else (T*T+2*T+2))
    else:
        value=value.real*(arb.pi()*v).sqrt()-p*v
        tail=arb(-T).exp()*(2*a*(T+1)+2*b*(T*T+2*T+2)+(arb.pi()*v).sqrt())
    return value+arb(tail/2,tail/2)


left,right,mid=arb(40344)/10**6,arb(40346)/10**6,arb(403448)/10**7
dl,dr,dm=direct(left,True),direct(right,True),direct(mid,True)
fm=direct(mid)
ga,gb=direct(mid,'a'),direct(mid,'b')
assert dl>0 and dr<0
upper=fm+abs(dm)*(right-left)
assert fm>arb('1.3739535256614') and upper<arb('1.3739535256616')
assert arb('1.3739535256614828')<fm<arb('1.3739535256614829')
assert arb('1.689944147450845')<ga<arb('1.689944147450846')
assert arb('2.622896929056071')<gb<arb('2.622896929056073')
result={'agent_id':'codex-a7c4','status':'PASS','python_flint':__import__('flint').__version__,
        'precision_bits':ctx.prec,'direct_Rice_value':str(fm),
        'left_derivative':str(dl),'right_derivative':str(dr),'middle_derivative':str(dm),
        'S_upper':str(upper),'S_enclosure':['1.3739535256614','1.3739535256616'],
        'method':'Direct I0/I1 Rice formula, no integration-by-parts rewrite',
        'fixed_variance_support_gradient_a':str(ga),
        'fixed_variance_support_gradient_b':str(gb),
        'support_variance':'403448/10000000',
        'support_value_enclosure':['1.3739535256614828','1.3739535256614829'],
        'support_gradient_a_enclosure':['1.689944147450845','1.689944147450846'],
        'support_gradient_b_enclosure':['2.622896929056071','2.622896929056073']}
if args.write_result:
    Path(__file__).with_name('remote_benchmark_result.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
