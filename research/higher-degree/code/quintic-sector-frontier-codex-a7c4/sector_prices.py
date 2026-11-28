"""Optional common sector split against the uncompressed Gram prices.
Uses the floors checked by the predecessor's mass_gram.make_rows and
product_cover.build; point.py performs their exact price reconstruction.
Agent-ID: codex-a7c4.
"""

from fractions import Fraction as Q
from pathlib import Path
import argparse
import sys


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    code = parser.parse_args().repo.resolve() / "research/higher-degree/code"
    sys.path[:0] = [
        str(code / "quintic-product-support-codex-a7c4"),
        str(code / "quintic-sector-moments-codex-a7c4"),
    ]
    import step_charges as s
    import mass_gram as m

    t, A, K, D = map(Q, (".42", ".6812", ".73532102", ".0144"))
    val = Q(10000, 14023) + Q(1, 500000)
    rows = []
    for c, _, _, _, prices in s.ROWS:
        a, h, *p = [Q(z, 10**9) for z in prices]
        rows.append((a, h, m.ETA - Q(c, 10**6), p))
    for L, c, _, _, prices in m.TRIALS:
        h, *p = [Q(z, 10**7) for z in prices]
        rows.append((m.ETA + Q(L), h, m.ETA - Q(c), p))
    if len(rows) != 12 or s.SLOTS[3] != (1, 0) or s.WEIGHTS[2] != Q(".066254"):
        raise ValueError("unexpected sector convention")

    def slack(slot):
        w = D / s.WEIGHTS[slot - 1]
        if not 0 <= w <= 1:
            raise ValueError("invalid mixture")
        return min(
            a
            + (1 - h) * t * t
            + m.EPS * A
            - d * K
            - A * ((1 - w) * p[0] + w * p[slot])
            - val
            for a, h, d, p in rows
        )

    if slack(3) <= Q(33827825, 10**12) or slack(1) >= 0:
        raise ValueError("Gram mixture or wrong-sector control")
    print(
        "Remote and (1,0) mixture clears all twelve raw Gram rows by >",
        int(slack(3) * 10**12),
        "trillionths.",
    )
    print("Replacing (1,0) by (1,1) rejects the same charge.")


if __name__ == "__main__":
    main()
