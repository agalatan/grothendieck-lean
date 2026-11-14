#!/usr/bin/env python3
"""codex-a713: exact accepted mixture reoptimization after boundary movement."""
import sys
sys.dont_write_bytecode=True
from pathlib import Path
# -I deliberately omits the script directory; allow only this audited directory.
sys.path.insert(0, str(Path(__file__).resolve().parent))
import json,copy,time
from fractions import Fraction as Q
from improvement_cover import read_current,partition,reprice,save,encode,OUT
from improvement_refine import optimize
from needle_cover_lean import serialize

def main():
    started=time.monotonic();c,original,_,_,maps,_=read_current()
    cover=json.loads((OUT/'improvement_cover_v3.json').read_text())
    tokens=json.loads((OUT/'improvement_certificate_v3.json').read_text())['partition_tokens']
    threshold=Q(cover['target'])-Q(1,10**6);ledger=[];tried=0
    for i,b in enumerate(cover['boxes']):
        if Q(b['upper'])<threshold:continue
        tried+=1;candidate=optimize(c,copy.deepcopy(b))
        if candidate is not None:
            assert Q(candidate['upper'])<=Q(b['upper'])
            if Q(candidate['upper'])<Q(b['upper']):
                ledger.append(dict(index=i,before=b,after=candidate));cover['boxes'][i]=candidate
    partition(tokens,cover['boxes']);upper,binding=reprice(c,cover,True)
    inherited,im,nm,em=maps;strings=serialize(cover,inherited,im,nm,em)
    (OUT/'improvement_ledger_v5.json').write_text(json.dumps(encode(dict(agent='codex-a713',changes=ledger)),indent=2)+'\n')
    save(cover,strings,tokens,dict(original_B=original['target'],original_L=original['lower'],
        input_cover='improvement_cover_v3.json',actual_upper=str(upper),binding_boxes=binding,
        boxes=len(strings),tried=tried,accepted_reweights=len(ledger),seconds=time.monotonic()-started), 'v5')

if __name__=='__main__':main()
