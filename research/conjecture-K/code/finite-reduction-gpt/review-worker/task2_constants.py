"""Review, task 2 (label N): the constants of REDUCTION.md (8) for the six band rows, and the dimension at which test (9) can hold.

Profiles: research/higher-degree/code/degree5-content/profiles/band_row_<t>.json (tables accurate to about 1e-4; G frozen beyond s = 6).
Normalised at energy u:  H(v) = h(u v) = G(sqrt(u v))/sqrt(u v),  K = K_1 H (K(v) = E H(v + tau)),  K' = K - H,  K'' = K' - H'.
  Phi(z) = z H(|z|^2) = ph(z) G(sqrt(u)|z|)/sqrt(u):   B_Phi = sup|G|/sqrt(u),   L_Phi = max(sup|G'|, sup|G(s)/s|)   (operator norm of D Phi)
  a(z) = v K'(v), g(z) = v K'(v)^2 (v = |z|^2):        B_a, B_g sup norms;  L_a = sup 2 sqrt(v)|K' + v K''|,  L_g = sup 2 sqrt(v)|K'^2 + 2 v K' K''|
  d_f = 3 B_f + 37 L_f,   E_theta = 2 B_Phi d_Phi + theta [66000 B_g + 63 (d_g + B_a d_a)].
Margin of a cubic with ratio r = |C|^2/(chi omega):  -R_theta = (theta - r) chi omega.   Test (9) needs  E_theta/sqrt(m) <= (theta - r) chi omega.
"""
import json, math, sys
import numpy as np
from scipy.interpolate import CubicSpline

KIT = '/Users/alingalatan/workspaces/grothe-claude-b9ee-k-records/research/higher-degree/code/degree5-content/profiles/'
LX, LW = np.polynomial.laguerre.laggauss(120)

def gl(a, b, npan, nq=8):
    x, w = np.polynomial.legendre.leggauss(nq); ed = np.linspace(a, b, npan + 1)
    t = np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(npan)])
    wt = np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(npan)])
    return t, wt
_t1, _w1 = gl(0.0, 2.0, 60); _t2, _w2 = gl(2.0, 70.0, 240)
TN = np.concatenate([_t1, _t2]); TW = np.concatenate([_w1, _w2]) * np.exp(-TN)      # T ~ Exp(1)

class Prof:
    def __init__(self, S, G):
        self.cs = CubicSpline(S, G); self.smax = S[-1]
    def G(self, s):
        return self.cs(np.minimum(s, self.smax))
    def Gp(self, s):
        return np.where(s <= self.smax, self.cs(np.minimum(s, self.smax), 1), 0.0)
    def h(self, w):                       # h(w) = G(sqrt w)/sqrt w
        s = np.sqrt(np.maximum(w, 0.0)); out = np.empty_like(s); m = s > 1e-6
        out[m] = self.G(s[m]) / s[m]; out[~m] = self.cs(0.0, 1)
        return out
    def hp(self, w):                      # h'(w) = [G'(s) s - G(s)]/(2 s^3)
        s = np.sqrt(np.maximum(w, 0.0)); out = np.empty_like(s); m = s > 2e-3
        out[m] = (self.Gp(s[m]) * s[m] - self.G(s[m])) / (2 * s[m] ** 3)
        out[~m] = self.cs(0.0, 3) / 6.0   # G = G'(0) s + G'''(0) s^3/6 + ...: h' -> G'''(0)/6
        return out

def constants(P, u):
    # grid in w = u v (physical squared amplitude), up to s = 30
    s = np.concatenate([np.linspace(0, 6, 2401), np.linspace(6, 30, 961)[1:]]); w = s * s; v = w / u
    H = P.h(w); Hp = u * P.hp(w)
    K = np.array([np.sum(LW * P.h(u * (x + LX))) for x in v])
    Kp = K - H; Kpp = Kp - Hp
    a = v * Kp; g = v * Kp ** 2
    La = 2 * np.sqrt(v) * np.abs(Kp + v * Kpp); Lg = 2 * np.sqrt(v) * np.abs(Kp ** 2 + 2 * v * Kp * Kpp)
    sg = np.linspace(1e-4, 6, 6000)
    B_Phi = np.max(np.abs(P.G(sg))) / math.sqrt(u)
    L_Phi = max(np.max(np.abs(P.Gp(sg))), np.max(np.abs(P.G(sg) / sg)))
    out = dict(B_Phi=B_Phi, L_Phi=L_Phi, B_a=np.max(np.abs(a)), L_a=np.max(La), B_g=np.max(g), L_g=np.max(Lg))
    Ksp = CubicSpline(v, K)
    def Kp_of(V):
        V = np.minimum(V, v[-1]); return Ksp(V) - P.h(u * V)
    out['Kp'] = Kp_of
    return out

