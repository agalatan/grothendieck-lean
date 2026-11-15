# claude-b9ee, 15 Nov 2026 (N).  Which tilt s makes the certified chain strongest?
#   gain <= ||c_s||^2/(P - Sec(s)),   ||c_s||^2 <= min{ (6/25) supN(s) chi u^2,  hw(s)^2 u },
# hw(s) = half-width of the range of h_s, supN(s) = sup_R N_Phi(R) for the profile h_s, Sec(s) = global secant curvature.
import sys, numpy as np, importlib.util
def load(name):
    spec = importlib.util.spec_from_file_location(name, name + '.py'); m = importlib.util.module_from_spec(spec); spec.loader.exec_module(m); return m
sc = load('secant_curvature'); c2 = load('check_tilt_report_2')
a, b, p = sc.a, sc.b, sc.p
T, wT, ell = sc.make(120, 20)
Rg = np.concatenate([np.linspace(1e-3, 3, 1500), np.linspace(3, 60, 600)[1:]])
TAU = np.array([sc.tau(ell, R) for R in Rg])                    # (R, T)
Rs = np.concatenate([np.linspace(0.002, 3, 600), np.linspace(3, 8, 101)[1:]])
T1, wT1, ell1 = sc.make(60, 16)
rhos = np.concatenate([np.linspace(0.02, 0.6, 30), np.linspace(0.65, 2.0, 28), np.linspace(2.2, 6.0, 12)])
w1g = np.linspace(-7, 7, 71); w2g = np.linspace(0, 7, 36); W1, W2 = np.meshgrid(w1g, w2g, indexing='ij')
print('   s      P     range of h_s            hw^2      supN     Sec    P-Sec   a1 = (6/25)supN/(P-Sec)   b1 = hw^2/(P-Sec)   crossover chi at u=0.0463')
for s in (0.40, 0.45, 0.50, 0.55, 0.60, 0.65, 0.70):
    d = 1 - s; P = p - s*s
    H = TAU@(wT*(T - d)); H0 = float((wT*(T - d)/(2*ell)).sum()); h = H - H0
    lo, hi = min(h.min(), -H0), h.max(); hw = (hi - lo)/2
    c2.d = d
    AB = np.array([c2.AB_8(R) for R in Rs]); supN = max(c2.N_of(A, B) for A, B in AB)
    sec = max(float(sc.rem_over_rho2(T1, wT1, ell1, d, W1, W2, rho).max()) for rho in rhos)
    print(' %.2f  %.4f  (%+.4f, %+.4f)   %.5f   %.4f   %.4f  %.4f        %.4f                 %.5f            %.2f'
          % (s, P, lo, hi, hw*hw, supN, sec, P - sec, 0.24*supN/(P - sec), hw*hw/(P - sec), hw*hw/(0.24*supN*0.0463)))
    sys.stdout.flush()
