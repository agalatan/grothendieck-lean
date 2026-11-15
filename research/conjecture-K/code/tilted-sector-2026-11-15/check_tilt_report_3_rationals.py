# claude-b9ee, 15 Nov 2026: exact checks of the scalar comparisons of secant_proof.md sections 2-4 and of the assembly
# table of REPORT.md section 4 (fifth version of the tilted-sector report of codex-6e2b).  Output: check_tilt_report_3_rationals.log
from fractions import Fraction as F
from math import exp, sqrt, pi, e
a, b, d = F(699,1250), F(179,1250), F(2,5)
print('exterior (7): 170/467 + (11/600)(36/5*47/16 - 2770/467) =', F(170,467) + F(11,600)*(F(36,5)*F(47,16) - F(2770,467)), '=', float(F(170,467) + F(11,600)*(F(36,5)*F(47,16) - F(2770,467))), '; 3603551/5604000 =', float(F(3603551,5604000)), '< 13/20:', F(3603551,5604000) < F(13,20))
print('   sqrt(6925000/805701) =', sqrt(6925000/805701), '< 47/16 =', 47/16, ';  (a+4b)(a+12b)*25/554 vs 805701/6925000:', (a+4*b)*(a+12*b)*F(25,554), F(805701,6925000))
print('   e^4 =', exp(4), '> 340217/6237 =', 340217/6237, '> 600/11 =', 600/11, ';  sum_{k<=11} 4^k/k! =', sum(F(4)**k/__import__('math').factorial(k) for k in range(12)))
print('   coefficient of e^-4 positive:', F(36,5)*F(47,16) - F(2770,467) > 0, ' (true value with exact sqrt and e^-4: %.6f)' % (170/467 + exp(-4)*(36/5*sqrt(6925000/805701) - 2770/467)))
g = a - F(33,200)**2/(3*b)
print('small amplitudes: gamma = a - (33/200)^2/(3b) =', float(g), '> 49/100:', g > F(49,100), ';  |z| bound (8/3)(a+7b) + (33/200)(33/5) =', float(F(8,3)*(a+7*b) + F(33,200)*F(33,5)), '< 23/4')
print('   (9): 3(33/5)^2/490 + 19/(96000 b) =', float(3*F(33,5)**2/490 + F(19,96000)/b), '< 27/100;  with exact exponentials:', 3*6.6**2*exp(-7)/0.49 + 19*exp(-9)/(12*float(b)))
print('   row 161 of theta_candidates: K = 0.165138 >= 33/200 = 0.165:', F(165138,10**6) >= F(33,200), ';  target 0.649660 < 13/20:', F(649660,10**6) < F(13,20))
M = 2*exp(-0.4) - 0.6
print('large amplitudes: M = E|T - 2/5| =', M, '< 3/4; 4M/5 =', 4*M/5, '< 13/20')
p = F(2500,1891); P = p - F(9,25); k = P - F(13,20)
print('k = P - 13/20 =', k, '=', float(k))
print('assembly: every cubic: 126 sqrt(42) u^3/k <= 2e-5 at u = 0.00196979:', 126*sqrt(42)*0.00196979**3/float(k), ';  3*42^1.5 =', 3*42**1.5, '= 126 sqrt 42 =', 126*sqrt(42))
dl = 2037/12500000
print('   small cumulant delta <= %.8f: min((2/25)delta, 3 delta^1.5)/k = %.4e (<= 2e-5)' % (dl, min(0.08*dl, 3*dl**1.5)/float(k)))
print('   positive deficit D >= 0.00133: (1/2500)/k = %.6e  <= (19/20) 0.00133 + 2e-5 = %.6e' % (1/2500/float(k), 0.95*0.00133 + 2e-5))
kap = F(3,10)/k; eta = F(3,500000)/k
print('   (5) => kappa = (3/10)/k =', kap, '=', float(kap), '(claim 56730/59009 =', F(56730,59009), ');  eta = (3/500000)/k =', eta, '=', float(eta), '(claim 5673/295045000 =', F(5673,295045000), ')')
