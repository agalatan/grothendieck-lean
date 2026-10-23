#!/usr/bin/env python3
"""Focused rejection controls for the scalar cubic-family replay."""
import argparse
import copy
import importlib.util
import json
from pathlib import Path
import time

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--verifier', type=Path, required=True)
parser.add_argument('--certificate', type=Path, required=True)
args = parser.parse_args()
spec = importlib.util.spec_from_file_location('tested_cubic_family_floor', args.verifier)
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
source = json.loads(args.certificate.read_text())
started = time.monotonic()
positive = module.verify(source)
if positive['status'] != 'PASS':
    raise RuntimeError('The positive control failed')
controls = []


def reject(name, mutation):
    data = copy.deepcopy(source)
    mutation(data)
    try:
        module.verify(data)
    except (ValueError, ArithmeticError, TypeError, ZeroDivisionError) as error:
        controls.append({'name': name, 'status': 'REJECTED',
                         'exception': type(error).__name__, 'reason': str(error)})
    else:
        raise RuntimeError('An invalid control was accepted: '+name)


reject('inflated advertised floor', lambda d: d.update(uniform_floor='1'))
reject('undersized reciprocal ceiling', lambda d: d.update(ratio_ceiling='7/5'))
reject('finite dimension loses opposite signs', lambda d: d.update(m='65536'))
reject('reversed profile slopes', lambda d: d['profiles'].reverse())
reject('zero remote phase coefficient', lambda d: d['profiles'][0].update(b='0'))
reject('negative remote phase coefficient', lambda d: d['profiles'][0].update(b='-1'))
reject('external weights in exact-cancellation mode', lambda d: d.update(weights=['1/2', '1/2']))
reject('complex parameter without exact cancellation',
       lambda d: d.update(exact_zero_slope=False, weights=['1/2', '1/2']))
reject('nonprobability weights',
       lambda d: d.update(exact_zero_slope=False, weights=['1', '1']))
reject('reversed real parameter interval',
       lambda d: d.update(exact_zero_slope=False, weights=['1', '0'], epsilon_domain=['1', '0']))
reject('insufficient working precision', lambda d: d.update(precision_bits=95))
reject('noninteger dimension', lambda d: d.update(m='1.2'))
reject('zero dimension', lambda d: d.update(m='0'))
print(json.dumps({'status': 'PASS', 'positive_controls': 1,
                  'negative_controls': controls, 'seconds': time.monotonic()-started}, indent=2))
