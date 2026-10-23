#!/usr/bin/env python3
"""Recompute the outward matrices and extract radius-uniform quadratic caps.

Every input m-region is independent of radius, so its exact quadratic cap is
valid for every radius >=0. The maximum per cover and minimum across complete
covers remain global pointwise upper bounds. No optimizer is trusted here.
"""
from pathlib import Path
from fractions import Fraction as Q
import sys,json,hashlib,time,argparse,importlib
import numpy as np
sys.set_int_max_str_digits(0)
if not __debug__:
 raise RuntimeError('The inherited exact checker requires assertions; omit -O/-OO')
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('certificate',type=Path)
for name in ['audit','law','profiles','moments','out']:
 parser.add_argument('--'+name,type=Path,required=True)
parser.add_argument('--tools',type=Path,default=Path(__file__).resolve().parent,
                    help='Directory containing inherited replay modules')
parser.add_argument('--node-certificate',type=Path,action='append',default=[],
                    help='Additional source-bound radius-independent covers')
args=parser.parse_args();sys.path.insert(0,str(args.tools.resolve()))
integration=importlib.import_module('joint_fibre_majorizer')
upper_module=importlib.import_module('verify_joint_fibre_upper')
read_sources=importlib.import_module('verify_abstract_response_support').read_sources
joint_source=importlib.import_module('verify_joint_fibre_response').joint_source
verify_cache=importlib.import_module('verify_joint_fibre_moments').verify_cache
line_cover=upper_module.line_cover
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
CERT=args.certificate;data,target=read_sources(args);law=json.loads(args.law.read_text())
matrix,ell,beta,forcing=joint_source(data,target,law,args.profiles)
record=next(r for r in json.loads(args.audit.read_text())['selected']if r['index']==data['index'])
if data['source_row_weights']!=record['rows']:
 raise ValueError('Source row weights mismatch')
if sum((Q(a['weight'])*Q(a['v'])**2 for a in data['support']),Q(0))!=1:
 raise ValueError('Normalized remote variable required')
if sha(Path(integration.__file__))!=data['integration_sha256']:
 raise ValueError('Outward integration implementation changed')
checked=verify_cache(args.moments)
if checked['sha256']!=data['moments_sha256']:
 raise ValueError('Moment cache hash mismatch')
lam=list(map(Q,data['lambda']));t,tau0,eps=[Q(target[k])for k in ['t','tau','epsilon']]
if len(lam)!=5 or tau0<=0:
 raise ValueError('Five moment prices and positive source tau required')
row=upper_module.custom_row(matrix,ell,beta,forcing,tau0,lam,eps)
if row!=data['custom_row']:
 raise ValueError('Priced row was not reconstructed exactly')
