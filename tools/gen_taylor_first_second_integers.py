#!/usr/bin/env python3
"""Generate/replay exact authoritative integer grades for Taylor c1 and c2.

Inputs are pinned binary64 NPZ archives decoded with the existing standard-
library-only reader. Both packed sources and exact band integer targets are
independently replayed before generating anything. Only `--full` writes all
137 grade modules and the global source; default/pilot creates four samples.
No Gaussian error or unconditional upper-bound claim is made here.
"""
from __future__ import annotations
import argparse
from hashlib import sha256
import json
from pathlib import Path
import re
import sys
import zipfile
from gen_taylor_rounding_data import read_f64, count_levels, COMMON_EXPONENT

ROOT=Path(__file__).resolve().parents[1]
DATA=ROOT/'data/taylor-approximants'
LEAN=ROOT/'Grothe/UpperChaos'
MANIFEST=DATA/'first-second-integer-manifest.json'
PART=64
GROUP_PARTS=8
SPECS=[('First','first',91,91,'arb_first_phase_D181.npz',[(0,51),(51,101),(101,151),(151,161),(161,171),(171,181)]),
       ('Second','second',76,46,'arb_phase_power2_D151.npz',[(0,51),(51,71),(71,81),(81,91)])]


def parse_targets(prefix):
    text=(LEAN/'TaylorCenterBandData.lean').read_text()
    marker=f'def {prefix}CenterBandIntegerEnergy : '
    body=text.split(marker,1)[1].split('/--',1)[0]
    found=re.findall(r'^\s*\| (?:\d+|_) => (\d+)',body,re.M)
    return list(map(int,found))


def load_spec(spec):
    cap,name,source_levels,levels,filename,bands=spec
    manifest=json.loads((DATA/'manifest.json').read_text())
    matches=[x for x in manifest['inputs'] if Path(x['path']).name==filename]
    if len(matches)!=1: raise ValueError(f'no unique pinned input for {filename}')
    info=matches[0]; path=DATA/info['path']; raw=path.read_bytes()
    if len(raw)!=info['size_bytes'] or sha256(raw).hexdigest()!=info['sha256']:
        raise ValueError(f'pinned archive mismatch: {filename}')
    with zipfile.ZipFile(path) as archive:
        full=read_f64(archive,'center.npy',(count_levels(source_levels),))
    values=full[:count_levels(levels)]
    if len(values)!=count_levels(levels): raise ValueError('retained count mismatch')
    ints=[m << (COMMON_EXPONENT-e) for m,e in values]
    old=(LEAN/f'Taylor{cap}Data.lean').read_text()
    marker=f'def {name}CenterPackedChunks : Array String := #['
    if marker in old:
        body=old.split(marker,1)[1].split('\n]',1)[0]
        records=','.join(re.findall(r'"([^"\\]*)"',body)).split(',')
        expected=[f'{m}:{e}' for m,e in values]
        if records!=expected: raise ValueError(f'{name}: packed source differs from NPZ or ordering')
    grades=[]
    for q in range(levels):
        start=count_levels(q); stop=count_levels(q+1)
        grade=ints[start:stop]
        if len(grade)!=(q+1)*(q+2): raise ValueError('invalid grade geometry')
        grades.append(grade)
    targets=parse_targets(name)
    got=[sum(x*x for q,g in enumerate(grades) if lo<2*q+1<=hi for x in g) for lo,hi in bands]
    if got!=targets: raise ValueError(f'{name}: band targets differ from source')
    return info,grades,targets,len(full)


