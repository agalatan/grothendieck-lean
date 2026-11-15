# Finite Gauss polynomial certificates

This exact rational witness family is work in progress. It supplies the
polynomial inputs for the original Legendre orders 1 through 64. It does
not certify the selected numerical nodes, weights, or analytic remainder.

Regenerate with `python3 tools/gen_gauss_polynomial_certificates.py`, or
check exact source reproduction with the same command followed by `--check`.
The generator emits the shared data, one module per order and the aggregate
exactness consumer.

The JSON and Python generator supply witnesses only. Lean checks recurrence,
orthogonality, derivative and Bezout identities, squared norms, and leading
coefficients using `decide +kernel`. `Q0GaussQPoly` provides the checked
LeanCert semantic bridge. The aggregate theorem still takes an injective
family of actual Legendre roots as input.

The generated family is imported by the main Lean root and checked with the
`Grothe` build.

Agent-ID: codex-2ca4.
