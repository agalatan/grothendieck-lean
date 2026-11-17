# Global evidence for C = sqrt(55)/8 on S^2: the iteration Y <- P sign(Y) never decreases ||Y||_1/||Y||_2
# (||Y'||_2^2 = <Y', sign Y> <= ||Y'||_1 with Y' = P sign Y, so ||Y'||_1/||Y'||_2 >= ||Y'||_2 = <Y, sign Y>... monotone).
import numpy as np
def grid(NZ):
    NP = 2*NZ; z = (np.arange(NZ)+0.5)/NZ*2-1; ph = (np.arange(NP)+0.5)/NP*2*np.pi
    Z, PH = np.meshgrid(z, ph, indexing='ij'); R = np.sqrt(1-Z**2); X, Y = R*np.cos(PH), R*np.sin(PH)
    B = np.stack([np.sqrt(3)*X, np.sqrt(3)*Y, np.sqrt(3)*Z, np.sqrt(7)*(5*Z**3-3*Z)/2, np.sqrt(42)/4*(5*Z**2-1)*X, np.sqrt(42)/4*(5*Z**2-1)*Y,
                  np.sqrt(105)/2*Z*(X**2-Y**2), np.sqrt(105)*X*Y*Z, np.sqrt(70)/4*(X**3-3*X*Y**2), np.sqrt(70)/4*(3*X**2*Y-Y**3)]).reshape(10, -1)
    return B
B = grid(300); rng = np.random.default_rng(7); best = (0, None); vals = []
for s in range(300):
    c = rng.standard_normal(10); c /= np.linalg.norm(c)
    for it in range(60):
        S = np.sign(c @ B); g = B @ S / B.shape[1]; c = g/np.linalg.norm(g)
    r = np.mean(np.abs(c @ B)); vals.append(r)
    if r > best[0]: best = (r, c)
vals = np.array(vals); print('300 starts: max ratio %.6f, top distinct values %s' % (vals.max(), np.unique(np.round(vals, 4))[-6:]))
Bf = grid(1500); c = best[1]
for it in range(40):
    S = np.sign(c @ Bf); g = Bf @ S / Bf.shape[1]; c = g/np.linalg.norm(g)
print('best start refined on a fine grid: %.7f   sqrt(55)/8 = %.7f' % (np.mean(np.abs(c @ Bf)), np.sqrt(55)/8))
H1 = np.linalg.norm(c[:3]); print('  its degree-1 part |c_1| = %.5f (hemisphere: sqrt(3/4)/sqrt(55/64) = %.5f)' % (H1, np.sqrt(0.75)/np.sqrt(55/64)))
