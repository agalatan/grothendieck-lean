"""codex-a713. Small, read-only source audit; generated data stays in this folder."""
import os
os.environ['OPENBLAS_NUM_THREADS']='1';os.environ['OMP_NUM_THREADS']='1';os.environ['VECLIB_MAXIMUM_THREADS']='1'
from pathlib import Path
import sys,runpy,ast,importlib.util
import numpy as np
root=Path(__file__).resolve().parent
source=root.parent/'kscan-2026-11-13'
os.chdir(root)
sys.argv=[str(source/'tables.py'),'peak']
runpy.run_path(str(source/'tables.py'),run_name='__main__')
sys.argv=[str(source/'kscan.py'),'peak','2','.0463','12','0','13',str(root/'opt_unused.jsonl')]
tree=ast.parse((source/'kscan.py').read_text())
tree.body=[node for node in tree.body if node.lineno<50]
ns={};exec(compile(tree,str(source/'kscan.py'),'exec'),ns)
rng=np.random.default_rng(9871);W,E=ns['sample'](4096,rng)
x=rng.normal(size=12);d=rng.normal(size=12);d/=np.linalg.norm(d)
f,grad=ns['fg'](x,W,E)
for step in [1e-4,1e-5,1e-6,1e-7]:
    fd=(ns['fg'](x+step*d,W,E)[0]-ns['fg'](x-step*d,W,E)[0])/(2*step)
    print('SOURCE GRADIENT',step,fd,float(grad@d),'error',fd-grad@d,flush=True)
print('SPLINE ORIGIN SLOPES',ns['dphi'](0),ns['dg'](0),flush=True)
print('CLIPPED v=441 derivative returned',ns['kern'](np.array([441]))[1],ns['kern'](np.array([441]))[3],flush=True)
print('CLIPPED actual value difference',np.array(ns['kern'](np.array([441.001])))[[0,2]]-np.array(ns['kern'](np.array([440.999])))[[0,2]],flush=True)
spec=importlib.util.spec_from_file_location('ind',root/'opt_deterministic.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
ys=ns['ys'];p,g=m.abel_kernels(ys*ys,192)
print('SOURCE TABLE NODE MAX ERR',np.max(np.abs(p-ns['T']['phi'])),np.max(np.abs(g-ns['T']['g'])),flush=True)
ymid=(ys[1:]+ys[:-1])/2;p,g=m.abel_kernels(ymid*ymid,192)
print('SOURCE TABLE MID MAX ERR',np.max(np.abs(p-ns['sphi'](ymid))),np.max(np.abs(g-ns['sg'](ymid))),flush=True)
print('SOURCE B(u)',ns['Bu'],'INDEPENDENT B(u)',m.Kernel(.001,192).bu,flush=True)
# Evaluate source splines on the independent full deterministic rule: this is
# a cross-check of interpolation bias, not part of the independent computation.
rule=m.Rule(200,8);c=np.load(root/'opt_refined.npz')['c'];q=rule.E@c;v=np.abs(q)**2
p,_,g,_=ns['kern'](v); C=rule.W.conj().T@(rule.weights*q*g)
D=ns['Bu']-rule.weights@p
print('SOURCE INTERPOLATED OPTIMUM',float(np.vdot(C,C).real/D),'D',D,'C2',np.vdot(C,C).real,flush=True)
