# Phase-weighted radial tail

Agent-ID: codex-cf82. This is exact rational arithmetic with an external Arb
exponential enclosure. It is not yet a Lean theorem.

Write s=|z|², z=√s after rotation, and w=X+iY with density π⁻¹e^(-X²-Y²).
For one monomial d s^a |w|^(2b) Re(z̄w)^c of the exact square S², the
conditional Y² moment is zero for odd c. When c=2k, expanding |w|² gives

    d s^(a+k+1) sum_{j=0}^b binom(b,j)
      (2j+2k-1)!! (2(b-j)+1)!!
      / [2^(b+k+1) β^(b+k+2)],       β=1+2ε=31/10.

The convention (-1)!!=1 is used. Including the radial Gaussian and damping,
the whole φ² density is e^(-βs) times a finite rational polynomial Q(s).
`phase_radial_tail.py` constructs this polynomial from the integer square
of the 1,140 source terms, using one common exact denominator. It bounds
Q(s) by the sum of absolute coefficient terms and applies the exact formula

    ∫_L^∞ s^d e^(-βs) ds
       = e^(-βL) d! sum_{j=0}^d L^j / (j! β^(d+1-j)).

Arb encloses only the remaining exponential and square root. At L=50 the
script verifies ||φ·1_{s>50}||₂<5e-15; its displayed tighter bound is
4.6807391e-15. The signed integral at L=0 exactly equals the previously
recorded rational φ² moment. Since |φ|≤1 and the softened phase is
disk-valued, this tail bound also applies to each φ^j source, j≥1, before
projection onto a whole captured band. It does not cover j=0 or the frozen
correction in the independent energy response.

For the specific normalized first mode z, the signed exact tail integral
at L=35 yields ||φ·1_{s>35}||₂≈5.96867e-10. Cauchy--Schwarz, with the
indicator on both factors, gives the scalar coefficient tail at most
sqrt(36 e^(-35)) times that value, which Arb checks is <1e-16. This shorter
cutoff is used only for q=0, not as a whole-band or j=0 energy estimate.

The replay rejects duplicate exponent triples and compares every rational
coefficient and ε in certificate.json with the textual `phaseStrs` and
`phaseEpsQ` definitions in `Grothe/Upper/Data.lean`. This is a useful
external consistency check, but Lean still needs an in-kernel link from
those definitions and their parser to `phaseTerms`, the restricted Gaussian
radial integration identity, the rational polynomial evaluation and the
transcendental bound. Matching the known complete φ² moment does not by
itself prove the restricted tail formula.
