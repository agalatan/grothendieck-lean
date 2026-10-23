"""Assemble cert-0745c: new row files (built by build_cert.py into NEWDIR) + unchanged rows copied from cert-0745b; manifest with sha256 of every row file (B = "1" until mkenv).
usage: assemble.py OLDCERT NEWDIR OUT"""
import sys, os, json, hashlib, shutil
old, new, out = sys.argv[1:4]; os.makedirs(out, exist_ok=True); man = json.load(open(os.path.join(old, 'manifest.json'))); files = {}
for fn in sorted(f for f in man['files'] if f.startswith('row_')):
    src = os.path.join(new, fn) if os.path.exists(os.path.join(new, fn)) else os.path.join(old, fn)
    shutil.copyfile(src, os.path.join(out, fn)); files[fn] = hashlib.sha256(open(os.path.join(out, fn), 'rb').read()).hexdigest()
    print(fn, 'NEW' if src.startswith(new) else 'unchanged', files[fn][:16])
json.dump(dict(eps=man['eps'], B="1", files=files), open(os.path.join(out, 'manifest.json'), 'w'), indent=1)
