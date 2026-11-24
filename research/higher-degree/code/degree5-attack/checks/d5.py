# scratch library: degree-5 capped game, definitions written from the notes (independent of the kit code)
import numpy as np, math, json
from fractions import Fraction as Fr
from numpy.polynomial.legendre import leggauss
E1, ETA = 0.78, 0.0779
def zgrid(npan=60, nq=8, nth=256, R=6.6):
    x, w = leggauss(nq); ed = np.linspace(0, R, npan+1)
    r = np.concatenate([(ed[i]+ed[i+1])/2 + (ed[i+1]-ed[i])/2*x for i in range(npan)])
    wr = np.concatenate([(ed[i+1]-ed[i])/2*w for i in range(npan)])*2*r*np.exp(-r*r)
    th = (np.arange(nth)+0.5)*2*np.pi/nth
    Rm, TH = np.meshgrid(r, th, indexing='ij')
    W = (wr[:,None]*np.ones(nth)[None,:]/nth).ravel()
    return (Rm*np.exp(1j*TH)).ravel(), W/W.sum()
def e11(z): return np.abs(z)**2 - 1
def e20(z): return z**2/math.sqrt(2)
def e32(z):
    T = np.abs(z)**2; return z*(T*T - 6*T + 6)/math.sqrt(12)
def base(z, l, beta, nu): return z*(l + beta*(np.abs(z)**2 - 2)) + nu*e32(z)
def Dz(z, bA, bB): return 1 - bA*e11(z) - bB*e20(z)
ROWS2B = '/Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/cert2b/out/rows2b.json'
def rows2b():
    d = json.load(open(ROWS2B)); out = []
    for r in d['rows']:
        l, b, bA, bB = [Fr(x) for x in r['row'].split(',')]
        C = Fr(r.get('C_stein', r['C_plain'])); out.append(dict(t=r['t'], tag=r['tag'], l=l, beta=b, bA=bA, bB=bB, C=C, Cplain=Fr(r['C_plain'])))
    return out, d['small_t']
