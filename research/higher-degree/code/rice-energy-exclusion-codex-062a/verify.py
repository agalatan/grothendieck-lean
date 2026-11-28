"""Transport the certified single-test Rice exclusions. Agent-ID: codex-062a."""
from dataclasses import dataclass
from decimal import Decimal
from fractions import Fraction as Q
import json
from math import ceil, floor, isqrt
from pathlib import Path
import sys

CODE = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(CODE / "piece15-content-codex-062a"))
import replay

E = Q(39, 50)
SCALE = 10**8
C6 = Q(4045313, 100000)
CHI_EDGES = (0, 1, 2, 3, 4, 6, 8, 10, 12, 14, 16, 20, 24, 30, 36, 42)


def sqrt_interval(x):
    scale = 2**64
    n = isqrt(x.numerator * scale**2 // x.denominator)
    lo = Q(n, scale)
    return lo, lo if lo**2 == x else Q(n + 1, scale)


@dataclass(frozen=True)
class Witness:
    piece: int
    chi_lo: Q
    chi_hi: Q
    energy: Q
    threshold: Q
    test: Q
    weight: Q
    second_lo: Q
    second_hi: Q
    third: Q

    def moment_slack(self, x):
        """Lower bound for the signed moment contribution at actual fourth excess x."""
        upper = self.chi_hi
        replay.check(0 <= x <= upper, "excess outside normalized moment domain")
        second = self.second_lo * (x - self.chi_lo) + self.second_hi * (upper - x)
        if x == upper:
            return second
        diff = upper * sqrt_interval(upper)[0] - x * sqrt_interval(x)[1]
        return second + self.third * (9 * (upper - x) + C6 * diff)

    def cutoff(self, t, slack=0):
        shift = E * (self.threshold - t - (Q(1, 2) + slack) / self.weight) / self.test
        return max(Q(0), self.energy + shift)**2 / self.energy


def load_witnesses():
    table = json.loads(replay.TABLE.read_text(), parse_float=Decimal)
    rows = []
    for chosen in sorted(table["chosen"], key=lambda c: Q(c["piece"][0])):
        row, = (r for r in table["cases"]
                if r["piece"] == chosen["piece"] and r["row_tag"] == chosen["row_tag"])
        rows.append(row)
    cfg = replay.original.load_full_cfg(str(replay.SOURCE / "dual_certs.json"))
    witnesses = []
    for c in cfg["cells"]:
        if c["kind"] != "INFEAS_R1":
            continue
        row = rows[c["piece_idx"] - 1]
        energy = Q(row["theta"][c["u_idx"]]["u"])
        replay.check(row["row_tag"] == c["row_tag"] and 0 < Q(c["u_lo"]) <= energy <= Q(c["u_hi"])
                     and Q(c["t_lo"]) <= Q(row["piece"][0]), "wrong source anchor")
        sc, = c["slicesA"]
        replay.check(not c["slicesB"] and sc["eta_sl_lo"] == sc["eta_sl_hi"] == 0, "profile-dependent witness")
        active = [(Q(lam), Q(m)) for lam, m in zip(cfg["lams_rice"], sc["mu_rice"], strict=True) if m]
        (lam, weight), = active
        replay.check(lam > 0 and weight > 0, "invalid active Rice test")
        multipliers = tuple(Q(sc[k]) for k in ("mu_u2_lo", "mu_u2_hi", "mu_u3"))
        replay.check(all(v >= 0 for v in multipliers), "negative moment multiplier")
        witnesses.append(Witness(c["piece_idx"], Q(c["chi_lo"]), Q(c["chi_hi"]),
                                 energy, Q(c["t_lo"]), lam, weight, *multipliers))
    replay.check(len(witnesses) == 19 and len(rows) == 21, "unexpected source inventory")
    return rows, witnesses


def upper_decimal(x):
    units = ceil(x * SCALE)
    return f"{units // SCALE}.{units % SCALE:08d}"


def first_grid_threshold(bound, u, left, right):
    """First 8-place t in the piece that certifies the specified energy."""
    lo, hi = ceil(left * SCALE) - 1, floor(right * SCALE)
    if lo >= hi or bound(Q(hi, SCALE)) > u:
        return None
    while hi - lo > 1:
        mid = (lo + hi) // 2
        if bound(Q(mid, SCALE)) <= u:
            hi = mid
        else:
            lo = mid
    return Q(hi, SCALE)


def moment_cutoff(witnesses, t, a, b):
    replay.check(0 <= a <= b, "invalid excess interval")
    return min(w.cutoff(t, min(w.moment_slack(a), w.moment_slack(b)))
               for w in witnesses if b <= w.chi_hi)


def check_moment_bins(rows, witnesses):
    before = after = 0
    additions = []
    for p, row in enumerate(rows, 1):
        t = Q(row["piece"][0])
        added = 0
        for a, b in zip(CHI_EDGES, CHI_EDGES[1:]):
            previous = [w.cutoff(t) for w in witnesses if w.chi_lo <= a and b <= w.chi_hi]
            cutoff = moment_cutoff(witnesses, t, a, b)
            for node in row["theta"]:
                u = Q(node["u"])
                old = any(u >= z for z in previous)
                new = u >= cutoff
                replay.check(not old or new, "lost a previously excluded whole bin")
                before += old
                after += new
                if new and not old:
                    replay.check(str(b) not in node["theta_chi"], "additional bin has an allowance")
                    added += 1
        additions.append(added)
        print(f"piece {p}: {added} additional whole omitted bins")
    replay.check((before, after) == (13, 40), "changed whole-bin totals")
    replay.check(additions == [1, 2, 1, 1, 6, 4, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0],
                 "changed per-piece comparisons")
    for p, lowest in [(5, "9.88"), (6, "12.57"), (7, "18.39"), (16, "33.94"), (17, "34.41")]:
        row = rows[p - 1]
        node = max(row["theta"], key=lambda node: Q(node["u"]))
        t, u, chi = Q(row["piece"][0]), Q(node["u"]), Q(lowest)
        cutoff = moment_cutoff(witnesses, t, chi, 42)
        replay.check(cutoff <= u < moment_cutoff(witnesses, t, chi - Q(1, 100), 42),
                     f"piece {p}: hundredth-grid comparison changed")
        print(f"piece {p}: chi in [{lowest}, 42] excluded from u = {node['u']}")
    print(f"{after - before} additional whole omitted bins ({before} to {after}).")


def main():
    replay.original.verify_all()  # bind the native receipt and audit signs, polygon and tails
    rows, witnesses = load_witnesses()
    check_moment_bins(rows, witnesses)
    print("Piece | u cutoffs at left t for chi in [30,42], [36,42], [39,42], [41,42], {42}")
    for i, row in enumerate(rows, 1):
        left = Q(row["piece"][0])
        cuts = [min(w.cutoff(left) for w in witnesses if w.chi_lo <= chi <= 42 <= w.chi_hi)
                for chi in (30, 36, 39, 41, 42)]
        print(i, *(upper_decimal(u) for u in cuts))
    active = [w for w in witnesses if w.chi_lo <= 39 and w.chi_hi >= 42]

    def bound(t):
        return min(w.cutoff(t) for w in active)

    # Bind the published comparisons to the exact table decimals and the best applicable witness.
    expected = [
        (18, "0.019461697561785344", "0.01973004", "0.86696928", True),
        (19, "0.013921953999498488", "0.01512316", "0.87401059", True),
        (20, "0.007929634325071395", "0.01082853", "0.88348334", False),
        (21, "0.002155699369223745", "0.00757856", None, False),
    ]
    for i, last_decimal, cutoff, first, below_cap in expected:
        row = rows[i - 1]
        left, right = map(Q, row["piece"])
        last = max(Q(n["u"]) for n in row["theta"])
        cap = Q(row["ucap"])
        u = bound(left)
        replay.check(last == Q(last_decimal), "largest listed energy changed")
        source17, = (w for w in active if w.piece == 17)
        replay.check(source17.cutoff(left) == u, "whole-piece attribution changed")
        replay.check(upper_decimal(u) == cutoff and last < u and (Q(cutoff) < cap) == below_cap,
                     f"piece {i}: changed whole-piece comparison")
        replay.check(u < cap if below_cap else u > cap, "ambiguous cap rounding")
        t = first_grid_threshold(bound, last, left, right)
        replay.check((upper_decimal(t) if t is not None else None) == first, "changed gate threshold")
        if t is None:
            replay.check(bound(right) > last, "right endpoint needs separate treatment")
        else:
            replay.check(source17.cutoff(t) <= last < bound(t - Q(1, SCALE)), "threshold rounded in wrong direction")
        print(f"piece {i}: last node {last}; first t at the node {first}; whole-piece cutoff {cutoff}")


if __name__ == "__main__":
    main()
