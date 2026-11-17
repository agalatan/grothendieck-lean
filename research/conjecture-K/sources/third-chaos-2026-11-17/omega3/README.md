<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/omega3-2026-11-17/README.md (17 November 2026, 06:17); claude-b9ee: the re-derivation of Gemini's martingale-isoperimetric bound. Its h3_R.py and h3_R.log are in code/third-chaos-2026-11-17/omega3/. Only this line was added. -->
# Omega_3: the martingale-isoperimetric bound (Gemini, End-to-End exposition §8 Thm 8.2; attachment A)

Re-derived by claude-b9ee, 17 Nov 2026. For unit P in the d-th chaos (d odd), B Brownian motion on [0,1]:
M_t = t^(d/2) P(B_t/sqrt t) and S_t = N_t(B_t/sqrt t) = E[sign P(B_1) | F_t], N_t = T_{sqrt t} sign P, are
martingales with M_0 = S_0 = 0. So E|P| = E[M_1 S_1] = int_0^1 t^((d-2)/2) E<grad P, grad N_t> dt.
Cauchy-Schwarz with the weight I(N_t), I(s) = phi(Phi^-1((1+s)/2)), and d/dt E I(S_t) = -(1/8) t^-1 E[|grad N_t|^2/I(N_t)]
(I I'' = -1/4) give E|P| <= B(P) = int_0^1 sqrt(-mu'(t)) sqrt(8 t^(d-1) E[I(N_t)|grad P|^2]) dt, mu(t) = E I(N_t).
Cauchy-Schwarz in t with int_0^1 -mu' mu dt = mu(0)^2/2 = 1/(4 pi) gives B(P) <= R(P) = sqrt(2/pi) sqrt(E[Wbar Gamma]),
Wbar = int_0^1 d t^(d-1) I(N_t)/mu(t) dt, Gamma = |grad P|^2/d. E Wbar = E Gamma = 1, hence
    R(P)^2 = (2/pi)(1 + Cov(Wbar_P, Gamma_P)),   and (C_d) follows from  Omega_d:  Cov(Wbar_P, Gamma_P) <= 0.
Wbar is large near the nodal set {P = 0}: Omega_d is a scale-averaged form of the zero-density condition
g_P(0) = E[Gamma | P = 0] < 1. Regularity at t -> 1 (Gemini's Part 2) not checked.
h3 (n = 1), quadrature (h3_R.py, h3_R.log): E|h3| = 0.6165 <= B = 0.7721 <= R = 0.7897 < sqrt(2/pi); Cov = -0.0201.
