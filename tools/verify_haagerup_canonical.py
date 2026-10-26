"""Independent directed replay of the canonical Haagerup resolvent completion."""
from fractions import Fraction as Q
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import re
import time


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[1]
    source = root / 'Grothe/Haagerup/CanonicalData.lean'
    text = source.read_text()

    def parameter(name):
        values = re.findall(r'^def ' + name + r' : [ℕℚ] := ([0-9 /]+)$', text, re.M)
        assert len(values) == 1, name
        return Q(values[0].replace(' ', ''))

    k, order, cutoff = (int(parameter(n)) for n in ('start', 'order', 'cutoff'))
    head_cap, remainder_cap = (parameter(n) for n in ('headCap', 'remainderCap'))
    data_path = root / 'data/haagerup-resolvent/certificate.json'
    data = json.loads(data_path.read_text())
    spec = importlib.util.spec_from_file_location('generator', root/'tools/gen_haagerup_power.py')
    generator = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(generator)
    assert (root/'Grothe/Haagerup/PowerCheck.lean').read_text() == generator.render(data)
    pl, rl = ([Q(x) for x in data[n]] for n in ('P', 'R'))
    eta, seed_cap = (Q(data[n]) for n in ('defect_cap', 'seed_cap'))
    seed = data['seed_power']
    assert sum(map(abs, pl)) <= 1 and 0 <= eta < 1
    assert rl[0] == 1 and sum(map(abs, rl[1:])) + eta <= 2
    assert seed <= 2*k+1 and seed_cap <= Q(1, 2)

    from flint import arb, arb_poly, ctx, __version__
    ctx.prec = 192
    ctx.threads = 1
    def ball(q):
        q = Q(q)
        return arb(q.numerator)/q.denominator
    def norm(p):
        return sum((abs(c) for c in p.coeffs()), arb(0))
    def upper(x):
        return str(x.upper().fmpq())
    start_time = time.time()
    p, r = (arb_poly([ball(q) for q in qs]) for qs in (pl, rl))
    x = arb_poly([0, 1])
    a = x*p*p
    defect = norm(1-r*(1-a))
    seed_norm = norm(r*p**seed)
    assert defect < ball(eta) and seed_norm < ball(seed_cap)

    coeff = [Q(1)]
    for j in range(k+order):
        coeff.append(coeff[-1]*Q((2*j+1)**2, 4*(j+1)*(j+2)))
    ds, current = [], coeff[k:k+order+1]
    while current:
        ds.append(current[0])
        current = [u-v for u, v in zip(current, current[1:])]
    assert all(v >= 0 for v in ds)
    assert coeff[k] <= Q(1, 10000) and ds[order] <= Q(37, 10**13)
    head = arb_poly([])
    for q in reversed(coeff[:k]):
        head = a*head+ball(q)
    correction = arb_poly([])
    for q in reversed(ds[:order]):
        correction = (-r*a)*correction+ball(q)
    completed = p*head + r*x**k*p**(2*k+1)*correction - ball(pl[0])
    head_norm = norm(completed)
    assert completed.degree() < cutoff and head_norm < ball(head_cap)
    remainder = (2**order*ds[order] + eta*sum(2**j*ds[j] for j in range(order)))/(1-eta)
    coarse = (2**order*Q(37, 10**13) + eta*(2**order-1)*Q(1, 10000))/(1-eta)
    assert remainder <= coarse <= remainder_cap
    assert pl[0]-head_cap-remainder_cap > 0
    endpoint = Q(4)/(Q('3.14159265358979323846')*(pl[0]-head_cap-remainder_cap))
    proof = (root/'Grothe/Haagerup/CanonicalProof.lean').read_text()
    public_text = (root/'Grothe/Haagerup/Power.lean').read_text()
    targets = re.findall(r'IsGrothendieckBound \(([0-9 /]+)\)', public_text)
    assert len(targets) == 2 and targets[0] == targets[1]
    public = Q(targets[0].replace(' ', ''))
    assert f'IsGrothendieckBound ({targets[0]})' in proof
    assert endpoint < public
    names = ['Grothe/Haagerup/Power.lean', 'Grothe/Haagerup/PowerCheck.lean',
             'Grothe/Haagerup/CanonicalData.lean', 'Grothe/Haagerup/CanonicalCheck.lean',
             'Grothe/Haagerup/CanonicalProof.lean', 'Grothe/Haagerup/CompleteMonotone.lean',
             'Grothe/Upper/FiniteDifference.lean', 'Grothe/Upper/ResolventCompletion.lean',
             'Grothe/Upper/ResolventCertificate.lean', 'GrotheKernel/ResolventCompletion.lean']
    result = dict(status='PASS_DIRECTED_CANONICAL_HAAGERUP', flint_version=__version__,
        precision_bits=ctx.prec, start=k, order=order, degree=completed.degree(), cutoff=cutoff,
        candidate_sha256=hashlib.sha256(data_path.read_bytes()).hexdigest(),
        source_sha256={n: hashlib.sha256((root/n).read_bytes()).hexdigest() for n in names},
        verifier_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        inverse_defect_upper=upper(defect), seed_upper=upper(seed_norm),
        completed_head_upper=upper(head_norm), head_cap=str(head_cap),
        differences=list(map(str, ds)), remainder_upper=str(remainder),
        coarse_remainder_upper=str(coarse), remainder_cap=str(remainder_cap),
        arithmetic_endpoint=str(endpoint), unconditional_upper=str(public),
        seconds=time.time()-start_time)
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
