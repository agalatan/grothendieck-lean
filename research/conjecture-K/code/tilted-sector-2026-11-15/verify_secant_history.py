#!/usr/bin/env python3
"""Exact certificates for REPORT.md. Agent-ID: codex-6e2b.

Run: python3 -I verify.py
The full replay needs a C++17 compiler and python-flint. It compiles in a
temporary subdirectory here and removes that directory on exit. Set
TILTED_FLINT_PYTHON to choose an interpreter with python-flint installed.
The --algebra-only mode needs only the Python standard library; its
acceptance arithmetic is Fraction / integers and decimals are OUTWARD rounded.
Optional independent floating-point monomial diagnostic:
    python3 -I verify.py --algebra-only --numerical  # needs numpy and scipy
Replay only the additive third-order tensor certificate and exact algebra:
    python3 -I verify.py --tensor-only
The default replay uses the global function-value secant route, without
localization. The general content/deficit hypothesis remains open.
"""
import sys
sys.dont_write_bytecode = True
import hashlib
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
from fractions import Fraction as F
from math import comb, factorial, isqrt


class I:
    """Closed rational interval, without floating-point endpoints."""
    def __init__(self, lo, hi=None):
        self.lo = F(lo)
        self.hi = F(lo if hi is None else hi)
        assert self.lo <= self.hi

    @staticmethod
    def lift(x):
        return x if isinstance(x, I) else I(x)

    def __add__(self, other):
        b = self.lift(other)
        return I(self.lo+b.lo, self.hi+b.hi)
    __radd__ = __add__

    def __neg__(self):
        return I(-self.hi, -self.lo)

    def __sub__(self, other):
        return self + (-self.lift(other))

    def __rsub__(self, other):
        return self.lift(other) + (-self)

    def __mul__(self, other):
        b = self.lift(other)
        q = [self.lo*b.lo, self.lo*b.hi, self.hi*b.lo, self.hi*b.hi]
        return I(min(q), max(q))
    __rmul__ = __mul__

    def __truediv__(self, other):
        b = self.lift(other)
        assert b.lo*b.hi > 0
        return self * I(1/b.hi, 1/b.lo)

    def __rtruediv__(self, other):
        return self.lift(other) / self

    def sqrt(self, digits=90):
        assert self.lo >= 0
        scale = 10**digits
        low = isqrt(self.lo.numerator*scale**2//self.lo.denominator)
        high = isqrt(self.hi.numerator*scale**2//self.hi.denominator)+1
        return I(F(low, scale), F(high, scale))


def outward(x, digits=15):
    x = I.lift(x)
    scale = 10**digits
    def floor(q):
        return q.numerator//q.denominator
    def fmt(v):
        sign = '-' if v < 0 else ''
        v = abs(v)
        return f'{sign}{v//scale}.{v%scale:0{digits}d}'
    return '['+fmt(floor(x.lo*scale))+', '+fmt(-floor(-x.hi*scale))+']'


def atan_inv(m, n=100):
    # Alternating Taylor series, with the first omitted term bounding its tail.
    terms = [F((-1)**k, (2*k+1)*m**(2*k+1)) for k in range(n)]
    total = sum(terms, F(0))
    next_term = F((-1)**n, (2*n+1)*m**(2*n+1))
    return I(min(total, total+next_term), max(total, total+next_term))


def exp_pos(x, n=220):
    # Positive series. Tail after n is bounded by a geometric series whose
    # ratio dominates all subsequent successive-term ratios.
    x = F(x)
    assert x >= 0 and x < n+2
    term = F(1)
    total = term
    for k in range(1, n+1):
        term *= x/k
        total += term
    first = term*x/(n+1)
    return I(total, total+first/(1-x/(n+2)))


def exp_neg(x):
    return 1/exp_pos(x)


def erf_series(x, n=120):
    # erf(sqrt(x)) = 2 sqrt(x/pi) * S(x).
    # Terms need only decrease from the truncation onwards. Here n>x.
    x = F(x)
    assert 0 <= x < n
    total = sum(((-1)**k*x**k/F(factorial(k)*(2*k+1))
                 for k in range(n)), F(0))
    nxt = (-1)**n*x**n/F(factorial(n)*(2*n+1))
    return I(min(total,total+nxt), max(total,total+nxt))


def bernstein_on(poly, left, right):
    """Exact Bernstein coefficients on [left,right], fixed original degree."""
    n = len(poly)-1
    power = [sum((poly[j]*comb(j,k)*left**(j-k)*(right-left)**k
                  for j in range(k,n+1)), F(0)) for k in range(n+1)]
    return [sum((power[k]*F(comb(i,k),comb(n,k))
                 for k in range(i+1)),F(0)) for i in range(n+1)]


def exact():
    print('Agent-ID: codex-6e2b')
    print('C checks: exact rational arithmetic; no sampled inequalities.')
    pi = 16*atan_inv(5)-4*atan_inv(239)
    assert pi.lo > F(157,50) and pi.hi < F(22,7)
    # The C++ checker rounds these rational bounds outward to binary64.
    # This links its trigonometric certificate to the exact Machin proof.
    assert pi.lo > F('3.141592653589793')
    assert pi.hi < F('3.141592653589794')
    sqrtpi = pi.sqrt()
    print('pi',outward(pi))

    # C1: circular mean <= 1 + 3 t^2/10.
    # t<=1 follows from the positive binomial-square series and pi>=157/50.
    # t>=1 uses the quartic remainder, then x=t-1:
    # P(x) = 3 x^5/10 + x^4/2 - x^2/4 + 41/1570.
    # x>=1: x^4/2-x^2/4 >= x^4/4 >= 0.
    # x in [0,1]: all Bernstein coefficients on each closed subinterval >0.
    poly = [F(41,1570), F(0), -F(1,4), F(0), F(1,2), F(3,10)]
    mins = [min(bernstein_on(poly,F(k,32),F(k+1,32))) for k in range(32)]
    assert min(mins) > 0
    assert F(4)/F(157,50)-1 < F(3,10)
    print('C1 circular majorant: 32 closed intervals cover [0,1]; '
          'all Bernstein coefficients positive.')
    print('C1 minimum Bernstein coefficient',outward(min(mins)))

    # C2: exact integral formulas. I_k = int_0^infty
    # t^(k-1/2) exp(-t)/(a+b t) dt.
    a,b,p,s = F(699,1250),F(179,1250),F(2500,1891),F(3,5)
    x = a/b
    erfc = 1-2*I(x).sqrt()/sqrtpi*erf_series(x)
    assert erfc.lo > 0
    i0 = pi*exp_pos(x)*erfc/I(a*b).sqrt()
    i1 = (sqrtpi-a*i0)/b
    i2 = (sqrtpi/2-a*i1)/b
    for k,val in enumerate((i0,i1,i2)):
        assert val.hi-val.lo < F(1,10**60)
        print(f'C2 I{k}',outward(val))
    j0 = i0/2
    g0 = (i1-i0)/2
    js = i2-F(4,5)*i1+F(4,25)*i0
    budget = p-s*s
    localcost = budget-js/2
    coeff = F(3,5)*i0
    coercivity = budget-F(3,5)*js
    print('C2 j0',outward(j0))
    print('C2 g0',outward(g0))
    print('C2 J_s',outward(js))
    print('C2 local cost k(3/5)',outward(localcost))
    print('C2 global u coefficient (3/5)I0',outward(coeff))
    print('C2 global coercivity P-(3/5)J_s',outward(coercivity))
    assert coeff.hi < F(1074,625)
    assert coercivity.lo > F(859,2500)
    assert F(1074,625)/85920 == F(1,50000)
    print('C3 certified constants for REPORT section 2 proof: '
          'gain <= (1074/625)u - (859/2500)||r||^2.')
    print('C3 rational corollary of that proof: u<=1/85920 gives '
          's=3/5, kappa=0, eta=1/50000.')
    umax = F(463,10000)
    radius = I(F(1074,625)*umax/F(859,2500)).sqrt()
    assert radius.hi < F(241,500)
    print('C3 elementary maximizing-radius bound at u=0.0463',outward(radius))

    # C4: original conditional assembly; only its content hypothesis remains O.
    delta = budget-F(3,4)
    assert delta > F(1,5)
    M = 2*exp_neg(F(2,5))-F(3,5)
    assert M.hi < F(3,4)
    R,rmax = F(3,10),F(17,200)
    tail = 4*M*(R+rmax*rmax/(2*R))*exp_neg(R*R/(rmax*rmax))
    simplified_tail = 3*I(R+rmax*rmax/(2*R))*exp_neg(F(3600,289))
    assert tail.hi < F(4,10**6) and simplified_tail.hi < F(4,10**6)
    print('C4 M=E|T-2/5|',outward(M))
    print('C4 P-3/4',outward(delta))
    print('C4 tail(R=.3, sigma=.085)',outward(tail))
    print('C4 simplified certified tail',outward(simplified_tail))
    assert 5*F(1,10) == F(1,2)
    assert 5*F(3,10**6)+F(4,10**6) == F(19,10**6)
    print('C4 with certified curvature and localization, IF strong O-B holds: '
          'kappa=1/2, eta=19/10^6.')
    print('C4 tail sensitivity (analytic upper bounds, not actual errors):')
    for radius in (F(17,200),F(9,100),F(1,10)):
        v = 4*M*(R+radius*radius/(2*R))*exp_neg(R*R/(radius*radius))
        print('  sigma='+str(radius),outward(v))

    # C5: explicit profile bound for the structural cumulant estimate.
    # max sqrt(t)e^-t = sqrt(1/(2e));
    # max t^(3/2)e^-t = sqrt(27/(8e^3)).
    elo = sum((F(1,factorial(k)) for k in range(8)),F(0))
    assert F(1,2)/elo < F(43,100)**2
    assert F(27,8)/elo**3 < F(41,100)**2
    assert pi.hi < F(1773,1000)**2
    C0 = 1+F(2,5)+4*b*F(2,5)/a
    C1 = 1+4*b/a
    K = F(43,100)*C0+F(41,100)*C1
    H = C0+F(3,2)*C1
    assert K == F(3747,2330) and H == F(6775,1398)
    structural = 6*F(1773,1000)*K*H/a**4
    assert structural == F(406984637451171875,480017179618707)
    assert structural < 848
    print('C5 structural coefficient upper bound',outward(structural))
    assert 848*F(3,848000000) == F(3,10**6)
    print('C5 preliminary coefficient 848 for REPORT section 3; '
          'superseded by the full replay\'s coefficient 2/25.')
    print('C5 delta<=3/848000000 implies content^2<=3/10^6.')

    # Exact consequences of the additional certificates, replayed below.
    assert F(1074,625)-F(7,10) == F(1273,1250)
    assert F(1273,1250)/50920 == F(1,50000)
    radius = I(F(1273,1250)*umax/F(859,2500)).sqrt()
    assert radius.hi < F(371,1000)
    assert F(6,25)*F(1,3) == F(2,25)
    assert F(2,25)*F(3,80000) == F(3,10**6)
    assert (F(253,1000)+F(1,40))/2 == F(139,1000)
    content2 = F(139,1000)**2*umax
    assert content2 == F(8945623,10**10) and content2 < F(9,10000)
    deficit_threshold = 10*(content2-F(3,10**6))
    assert deficit_threshold == F(8915623,10**9)
    print('C6 arithmetic consequences (depend on full replay): '
          'gain <= (1273/1250)u-(859/2500)sigma^2; '
          'u<=1/50920 gives kappa=0, eta=1/50000.')
    print('C6 improved maximizing radius at u=.0463',outward(radius))
    print('C6 content^2 <= min((2/25)delta,(19321/10^6)u); '
          'content budget holds if delta<=3/80000 or '
          'D_+ >= (19321/100000)u-3/100000.')
    print('C6 endpoint content^2 bound',outward(content2))
    print('C6 endpoint sufficient D_+ threshold',outward(deficit_threshold))

    # C7: assemble a proved all-r energy interval from the full certificates.
    # Nonnegative gain implies sigma^2 <= alpha*u.  The moment input gives
    # delta <= 42*u^2, so completion of the finite-amplitude square yields
    # gain <= (840/53)*u^2 + tail(sqrt(alpha*u)).
    u0, alpha = F(1123,10**6), F(2546,859)
    assert alpha == F(1273,1250)/F(859,2500)
    assert budget-F(3,4) > F(53,250)
    assert F(2,25)*42/F(53,250) == F(840,53)
    v0 = alpha*u0
    assert v0 == F(1429579,429500000) and v0 < F(1,300)
    assert R*R/v0 > 27
    assert 3*(R+v0/(2*R)) < F(11,12)
    # e^3 > this positive Taylor partial sum > 20; hence e^27 > 20^9.
    e3_lower = sum((F(3)**k/factorial(k) for k in range(9)),F(0))
    assert e3_lower == F(89641,4480) and e3_lower > 20
    small_main = F(840,53)*u0*u0
    small_tail = F(11,12*20**9)
    assert small_main == F(26483709,1325000000000)
    assert small_main+small_tail < F(1,50000)
    print('C7 all-r theorem: u<=1123/10^6, s=3/5, kappa=0, eta=1/50000.')
    print('C7 radius cap at endpoint',outward(I(v0).sqrt()))
    print('C7 gain main bound',outward(small_main,20))
    print('C7 rational tail upper bound',outward(small_tail,20))
    print('C7 combined gain upper bound',outward(small_main+small_tail,20))

    # C8: the new global radial-gradient majorant closes localization.
    max_radius2 = F(1,40)*umax/(budget-F(4,5))
    assert max_radius2 == F(875533,122576000)
    assert max_radius2 < F(17,200)**2
    margin = (budget-F(4,5))*F(17,200)**2-F(1,40)*umax
    assert margin == F(50393,3782000000) and margin > 0
    localized_tail = 4*M*(R+max_radius2/(2*R))*exp_neg(R*R/max_radius2)
    assert localized_tail.hi < F(32,10**7)
    print('C8 all global maximizers have radius at most',outward(I(max_radius2).sqrt()))
    print('C8 localized finite-amplitude tail',outward(localized_tail,20))
    # The new Gaussian-probe dual certificate supplies C<=1/50.
    assert F(1,50)**2 == F(1,2500)
    assert 5*(F(1,2500)-F(3,10**6)) == F(397,200000)
    assert F(250,53)*F(1,5) == F(50,53) < 1
    assert F(250,53)*F(3,10**6)+F(32,10**7) < F(18,10**6)
    print('C9 content^2 <= min((2/25)delta,1/2500) throughout u<=.0463.')
    print('C9 IF remaining O-B: content^2 <= D_+/5 + 3/10^6, '
          'THEN kappa=50/53, eta=18/10^6 on the full energy range.')
    print('C9 this budget holds when delta<=3/80000 or D_+>=397/200000.')

    # C10: nonlinear third-order tensor theorem and its scalar M3 certificate.
    assert F(49,20)**2 > 6
    k3_upper = F(3)*F(22,7)**2*F(49,20)*13**2/4096
    assert k3_upper == F(61347,20480) < 3
    assert 3*F(1,10000)*F(1,100) == F(3,10**6)
    new_u = F(173,100000)
    assert F(1621,250)**2 > 42
    new_main = F(250,53)*3*42*F(1621,250)*new_u**3
    assert new_main == F(528763993191,26500000000000000)
    new_radius2 = new_u/(40*(budget-F(4,5)))
    assert new_radius2 == F(327143,1225760000)
    assert R*R/new_radius2 > 30
    assert 3*(R+new_radius2/(2*R)) < 1
    # e>2 by its positive Taylor series, hence the tail is <2^-30.
    assert new_main+F(1,2**30) < F(1,50000)
    print('C10 with certified sup|m_s third derivative|<13: '
          'content^2 <= 3 delta^(3/2).')
    print('C10 full-energy content-budget class enlarged to delta<=1/10000.')
    print('C10 all-r theorem: u<=173/100000, s=3/5, kappa=0, eta=1/50000.')
    print('C10 endpoint main upper bound',outward(new_main,20))
    print('C10 endpoint gain including tail upper bound',outward(new_main+F(1,2**30),20))
    print('PASS: all exact algebra assertions. No full tilted-sector proof claimed.')


def flint_interpreter():
    fallback = Path('/Users/alingalatan/workspaces/grothe-coordination/evidence/'
                    'codex-2ca4/retired-worktrees/grothe-codex-canonical-proof-2ca4/'
                    'handoff/codex-2ca4/replay-venv/bin/python')
    requested = os.environ.get('TILTED_FLINT_PYTHON')
    candidates = [requested] if requested else [sys.executable, str(fallback)]
    for candidate in candidates:
        if not Path(candidate).is_file():
            continue
        check = subprocess.run([candidate, '-I', '-B', '-c',
                                'import flint; print(flint.__version__)'],
                               text=True, capture_output=True)
        if check.returncode == 0:
            print('python-flint', check.stdout.strip(), 'via', candidate, flush=True)
            return candidate
    raise RuntimeError('python-flint is required: install it in your interpreter '
                       'or set TILTED_FLINT_PYTHON; no certificate was skipped')


def secant_scalars():
    """Exact scalar prerequisites for the active route; no localization."""
    print('Agent-ID: codex-6e2b', flush=True)
    pi=16*atan_inv(5)-4*atan_inv(239)
    assert pi.lo>F('3.141592653589793') and pi.hi<F('3.141592653589794')
    a,b=F(699,1250),F(179,1250)
    x=a/b
    sqrtpi=pi.sqrt()
    erfc=1-2*I(x).sqrt()/sqrtpi*erf_series(x)
    i0=pi*exp_pos(x)*erfc/I(a*b).sqrt()
    i1=(sqrtpi-a*i0)/b
    i2=(sqrtpi/2-a*i1)/b
    assert (i0/2).hi<F(179,125)
    assert F(49,20)**2>6
    assert F(3)*F(22,7)**2*F(49,20)*13**2/4096<3
    assert F(6,25)*F(1,3)==F(2,25)
    assert ((F(253,1000)+F(1,40))/2)**2==F(19321,10**6)
    print('C exact pi',outward(pi),flush=True)
    for j,v in enumerate((i0,i1,i2)):
        print('C exact I'+str(j),outward(v),flush=True)
    print('C exact j0<179/125; content coefficients 2/25, 3, 19321/10^6.',flush=True)


def tensor_replay():
    """Targeted replay for the additive certificate; no earlier C files changed."""
    folder = Path(__file__).resolve().parent
    for name in ('verify.py', 'content_profile.py', 'content_next_m3.py'):
        print('EXTENSION SHA256', name,
              hashlib.sha256((folder/name).read_bytes()).hexdigest(),flush=True)
    args = [flint_interpreter(), '-I', '-B', str(folder/'content_next_m3.py')]
    print('RUN', ' '.join(args),flush=True)
    result = subprocess.run(args,cwd=folder,text=True,stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT)
    for line in result.stdout.splitlines():
        if result.returncode or not line.startswith('{"x":'):
            print(line,flush=True)
    result.check_returncode()
    print('PASS TENSOR EXTENSION: scalar derivative, third-order content, '
          'and .00173 all-r endpoint. Earlier certificates are separate prerequisites.',
          flush=True)


def historical_replay():
    """Replay every additional C claim, without trusting stored result files."""
    folder = Path(__file__).resolve().parent
    names = ('verify.py', 'localization_verify.py', 'theta_verify.cpp',
             'theta_candidates.txt', 'content_profile.py', 'profile_range.py',
             'localization_majorant.cpp', 'localization_circle.hpp',
             'content_next_bound.py', 'content_next_m3.py')
    for name in names:
        print('SHA256', name, hashlib.sha256((folder/name).read_bytes()).hexdigest(),
              flush=True)

    def run(args, *, env=None, compact=False):
        print('RUN', ' '.join(map(str,args)), flush=True)
        result = subprocess.run(list(map(str,args)), cwd=folder, env=env,
                                text=True, stdout=subprocess.PIPE,
                                stderr=subprocess.STDOUT)
        for line in result.stdout.splitlines():
            # All box checks still execute. Only the successful verbose box
            # transcript is omitted from this summary, not from acceptance.
            if (compact and result.returncode == 0 and
                ('"claim": "C range box"' in line or line.startswith('progress ')
                 or line.startswith('{"x":'))):
                continue
            print(line, flush=True)
        result.check_returncode()

    run([sys.executable, '-I', '-B', folder/'localization_verify.py'])
    compiler = shutil.which('clang++')
    if not compiler:
        raise RuntimeError('clang++ with directed-rounding support is required')
    with tempfile.TemporaryDirectory(prefix='codex-6e2b-replay-', dir=folder) as tmp:
        exe = Path(tmp)/'theta_verify'
        env = dict(os.environ, TMPDIR=tmp)
        run([compiler, '-O2', '-std=c++17', '-frounding-math', '-ffp-contract=off',
             '-fno-fast-math', folder/'theta_verify.cpp', '-o', exe], env=env)
        run([exe, '--certify', folder/'theta_candidates.txt'], compact=True)

    flint_python = flint_interpreter()
    # This script replays content_profile.certify_global before checking range.
    run([flint_python, '-I', '-B', folder/'profile_range.py', '--certify'], compact=True)
    # Both scalar prerequisites of the exterior/cheap localization estimates
    # have now been replayed in this invocation, before using them.
    with tempfile.TemporaryDirectory(prefix='codex-6e2b-replay-', dir=folder) as tmp:
        exe = Path(tmp)/'localization_majorant'
        env = dict(os.environ, TMPDIR=tmp)
        run([compiler, '-O2', '-std=c++17', '-frounding-math', '-ffp-contract=off',
             '-fno-fast-math', folder/'localization_majorant.cpp', '-o', exe], env=env)
        run([exe, '--certify'], compact=True)
    # Skipping only the duplicate dependency replay is valid here: the exact
    # same profile/Hessian certificates were replayed above in this chain.
    run([flint_python, '-I', '-B', folder/'content_next_bound.py',
         '--skip-dependency-replay'], compact=True)
    run([flint_python, '-I', '-B', folder/'content_next_m3.py'], compact=True)
    print('PASS FULL REPLAY: curvature, structural content, profile range, '
          'global localization, Gaussian-probe and third-order content, and scalar constants. '
          'Only the general content/deficit inequality O-B remains open.',
          flush=True)


def replay():
    """Replay the active secant route, regenerating every numerical input."""
    folder = Path(__file__).resolve().parent
    names = ('verify.py', 'secant_exact.py', 'theta_verify.cpp',
             'theta_candidates.txt', 'localization_circle.hpp',
             'content_profile.py', 'profile_range.py', 'content_next_bound.py',
             'content_next_m3.py', 'secant_profile_table.py',
             'secant_profile_dual.py', 'secant_verify.cpp',
             'secant_content_verify.py', 'secant_content_witness.json')
    for name in names:
        print('SHA256', name, hashlib.sha256((folder/name).read_bytes()).hexdigest(), flush=True)

    def run(args, *, env=None, compact=False):
        print('RUN', ' '.join(map(str,args)), flush=True)
        with subprocess.Popen(list(map(str,args)), cwd=folder, env=env,
                              text=True, stdout=subprocess.PIPE,
                              stderr=subprocess.STDOUT, bufsize=1) as process:
            for line in process.stdout:
                # Successful pointwise diagnostic rows are verbose; progress
                # and acceptance summaries are retained as the process runs.
                if compact and ('"claim": "C range box"' in line or
                                line.startswith('{"x":')):
                    continue
                print(line, end='', flush=True)
            code = process.wait()
        if code:
            raise subprocess.CalledProcessError(code, args)

    run([sys.executable, '-I', '-B', folder/'secant_exact.py'])
    compiler = shutil.which('clang++')
    if not compiler:
        raise RuntimeError('clang++ with directed-rounding support is required')
    flint_python = flint_interpreter()
    with tempfile.TemporaryDirectory(prefix='codex-6e2b-secants-', dir=folder) as tmp:
        env = dict(os.environ, TMPDIR=tmp)
        theta_exe, secant_exe = Path(tmp)/'theta_verify', Path(tmp)/'secant_verify'
        for source, exe in (('theta_verify.cpp', theta_exe), ('secant_verify.cpp', secant_exe)):
            run([compiler, '-O2', '-std=c++17', '-frounding-math', '-ffp-contract=off',
                 '-fno-fast-math', folder/source, '-o', exe], env=env)
        run([theta_exe, '--certify', folder/'theta_candidates.txt'])
        # Includes the global N_Phi<1/3 dependency for table interpolation.
        run([flint_python, '-I', '-B', folder/'profile_range.py', '--certify'], compact=True)
        run([flint_python, '-I', '-B', folder/'secant_profile_table.py',
             '--skip-dependency-replay'])
        run([secant_exe, '--certify', folder/'secant_profile_table.txt'])
        # This adapter reuses exactly the freshly regenerated radial values.
        run([flint_python, '-I', '-B', folder/'secant_profile_dual.py',
             '--skip-dependency-replay'])
        run([flint_python, '-I', '-B', folder/'content_next_m3.py'], compact=True)
        run([flint_python, '-I', '-B', folder/'secant_content_verify.py'])
    print('PASS FULL SECANT REPLAY: global Rem<=13 rho^2/20; '
          'global structural, uniform, and third-order content bounds; '
          'central-energy content coefficient 1077659/27000000. '
          'General content/deficit comparison remains OPEN.', flush=True)


def numerical():
    """N only. Independent quadrature at two resolutions, one real direction.

    Bounds below are optimizer search intervals, never global certificates.
    The imaginary r direction and other tensors are not searched here.
    """
    import numpy as np
    from scipy.special import ellipe
    from scipy.optimize import minimize_scalar
    a,b,p,s = 699/1250,179/1250,2500/1891,3/5
    print('\nN: independent monomial diagnostic, no interval error bounds.')
    for order,panels in ((12,22),(20,30)):
        xg,wg=np.polynomial.legendre.leggauss(order)
        edges=np.linspace(0,1,panels+1)**1.5*7.5
        rad=np.concatenate([(lo+hi)/2+(hi-lo)*xg/2 for lo,hi in zip(edges[:-1],edges[1:])])
        weights=np.concatenate([(hi-lo)*wg/2 for lo,hi in zip(edges[:-1],edges[1:])])
        t=rad**2
        wt=weights*2*rad*np.exp(-t)
        T=t[:,None]; Y=t[None,:]
        measure=wt[:,None]*wt[None,:]
        ell=np.sqrt(T)*(a+b*T)
        def mabs(x,z):
            total=x+z
            return 2/np.pi*total*ellipe(np.clip(4*x*z/(total*total),0,1))
        print(f'  order={order}, panels={panels}, radial_nodes={len(t)}')
        for u in (.02,.0463):
            qcoef=np.sqrt(u/2)*(Y-2)
            def value(r):
                amp=np.sqrt(Y)*np.abs(qcoef+(T-1+s)*r)
                return 2*np.sum(measure*mabs(ell,amp))-(p-s*s)*r*r
            base=value(0.0)
            gaussian=2*np.sum(measure*mabs(ell,np.sqrt(u*Y)))
            deficit=gaussian-base
            opt=minimize_scalar(lambda r:-value(r),bounds=(-.15,.15),method='bounded',
                                options={'xatol':1e-10})
            gain=-opt.fun-base
            h=1e-5
            content=(value(h)-value(-h))/(4*h)
            print(f'  u={u:.4f} D={deficit:.12g} r={opt.x:.12g} '
                  f'gain={gain:.12g} gain/D={gain/deficit:.9g} '
                  f'content^2/D={content*content/deficit:.9g}')


if __name__ == '__main__':
    assert set(sys.argv[1:]).issubset({'--numerical', '--algebra-only', '--tensor-only'}), 'unknown argument'
    assert not ('--algebra-only' in sys.argv and '--tensor-only' in sys.argv), 'choose one partial replay'
    secant_scalars()
    if '--tensor-only' in sys.argv[1:]:
        tensor_replay()
    elif '--algebra-only' not in sys.argv[1:]:
        replay()
    else:
        subprocess.run([sys.executable,'-I','-B',str(Path(__file__).resolve().parent/'secant_exact.py')],check=True)
    if '--numerical' in sys.argv[1:]:
        numerical()
