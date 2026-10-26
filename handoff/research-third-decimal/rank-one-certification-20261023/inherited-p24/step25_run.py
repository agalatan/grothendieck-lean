# Step 25 (stage 2, part 1): EXACT-weight re-evaluation of the binding cluster.  For every selected box: the box mixture with its exact row weights
# (no linear gain model, no nearest-mixture proxy), the cone w, the pointwise-optimal f*, robust d_r (step22_main/opt/val), then the tensor_q law
# relaxation (step24_socp, current certificate) on a fine (tau, x) node grid of the box; box gain = min over nodes.  [F]
import hashlib, sys, json, os, subprocess, collections, numpy as np
sys.argv_save = sys.argv; sys.argv = ["x", "step24_socp_tensor_q.json", "opt"]
exec(open("step24_boxes.py").read().split("if __name__")[0]); sys.argv = sys.argv_save
P = sys.executable
out = json.load(open("step24_boxes_tensor_q.json"))
MAXM = float(sys.argv[1]); LIM = int(sys.argv[2])
sel = sorted([o for o in out if o["g"] is not None and o["kind"] != "c" and o["gap"]+o["g"] < MAXM], key=lambda o: o["gap"]+o["g"])
groups = collections.OrderedDict()
for o in sel:
    k, w = rowweights(d["boxes"][o["i"]]); key = tuple(sorted((int(r), round(v, 10)) for r, v in w.items() if v > 1e-12))
    groups.setdefault(key, []).append(o)
keys = list(groups)[:LIM]
res = json.load(open("step25_res.json")) if os.path.exists("step25_res.json") else {}
for gi, key in enumerate(keys):
    tag = "b" + hashlib.md5(str(key).encode()).hexdigest()[:8]
    if tag in res: continue
    wd = {str(r): v for r, v in key}
    if not os.path.exists("step22_val_%s.npz" % tag):
        subprocess.run([P, "step22_main.py", json.dumps({tag: wd})], check=True, stdout=open("step25_logs/main_%s.log" % tag, "w"))
        subprocess.run([P, "step22_opt.py", tag], check=True, stdout=open("step25_logs/opt_%s.log" % tag, "w"))
        subprocess.run([P, "step22_val.py", tag], check=True, stdout=open("step25_logs/val_%s.log" % tag, "w"))
    boxes = groups[key]
    sl = min(o["b"][2] for o in boxes); su = max(o["b"][3] for o in boxes); xl = min(o["b"][4] for o in boxes); xu = max(o["b"][5] for o in boxes)
    taus = sorted(set(np.round(np.concatenate([[sl, su], np.arange(np.ceil(sl/0.0025)*0.0025, su, 0.0025)]), 5)))
    xs = sorted(set(np.round(np.concatenate([[xl, xu], np.arange(np.ceil(xl/0.0625)*0.0625, xu, 0.0625)]), 4)))
    env = dict(os.environ, RELAX="tensor", KEEPQ="1", NJ="8")
    subprocess.run([P, "step24_socp.py", tag, ",".join(map(str, xs)), ",".join(map(str, taus)), "step25_logs/socp_%s.json" % tag], check=True, env=env,
                   stdout=open("step25_logs/socp_%s.log" % tag, "w"))
    T = json.load(open("step25_logs/socp_%s.json" % tag))
    bres = []
    for o in boxes:
        b = o["b"]; gs = [r["gain"] for r in T if r["gain"] is not None and b[2]-1e-9 <= r["tau"] <= b[3]+1e-9 and b[4]-1e-9 <= r["x"] <= b[5]+1e-9]
        st = [r.get("status") for r in T]
        g = max(0.0, min(gs)) if gs else None
        bres.append(dict(i=o["i"], gap=o["gap"], g_model=o["g"], g_exact=g, margin=None if g is None else o["gap"]+g, nodes=len(gs)))
    res[tag] = dict(wd=wd, boxes=bres, inacc=sum(s != "optimal" for s in st))
    json.dump(res, open("step25_res.json", "w"), indent=1)
    for r in bres: print("%s box %d gap %.2e model %.2e exact %s margin %s nodes %d" % (tag, r["i"], r["gap"], r["g_model"], "%.2e" % r["g_exact"] if r["g_exact"] is not None else None, "%.2e" % r["margin"] if r["margin"] is not None else None, r["nodes"]), flush=True)
