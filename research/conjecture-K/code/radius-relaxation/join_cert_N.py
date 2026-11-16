#!/usr/bin/env python3
"""Reassemble cert_N_final.json (the certificate of E|q| <= 0.93 ||q||_2) from cert_N_final/head.json and
cert_N_final/row_NN.json, and check its SHA-256.  The file is kept in pieces because the research folder holds no
certificate above 300 KB (research/README.md).  Usage: python3 -I join_cert_N.py [output path]
"""
import glob, hashlib, json, os, sys

HERE = os.path.dirname(os.path.abspath(__file__))
SHA256 = 'fb7d22b8bf268bc2960d5f5ffa522d0dddf8b4daa6a95110afd8a13ba321df44'
head = json.load(open(os.path.join(HERE, 'cert_N_final', 'head.json'), encoding='utf-8'))
rows = [json.load(open(p, encoding='utf-8')) for p in sorted(glob.glob(os.path.join(HERE, 'cert_N_final', 'row_*.json')))]
cert = {'kind': head['kind'], 'rows': rows, 'claim': head['claim'], 'statement': head['statement']}
data = json.dumps(cert).encode()
got = hashlib.sha256(data).hexdigest()
if got != SHA256:
    sys.exit('SHA-256 mismatch: ' + got)
out = sys.argv[1] if len(sys.argv) > 1 else os.path.join(HERE, 'cert_N_final.json')
with open(out, 'wb') as f:
    f.write(data)
print(len(rows), 'rows,', len(data), 'bytes, sha256', got, '->', out)
