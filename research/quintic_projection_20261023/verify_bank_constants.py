#!/usr/bin/env python3
"""Exact-rational aggregation of the two bank certificate constants.

This only checks rational arithmetic/hashes from the companion Arb replays.
The original finite Gaussian projection and endpoint identities remain the
explicit analytic inputs documented in their verifiers and repository note.
"""
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path

root=Path(__file__).parent
names={'old':'quintic-all-moments-replay.json',
       'new':'exchange-active-cancellation-replay.json',
       'endpoint':'exchange-endpoint-lower-replay.json'}
data={key:json.loads((root/name).read_text()) for key,name in names.items()}
assert all(row['status']=='PASS' for row in data.values())
for replay,input_name,verifier_name in [
    (data['old'],'quintic_phase_profiles.json','quintic_phase_moments.py'),
    (data['new'],'exchange-active-cancellation-input.json','certify_exchange_cancellation.py')]:
    assert hashlib.sha256((root/input_name).read_bytes()).hexdigest()==replay['input_sha256']
    assert hashlib.sha256((root/verifier_name).read_bytes()).hexdigest()==replay['verifier_sha256']
assert hashlib.sha256((root/'verify_exchange_endpoint_lower.py').read_bytes()).hexdigest()==data['endpoint']['verifier_sha256']
assert hashlib.sha256((root/names['new']).read_bytes()).hexdigest()==data['endpoint']['active_replay_sha256']
old_profiles=[]
old_cubic_intervals=[]
for row in data['old']['profiles'][:2]:
    p_upper=Q(row['moment_rational_bounds']['m0'][1])**2
    s5_upper=Q(row['full_fifth_finite_bounds'][1])
    assert p_upper<Q('71314/100000')
    assert s5_upper<Q('-4042/1000000')
    h=list(map(Q,row['moment_rational_bounds']['m1']))
    q=list(map(Q,row['moment_rational_bounds']['mq']))
    h2,q2=[x*x for x in h],[x*x for x in q]
    assert h[0]<h[1]<0 and 0<q[0]<q[1]
    delta=Q(1,10**12+1)
    cubic=[min(h2)-max(q2)-delta,max(h2)-min(q2)+delta]
    old_cubic_intervals.append(cubic)
    old_profiles.append({'c':row['c'],'b':row['b'],'p_upper':str(p_upper),
                         'actual_finite_s5_upper':str(s5_upper),
                         'actual_finite_s3_bounds':list(map(str,cubic))})
assert old_cubic_intervals[0][0]>0>old_cubic_intervals[1][1]
old_C1_lower=Q(data['endpoint']['profiles'][2]['endpoint_lower']['rational_bounds'][0])
new_C1_lower=Q(data['endpoint']['exact_finite_weight_mixed_endpoint_lower']['rational_bounds'][0])
new_p_upper=max(Q(row['finite_support_payoff']['rational_bounds'][1])
                for row in data['new']['profiles'])
assert old_C1_lower>Q('7/10') and new_C1_lower>Q('18/25')
assert new_p_upper<Q('35619/50000')
result={'status':'PASS','finite_m':'1000000000000',
        'old_bank':{'profiles':old_profiles,'p_upper_strict':'71314/100000',
                    's3_exact':'0','s5_upper_strict':'-4042/1000000',
                    'C1_lower':str(old_C1_lower),'C1_lower_strict':'7/10'},
        'new_bank':{'p_upper_from_common_support':str(new_p_upper),
                    'p_upper_strict':'35619/50000','s3_exact':'0','s5_exact':'0',
                    'C1_lower':str(new_C1_lower),'C1_lower_strict':'18/25'},
        'new_p_upper_reason':'Actual finite positive Cramer weights cancel s3,s5, so p equals their convex mixture of the three certified finite support payoffs.',
        'old_mixture_reason':'The certified actual finite cubic intervals have strict opposite signs. Thus theta=-s3_2/(s3_1-s3_2) lies strictly between zero and one and makes the cubic coefficient exactly zero. Both individual columns have the stated p and s5 bounds, inherited by this convex mixture. The balanced cmax endpoint grid bounds both profiles below.',
        'sources':{key:{'path':name,'sha256':hashlib.sha256((root/name).read_bytes()).hexdigest()}
                   for key,name in names.items()},
        'verifier_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
(root/'bank-constants-replay.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
