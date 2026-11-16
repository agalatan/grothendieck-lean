"""FLOAT cross-checks of the stage-0b correction lemma (claude-b9ee worker, 15 Nov 2026).  Not a proof: it tests the proof.

Notation (PROOF.tex): nu >= 0, d2, d3 > nu, e_i = d_i - nu, sig = e2 + e3, dl = e3 - e2, Delta = d2 d3 - nu^2,
   Psi_nu(A, B) = max_{|f|=|g|=1} Re(conj f A) + Re(conj g B) + nu Re(conj f g),
   Phi_d(A, B)  = (d2 + d3)/2 + (d3 |A|^2 + d2 |B|^2 + 2 nu Re(A conj B)) / (2 Delta),
   h(L, p)      = 4 Re(p conj L) - c0 - c1 |L|^2   (c0, c1 of the stage-0 REPORT, section 3.2),
   Gamma(l)     = 4 + |dl| (2 l + |dl|) / (e2 e3),
   gstar(l)     = 8 sig / (Delta (Delta Gamma(l)^2 + 16 l^2)).
Claim (Theorem 1): for |L| <= R and every p,  Phi_d(L+p, L-p) - (g/16) h^2 >= Psi_nu(L+p, L-p)  whenever g <= gstar(R);
gstar(l) is the sharp coefficient at |L| = l.

Tests: (A) gstar against the discriminant formula of the far pieces (stage-0 capnu.gamma_closed algebra) and AF's 8/D at nu = 0;
(B) brute force over random complex p (Psi_nu by a 256-phase grid + 10 Newton steps) at g = gstar(R), |L| <= R;
(C) sharpness: g = (1 + 1e-3) gstar(l) violates at the vertex of the binding far piece, and that vertex lies in the far regime;
(D) the 2-angle reduction: min over p of Phi_d - corr - l_w(p) (exact quadratic minimisation) equals the closed form of Lemma 2;
(E) the key bound |Ht| <= Gamma |r| on random (f, g) (Lemma 3).
usage: python3 numcheck.py [ncase] [seed]"""
import sys, numpy as np

def psi(A, B, nu, nphi=256, newton=10):
    """Psi_nu(A, B) = max_phi |A + e^{i phi} B| + nu cos(phi), vectorised; grid + safeguarded Newton (accurate to ~1e-15)"""
    A = np.asarray(A, complex); B = np.asarray(B, complex)
    aA, aB = np.abs(A), np.abs(B); P = aA ** 2 + aB ** 2; Q = 2 * aA * aB; ph0 = np.angle(np.conj(A) * B)
    # |A + e^{i phi} B|^2 = P + Q cos(phi + ph0)
    phis = 2 * np.pi * np.arange(nphi) / nphi
    best = np.full(A.shape, -np.inf); bph = np.zeros(A.shape)
    for k in range(0, nphi, 256):
        ph = phis[k:k + 256][:, None]
        v = np.sqrt(np.maximum(P + Q * np.cos(ph + ph0), 0)) + nu * np.cos(ph)
        i = np.argmax(v, 0); vm = v[i, np.arange(v.shape[1])] if v.ndim == 2 else v[i]
        upd = vm > best; best = np.where(upd, vm, best); bph = np.where(upd, phis[k:k + 256][i], bph)
    ph = bph; h = 2 * np.pi / nphi
    val = lambda t: np.sqrt(np.maximum(P + Q * np.cos(t + ph0), 0)) + nu * np.cos(t)
    for _ in range(newton):
        c = np.cos(ph + ph0); s = np.sin(ph + ph0); rt = np.sqrt(np.maximum(P + Q * c, 1e-300))
        g1 = -Q * s / (2 * rt) - nu * np.sin(ph); g2 = -Q * c / (2 * rt) - Q * Q * s * s / (4 * rt ** 3) - nu * np.cos(ph)
        st = np.where(g2 < -1e-14, -g1 / np.where(g2 < -1e-14, g2, -1.0), np.sign(g1) * 0.25 * h)
        st = np.clip(st, -h, h); h *= 0.6; phn = ph + st
        ph = np.where(val(phn) >= val(ph), phn, ph)
    return np.maximum(val(ph), best)

def phi_d(L, p, d2, d3, nu):
    A = L + p; B = L - p; D = d2 * d3 - nu * nu
    return (d2 + d3) / 2 + (d3 * abs(A) ** 2 + d2 * abs(B) ** 2 + 2 * nu * (A * np.conj(B)).real) / (2 * D)

def centre(d2, d3, nu):
    e2, e3 = d2 - nu, d3 - nu
    return d2 * d2 - d3 * d3 + nu * (d2 - d3) * (e2 * e2 + e3 * e3) / (e2 * e3), -4 * nu * (d2 - d3) / (e2 * e3)

def gstar(d2, d3, nu, l):
    e2, e3 = d2 - nu, d3 - nu; s = e2 + e3; dl = abs(e3 - e2); D = d2 * d3 - nu * nu
    G = 4 + dl * (2 * l + dl) / (e2 * e3)
    return 8 * s / (D * (D * G * G + 16 * l * l))