def law_terms(c, P, u, V, wts, Cval):
    Kp = c['Kp'](V)
    Eg = np.sum(wts * V * Kp ** 2); Ea = np.sum(wts * V * Kp)
    om = 1.5 * Eg - 0.75 * Ea ** 2
    return om, Cval

if __name__ == '__main__':
    rows = ['0.80', '0.82', '0.84', '0.845', '0.85', '0.855']
    print('row sector u/u*  |  B_Phi  L_Phi    B_a     L_a     B_g      L_g   |  E_theta    | junta: C^2      omega     ratio  margin(theta-r)*42*omega | E/sqrt(1024) / margin | m needed (junta) | 3 B_g theta 63/2-floor: m > (66000/63)^2')
    worst = []
    for t in rows:
        d = json.load(open(KIT + f'band_row_{t}.json')); S = np.array(d['S']); th = d['theta_needed']; us = d['ustar']
        for sec, G in [('A', np.array(d['GA']) + d['tilt']['s'] * np.array(d['G0'])), ('B', np.array(d['GB']) + d['tilt']['t'] * np.array(d['G0']))]:
            P = Prof(S, G)
            for f in (0.5, 1.0, 1.3):
                u = f * us; c = constants(P, u)
                dPhi = 3 * c['B_Phi'] + 37 * c['L_Phi']; da = 3 * c['B_a'] + 37 * c['L_a']; dg = 3 * c['B_g'] + 37 * c['L_g']
                E = 2 * c['B_Phi'] * dPhi + th * (66000 * c['B_g'] + 63 * (dg + c['B_a'] * da))
                # junta: Q = y(T-2)/sqrt2, V = T(T-2)^2/2, chi = 42; marked content E[conj(y) Q H(V)] = E[T(T-2)/sqrt2 * h(u V)]
                V = TN * (TN - 2) ** 2 / 2
                C = np.sum(TW * TN * (TN - 2) / math.sqrt(2) * P.h(u * V))
                Kp = c['Kp'](V); Eg = np.sum(TW * V * Kp ** 2); Ea = np.sum(TW * V * Kp); om = 1.5 * Eg - 0.75 * Ea ** 2
                r = C * C / (42 * om); margin = (th - r) * 42 * om
                # Gaussian law, for scale
                KpG = c['Kp'](TN); omG = 1.5 * np.sum(TW * TN * KpG ** 2) - 0.75 * np.sum(TW * TN * KpG) ** 2
                mneed = (E / margin) ** 2 if margin > 0 else float('inf')
                print(f"{t:5s} {sec} {f:3.1f} | {c['B_Phi']:6.3f} {c['L_Phi']:6.3f} {c['B_a']:7.4f} {c['L_a']:7.4f} {c['B_g']:8.5f} {c['L_g']:8.5f} | {E:10.2f} | {C*C:9.3e} {om:9.3e} {r:6.3f} {margin:10.3e} | {E/32/margin:10.3e} | {mneed:9.2e} | omega_G={omG:9.3e} omega/(1.5 B_g)={om/(1.5*c['B_g']):.3f}")
                worst.append((t, sec, f, E, margin, mneed, c['B_g'], th))
    print()
    print('smallest m with E_theta/sqrt(m) <= junta margin over the listed cases:', f"{min(w[5] for w in worst):.3e}", ' largest:', f"{max(w[5] for w in worst):.3e}")
    print('absolute floor from the single term 66000 theta B_g/sqrt(m) <= theta*42*(3/2)*B_g:  m >=', (66000 / 63) ** 2)
