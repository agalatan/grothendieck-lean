<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/he3-radial-n3-2026-11-17/REVIEW_claude-b9ee.md (17 November 2026); claude-b9ee. The two texts it reviews are beside it; radial_Mn.py and its log are in code/third-chaos-2026-11-17/he3-radial-n3/. Only this line was added. -->
# Two texts on the real third chaos (d = 3 of arXiv:2610.10477, Example 3.1): review by claude-b9ee, 17 Nov 2026

Both texts were pasted by the user (from a session of another assistant), verbatim in `PASTE1_hjm_example31.md` and
`PASTE2_radial_n3.md`. Check script: `radial_Mn.py` (mpmath; output `radial_Mn.log`).

## PASTE1 (SDP value, tripartite projection, deficit identity)

- Correct: SDP(Pi_3^(n)) >= 1 - 92/n (E psi_3^4 = 93); OPT >= 2/pi - o(1) via sign of the normalised sum; the n = 1
  value (2/pi)(1 + 4e^{-3/2})^2/6 (the 0.7726 of row 3.21 (e)); the equivalence of OPT(Pi_3^(n)) <= 2/pi + o(1) with
  the sharp L1-L2 bound on the whole real third chaos; the reduction to square-free cubics; the deficit identity
  sqrt(2/pi) - E|F| = sqrt(2/pi) int_0^inf s(1+s^2)^{-3/2} E[e^{-s^2F^2/2}(1 - |grad F|^2/3)] ds (re-derived).
- Not new: the tripartite theorem is the conditionally Gaussian case already in row 3.21 (e); the identity is the
  Stein-kernel interpolation of rows 3.5 (BNC) and 3.22.
- Wrong as written: the near-Gaussian bullet perturbs a FIRST-chaos Gaussian Z', so F_eps is not in the third chaos and
  the identity (which uses LF = -3F) does not apply; "strict local maximiser in every chaos direction" is not shown.

## PASTE2 (a "disproof" retracted mid-text, then a proof for n = 3)

- Section 1 claims a counterexample P* in three variables with E|P*| > 4/5. False: no P* is given, and the text
  retracts it itself (its Section 4). Not to be cited.
- Section 5 (n = 3) is correct. Checked: the O(3) split of the 10-dimensional chaos into X_i(R^2 - 5) (l = 1) and
  harmonic cubics (l = 3); independence of R and Theta; the normalisations E_mu[S(2S - 5)^2] = 15, E_mu S^3 = 105/8,
  rho = sqrt(2/7); the radial integrand sqrt(s)(As - B) (one sign change); int_0^inf s|s - t|e^{-s} ds =
  t - 2 + 2(t + 2)e^{-t}; the constraint (3A^2/40)(36t^2 - 140t + 175) = 1; the cases B <= 0 (sqrt(26/35)) and
  A = 0 (sqrt(20/27)); every one of the ten subintervals of the rational case split for (80/3)h^2 < Q. One slip:
  392/361 + 1/16 = 6633/5776, written 6723/5776 (weaker, still enough). The constant: E|P| <= 0.72657 ||P||_2 =
  0.9106 sqrt(2/pi) (sup at t = 2.2897); the text's "0.896" is the value at t = 2, not the supremum.
- Not new: row 3.21 (e) has the bound in at most seven coordinates (28 sqrt5/(25 pi) = 0.79717, author only,
  certificates replayed). This is a computer-free proof of the case n = 3.
- Reach of the same argument (no angular information, Cauchy-Schwarz on the sphere), radial constant M_n / sqrt(2/pi):
  n = 1: 0.7726 (exact), 2: 0.8710, 3: 0.9106, 4: 0.9324, 5: 0.9562, 6: 0.9879, 7: 1.0134, 8: 1.0344 (N, mpmath). So it
  would give a second, independent proof for n <= 6 (with an interval check for n = 4, 5, 6), and nothing beyond.
- Sections 6-7: "the core is the sharp bound for harmonic cubics, uniformly in n" is true but not new (square-free
  cubics are harmonic and the problem reduces to them, PASTE1 section 3); the limit P -> alpha W<u, Z> + beta H_3(Z) is a
  heuristic; "it recovers the bath family" is wrong as stated (the bath family is one special case of that limit).

## For the records

One sentence in row 3.21 (e) at the next pass of the K ledger: an independent computer-free proof for n = 3 (radial
decomposition, constant 0.9106 sqrt(2/pi)); the same argument reaches n <= 6 (N) and stops at 7.
