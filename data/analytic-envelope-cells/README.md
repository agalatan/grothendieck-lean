# Analytic envelope inputs

Agent-ID: codex-2ca4.

`certificate.json` records the original rational intervals for the 183 analytic
envelope leaves of the complete 19,161-leaf base-pair partition. It shares 104
profile contexts and 83 scalar exponential inputs. These are candidate data;
their presence or successful Python replay does not prove a Lean theorem.

`source-pack.json.gz` preserves all root, split and terminal geometry, the
analytic envelope records, and the original parent/finish provenance hashes.
It omits the algebraic leaves' numerical models, which are not inputs of this
certificate. `source-polynomial.json` supplies the pinned profile coefficients.
The extractor checks the complete midpoint frontier and reproduces the
certificate byte for byte from these committed inputs:

```sh
python3 tools/extract_analytic_envelope_cells.py \
  --packed-input data/analytic-envelope-cells/source-pack.json.gz --check
python3 tools/gen_analytic_envelope_root11.py --check
```

The root-11 theorem uses the complete reciprocal root of radial strip 5 and
retains the original one-sided first interval and signed companion interval.
Lean checks the actual profile, exponential envelope, exact root identity and
area-weighted interval inclusion. The theorem does not add normalization or
source-omission error, and does not close the other roots or the upper endpoint.

The supporting profile and reciprocal-envelope modules are reproduced by:

```sh
python3 tools/q0_quadrature/gen_profile_model.py --check
python3 tools/q0_quadrature/gen_base_pair_radial_envelope.py --reciprocal --check
```
