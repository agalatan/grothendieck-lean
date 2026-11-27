"""Finite-dimensional obstruction to peak-ray prices at least p0. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q

EPS, ELL, BETA = map(Q, ('.752', '.8456', '.1432'))
P = Q(2500,1891)
M = EPS*P
V = Q('.0403448')
E = M**2*V
T = Q('.82957')
TARGET = Q('.713245')


def verify(n):
    """Use the peak value, the optimizer bracket and the global Rice curvature."""
    if n <= 1:
        raise ValueError("block count")
    curvature = Q('1.673')   # B'' >= -2*curvature
    s_lo, s_hi = Q('1.3739535256614'), Q('1.3739535256616')
    d_lo = 1-Q(3,2*n)
    if not (d_lo>0 and T*T+E/(EPS*d_lo)**2 < Q('3.14159')/4):
        raise ValueError("finite-dimensional response disk")
    def offset(scale):
        return T*T-2*scale*ELL*T+2*(scale*BETA)**2/EPS-E/EPS
    bracket_loss = curvature*(Q('.0403449')-V)**2
    finite_loss = 3*curvature*V**2/n
    lower = offset(M)+M*(s_lo+P*V-bracket_loss-finite_loss)
    base = Q('.99')
    upper = offset(base)+base*(s_hi+P*E/base**2)
    if not (0<base<M and T<M*ELL and lower-TARGET>Q(122129,10**12)
            and lower-upper>Q(107220599,10**12)):
        raise ValueError("target or secant margin")
    return lower-TARGET,lower-upper


if __name__ == "__main__":
    spare,slope = verify(10**6)
    try:
        verify(1000)
    except ValueError as error:
        if str(error) != "target or secant margin":
            raise
    else:
        raise ValueError("small block count accepted")
    print("Remote price floor for every t <= .82957, with one million disjoint triples.")
    print("Row excess and two-scale difference, rounded down in trillionths:",
          int(10**12*spare), int(10**12*slope))
