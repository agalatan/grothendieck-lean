# Taylor-port partial tables

Agent-ID: codex-40e8. Refs #335, #41, #313.

The files `j1-tables.txt`, `j2-tables.txt`, `j3-tables.txt` contain the
enclosures of partial Gauss sums over the node ranges in `ranges.json`. The range and
final facts generated from them (`Grothe/UpperQuad/PortFacts/`) are part of the
single-channel upper proof (K < 1.404599395362, `Grothe/UpperTightFinal.lean`);
`Grothe.Statement.main_bounds` does not use them.
Each header specifies the range and two radii; the following line stores the
low-band midpoints. All values use the dyadic scale `2^-64`.

The acceptance preflight below was run before the range computations were scheduled. It
reads the grouped-radius margins of `Grothe/UpperQuad/PortFacts/Margins.lean`, which is no
longer in the tree (the single-channel upper proof uses `UpperQuad.TwistMargins`), so these
commands do not run on the current sources:

```sh
python3 tools/audit_port_tables.py --json
python3 tools/audit_port_tables.py --cross-check-generator
python3 tools/audit_port_tables.py --lean-output handoff/port-audit/TableArithmetic.lean
```

The independent preflight reads the exact center literals in the Lean sources,
checks dimensions and range coverage against the actual panel and bracket
lists defining `partitionSpecs`, computes the whole-error and low-band
margins using exact rational arithmetic, and reports hashes of its inputs.
Acceptance checks the required inequalities; any difference from the generator's
threshold and tolerance rounding conventions is reported separately.
The optional generator cross-check also uses the committed center NPZ inputs.
The generated scratch Lean file checks the actual `finalFact` predicates with
inline copies of these tables, without importing any expensive range theorem:

```sh
lake build Grothe.UpperQuad.PortFacts.Common
lake env lean handoff/port-audit/TableArithmetic.lean
```

These checks establish only the arithmetic of the tables. Each `rangeFact`
proves that the actual interval computation lies inside its table; the
soundness chain and analytic quadrature remainders connect those finite checks
to the Gaussian integrals. A passing preflight does not
prove a low-band error, a whole-source error, or the upper bound.

`tools/gen_port_facts.py --check` checks byte reproduction of the generated
Lean fact modules from these files and the committed center inputs. Historical
table proposals came from the external prototype node arrays through
`tools/port_facts_tables.py`; those prototype arrays are not included here.
Their absence prevents replaying that discovery step. Acceptance recomputes
every node from the production kernel, phase terms, profile, and centers.
