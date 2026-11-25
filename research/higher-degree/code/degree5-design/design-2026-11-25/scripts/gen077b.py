#!/usr/bin/env python3
"""The three covers of the game (1, -0.77, 0.05) (band files of shift5.py) at the tilt (2/5, 3/20) with the constant margin of the margin scan
at that tilt: command lines for r4_theta6.py (PERCHI), ratio_cluster.py (c = 4) and reeval_tilt.py (N).  usage: gen077b.py"""
import json, os
PY=os.path.expanduser("~/claude-b9ee-degree5/venv/bin/python"); SD=os.path.expanduser("~/claude-b9ee-degree5/design/scripts"); TH=os.path.expanduser("~/claude-b9ee-degree5/degree5-newcap-2026-11-16/thresholds")
W=os.path.expanduser("~/claude-b9ee-degree5/design/work/g077"); M=os.path.expanduser("~/claude-b9ee-degree5/design/margins"); cmds=[]; out=[]
BINS="0:1,1:2,2:3,3:4,4:6,6:8,8:12,12:16,16:24,24:42.1"
for c in json.load(open("cmds_g077.txt.cases.json")):
    b=json.load(open(os.path.join(W,c["band"]))); m=json.load(open(os.path.join(M,"m077b_t%g.json"%c["tprime"]))); mu=min(m["mu0"],m["mu_glob"])
    b["tilt"]=[0.4,0.15]; b["rows"]["1"]["mu"]=mu; bf=c["band"].replace("band5_","band5_tiltB_"); json.dump(b,open(os.path.join(W,bf),"w"),indent=1); name=bf[len("band5"):-5]
    cmds.append("cd %s && PERCHI=1 D5_E1=0.77 D5_ETA=0.05 OMP_NUM_THREADS=1 THRESH_DIR=%s BAND_ROWS=%s KAPPA_CHI=%s MARGIN_MODEL=const:%.6f %s %s/r4_theta6.py 1 %s - %s_Mglob > out/r4_theta6%s_Mglob.log 2>&1"%(W,TH,bf,c["kappa"],mu,PY,SD,c["energies"],name,name))
    cmds.append("cd %s && OMP_NUM_THREADS=1 %s %s/ratio_cluster.py %s 0.4,0.15 0.77 %r %s out/ratio%s_c4.json A 4 14 19 %s > out/ratio%s_c4.log 2>&1"%(W,PY,SD,c["prof"],c["tlo"],c["u_abs"],name,BINS,name))
    for rf in ("b2_gen5_5_u0.85_n6_free","b2_gen5_5_u0.85_n5_free","b2_rows_n4"):
        cmds.append("cd %s && OMP_NUM_THREADS=1 THRESH_DIR=%s %s %s/reeval_tilt.py g077design 0.77 0.05 %s b2data/%s.json %s 19 > %s/out/reevalD%s_%s.log 2>&1"%(TH,TH,PY,SD,bf,rf,c["energies"],W,name,rf))
    out.append(dict(name=name,band=bf,tprime=c["tprime"],mu=mu,room=c["room"],tlo=c["tlo"]))
open("batch077b.txt","w").write("\n".join(cmds)+"\n"); json.dump(out,open("batch077b.cases.json","w"),indent=1); print(len(cmds))
