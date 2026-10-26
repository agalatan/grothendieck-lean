import json, sys, collections
sys.argv=["x","step24_socp_tensor_q.json","opt"]
exec(open("step24_boxes.py").read().split("if __name__")[0])
out=json.load(open("step24_boxes_tensor_q.json"))
for thr in (2e-6,5e-6,1e-5,1.5e-5):
    sel=[o for o in out if o["gap"]<=thr]
    W=collections.Counter()
    for o in sel:
        k,w=rowweights(d["boxes"][o["i"]])
        W[str(sorted((kk,round(v,4)) for kk,v in w.items()) if k!="c" else ("c",w))]+=1
    print(thr,len(sel),"distinct weights",len(W))
sel=[o for o in out if o["g"] is not None and o["gap"]+o["g"]<1.3e-5]
print("margin<1.3e-5:",len(sel))
W=collections.Counter()
for o in sel:
    k,w=rowweights(d["boxes"][o["i"]]); W[str(sorted((kk,round(v,3)) for kk,v in w.items()) if k!="c" else ("c",w))]+=1
print("distinct",len(W))
