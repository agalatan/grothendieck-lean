"""Chunked evaluation for n >= 3 (label N): deterministic gauge-reduced grids and Monte Carlo."""
import math
import numpy as np
from dslib import radial_rule, stein_fields, normalise

class ChunkGrid:
    """Gauge-reduced tensor grid on C^n, processed in chunks over the first radial coordinate."""

    def __init__(self, n, panels, k, nt):
        self.n = n
        self.r, self.wr = radial_rule(panels, k)
        th = np.arange(nt) * 2 * np.pi / nt
        axes = [self.r] * (n - 1) + [th] * (n - 1)
        waxes = [self.wr] * (n - 1) + [np.full(nt, 1.0 / nt)] * (n - 1)
        mesh = np.meshgrid(*axes, indexing='ij')
        W = np.ones(mesh[0].shape)
        for i, wa in enumerate(waxes):
            shp = [1] * len(axes); shp[i] = len(wa)
            W = W * wa.reshape(shp)
        self.subY = np.stack([(np.sqrt(mesh[j]) * np.exp(1j * mesh[n - 1 + j])).ravel() for j in range(n - 1)], axis=1)
        self.subW = W.ravel()
        self.size = len(self.r) * self.subW.size

    def run(self, t, profs):
        """t normalised to E|q|^2 = u (same u for all profs).  Returns list of dicts and moments."""
        acc = [dict(Ephi=0.0, T1=0.0, T2=0.0) for _ in profs]
        mom = dict(u=0.0, EV2=0.0, Eq2a=0.0, covc2V=0.0, Ec2=0.0)
        M = self.subW.size
        for r1, w1 in zip(self.r, self.wr):
            Y = np.concatenate([np.full((M, 1), math.sqrt(r1), dtype=complex), self.subY], axis=1)
            W = w1 * self.subW
            V, c1, c2, rhoV = stein_fields(t, Y)
            mom['u'] += np.sum(W * V); mom['EV2'] += np.sum(W * V * V); mom['Eq2a'] += np.sum(W * rhoV)
            mom['covc2V'] += np.sum(W * c2 * V); mom['Ec2'] += np.sum(W * c2)
            for a, p in zip(acc, profs):
                a['Ephi'] += np.sum(W * p.phi(V)); a['T1'] -= np.sum(W * (c2 - p.u) * p.Kp(V)); a['T2'] += np.sum(W * rhoV * p.gp(V))
        out = [dict(D=p.B - a['Ephi'], T1=a['T1'], T2=a['T2']) for a, p in zip(acc, profs)]
        mom['delta'] = mom['EV2'] - 2 * mom['u'] ** 2; mom['covc2V'] -= mom['u'] * mom['Ec2']
        return out, mom


def mc_run(t, profs, N, seed=0, chunk=200000):
    """Monte Carlo with standard errors: returns list of dicts with D, T1, T2 and their s.e."""
    n = t.shape[0]
    rng = np.random.default_rng(seed)
    sums = [np.zeros(3) for _ in profs]; sq = [np.zeros(3) for _ in profs]
    cnt = 0; mV = 0.0; mV2 = 0.0
    while cnt < N:
        m = min(chunk, N - cnt)
        Y = (rng.standard_normal((m, n)) + 1j * rng.standard_normal((m, n))) / math.sqrt(2)
        V, c1, c2, rhoV = stein_fields(t, Y)
        mV += V.sum(); mV2 += (V * V).sum()
        for i, p in enumerate(profs):
            cols = np.stack([p.B - p.phi(V), -(c2 - p.u) * p.Kp(V), rhoV * p.gp(V)])
            sums[i] += cols.sum(axis=1); sq[i] += (cols ** 2).sum(axis=1)
        cnt += m
    out = []
    for i in range(len(profs)):
        mean = sums[i] / N; se = np.sqrt(np.maximum(sq[i] / N - mean ** 2, 0) / N)
        out.append(dict(D=mean[0], T1=mean[1], T2=mean[2], seD=se[0], seT1=se[1], seT2=se[2]))
    return out, dict(u=mV / N, delta=mV2 / N - 2 * (mV / N) ** 2)
