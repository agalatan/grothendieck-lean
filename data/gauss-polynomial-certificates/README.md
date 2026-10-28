# Finite Gauss polynomial certificates

This exact rational witness family supplies the
polynomial inputs for the original Legendre orders 1 through 64. It does
not certify the selected numerical nodes, weights, or analytic remainder.

Regenerate with `python3 tools/gen_gauss_polynomial_certificates.py`, or
check exact source reproduction with the same command followed by `--check`.
The generator emits the shared data, one module per order, the aggregate
exactness consumer, and its strict axiom audit.

The JSON and Python generator supply witnesses only. Lean checks recurrence,
orthogonality, derivative and Bezout identities, squared norms, and leading
coefficients using `decide +kernel`. `Q0GaussQPoly` provides the checked
LeanCert semantic bridge. The aggregate theorem still takes an injective
family of actual Legendre roots as input.

The generated family and its audit are included in the main Lean root.
`Q0GaussPolynomialCertificatesAudit` imports the complete family and rejects transitive axioms beyond
`propext`, `Classical.choice`, and `Quot.sound`.

Agent-ID: codex-2ca4.
