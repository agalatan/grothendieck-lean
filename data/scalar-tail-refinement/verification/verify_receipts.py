#!/usr/bin/env python3
"""Check archived replay scope and exact scalar power16 arithmetic.

No upstream code is downloaded or executed. This checks evidence bindings and
rational arithmetic; it does not compile Lean, regenerate integral tables, or
prove that published integral enclosures match the Gaussian functions.
"""
import argparse
from datetime import datetime, timezone
from fractions import Fraction as Q
import hashlib
import json
import math
from pathlib import Path, PurePosixPath


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
COMMIT = '7139f4cb8d0f30c2eb4c1267c46732a9d5229c3f'
STAGES = {
    'support_compression_certificate/complex_upper_convex_2e6_polynomial_certificate.py':
        'second radial polynomial exact algebra: PASS',
    'support_compression_certificate/complex_upper_saha_visible_energy_refinement.py':
        'origin-layer visible-energy refinement: PASS',
    'audit_sparse6_altgroups.py': 'direct six-branch / seven-atom certificate: PASS',
    'audit_best7_final_arithmetic.py': 'exact final-arithmetic audit: PASS',
}
TABLES = {
    'support_compression_certificate/complex_upper_origin_layer_coefficients_n120_analytic.npz':
        'fc29fa555fb66c5cd6a2ac53dbd2508207b6058cfe0b339163faadeb85ad54da',
    'origin_tail_25_36.npz':
        '8bcc654f4fd44881a7b487fe1336a8905aaa2d1b52deca45e622e1c397fb03aa',
}


def require(condition, message):
    if not condition:
        raise ValueError(message)


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def load(name):
    return json.loads((HERE/name).read_text())


