# Lower-certificate reproduction failure: diagnosis

The exact envelope verifier proves an implication from the profile table; it does not independently establish that table. A full run of the upstream lower certificate failed locally. Therefore the lower bound should not be described as fully reproduced in this session.

Environment: macOS 26.3.1, ARM64; Apple clang 17.0.0 invoked as g++.
Source preserved unchanged: work/source_complex/check_complex_lower.py.
Wrapper: work/real/diagnose_lower_first_profile.py.

The first failed comparison is:

- profile H0.1;
- node r=3/100;
- recipe index 3, pool0/price_0009;
- computed certified upper =3345478627223566433626713195046333/5000000000000000000000000000000000;
- stored cap =6690957254447126299812000800881413/10000000000000000000000000000000000;
- exact excess =6567441425589211253/10000000000000000000000000000000000, approximately 6.567441425589211253e-16.

The preceding node r=0 equals its stored cap exactly. The next two nodes have negative differences of approximately -2.17e-18 and -1.06e-14. Thus the stored caps have essentially no margin for cross-platform variations in the selected prices.

The C++ PriceGenerator::weights function deliberately uses ordinary floating-point sin, cos, acos, square roots and std::complex operations to CHOOSE positive dyadic weights. Their non-rigorous evaluation does not itself compromise a proof, because the chosen dyadics are then treated as exact constants in outward-rounded moment estimates. However, slightly different chosen dyadics can produce slightly different certified bounds. Fixed rational caps copied from another run can then fail, as happened here.

The offending recipe yields the exact same rational result with Apple clang -O0, -O2 and -O3, each with -fno-fast-math -ffp-contract=off. This rules out optimization-level variation among those three settings; it does not establish the cause. No Linux/GCC/libm cross-check has been performed.

Conclusion: reproduction failed at a difference of about 6.6e-16. This is compatible with a portability or data-margin issue but does not prove its cause, and it does not disprove the underlying profile inequality or mathematical lower bound. The independent upper-bound audit does not use this verifier or these profiles.

No proof gates were disabled or weakened. No upstream files were changed. Saved diagnostic inputs, generated moments and exact failure data are in work/real/lower_diagnostic/.
