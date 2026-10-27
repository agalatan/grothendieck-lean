# Exact phase moments

`targets.json` preserves the rational second, fourth and sixth moments computed
by `tools/needle_phase_moments.py` from the production phase polynomial. The
generator `tools/gen_phase_moment_data.py` checks the semantic phase, damping
and common denominator, then reproduces `PhaseMomentData.lean` byte for byte.
These stored values are targets; they are not proof inputs about a Gaussian
integral.

`PhaseMomentCheck` proves denominator clearing and exact integer polynomial
convolution. `PhaseMomentEval` integrates the resulting polynomial using the
finite invariant-monomial formula. `ConcretePhaseMoments` identifies this
calculation with every even moment of the actual `phiT`, without using the
numerical phase-cover certificate.

The first numerical leaf is `PhaseMoment2`: one single-threaded native check
recomputes the second moment from the actual phase and compares it with its
target. Its full compilation and axiom verification are required before this
leaf is accepted. Fourth- and sixth-moment leaves remain separate work.

This ingredient alone does not discharge the component-error or stored-energy
comparison hypotheses of the conditional Grothendieck bound.