def convolve(a, b):
    answer = [0]*(len(a)+len(b)-1)
    for i, x in enumerate(a):
        if x:
            for j, y in enumerate(b):
                if y:
                    answer[i+j] += x*y
    return answer


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--certificate', type=Path, default=HERE.parent/'certificate.json')
    parser.add_argument('--out', type=Path)
    args = parser.parse_args()
    rows = (HERE/'SHA256SUMS').read_text().splitlines()
    checked = []
    for line in rows:
        expected, relative = line.split(maxsplit=1)
        path = (ROOT/relative).resolve()
        require(path.is_relative_to(HERE.parent.resolve()), 'Manifest path escapes package: '+relative)
        require(sha(path) == expected, 'Packaged file hash mismatch: '+relative)
        checked.append(relative)
    require(len(checked) == len(set(checked)) and checked, 'Empty or duplicate package manifest')

    receipt, manifest = load('UPSTREAM_REPLAY.json'), load('UPSTREAM_MANIFEST.json')
    require(receipt['complete'] is True and receipt['coefficient_tables_regenerated'] is False,
            'Unexpected replay or table regeneration scope')
    require(receipt['commit'] == manifest['commit'] == COMMIT, 'Upstream commit mismatch')
    require(receipt['manifest_sha256'] == sha(HERE/'UPSTREAM_MANIFEST.json'), 'Upstream manifest binding failed')
    require(receipt['source_sha256'] == sha(HERE/'REPLAY_DRIVER.py'), 'Replay driver binding failed')
    pins = {row['path']: row for row in manifest['files']}
    for path, expected in TABLES.items():
        require(pins[path]['sha256'] == expected, 'Pinned table hash mismatch: '+path)
    stages = receipt['stages']
    require([row['script'] for row in stages] == list(STAGES), 'Replay stages differ')
    for row in stages:
        script = row['script']
        require(row['returncode'] == 0, 'Unsuccessful upstream stage: '+script)
        require(row['source_sha256'] == pins[script]['sha256'], 'Stage source pin differs: '+script)
        log = HERE/'upstream-logs'/PurePosixPath(row['log']).name
        require(sha(log) == row['log_sha256'], 'Stage log binding failed: '+script)
        require(STAGES[script] in log.read_text(), 'Expected successful stage marker absent: '+script)

    audit, source = load('POWER16_ARITHMETIC_AUDIT.json'), load('SCALAR_BRANCH5.json')
    require(audit['input_sha256'] == sha(HERE/'SCALAR_BRANCH5.json'), 'Power input binding failed')
    require(source['source_sha256'] == pins['audit_sparse6_altgroups.py']['sha256'], 'P5 canonical source pin differs')
    P = list(map(Q, source['P']))
    denominator = math.lcm(*(x.denominator for x in P))
    power = [int(x*denominator) for x in P]
    for unused in range(4):
        power = convolve(power, power)
    norm = Q(sum(map(abs, power)), denominator**16)
    cap = Q(581, 1000)
    require(sum(map(abs, P)) == Q(999999999993, 10**12), 'Unexpected P5 coefficient budget')
    require(norm == Q(audit['P16_l1']) and norm < cap, 'Exact sixteenth-power norm failed')
    require(len(power) == 593 and audit['P16_degree'] == 592, 'Power degree/cutoff differs')
    require(Q(audit['power_cap']) == cap, 'Power cap differs')

    # Independent finite arithmetic behind the standard-axiom Wallis proof.
    # The infinite suffix deduction itself is in the Lean module.
    phase_r = [Q(1)]
    for k in range(120):
        phase_r.append(phase_r[-1]*Q((2*k+1)**2, 4*(k+1)*(k+2)))
    phase_chunk = sum(phase_r[67:120])
    phase_majorant = phase_r[120]*121*241
    wallis_rational = Q(355, 452)*(phase_chunk+phase_majorant/240)
    require(phase_chunk == 4*120*121*phase_r[120]-4*67*68*phase_r[67],
            'Exact phase prefix identity differs')
    require(wallis_rational < Q(1, 268), 'Finite phase-tail comparison failed')

    # Independent constants identified in PROOF.md, not read from assertions
    # of the arithmetic receipt that this calculation checks.
    paper = {
        'q0_lower': Q('0.71179640805640433452'),
        'nonlinear_prefix_upper': Q('1.074829404498064e-6'),
        'first_67_complete_outer_tail_upper': Q('2.699176355797438e-12'),
        'other_weighted_tails_upper': Q('1.040224125770398e-7'),
        'selector_mass': Q(1250000000000000121997, 1250000000000000000000),
        'branch5_weight': Q('0.0000169358532612748746'),
    }
    for key, value in paper.items():
        require(Q(audit['paper_inputs'][key]) == value, 'Paper arithmetic input differs: '+key)
    outer = paper['branch5_weight']*cap**8/268
    residual = sum(paper[key] for key in ('nonlinear_prefix_upper',
        'first_67_complete_outer_tail_upper', 'other_weighted_tails_upper'))+outer
    score = (paper['q0_lower']-residual)/paper['selector_mass']
    claim = Q(35122461, 25000000)
    require(Q(audit['replacement']['new_outer_reserve']) == outer, 'Outer reserve differs')
    require(Q(audit['assembled']['residual_upper']) == residual, 'Residual ledger differs')
    require(Q(audit['assembled']['normalized_score_lower']) == score, 'Normalized score differs')
    require(Q(audit['assembled']['claim_times_score_minus_one']) == claim*score-1 > 0,
            'Reciprocal acceptance margin failed')

    certificate = json.loads(args.certificate.read_text())
    require(list(map(Q, certificate['P'])) == P, 'Production coefficient list differs')
    for key, expected in {'power':16, 'outer_start':67, 'quotient':8, 'wallis_denominator':268}.items():
        require(certificate[key] == expected, 'Production integer parameter differs: '+key)
    require(certificate['schema_version'] == 2, 'Production schema differs')
    require(Q(certificate['ratio']) == cap, 'Production power cap differs')
    require(certificate['weighted_split'] == 160, 'Production weighted split differs')

    # Recompute the current weighted tail independently of the generator.
    # The archived power audit above retains its original coarser ledger.
    while len(phase_r) <= 160:
        k = len(phase_r) - 1
        phase_r.append(phase_r[-1]*Q((2*k+1)**2, 4*(k+1)*(k+2)))
    weighted_prefix = sum(phase_r[k]*cap**((2*k+1)//16) for k in range(67, 160))
    weighted_suffix = cap**20*phase_r[160]*161*321/320
    weighted_bound = Q(355, 452)*(weighted_prefix+weighted_suffix)
    outer = paper['branch5_weight']*weighted_bound
    residual = sum(paper[key] for key in ('nonlinear_prefix_upper',
        'first_67_complete_outer_tail_upper', 'other_weighted_tails_upper'))+outer
    score = (paper['q0_lower']-residual)/paper['selector_mass']
    claim = Q(14048984303, 10000000000)
    require(Q(certificate['reciprocal_claim']) == claim, 'Production reciprocal claim differs')
    require(claim*score > 1, 'Weighted reciprocal acceptance margin failed')
    budget_map = {'branch5_weight':'branch5_weight', 'slope_lower':'q0_lower',
        'prefix_upper':'nonlinear_prefix_upper', 'finite67_upper':'first_67_complete_outer_tail_upper',
        'other_tails_upper':'other_weighted_tails_upper', 'selector_mass':'selector_mass'}
    for production, audited in budget_map.items():
        require(Q(certificate['paper_budgets'][production]) == paper[audited],
                'Production paper budget differs: '+production)
    for key, expected in {'P_l1':sum(map(abs, P)), 'power_l1':norm,
                          'weighted_outer_bound':weighted_bound, 'outer_reserve':outer,
                          'residual_upper':residual, 'score_lower':score}.items():
        require(Q(certificate['exact_arithmetic'][key]) == expected,
                'Production arithmetic differs: '+key)
    provenance = certificate['provenance']
    require(provenance['upstream_commit'] == COMMIT, 'Production upstream commit differs')
    require(provenance['coefficient_source_sha256'] == pins['audit_sparse6_altgroups.py']['sha256'],
            'Production coefficient source hash differs')

    result = dict(status='PASS_ARCHIVED_REPLAY_AND_EXACT_POWER16_SCOPE',
        checked_utc=datetime.now(timezone.utc).isoformat(), upstream_commit=COMMIT,
        packaged_files_verified=len(checked), upstream_stage_count=4,
        all_stage_returncodes=0, coefficient_tables_regenerated=False,
        upstream_manifest_sha256=sha(HERE/'UPSTREAM_MANIFEST.json'),
        replay_receipt_sha256=sha(HERE/'UPSTREAM_REPLAY.json'),
        independent_power16_receipt_sha256=sha(HERE/'POWER16_ARITHMETIC_AUDIT.json'),
        production_certificate_sha256=sha(args.certificate),
        verified_power_norm=str(norm), power_cap=str(cap), reciprocal_claim=str(claim),
        wallis_finite_rational_upper=str(wallis_rational),
        weighted_split=160, weighted_outer_bound=str(weighted_bound),
        weighted_outer_reserve=str(outer), strict_product_margin=str(claim*score-1),
        lean_compilation_performed=False,
        scope='Archived non-regeneration replay and exact polynomial/ledger arithmetic only. '
              'Published Gaussian and integral claims are cited in PROOF.md; '
              'this check is not a new unconditional Lean Grothendieck endpoint.')
    if args.out:
        args.out.write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
