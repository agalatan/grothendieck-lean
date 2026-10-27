#!/usr/bin/env python3
"""Generate full independent 64-mode signed/mean certificate candidates.

Exact source fractions and the pinned replay give check targets only. Lean
must recompute every expression, and the analytic integral/endpoint bridges
and all CI verification remain separate obligations.
"""
from __future__ import annotations
import argparse, hashlib, json, sys
from fractions import Fraction as Q
from pathlib import Path
import gen_origin_unweighted64_helper as g

ROOT=Path(__file__).resolve().parents[1]
SCALE=10**18
DELTA=Q(1001,10**15)
PI_LO=Q(314159265358979323846,10**20)
PI_HI=Q(314159265358979323847,10**20)
TARGETS={'left':(Q(46593520,10**8),Q(46592860,10**8),Q(46592855,10**8)),
         'right':(Q(46577720,10**8),Q(46577055,10**8),Q(46577050,10**8))}

def sqrt_bounds(q,scale=10**12):
 import math
 n=math.isqrt((q.numerator*scale*scale)//q.denominator)
 return Q(n,scale),Q(n+1,scale)
def ceil(q):return -((-q.numerator)//q.denominator)
def enc(q):return ((q*SCALE).__floor__(),ceil(q*SCALE))
def qlist(xs):return g.qlist(xs)
def leanq(x):return g.leanq(x)
def ints(xs):return g.ints(xs)
def mulmin(a,b,c,d):return min(a*c,a*d,b*c,b*d)

def rows(d,side):
 runs=[x for x in d['panels']['runs'] if x['side']==side and x['degree_W']==16]
 if len(runs)!=1:raise ValueError('bad panel run '+side)
 rec=[x for x in d['receipt']['records'] if x['side']==side]
 cells=[];cur=Q(0)
 for i,p in enumerate(runs[0]['certificate']):
  a,b=Q(p['a']),Q(p['b'])
  if a!=cur:raise ValueError('panel gap')
  for x,y in g.split(a,b):
   if x!=cur or not a<=x<y<=b:raise ValueError('subpanel gap')
   cells.append((x,y,i));cur=y
 if cur!=8 or len(cells)!=98 or len(rec)!=98:raise ValueError('bad cover')
 for (a,b,j),x in zip(cells,rec):
  if (a,b,j)!=(Q(x['a']),Q(x['b']),x['panel']):raise ValueError('receipt mismatch')
  for key in ('correlation','Jre','Jim'):
   l,h=x[key]
   if type(l) is not int or type(h) is not int or l>h:raise ValueError('bad interval')
 return cells,rec

def alpha(d,side):
 raw=d['witness']['sides'][side]['alpha']
 if len(raw)!=120:raise ValueError('witness length')
 return [(Q(a)/Q((2*n+1)**2),Q(b)/Q((2*n+1)**2)) for n,(a,b) in enumerate(raw[:64])]

def rational_facts(d,side,rec):
 v=alpha(d,side);raw=d['origin']['definitions'];r=Q(raw[side+'Real'][0]);im=Q(raw[side+'Imag'][0]);q=r*r+im*im
 rl,rh=sqrt_bounds(q); pl,ph=sqrt_bounds(PI_LO/4)[0],sqrt_bounds(PI_HI/4)[1]
 rho=Q(1);k=Q(0)
 for n,(a,b) in enumerate(v):
  k+=Q(2*n+1)*(-1)**n*rho*(r*a+im*b)
  rho*=Q(2*n+1,2*n+2)
 B=sum((n+1)*(2*n+1)**2*(a*a+b*b) for n,(a,b) in enumerate(v))
 if not (k<0 and 0<rl<=rh and 0<pl<=ph):raise ValueError('unexpected endpoint sign')
 kUpper=Q(ceil(k*10**12),10**12)
 endpoint=pl*kUpper/rh
 endhi={'left':Q(-23299627,10**8),'right':Q(-23291728,10**8)}[side]
 if not (k<=kUpper<0 and endpoint<=endhi):raise ValueError('negative endpoint cap '+side)
 ur=enc(min(r/rl,r/rh))[0],enc(max(r/rl,r/rh))[1]
 ui=enc(min(im/rl,im/rh))[0],enc(max(im/rl,im/rh))[1]
 jr=(Q(sum(x['Jre'][0] for x in rec),SCALE),Q(sum(x['Jre'][1] for x in rec),SCALE))
 ji=(Q(sum(x['Jim'][0] for x in rec),SCALE),Q(sum(x['Jim'][1] for x in rec),SCALE))
 csum=Q(sum(x['correlation'][0] for x in rec),SCALE)
 U=2-2*(mulmin(Q(ur[0],SCALE),Q(ur[1],SCALE),*jr)+mulmin(Q(ui[0],SCALE),Q(ui[1],SCALE),*ji))+2*DELTA
 C=csum-endhi-DELTA
 Ttarget,Btarget,Ctarget=TARGETS[side]
 if not (B<=Btarget and U<=Ttarget and C>=Ctarget and C>0 and
         Ttarget-Ctarget**2/Btarget < Q(53,20000)**2):
  raise ValueError('target budget fails '+side)
 return dict(rootLo=rl,rootHi=rh,piLo=pl,piHi=ph,endpointHi=endhi,
  urLo=Q(ur[0],SCALE),urHi=Q(ur[1],SCALE),uiLo=Q(ui[0],SCALE),uiHi=Q(ui[1],SCALE),endpointKUpper=kUpper,
  total=U,mass=B,correlation=C,endpointK=k)

def witness(side,d):
 title=side.capitalize();re,im=g.witness_polynomial(d['witness']['sides'][side]['alpha'])
 return f'''import Grothe.HJM.OriginWitnessLaguerre
import Grothe.HJM.OriginWitnessData
namespace Grothe.HJM.OriginUnweighted{title}Witness
open Grothe.HJM.OriginPanel
set_option maxRecDepth 1000000

def alpha : List (ℚ × ℚ) := (List.range 64).map fun n =>
  let a := Grothe.HJM.OriginWitnessData.{side}Alpha.getD n (0, 0)
  let d : ℚ := (2 * (n : ℚ) + 1) ^ 2
  (a.1 / d, a.2 / d)
def polynomial : CList :=
  ⟨{qlist(re)},
   {qlist(im)}⟩
theorem polynomial_eq : polynomial = Grothe.HJM.Origin.witnessPolynomial alpha 64 := by
  native_decide
end Grothe.HJM.OriginUnweighted{title}Witness
'''

def cell_data(side,cells,rec):
 title=side.capitalize();edge=[cells[0][0]]+[x[1] for x in cells];arrays=[]
 for key in ('correlation','Jre','Jim'):
  for ind,suf in ((0,'Lower'),(1,'Upper')):
   arrays.append('def '+key+suf+' : List ℤ := '+ints([r[key][ind] for r in rec]))
 return f'''import Grothe.HJM.OriginPanelsData
import Grothe.HJM.OriginMomentEnclosure
namespace Grothe.HJM.OriginUnweighted{title}Cells
open Grothe.HJM.OriginPanel Grothe.HJM.OriginPanels

def edgeList : List ℚ := {qlist(edge)}
def parentList : List ℕ := ['''+', '.join(str(x[2]) for x in cells)+f''']
def edges (i : ℕ) : ℚ := edgeList.getD i 0
def parent (i : ℕ) : Panel := {side}Panels.getD (parentList.getD i 0) {side}000

'''+ '\n\n'.join(arrays)+f'''

def entry (xs : List ℤ) (i : ℕ) : ℚ := (xs.getD i 0 : ℚ) / 10 ^ 18
end Grothe.HJM.OriginUnweighted{title}Cells
'''

def checks(side):
 title=side.capitalize()
 return f'''import Grothe.HJM.OriginUnweighted{title}Witness
import Grothe.HJM.OriginUnweighted{title}Cells
import Grothe.HJM.OriginUnweightedMeanPolynomial
namespace Grothe.HJM.OriginUnweighted{title}Checks
open Grothe.HJM.OriginMoment Grothe.HJM.OriginUnweighted{title}Cells
open Grothe.HJM.OriginUnweighted{title}Witness Grothe.HJM.OriginUnweightedMeanPolynomial
open Grothe.HJM.OriginPanel Grothe.HJM.OriginPanels

def signedBounds (i : ℕ) : ℚ × ℚ :=
  let c := panelCenter edges i
  let h := panelRadius edges i
  panelBounds (signedCellPolynomial polynomial Grothe.HJM.OriginData.{side}Real
    Grothe.HJM.OriginData.{side}Imag (parent i) c h) c h 40

def meanBounds (part : List ℚ) (i : ℕ) : ℚ × ℚ :=
  let c := panelCenter edges i
  let h := panelRadius edges i
  panelBounds (meanCellPolynomial part (parent i) c h) c h 40

def signedCheck (i : ℕ) : Bool :=
  let v := signedBounds i
  decide (entry correlationLower i ≤ v.1 ∧ v.2 ≤ entry correlationUpper i)

def meanCheck (i : ℕ) : Bool :=
  let r := meanBounds Grothe.HJM.OriginData.{side}Real i
  let z := meanBounds Grothe.HJM.OriginData.{side}Imag i
  decide (entry JreLower i ≤ r.1 ∧ r.2 ≤ entry JreUpper i ∧
    entry JimLower i ≤ z.1 ∧ z.2 ≤ entry JimUpper i)

/-- All lookups are in bounds and the cells form an ordered partition of
[0,8]. Per-cell parent and Taylor gates are part of the combined check. -/
def dataShape : Bool := decide (
  edgeList.length = 99 ∧ parentList.length = 98 ∧
  correlationLower.length = 98 ∧ correlationUpper.length = 98 ∧
  JreLower.length = 98 ∧ JreUpper.length = 98 ∧
  JimLower.length = 98 ∧ JimUpper.length = 98 ∧
  edges 0 = 0 ∧ edges 98 = 8 ∧ covers 0 8 {side}Panels = true)

def geometryCheck (i : ℕ) : Bool := dataShape && decide (
  i < 98 ∧ parentList.getD i 0 < {side}Panels.length ∧
  edges i < edges (i + 1) ∧ (parent i).a ≤ edges i ∧
  edges (i + 1) ≤ (parent i).b ∧
  0 ≤ panelCenter edges i ∧ 0 < panelRadius edges i ∧
  panelCenter edges i ≤ 8 ∧
  variation (panelCenter edges i) (panelRadius edges i) ≤ 1 ∧
  entry correlationLower i ≤ entry correlationUpper i ∧
  entry JreLower i ≤ entry JreUpper i ∧
  entry JimLower i ≤ entry JimUpper i)

def combinedCheck (i : ℕ) : Bool := geometryCheck i && (signedCheck i && meanCheck i)
end Grothe.HJM.OriginUnweighted{title}Checks
'''

def block(side,kind,i):
 title=side.capitalize();numbers=', '.join(map(str,range(i*7,(i+1)*7)));name=kind.lower()+'Block'+f'{i:02}'
 return f'''import Grothe.HJM.OriginUnweighted{title}CheckData
namespace Grothe.HJM.OriginUnweighted{title}Checks
set_option maxRecDepth 1000000

theorem {name} : ([{numbers}] : List ℕ).all {kind.lower()}Check = true := by
  native_decide
end Grothe.HJM.OriginUnweighted{title}Checks
'''

def aggregate(side,f):
 title=side.capitalize();T,B,C=TARGETS[side]
 imports='\n'.join(f'import Grothe.HJM.OriginUnweighted{title}Combined{i:02}' for i in range(14))
 names=', '.join('combinedBlock'+f'{i:02}' for i in range(14))
 expr=' ++ '.join('['+', '.join(map(str,range(i*7,(i+1)*7)))+']' for i in range(14))
 constants='\n'.join('def '+k+' : ℚ := '+leanq(f[k]) for k in ('rootLo','rootHi','piLo','piHi','endpointHi','endpointKUpper','urLo','urHi','uiLo','uiHi'))
 return imports+f'''
import Grothe.HJM.OriginVisibleEnergy
namespace Grothe.HJM.OriginUnweighted{title}Aggregate
open Grothe.HJM.OriginUnweighted{title}Checks Grothe.HJM.OriginUnweighted{title}Cells
open Grothe.HJM.OriginUnweighted{title}Witness
set_option maxRecDepth 1000000

private theorem blocks_cover : (List.range 98) = ({expr} : List ℕ) := by decide +kernel

theorem allCombined : (List.range 98).all combinedCheck = true := by
  rw [blocks_cover]
  simp only [List.all_append, {names}, Bool.true_and]

theorem allGeometry : (List.range 98).all geometryCheck = true := by
  apply List.all_eq_true.mpr
  intro i hi
  have h := (List.all_eq_true.mp allCombined) i hi
  simp only [combinedCheck, Bool.and_eq_true] at h
  exact h.1

theorem allSigned : (List.range 98).all signedCheck = true := by
  apply List.all_eq_true.mpr
  intro i hi
  have h := (List.all_eq_true.mp allCombined) i hi
  simp only [combinedCheck, Bool.and_eq_true] at h
  exact h.2.1

theorem allMean : (List.range 98).all meanCheck = true := by
  apply List.all_eq_true.mpr
  intro i hi
  have h := (List.all_eq_true.mp allCombined) i hi
  simp only [combinedCheck, Bool.and_eq_true] at h
  exact h.2.2

{constants}
def delta : ℚ := (1001 : ℚ) / 10 ^ 15
def totalTarget : ℚ := {leanq(T)}
def massTarget : ℚ := {leanq(B)}
def correlationTarget : ℚ := {leanq(C)}
def piLower : ℚ := {leanq(PI_LO)}
def piUpper : ℚ := {leanq(PI_HI)}
def r0 : ℚ := Grothe.HJM.OriginData.{side}Real.getD 0 0
def i0 : ℚ := Grothe.HJM.OriginData.{side}Imag.getD 0 0
def q0 : ℚ := r0 ^ 2 + i0 ^ 2

def mass : ℚ := ((List.range 64).map fun n =>
  let a := alpha.getD n (0, 0)
  ((n : ℚ) + 1) * (2 * (n : ℚ) + 1) ^ 2 * (a.1 ^ 2 + a.2 ^ 2)).sum

def endpointK : ℚ := ((List.range 64).map fun n =>
  let a := alpha.getD n (0, 0)
  let b := if n % 2 = 0 then Grothe.HJM.Origin.phaseRatio n
    else -Grothe.HJM.Origin.phaseRatio n
  (2 * (n : ℚ) + 1) * b * (r0 * a.1 + i0 * a.2)).sum

def sumScaled (xs : List ℤ) : ℚ := (xs.sum : ℚ) / 10 ^ 18
def minProduct (a b c d : ℚ) : ℚ := min (min (a * c) (a * d)) (min (b * c) (b * d))
def innerLower : ℚ :=
  minProduct urLo urHi (sumScaled JreLower) (sumScaled JreUpper) +
  minProduct uiLo uiHi (sumScaled JimLower) (sumScaled JimUpper)
def totalUpper : ℚ := 2 - 2 * innerLower + 2 * delta
def certifiedCorrelationLower : ℚ := sumScaled correlationLower - endpointHi - delta

/-- Exact arithmetic only. Analytic endpoint, integration and residual
bindings are separate obligations, not conclusions of this native fact. -/
theorem rationalFacts :
    0 < rootLo ∧ rootLo ≤ rootHi ∧ rootLo ^ 2 ≤ q0 ∧ q0 ≤ rootHi ^ 2 ∧
    0 < piLo ∧ piLo ≤ piHi ∧ piLo ^ 2 ≤ piLower / 4 ∧ piUpper / 4 ≤ piHi ^ 2 ∧
    urLo ≤ min (r0 / rootLo) (r0 / rootHi) ∧ max (r0 / rootLo) (r0 / rootHi) ≤ urHi ∧
    uiLo ≤ min (i0 / rootLo) (i0 / rootHi) ∧ max (i0 / rootLo) (i0 / rootHi) ≤ uiHi ∧
    0 < mass ∧ mass ≤ massTarget ∧ massTarget ≤ 1 ∧
    0 < correlationTarget ∧ endpointK ≤ endpointKUpper ∧ endpointKUpper < 0 ∧
    piLo * endpointKUpper / rootHi ≤ endpointHi ∧
    totalUpper ≤ totalTarget ∧ correlationTarget ≤ certifiedCorrelationLower := by
  native_decide

/-- Extract the three rational target gates from the complete sign-safe
arithmetic check. -/
theorem targetBounds : mass ≤ massTarget ∧ totalUpper ≤ totalTarget ∧
    correlationTarget ≤ certifiedCorrelationLower := by
  have h := rationalFacts
  tauto

/-- Analytic bridge obligations may be supplied independently; the concrete
T/B/C target inequalities then follow from the checked rational arithmetic. -/
theorem dischargeRealTargets {{T B C : ℝ}}
    (htotal : T ≤ (totalUpper : ℝ)) (hmass : B ≤ (mass : ℝ))
    (hcorr : (certifiedCorrelationLower : ℝ) ≤ C) :
    T ≤ (totalTarget : ℝ) ∧ B ≤ (massTarget : ℝ) ∧ (correlationTarget : ℝ) ≤ C := by
  refine ⟨htotal.trans ?_, hmass.trans ?_, ?_⟩
  · exact_mod_cast targetBounds.2.1
  · exact_mod_cast targetBounds.1
  · exact (show (correlationTarget : ℝ) ≤ certifiedCorrelationLower by
      exact_mod_cast targetBounds.2.2).trans hcorr

theorem tailArithmetic : totalTarget - correlationTarget ^ 2 / massTarget < (53 / 20000 : ℚ) ^ 2 := by
  norm_num [totalTarget, correlationTarget, massTarget]
end Grothe.HJM.OriginUnweighted{title}Aggregate
'''

def render(d):
 out={'Grothe/HJM/OriginUnweightedMeanPolynomial.lean':d['mean_template']}
 inventory=[];summary={}
 for side in ('left','right'):
  title=side.capitalize();cells,rec=rows(d,side);f=rational_facts(d,side,rec)
  out[f'Grothe/HJM/OriginUnweighted{title}Witness.lean']=witness(side,d)
  out[f'Grothe/HJM/OriginUnweighted{title}Cells.lean']=cell_data(side,cells,rec)
  out[f'Grothe/HJM/OriginUnweighted{title}CheckData.lean']=checks(side)
  for i in range(14):
   out[f'Grothe/HJM/OriginUnweighted{title}Combined{i:02}.lean']=block(side,'Combined',i)
   inventory.append(f'Grothe.HJM.OriginUnweighted{title}Checks.combinedBlock{i:02}._native.native_decide.ax_1_1')
  out[f'Grothe/HJM/OriginUnweighted{title}Aggregate.lean']=aggregate(side,f)
  inventory += [f'Grothe.HJM.OriginUnweighted{title}Witness.polynomial_eq._native.native_decide.ax_1_1',
                f'Grothe.HJM.OriginUnweighted{title}Aggregate.rationalFacts._native.native_decide.ax_1_1']
  summary[side]={k:str(f[k]) for k in ('total','mass','correlation','endpointK','endpointHi')}
 out['data/axioms/native-proposed.txt']='\n'.join(sorted(inventory))+'\n'
 out['data/hjm/origin/unweighted64-aggregate-exact.json']=json.dumps({'status':'EXACT_RATIONAL_PROPOSAL_NOT_LEAN_CERTIFIED','sides':summary},indent=2)+'\n'
 return out

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--check',action='store_true');a=ap.parse_args()
 if hashlib.sha256(Path(g.__file__).read_bytes()).hexdigest() != 'd995a31e9c285d01feac210fa977ec51ab0b9aad65bf144ae1f083ac9da2fea7':
  raise ValueError('generator helper hash mismatch')
 files=render(g.load());bad=[]
 for name,body in files.items():
  p=ROOT/name;data=body.encode()
  if a.check:
   if not p.exists() or p.read_bytes()!=data:bad.append(name)
  else:p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(data)
 if bad:raise SystemExit('output mismatch: '+', '.join(bad))
 print(('checked' if a.check else 'generated'),len(files),'files; 196 cells and 32 proposed native facts')
if __name__=='__main__':main()