setup=integration.Setup(row,json.loads(args.moments.read_text()))
roundup=lambda f:Q((f.numerator*10**10+f.denominator-1)//f.denominator,10**10)
output={'scope':__doc__,'certificate_sha256':sha(CERT),'audit_sha256':sha(args.audit),'law_sha256':sha(args.law),'profiles_sha256':sha(args.profiles),'integration_sha256':sha(Path(integration.__file__)),'moments_sha256':data['moments_sha256'],'independently_checked_cached_moments':checked['independently_checked_intervals'],'target':data['target'],'lambda':data['lambda'],'custom_row':data['custom_row'],'source_row_weights':data['source_row_weights'],'support':data['support'],'radius_domain':['0',None],'coefficient_rounding':'1/10000000000 upward, coefficientwise; valid at every nonnegative radius','covers':[],'Q':[[str(x)for x in row]for row in setup.Q],'a':list(map(str,setup.a)),'additional_source_hashes':[]};started=time.monotonic();count=0;expected=Q(0);ball_count=0
tau0=Q(data['target']['tau']);newtheta=list(map(Q,data['custom_row']['theta']));newtheta[10]=(1+newtheta[10])/tau0-1;newtheta[11]/=tau0;newtheta[12]/=tau0;output['new_row']={'eps':data['custom_row']['eps'],'theta':list(map(str,newtheta))};output['radius_variables']={'old':'v=normalized remote modulus','new':'s=tau0*v','tau0':str(tau0)}
if len(data['atoms'])!=len(data['support']):
 raise ValueError('Incomplete parent radial atom coverage')
atoms=[(atom,True,jj)for jj,atom in enumerate(data['atoms'])]
for path in args.node_certificate:
 node=json.loads(path.read_text())
 if node['source_certificate_sha256']!=sha(CERT)or node['custom_row']!=row:
  raise ValueError('Additional node certificate source mismatch')
 output['additional_source_hashes'].append(sha(path));atoms.extend((atom,False,jj)for jj,atom in enumerate(node['atoms']))
for jj,(atom,parent,source_j) in enumerate(atoms):
 if parent and atom['v']!=data['support'][source_j]['v']:
  raise ValueError('Parent radial atom mismatch')
 if Q(atom['v'])<0:
  raise ValueError('Negative radial node')
 direction=list(map(Q,atom.get('direction',['0']*12)))
 if len(direction)!=12:
  raise ValueError('A direction needs twelve coordinates')
 cover={'original_anchor_radius':atom['v'],'parent_fixed_law_atom':parent,'direction':list(map(str,direction)),'pieces':[]};intervals=[];bounds=[]
 for ii,pc in enumerate(atom['pieces']):
  anchor=np.array(pc['anchor_y']);var=[np.array(v)for v in pc['variance_vectors']]
  if len(anchor)!=12 or any(len(v)!=12 for v in var)or not np.all(np.isfinite(anchor))or any(not np.all(np.isfinite(v))for v in var):
   raise ValueError('Invalid or nonfinite cell-price proposal')
  pa,pb=setup.prices(anchor,var)
  if not np.all(pa>0)or not np.all(pb>0):
   raise ValueError('Cell prices must be strictly positive')
  C,h,H=setup.integrate(pa,pb);Cu,hu,Hu,rho=integration.upper(C,h,H);eta=Q(pc.get('bessel_ball_multiplier','0'));effectiveQ=setup.Q
  if eta<0:
   raise ValueError('Negative Bessel ball multiplier')
  if eta:
   ball_count+=1;Cu+=eta;effectiveQ=[[setup.Q[i][j]+eta*sum(setup.Q[i][k]*setup.Q[k][j]for k in range(12))for j in range(12)]for i in range(12)]
  if pc.get('whole_space',False):cons=[];intervals.append((None,None))
  else:
   sign=pc['sign'];lo=Q(pc['lo']);hi=None if pc['hi']is None else Q(pc['hi']);la=Q(pc['lam']);mu=Q(pc['mu'])
   if not any(direction)or sign not in [-1,1]or la<0 or mu<0 or(hi is None and la!=0)or(hi is not None and hi<=lo):
    raise ValueError('Invalid slicing region or S-lemma multiplier')
   cons=[([sign*z for z in direction],lo,hi,la,mu)];intervals.append((lo,hi)if sign==1 else(None if hi is None else-hi,-lo))
  result=integration.piece_quadratic_multi(effectiveQ,setup.a,Cu,hu,Hu,cons)
  if result is None:
   raise ValueError('Exact rational LDL check failed')
  q=result[:3];source_radius=Q(atom['v']);point=sum(q[i]*source_radius**i for i in range(3))
  if point>Q(pc['cap_upper']):
   raise ValueError('Advertised node cap exceeded')
  bounds.append(Q(pc['cap_upper']))
  piece={'source_piece':ii,'constraints':[[list(map(str,v)),str(lo),None if hi is None else str(hi),str(la),str(mu)]for v,lo,hi,la,mu in cons],'whole_space':not cons,'radius_polynomial_exact':list(map(str,q)),'radius_polynomial_upper':list(map(lambda z:str(roundup(z)),q)),'source_point_cap':pc['cap_upper'],'Cu':str(Cu),'hu':list(map(str,hu)),'Hu':[[str(z)for z in row]for row in Hu],'bessel_ball_multiplier':str(eta)}
  qq=list(map(Q,piece['radius_polynomial_upper']));piece['new_radius_polynomial_upper']=list(map(str,[qq[0],qq[1]/tau0,qq[2]/tau0**2]));cover['pieces'].append(piece);count+=1
 line_cover(intervals);cover['certified_node_cap']=str(max(bounds));output['covers'].append(cover)
 if parent:
  expected+=Q(data['support'][source_j]['weight'])*max(bounds)
 print(json.dumps({'cover':jj,'radius':atom['v'],'pieces':len(cover['pieces']),'seconds':time.monotonic()-started}),flush=True)
alpha=list(map(Q,target['gate_alpha']));ca,cb,cc=map(Q,target['gate_C']);det=ca*cc-cb*cb
if not eps>0 or not ca>0 or not det>0:
 raise ValueError('Penalty matrix must be positive definite')
mm=[t,-2*beta/eps,tau0,alpha[0]*tau0,alpha[1]*tau0]
constant=t*t-2*ell*t+2*beta*beta/eps-Q(law['row_parameters']['price'])*tau0*tau0-sum(a*b for a,b in zip(lam,mm))+lam[1]**2/(2*eps)+(cc*lam[3]**2-2*cb*lam[3]*lam[4]+ca*lam[4]**2)/(4*det)
padding=Q(data['assembly_padding']);assembled=constant+expected+padding
if padding<0 or assembled>Q(data['score_upper_rational']):
 raise ValueError('Parent fixed-law assembly exceeded advertised cap')
output.update({'status':'PASS','parent_assembled_upper':str(assembled),'parent_advertised_upper':data['score_upper_rational'],'priced_outer_constant':str(constant),'quadratic_regions':count,'bessel_constrained_regions':ball_count,'potential_scope':'actual Bessel-constrained responses'if ball_count else'unrestricted priced coefficient potential','seconds':time.monotonic()-started})
args.out.write_text(json.dumps(output,indent=2)+'\n')
print(json.dumps({'status':'PASS','covers':len(output['covers']),'quadratic_regions':count,'parent_upper_float':float(assembled),'seconds':output['seconds']},indent=2))
