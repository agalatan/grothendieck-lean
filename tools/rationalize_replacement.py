#!/usr/bin/env python3
"""Exact finite-cut feasibility replay for a replacement radial law.

This proves only normalization, named moments and every listed rational cut.
It does not prove Gaussian-cubic realizability or any Gaussian integral.
"""
import argparse,copy,json,sys
from fractions import Fraction as Q
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parent))
from verify_radial_countermodel import cut,solve3,table

def verify(law):
 atoms=[(Q(a['v']),Q(a['weight']))for a in law['support']];x=Q(law['point']['x'])
 assert atoms and all(v>=0 and w>0 for v,w in atoms)
 mom=lambda k:sum(w*v**k for v,w in atoms)
 assert mom(0)==1 and mom(2)==1 and mom(4)==2+x*x
 assert mom(1)<=Q(973612157,10**9)
 cap=6+9*x*x+Q(4045313,100000)*x**3;assert mom(6)<=cap
 slacks=[]
 for item in law['cuts']:
  no=item['data'];assert x<=Q(no.get('sixth_joint',{}).get('xmax','31/4'))
  s=sum(w*cut(no,v*v)for v,w in atoms);assert s>=0,(item['name'],float(s));slacks.append((s,item['name']))
 ell,beta,price=[Q(law['row_parameters'][k])for k in ['ell','beta','price']];t,tau=[Q(law['point'][k])for k in ['t','tau']]
 phi=sum(Q(row['weight'])*sum(w*table(row['row'],Q(row['row']['delta'])*tau*v)for v,w in atoms)for row in law['rows'])
 score=t*t-2*ell*t+2*beta*beta/Q(149,200)+phi-price*tau*tau
 return {'status':'PASS exact finite radial constraints','atoms':len(atoms),'cuts':len(slacks),'moments':{str(k):str(mom(k))for k in [0,1,2,4,6]},'minimum_cut_slack':str(min(slacks)[0]),'minimum_cut_name':min(slacks)[1],'table_score':str(score),'table_score_float':float(score),'sixth_slack':str(cap-mom(6))}

def main():
 p=argparse.ArgumentParser(description=__doc__)
 for k in ['proposal','bank','template','out']:p.add_argument('--'+k,type=Path,required=True)
 a=p.parse_args();r=json.loads(a.proposal.read_text());bank=json.loads(a.bank.read_text());law=json.loads(a.template.read_text())
 ids=[i for i,w in enumerate(r['radial_weights'])if w>1e-12];vs=[Q(r['radii'][i]).limit_denominator(10**8)for i in ids];ws=[Q(round(r['radial_weights'][i]*10**18),10**18)for i in ids]
 x=Q(law['point']['x']);uu=[v*v for v in vs];picks=[0,len(ids)//2,len(ids)-1];A=[[uu[j]**k for j in picks]for k in range(3)]
 rhs=[target-sum(w*u**k for w,u in zip(ws,uu))for k,target in enumerate([Q(1),Q(1),2+x*x])]
 for j,c in zip(picks,solve3(A,rhs)):ws[j]+=c
 law=copy.deepcopy(law);law['scope']=__doc__;law['support']=[{'v':str(v),'weight':str(w)}for v,w in zip(vs,ws)];law['cuts']=bank['cuts'];law['proposal_indices']=ids
 result=verify(law);law['exact_replay']=result;a.out.write_text(json.dumps(law,indent=2)+'\n');print(json.dumps(result,indent=2))

if __name__=='__main__':main()
