"""N.  Directional test of the tail row (NOTE.md section 5.2) at the rows of tail_row_model.log.

At the diffuse optimum (l, beta, sigma) of each t, the bracket of (5.1) is evaluated after adding one
sector of amplitude s (keeping sigma, and also with sigma re-optimised): a positive entry would mean
that the sector raises the row functional above its diffuse value.  Sectors: e21(z1) real and
imaginary coefficient; z1*(complex diffuse H11); z1*(real H11) in phase and transverse;
conj(z1)*H20; e11(z1) w; e20(z1) conj(w); the last two together with both relative signs.
"""
import numpy as np
from scipy.optimize import minimize_scalar
import midt_lib as L

ROWS = [(0.2528, 0.1670, 0.0050, 0.6632), (0.35, 0.2411, 0.0103, 0.6357), (0.45, 0.3212, 0.0199, 0.5960),
        (0.55, 0.4099, 0.0376, 0.5421), (0.60, 0.4599, 0.0506, 0.5085), (0.649, 0.5147, 0.0665, 0.4701)]
#           alpha_re alpha_im aC aR phiR b c d phicd
SECT = {"e21 real": (1, 0, 0, 0, 0, 0, 0, 0, 0), "e21 imag": (0, 1, 0, 0, 0, 0, 0, 0, 0),
        "z1*H11 complex": (0, 0, 1, 0, 0, 0, 0, 0, 0), "z1*H11 real, in phase": (0, 0, 0, 1, 0, 0, 0, 0, 0),
        "z1*H11 real, transverse": (0, 0, 0, 1, np.pi / 2, 0, 0, 0, 0), "conj(z1)*H20": (0, 0, 0, 0, 0, 1, 0, 0, 0),
        "e11 w": (0, 0, 0, 0, 0, 0, 1, 0, 0), "e20 conj(w)": (0, 0, 0, 0, 0, 0, 0, 1, 0),
        "e11 w + e20 conj(w)": (0, 0, 0, 0, 0, 0, 0.8, 0.6, 0), "e11 w - e20 conj(w)": (0, 0, 0, 0, 0, 0, 0.8, 0.6, np.pi)}
AMPS = (0.05, 0.1, 0.2, 0.4)


def vec(d, s, sig):
    g = np.array(list(d) + [sig], float)
    for i in (0, 1, 2, 3, 5, 6, 7):
        g[i] *= s
    return g


worst = -1e9
for t, l, beta, sig in ROWS:
    m0 = L.M_tail(l, beta, vec(SECT["e21 real"], 0.0, sig))
    print("t = %.4f  (l, beta, sigma) = (%.4f, %.4f, %.4f)  diffuse value of the bracket %.6f" % (t, l, beta, sig, m0))
    for name, d in SECT.items():
        fixed = [L.M_tail(l, beta, vec(d, s, sig)) - m0 for s in AMPS]
        reopt = []
        for s in AMPS:
            r = minimize_scalar(lambda x: -L.M_tail(l, beta, vec(d, s, x)), bounds=(0.0, 1.2), method="bounded",
                                options={"xatol": 1e-4})
            reopt.append(-r.fun - m0)
        worst = max(worst, max(reopt))
        print("   %-26s sigma fixed: %s   sigma re-optimised: %s" % (
            name, " ".join("%+.5f" % v for v in fixed), " ".join("%+.5f" % v for v in reopt)), flush=True)
print("largest change with sigma re-optimised: %+.2e (amplitudes %s)" % (worst, AMPS))
