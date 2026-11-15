<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/pipeline/kconj/PROGRESS.md (file dated 2026-10-12). Only this line was added. -->
# Worker K1 progress (Conjecture K)
* att3.py: n ordinary coordinates + diffuse W (analytic), full H21(C^n) basis (K=18 at n=3). Validated at n=2 (excess +1e-12, S_G = 1.3739535 at eps=.7564, (ell,beta)=(.8456,.1432), matches kmodel).
  Droplet runs n=3 (grid 4x5 radial, 16 angles, N = 2.05M): a3_peak.log, a3_745.log, a3_flank.log.
* attmult.py: multiplicative / scale-mixture family on (z1,z2): Gaussian multipliers xi (H11 diffuse), eta (H10), analytic conditional Gaussian. am_*.log.
* A results (float): n=3 full basis (18 complex + sigma_W), 20 starts each at 3 parameter points: all return to the Gaussian point (excess +2..5e-9 = coarse-grid artefact).
  attmult (scale mixtures / multiplicative Gaussian multipliers), 15 starts each at 2 points on droplet: max excess -3e-14 (some nan starts invalid).
* B: ka.py envelopes under K: eps=.7564: ideal .713144 / moment LP .713152 / chord .713160; eps=.75: .713196/.713193/.713201; eps=.745: .713303/.713302/.713310.
  hessglob/hessjoint: single-direction global quadratic constants A 1.03, B 0.62, z 1.19, H 0.99, zb 0.70; (A,B) plane 1.20; (z,H) plane 1.71 > 1/eps = 1.322.
  content.py: families J (junta+diffuse) and M (multiplicative skew + diffuse): R = content^2/(1/eps - 1.2) <= 0.25 x slack for a >= 0.2; theta <= 0.2.
* C: d5k.py calibrated on the cubic (0.713135). Degree-5 runs in progress.
* C done: degree-5 gate-free rows 0.71243-0.71245 on t in [0.82,0.88] (finer grid at 0.84: 0.712432); W5 direction untested. RESULTS.md written.
