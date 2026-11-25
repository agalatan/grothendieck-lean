"""Verify the concentrated finite-selector mixtures and the d=1 control. Agent-ID: codex-a7c4."""

import argparse
from fractions import Fraction as Q
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "angular-selector-transfer-codex-a7c4"))
from selector import selector_columns, require
from verify import six_columns, check_low_grades, fixed_lower


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--sources", required=True, type=Path, help="directory from fetch_sources.sh")
    args = parser.parse_args()
    rows, caps, _ = six_columns(args.sources.resolve())
    columns = (
        (3, Q(3, 20), Q(197, 200)),
        (3, Q(3, 20), Q(39, 40)),
        (4, Q(7, 50), Q(199, 200)),
    )
    for baths, strength, p in columns:
        head, cap = selector_columns(baths=baths, strength=strength, radial_terms=1800, preprocessor=p)["linear"]
        check_low_grades(head, p, baths=baths, strength=strength)
        bound = Q(522, 10**7) if baths == 3 else Q(537, 10**7)
        require(cap < bound, f"full Wiener budget for d={baths}, p={p}")
        rows.append([(x, x) for x in head])
        caps.append(cap)

    seven = [855384964652, 87541564726, 156281241, 74502861, 56427888477, 350417167, 64380876]
    nine = [855461089648, 87466027512, 156246524, 76815338, 56421633549, 350909754,
            39335570, 22953474, 4988631]
    for integers, lower, upper in ((seven, "0.7119685862300", "1.404556352"),
                                   (nine, "0.7119685873541", "1.404556350")):
        weights = [Q(v, 10**12) for v in integers]
        slope = fixed_lower(rows, caps, weights)
        require(slope > Q(lower) and 1 / slope < Q(upper), "finite multiple-selector endpoint")
        print(f"{len(integers)} channels: D > {lower}, reciprocal < {upper}")
        print(f"Exact finite-certificate reciprocal: {1 / slope}")


if __name__ == "__main__":
    main()