def gd_far(d2, d3, nu, l, sgn):
    """the discriminant formula of the stage-0 REPORT (capnu.gamma_closed, far piece of sign sgn), WITHOUT the regime test"""
    D = d2 * d3 - nu * nu; cP = (d2 + d3 - 2 * nu) / (2 * D); c0, c1 = centre(d2, d3, nu); c = c0 + c1 * l * l
    k0 = (d2 + d3) / 2 + nu + (d2 + d3 + 2 * nu) * l * l / (2 * D); b1 = l * c / 2; b0 = (d3 - d2) * l / D - 2 * sgn
    return (4 * cP * k0 - b0 * b0) / (2 * b0 * b1 + cP * c * c / 4 + 4 * l * l * k0)

def gamma_closed(d2, d3, nu, llo, lhi):
    """verbatim algebra of capnu.gamma_closed (stage 0), scalar version"""
    c0, c1 = centre(d2, d3, nu)
    D = d2 * d3 - nu * nu; cP = (d2 + d3 - 2 * nu) / (2 * D); out = np.inf
    for l in (llo, lhi):
        c = c0 + c1 * l * l
        k0 = (d2 + d3) / 2 + nu + (d2 + d3 + 2 * nu) * l * l / (2 * D); pf = nu + np.sqrt(nu * nu + l * l); b1 = l * c / 2
        for sgn in (1.0, -1.0):
            b0 = (d3 - d2) * l / D - 2 * sgn
            den = 2 * b0 * b1 + cP * c * c / 4 + 4 * l * l * k0; num = 4 * cP * k0 - b0 * b0
            gd = num / den if den > 0 else 0.0
            al = cP - gd * l * l; be = b0 + gd * b1; pv = -be / (2 * al) if al > 0 else np.inf * sgn
            if sgn * pv >= pf: cand = gd
            else:
                p = sgn * pf; q0 = cP * p * p + b0 * p + k0; q1 = -(l * l * p * p) + b1 * p - c * c / 16
                cand = -q0 / q1 if q1 < 0 else np.inf
            out = min(out, cand)
        out = min(out, cP / max(l * l, 1e-300))
    return max(out, 0.0)

def rand_params(rng):
    nu = [0.0, 0.024066, 0.01, 0.06, 0.2][rng.integers(5)] * (1 if rng.random() < 0.8 else rng.random() * 3)
    e2 = np.exp(rng.uniform(np.log(1e-2), np.log(3))); e3 = e2 * np.exp(rng.uniform(-2.5, 2.5)) if rng.random() < 0.7 else np.exp(rng.uniform(np.log(1e-2), np.log(3)))
    R = np.exp(rng.uniform(np.log(1e-3), np.log(3)))
    return nu, e2 + nu, e3 + nu, R

