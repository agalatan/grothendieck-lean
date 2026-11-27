# claude-b9ee worker d5newcap: replay the reviewer verifier on cert_N_final.json and write the exact endpoint bounds per row
import json, sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import own_verifier as OV
from fractions import Fraction as F
cert = json.load(open(sys.argv[1])); rows = []
ok, worst = OV.verify_cert(cert, quiet=True)
for i, row in enumerate(cert["rows"]):
    res = OV.verify_row(row)
    b = res["bounds"]; keys = sorted(b.keys(), key=lambda k: str(k))
    rows.append(dict(s_lo=row["s_lo"], s_hi=row["s_hi"], bound=str(res["bound"]), bounds={str(k): str(v) for k, v in b.items()}))
    print(i, row["s_lo"], row["s_hi"], float(res["bound"]), {str(k): float(v) for k, v in b.items()})
json.dump(dict(source="cert_N_final.json (sha256 fb7d22b8...), reviewer verifier own_verifier.py", verified=bool(ok), max_bound=str(worst), claim=cert["claim"], rows=rows), open(sys.argv[2], "w"), indent=1)
print("verified", ok, "max", float(worst), "claim", cert["claim"])