def group_files(cap,name,q,values):
    output={}; groupmods=[]; prefix=f'{name}CenterIntegerGrade{q:03d}'
    for g,start in enumerate(range(0,len(values),PART*GROUP_PARTS)):
        v=values[start:start+PART*GROUP_PARTS]
        mod=f'Taylor{cap}IntegerGrade{q:03d}Group{g:03d}'
        parts=[]; lines=['import Mathlib.Data.Int.Basic','',
          '/-! Generated exact source integer arrays; at most 64 entries per part.',
          'Agent-ID: codex-8c4d. -/','namespace Grothe.UpperChaos','']
        for off in range(0,len(v),PART):
            part=f'{prefix}Part{start+off:05d}'; xs=v[off:off+PART]; parts.append((part,xs))
            lines.append(f'def {part} : Array ℤ := #['+', '.join(map(str,xs))+']')
        group=f'{prefix}Group{g:03d}'
        lines.extend(['',f'def {group} : Array ℤ := '+' ++ '.join(p for p,_ in parts),
                      '', 'end Grothe.UpperChaos',''])
        output[LEAN/(mod+'Data.lean')]='\n'.join(lines)
        lines=[f'import Grothe.UpperChaos.{mod}Data','import Grothe.UpperChaos.ArraySquareEnergy',
               'import Lean.Util.CollectAxioms','import Lean.Elab.Command','',
               '/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/',
               f'namespace Grothe.UpperChaos.{mod}Check','open ArraySquareEnergy','']
        for i,(part,xs) in enumerate(parts):
            lines.extend([f'private theorem len{i} : {part}.size = {len(xs)} := by decide +kernel',
                          f'private theorem sum{i} : energy {part} = {sum(x*x for x in xs)} := by decide +kernel'])
        ln=', '.join(f'len{i}' for i in range(len(parts)))
        en=', '.join(f'sum{i}' for i in range(len(parts)))
        size_append='Array.size_append, ' if len(parts)>1 else ''
        energy_append='energy_append, ' if len(parts)>1 else ''
        finish='\n  decide +kernel' if len(parts)>1 else ''
        lines.extend(['',f'theorem group_length : {group}.size = {len(v)} := by',
                      f'  simp only [{group}, {size_append}{ln}]','',
                      f'theorem group_energy : energy {group} = {sum(x*x for x in v)} := by',
                      f'  simp only [{group}, {energy_append}{en}]'+finish,'',
                      f'end Grothe.UpperChaos.{mod}Check','open Lean Elab Command','run_cmd do',
                      f'  for target in #[``Grothe.UpperChaos.{mod}Check.group_length,',
                      f'      ``Grothe.UpperChaos.{mod}Check.group_energy] do',
                      '    for ax in ← Lean.collectAxioms target do',
                      '      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do',
                      '        throwError m!"{target} has forbidden axiom {ax}"',''])
        output[LEAN/(mod+'Check.lean')]='\n'.join(lines)
        groupmods.append((group,mod))
    grade=f'{prefix}'; mod=f'Taylor{cap}IntegerGrade{q:03d}'
    imports='\n'.join(f'import Grothe.UpperChaos.{m}Data' for _,m in groupmods)
    output[LEAN/(mod+'Data.lean')]=imports+'\n\nnamespace Grothe.UpperChaos\n'+f'def {grade} : Array ℤ := '+' ++ '.join(x for x,_ in groupmods)+'\nend Grothe.UpperChaos\n'
    imports='\n'.join(f'import Grothe.UpperChaos.{m}Check' for _,m in groupmods)
    lens=', '.join(f'{m}Check.group_length' for _,m in groupmods)
    sums=', '.join(f'{m}Check.group_energy' for _,m in groupmods)
    size_append='Array.size_append, ' if len(groupmods)>1 else ''
    energy_append='energy_append, ' if len(groupmods)>1 else ''
    finish='\n  decide +kernel' if len(groupmods)>1 else ''
    check=f'''import Grothe.UpperChaos.{mod}Data
{imports}
import Lean.Util.CollectAxioms
import Lean.Elab.Command
/-! Exact source grade size and integer square energy from bounded parts.
No Gaussian error asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.{mod}Check
open ArraySquareEnergy

theorem grade_length : {grade}.size = {len(values)} := by
  simp only [{grade}, {size_append}{lens}]

theorem grade_energy : {grade}.foldl (fun acc x => acc + x ^ 2) (0 : ℤ) =
    {sum(x*x for x in values)} := by
  change energy {grade} = _
  simp only [{grade}, {energy_append}{sums}]{finish}

end Grothe.UpperChaos.{mod}Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.{mod}Check.grade_length,
      ``Grothe.UpperChaos.{mod}Check.grade_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{{target}} has forbidden axiom {{ax}}"
'''
    output[LEAN/(mod+'Check.lean')]=check
    return output,len(groupmods),sum((len(values[start:start+PART*GROUP_PARTS])+PART-1)//PART for start in range(0,len(values),PART*GROUP_PARTS))


def generate(mode):
    output={}; meta={'scope':'external exact input and packed-source replay, not a Lean source-equality proof or Gaussian error',
                     'common_exponent':COMMON_EXPONENT,
                     'part_size':PART,'parts_per_group':GROUP_PARTS,'centers':{}}
    for spec in SPECS:
        cap,name,source_levels,levels,filename,bands=spec
        info,grades,targets,full_count=load_spec(spec)
        meta['centers'][name]={'input':info['path'],'input_sha256':info['sha256'],
            'input_records':full_count,'retained_records':sum(map(len,grades)),
            'retained_levels':levels,'band_ranges':bands,'band_integer_energies':list(map(str,targets)),
            'grade_details':[{'grade':q,'length':len(v),'integer_square_sum':str(sum(x*x for x in v)),
               'integer_values_sha256':sha256(','.join(map(str,v)).encode()).hexdigest()} for q,v in enumerate(grades)]}
        selected=range(levels) if mode=='full' else [0,levels-1]
        for q in selected:
            files,_,_=group_files(cap,name,q,grades[q]);output.update(files)
        if mode=='full':
            imports='\n'.join(f'import Grothe.UpperChaos.Taylor{cap}IntegerGrade{q:03d}Data' for q in range(levels))
            value=' ++\n  '.join(f'{name}CenterIntegerGrade{q:03d}.toList' for q in range(levels))
            output[LEAN/f'Taylor{cap}IntegerData.lean']=imports+'\n\n/-! Exact retained integer coefficients in grade-major order. -/\nnamespace Grothe.UpperChaos\n'+f'def {name}CenterIntegerValues : List ℤ :=\n  {value}\nend Grothe.UpperChaos\n'
    output[MANIFEST]=json.dumps(meta,indent=2)+'\n'
    return output


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--full',action='store_true',help='generate/check every retained grade and global source')
    p.add_argument('--check',action='store_true',help='compare expected bytes without writing')
    args=p.parse_args(); outputs=generate('full' if args.full else 'pilot'); failures=[]
    for path,text in outputs.items():
        if args.check:
            if not path.is_file() or path.read_text()!=text: failures.append(str(path.relative_to(ROOT)))
        else:
            if path.exists() and path.read_text()!=text:
                raise FileExistsError(f'refusing to overwrite changed file: {path}')
            path.parent.mkdir(parents=True,exist_ok=True);path.write_text(text)
    if failures:
        print('\n'.join(failures),file=sys.stderr);raise SystemExit(1)
    print(f'{"verified" if args.check else "wrote"} {len(outputs)} files; {"all" if args.full else "four pilot"} grades; input/packed/energy replays passed')

if __name__=='__main__': main()