if __name__ == "__main__":
    ncase = int(sys.argv[1]) if len(sys.argv) > 1 else 400; seed = int(sys.argv[2]) if len(sys.argv) > 2 else 1
    rng = np.random.default_rng(seed)
    # (A) closed forms
    errA = 0.0; errAF = 0.0
    for _ in range(20000):
        nu, d2, d3, R = rand_params(rng); l = R * rng.random()
        gs = gstar(d2, d3, nu, l); gm = min(gd_far(d2, d3, nu, l, 1), gd_far(d2, d3, nu, l, -1))
        errA = max(errA, abs(gm / gs - 1))
        S = d2 + d3; Daf = S * (S * S + 4 * l * l + 4 * l * abs(d2 - d3))
        errAF = max(errAF, abs(gstar(d2, d3, 0.0, l) * Daf / 8 - 1))
    print(f"(A) 20000 random (d, nu, l): max |min_sgn gd_far / gstar - 1| = {errA:.2e};  nu = 0: max |gstar / (8/D_AF) - 1| = {errAF:.2e}")
    # (B) brute force at g = gstar(R), |L| <= R ; (C) sharpness ; (D) reduction ; (E) key bound
    worstB = np.inf; nB = 0; nC_ok = 0; nC = 0; worstD = 0.0; worstE = np.inf; farvertex_ok = 0
    for k in range(ncase):
        nu, d2, d3, R = rand_params(rng)
        c0, c1 = centre(d2, d3, nu); g = gstar(d2, d3, nu, R)
        for _ in range(4):
            l = R * (1.0 if rng.random() < 0.5 else rng.random()); L = l * np.exp(2j * np.pi * rng.random())
            sc = max(l, nu, d2, d3)
            n = 4000
            p = np.concatenate([(rng.standard_normal(n) + 1j * rng.standard_normal(n)) * sc * rng.choice([0.1, 1, 5, 30], n),
                                L / max(l, 1e-300) * rng.uniform(-6, 6, n) * sc * (1 + 1e-3j * rng.standard_normal(n))])
            M = phi_d(L, p, d2, d3, nu) - g / 16 * (4 * (p * np.conj(L)).real - c0 - c1 * l * l) ** 2
            F = psi(L + p, L - p, nu); gap = (M - F) / (1 + abs(M)); worstB = min(worstB, gap.min()); nB += len(p)
        # (C) at |L| = l = R: vertex of the binding far piece for g' = (1 + 1e-3) gstar(l)
        l = R; L = l; gp = (1 + 1e-3) * gstar(d2, d3, nu, l); D = d2 * d3 - nu * nu; cP = (d2 + d3 - 2 * nu) / (2 * D)
        c = c0 + c1 * l * l; k0 = (d2 + d3) / 2 + nu + (d2 + d3 + 2 * nu) * l * l / (2 * D)
        sb = 1.0 if gd_far(d2, d3, nu, l, 1) <= gd_far(d2, d3, nu, l, -1) else -1.0
        b0 = (d3 - d2) * l / D - 2 * sb; al = cP - gp * l * l; be = b0 + gp * l * c / 2; pv = -be / (2 * al)
        Mv = phi_d(L, pv, d2, d3, nu) - gp / 16 * (4 * pv * l - c) ** 2; Fv = psi(np.array([L + pv]), np.array([L - pv]), nu)[0]
        nC += 1; nC_ok += (Mv - Fv < 0)
        g0v = gstar(d2, d3, nu, l); al0 = cP - g0v * l * l; pv0 = -(b0 + g0v * l * c / 2) / (2 * al0)
        farvertex_ok += (abs(pv0) >= nu + np.sqrt(nu * nu + l * l) - 1e-9 * (1 + abs(pv0)))
        # (D) reduction: random w = (f, g); min over p in C of Phi_d - corr - l_w(p) by solving the 2x2 system; compare closed form
        if g > 0:
            for _ in range(5):
                f = np.exp(2j * np.pi * rng.random()); gg = np.exp(2j * np.pi * rng.random()); l = R * rng.random(); L = l
                c = c0 + c1 * l * l
                # objective in (p1, p2): Phi_d - (g/16)(4 l p1 - c)^2 - [Re(conj(f-gg) p) + l Re(f+gg) + nu Re(conj f gg)]
                Dl = d2 * d3 - nu * nu; cL = (d2 + d3 + 2 * nu) / (2 * Dl); cP = (d2 + d3 - 2 * nu) / (2 * Dl); tau = (d3 - d2) / (2 * Dl)
                u = f - gg
                # quadratic: (cP - g l^2) p1^2 + cP p2^2 + (2 tau l + g l c / 2 - u.real) p1 - u.imag p2 + const
                const = (d2 + d3) / 2 + cL * l * l - g * c * c / 16 - l * (f + gg).real - nu * (np.conj(f) * gg).real
                Wd = const - (2 * tau * l + g * l * c / 2 - u.real) ** 2 / (4 * (cP - g * l * l)) - u.imag ** 2 / (4 * cP)
                e2, e3 = d2 - nu, d3 - nu; s2 = e2 + e3; eta = (e3 - e2) / (e2 * e3); s = 2 * l
                N = abs(s - e2 * f - e3 * gg) ** 2; Ht = 2 * s * (f.real - gg.real) + eta * (s2 * s2 - s * s)
                Wc = N / (2 * s2) - g * Dl * Dl / (16 * s2 * (s2 - 2 * g * Dl * l * l)) * Ht * Ht
                worstD = max(worstD, abs(Wd - Wc) / (1 + abs(Wd)))
        # (E) key bound |Ht| <= Gamma |r|
        e2, e3 = d2 - nu, d3 - nu; s2 = e2 + e3; eta = (e3 - e2) / (e2 * e3); dl = abs(e3 - e2)
        f = np.exp(2j * np.pi * rng.random(2000)); gg = np.exp(2j * np.pi * rng.random(2000)); s = 2 * R * rng.random(2000)
        r = s - e2 * f - e3 * gg; Ht = 2 * s * (f.real - gg.real) + eta * (s2 * s2 - s * s); G = 4 + dl * (s + dl) / (e2 * e3)
        worstE = min(worstE, ((G * abs(r) - abs(Ht)) / (G * (abs(r) + 1e-300) + abs(Ht))).min())
    print(f"(B) {nB} points ({ncase} parameter sets x 4 values of |L| <= R), g = gstar(R): min (majorant - Psi_nu)/(1 + |majorant|) = {worstB:+.3e}")
    print(f"(C) sharpness: g = 1.001 gstar(l) violates at the binding far vertex in {nC_ok} of {nC} cases; vertex (at gstar) in the far regime in {farvertex_ok} of {nC}")
    print(f"(D) reduction (closed form of min_p) max rel. error {worstD:.2e}")
    print(f"(E) min over samples of (Gamma|r| - |Ht|)/(Gamma|r| + |Ht|) = {worstE:+.3e}  (>= 0 required)")
