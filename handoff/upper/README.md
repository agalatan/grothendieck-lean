# Combined complex Grothendieck upper certificate

The directed calculation proves the strict bound

\[
K_G^{\mathbb C}<1.404898359045958.
\]

This combines the supplied verification bundle's first-order spectral energy
and extended fifth scalar composition with our joint endpoint cancellation,
global coefficient-integration error, and previously certified rational
common preprocessor. No claim of literature priority is made.

The unpreprocessed calculation gives an upper endpoint
`1.404898359220087370206295...`. The common preprocessor improves this to
`1.404898359045957010149930...`; the displayed theorem is rounded upward.

## Reproduce

Requires Python, `python-flint`, and `numpy` (our run used python-flint0.9.0).
Obtain the [original repository at the pinned commit](https://github.com/sheilman77/grothendieck_cx/tree/7139f4cb8d0f30c2eb4c1267c46732a9d5229c3f). Its directory is `SOURCE` below.
Do not run Python with `-O` or `-OO`.

```sh
python verify_combined.py --source-dir SOURCE
```

The default checks the pinned files, every new exact polynomial-norm assertion,
visible spectral energy, finite scalar series, and the full degree57240
preprocessed polynomial. It treats the original kernel prerequisites and the
three total-energy integrals as previously certified inputs. To rerun those:

```sh
python verify_combined.py --source-dir SOURCE --full
```

To rerun just the new total-energy integrations and save their enclosures:

```sh
python verify_dirichlet_energy.py --source-dir SOURCE --output regenerated-energy.json
```

Optional `--output result.json` on the main verifier saves the calculated result.
Neither verifier writes into the source repository. Outputs require explicit
paths. The bundled `verification.log` records the directed final assembly;
`energies.log` records the successful three-energy integration.
`full-verification.log` records the successful complete `--full` run. An
independent agent also reran the assembly and all three energy integrations,
obtaining the same outward endpoints.

The added coefficient table was generated and audited in our preceding bundle.
It contains modes120 through239 for each side, with cutoff36. Its SHA256 is
`8996603d5ad031d58e073105956d4189d4a1df3a6862f84a9dce1ec3dbce8dec`.
The supplied other-instance table overlaps our intervals but that overlap is
not used as a proof of enclosure. We retain our provenance-backed table.
Regeneration is a separate, longer computation:

```sh
python generate_added_origin.py --source-dir SOURCE --output rebuilt.npz
python verify_combined.py --source-dir SOURCE --added-table rebuilt.npz
```

A caller-supplied table is accepted only as a caller-certified quadrature input;
the checker reports its hash and whether it equals the bundled table. See
`proof.md` for the analytical estimates and `manifest.json` for input hashes and
provenance of the adapted finite-series code.
