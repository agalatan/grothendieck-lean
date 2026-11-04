#!/usr/bin/env python3
"""codex-8c4d: regenerate the complete finite scalar identity from pinned original inputs.

Run with --check for byte comparison only. Never invokes Lean or changes source data.
Structural templates preserve the independently reviewed extraction verbatim.
"""
from pathlib import Path
from fractions import Fraction
import argparse, hashlib, json, re

REPO = Path(__file__).resolve().parents[1]
DATA = REPO / 'data/finite-scalar-sum'
OUT = REPO / 'Grothe/UpperChaos'
NS = 'Grothe.UpperChaos.ScalarOriginalBindingDraft'

def digest(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()

def guard(names):
    return '\nopen Lean Elab Command\nrun_cmd do\n  for target in #[' + ',\n      '.join('``'+NS+'.'+n for n in names) + '''] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
'''

def main():
    check = argparse.ArgumentParser(description=__doc__)
    check.add_argument('--check', action='store_true')
    args = check.parse_args()
    manifest = json.loads((DATA/'manifest.json').read_text())
    assert digest(DATA/'templates.json') == manifest['templates_sha256']
    templates = json.loads((DATA/'templates.json').read_text())
    pinmap = {x['path']: x for x in manifest['source_inputs']}
    outputs = {}
    used = []
    def source(name):
        path = 'Grothe/UpperChaos/'+name+'.lean'
        b = (REPO/path).read_bytes()
        assert hashlib.sha256(b).hexdigest() == pinmap[path]['sha256']
        used.append(pinmap[path])
        return b.decode()
    alltext = source('Q0NodeMassAll')
    assert re.search(r'^def rows : List Row := (.+)$',alltext,re.M)[1] == ' ++ '.join(
        f'Grothe.UpperChaos.Q0NodeMassGroup{g:03}.rows' for g in range(22))
    text = source('Q0GaussAddress')
    panels=[]
    blocks=re.findall(r'def panelBlock(\d+) : Array Panel := #\[\n(.*?)\n\]',text,re.S)
    assert [int(k) for k,_ in blocks] == list(range(21))
    pat=r'⟨\(\((\d+) : ℚ\) / (\d+)\), \(\((\d+) : ℚ\) / (\d+)\), (\d+), (\d+)⟩'
    for _,body in blocks:
        for item in body.strip().rstrip(',').split(',\n'):
            m=re.fullmatch(pat,item.strip());assert m
            a,b,c,d,n,offset=map(int,m.groups())
            panels.append((Fraction(a,b),Fraction(c,d),n,offset))
    assert len(panels)==1289
    scan=source('Q0GaussAddressScan')
    assert re.search(r'^def sourcePanels : List Panel := (.+)$',scan,re.M)[1] == ' ++ '.join(
        f'panelBlock{i:03}.toList' for i in range(21))
    exc=source('Q0SourceExceptionIndex')
    assert '(146 ≤ i ∧ i ≤ 274) ∨ (557 ≤ i ∧ i ≤ 684) ∨ (964 ≤ i ∧ i ≤ 1087)' in exc
    scalar = int(re.search(r'def scalarSumLiteral : ℤ := (\d+)', templates['FiniteScalarData'])[1])
    masked = 0
    ledger=[]; chunks=[]; groups=[]
    for g in range(22):
        module=f'Q0NodeMassGroup{g:03}';text=source(module)
        pieces=re.findall(r'def rows(\d+) : List Row := \[\n(.*?)\n\]',text,re.S)
        assert [int(k) for k,_ in pieces]==list(range(len(pieces)))
        assert re.search(r'^def rows : List Row := (.+)$',text,re.M)[1]==' ++ '.join('rows'+k for k,_ in pieces)
        code=f'import Grothe.UpperChaos.ScalarOriginalTerms\nimport Grothe.UpperChaos.{module}\n\n/-! Agent-ID: codex-8c4d. Generated SOURCE-ONLY, UNCOMPILED.\nEach leaf evaluates an ORIGINAL named mass-row sublist, actual mask and original\nsource panel endpoint. No fresh row table or assumed equality is substituted. -/\nset_option warningAsError true\n\nnamespace '+NS+'\n'
        names=[];values=[]
        for k,body in pieces:
            rows=[]
            for item in body.strip().rstrip(',').split(',\n'):
                item=item.strip();assert re.fullmatch(r'⟨\d+(?:, \d+){5}⟩',item)
                rows.append(list(map(int,item[1:-1].split(', '))))
            assert 1<=len(rows)<=128
            total=0
            for i,p,j,L,W,T in rows:
                assert i==len(ledger)
                lo,hi,n,off=panels[p];assert 0<=j<n and off+j==i
                u=hi*10**9;U=-(-u.numerator//u.denominator)
                mask=int(not(146<=p<=274 or 557<=p<=684 or 964<=p<=1087))
                masked += 1 - mask
                total+=mask*T*U**251;ledger.append([i,p,j,L,W,T])
            name=f'chunk{g:03}_{int(k):02}_total';names.append(name);values.append(total)
            code+=f'\ntheorem {name} :\n    ({module}.rows{k}.map rowTerm).sum = ({total} : ℤ) := by\n  decide +kernel\n'
            chunks.append({'source':module+'.rows'+k,'first':rows[0][0],'last':rows[-1][0],
                           'rows':len(rows),'sum':str(total),'theorem':name,'lean_accepted':False})
        gn=f'group{g:03}_total';value=sum(values);expr=' + '.join(f'({x} : ℤ)' for x in values)
        code+=f'\ntheorem {gn} :\n    ({module}.rows.map rowTerm).sum = ({value} : ℤ) := by\n'
        if len(names) == 1:
            code+=f'  exact {names[0]}\n'
        else:
            code+=f'  calc\n    _ = {expr} := by\n      simp only [{module}.rows, List.map_append, List.sum_append, '+', '.join(names)+f']\n    _ = ({value} : ℤ) := by decide +kernel\n'
        names.append(gn);code+='\nend '+NS+'\n'+guard(names)
        outputs[f'ScalarOriginalGroup{g:03}.lean'] = code
        groups.append({'module':f'ScalarOriginalGroup{g:03}','source':module,'sum':str(value),'theorem':gn,'leaves':len(values)})
    assert len(ledger)==21577 and len(chunks)==169 and sum(int(x['sum']) for x in groups)==scalar
    assert masked == manifest['masked_rows']
    assert len(used) == len(pinmap) == 26
    outputs.update({name + '.lean': text for name, text in templates.items()})
    assert outputs.keys() == manifest['outputs'].keys()
    # Validate all outputs before any write; expected hashes bind every theorem and guard.
    for name, code in outputs.items():
        assert hashlib.sha256(code.encode()).hexdigest() == manifest['outputs'][name], name
    for name, code in outputs.items():
        path = OUT/name
        if args.check:
            assert path.read_bytes() == code.encode(), name
        else:
            path.write_text(code)
    print(json.dumps({'modules': len(outputs), 'original_rows': len(ledger),
                      'masked_rows': masked, 'leaf_checks': len(chunks),
                      'byte_identical_to_review': True, 'compiler_invoked': False}))

if __name__ == '__main__':
    main()
