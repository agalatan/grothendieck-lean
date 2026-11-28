# More channels for the upper bound: start here

**The proved selector improvement.** Lean proves $K_G^{\mathbb C}\le 1.404556392$ by adding a Gaussian angular selector to the six established rounding channels. Its signed scalar and matrix expansions, full Wiener error, and mixture with the six certified heads are formalized in `Grothe/UpperSelector/`. The seven-column transfer slope is `711968565817136711740669035/10^27`. An independently replayable rational dual puts every six-column slope below `0.7119685648573` with those same maps, preprocessors, cutoffs and tail allowances. [Root theorem](../../Grothe/Upper/Result.lean) · [Uniform six-column comparison](sources/angular-selector-transfer-codex-a7c4/PROOF.md) · [Current bounds](../../docs/CONSTANTS.md).

The 24 November 2026 mixture experiment has status **N**. The [ledger](STATUS.md) also records the paper proofs about rounding channels.

**What can one complex coordinate achieve?** Phase rounding maximizes the alternating coefficient sum over every charge-one disk map of one complex Gaussian coordinate and every contractive polynomial preprocessor. Its value is exactly Haagerup’s $\gamma^\dagger$. Thus beating that value by the mixture transfer requires a channel using at least two coordinates. The proof reduces the problem to a radial integral operator and certifies a spectral gap. [Proof and exact replay](sources/one-coordinate-ceiling-codex-a7c4/PROOF.md)

**The result in one paragraph.** Adding to the six channels **one** new channel, the cell channel of the
eighteen-channel certificate with the preprocessor R(X) = a − (1 − a)X at a = 93079/100000 instead of its committed
a = 0.9194…, gives the model slope D = 0.711974083612, that is 1/D = 1.404545507 (ledger 4.7). The experiment compared it with
the certificate of the six channels at the commit it read, 1/D = 1.404557403: 1.19·10⁻⁵ more. The six-channel Lean theorem proves
1.404556407 with a sharper certificate of those channels (another polynomial in the first channel, the linear
energy removed from the tail budgets, 321 head coefficients of the phase channel); the model value is 1.09·10⁻⁵
below that bound. Whether those refinements also gain for the candidate was not examined. The new channel takes the place of the six's channel 4, whose weight drops to zero.
The head of the new channel is an exact interval composition of grades that Lean already verifies on the
eighteen-channel branch, and its allowance (8.9·10⁻¹⁰) is the one that branch already pays for the same channel type;
both were re-derived here independently (ledger §4). The cell channel cannot be written inside the six-channel
framework: a certificate needs the cell machinery of the eighteen-channel branch, which is not on master.
Against master's seven channels the same copy still gains 1.18·10⁻⁵ (1/D = 1.404544590 at a = 23277/25000), and the selector then drops out ([eighth-channel note](sources/eighth-channel-2026-11-26/NOTE.md), ledger §9).
The candidate has exactly six channels with positive weight, so the six-channel assembly of master keeps its
shape: the new cell pair takes the slot of channel 4 (ledger §5).

## The model

A *channel* is a rounding scheme whose expected correlation is a radial series Σ_k h_k ζ|ζ|^{2k} with real,
absolutely summable coefficients (`haagerup-article/main.tex`, Sections 2 and 3). Channels mix: choosing channel p
with probability w_p gives H_k = Σ_p w_p h_k^{(p)}, and

    D = H_0 − Σ_{k≥1} |H_k|,        K_G^ℂ ≤ 1/D     (radial transfer lemma).

A certificate bounds D from below by a finite head and per-channel allowances:

    D ≥ H_0 − Σ_{1≤k≤250} |H_k| − Σ_p w_p a_p,

where a_p bounds everything of channel p that the head does not contain: its tail Σ_{k>250} |h_k^{(p)}| (Hardy tail
lemma: a bound B on the mean square on a circle of radius ρ > 1 inside the disk of analyticity gives
Σ_{k>K} |h_k| ≤ √(B ρ^{−(4K+6)}/(1 − ρ^{−4}))), and any comparison or truncation error of its head. The signs of the
h_k^{(p)} cancel across channels before the absolute value is taken, so the best weights solve a linear programme.

**The alternating sum in large dimension.** For this class of maps the supremum of $W=\sum_k(-1)^k H_k$ over all dimensions is one. Every fixed dimension has a strict gap. A charge-one version of Xie and Zhang’s quadratic-phase construction gives a finite example above $0.96$, while the transferable slope satisfies $D(H)\le\pi/4$ in every dimension. This answers the article's finite-attainment and slope-approximation questions. [Proof and finite witness](sources/high-dimensional-alternation-codex-a7c4/PROOF.md)

## The two families of channels

| | six channels | eighteen channels |
|---|---|---|
| where | master, `Grothe/UpperSix/` (article: `haagerup-article/main.tex`); read here at commit `f6620f3b` | the branch `gemini-1aa9/upper-mixture` of pull request #556 (closed, the branch deleted): `Grothe/UpperReplacement/`, its `docs/UPPER_CERTIFICATE.md`; read here at commit `76c4647b`, which `refs/pull/556/head` keeps |
| certified D, 1/D | 0.711968053274, 1.4045574031 (the certificate at that commit; the six-channel theorem proves 1.404556407 with the certificate of `Grothe/UpperSix/Certificate/`) | 0.711962052581, 1.404569241261 (stated by that branch; read, not replayed) |
| channel types | smoothed 64×64×36 cell map with (P, Q = −X): channels 0, 1, 5; phase with a degree-14 preprocessor: 2; reflected cell map with (−R, R): 3, 4 | ten GT channels, seven phase channels, one cell channel (a pair of responses on 64 angular × 128 × 128 radial cells, both coordinates preprocessed by R) |
| head data | `Haagerup/Data/OverlapData.lean` (interval tables at scale 2⁻¹²⁸), `Haagerup/Parameters.lean` | `data/upper-replacement/exact-columns.json`, `cell-inputs.npz`, `Grothe/Upper/Data.lean`, `HeadWitnessFacts/Group00`–`07` (cell grades), `RootData.lean` |
| head length | 251 coefficients per channel | 251 (GT, phase); 126 for the cell channel, which pays a truncation allowance for the rest |

In this folder the 24 channels are numbered 0–5 (the six) and 6–23 (the eighteen, in the order of
`exact-columns.json`); the eighteen's cell channel `tiger_fw_18` is number 21.

## What the experiment found

1. **The union of the 24 committed channels gains almost nothing**: D = 0.711968938847 (ledger 2.3). One residual,
   H_10 ≈ 1.9·10⁻⁶, carries two thirds of the nonlinear head, and no committed channel cancels it (ledger 2.4).
2. **New preprocessors for the eighteen's cell channel do.** Among extra copies of every channel type with other
   preprocessors, only copies of that cell channel with R = [a, −(1 − a)], a ≈ 0.93, help (ledger §3; allowances
   were assumed at that stage).
3. **The lead holds with real allowances** (ledger §4): the grades of the cell pair were recomputed from the integer
   cell data in ball arithmetic and lie inside the Lean-verified enclosures; the discarded part of the new channel
   (indices 126 to 250) is about 5·10⁻²⁶; its disk of analyticity has radius 1.204, so the radius 1.09 and the
   circle budget 2 of the committed cell channel apply unchanged, with a float circle mean of 1.18.

## How to reproduce

Python 3 with `numpy`, `scipy`, `mpmath` and `python-flint` (0.9 was used). From `research/upper-channels/code/`:

```sh
./fetch_sources.sh                       # src6/ and src18/ from the two pinned commits (ignored by git)
python3 channels.py out 8                # the 24 head vectors, exact intervals: out/channel-00.json ... -23.json
python3 analyse.py out results.json      # validation, the LPs for six / eighteen / union            (ledger §1, §2)
python3 colgen.py out colgen.json        # new preprocessors, assumed allowances                     (ledger §3)
python3 colgen2.py out colgen2.json
python3 colgen3.py out colgen3.json
python3 cell_grades.py src18/data/upper-replacement/cell-inputs.npz 250 grades-250.json 30 3072   # (ledger 4.1)
python3 cmp_grades.py grades-250.json src18
python3 cell_heads.py grades-250.json out/channel-21.json src18 heads-250.json 93079/100000 931/1000 1861/2000 \
        3723/4000 465383518149/500000000000 3727/4000 233/250                                     # (ledger 4.2, 4.3)
python3 schur_tail.py schur_tail.json 9/10 91942572547021/100000000000000 93/100 93079/100000 931/1000 \
        1861/2000 3723/4000 465383518149/500000000000 3727/4000 233/250 47/50 19/20 391/400       # (ledger 4.4)
python3 mixture_real.py out src18 results.json mixture_real.json                                  # (ledger 4.6, 4.7)
```

**The inputs are pinned.** `fetch_sources.sh` reads the six-channel data at master commit
`f6620f3b6bb3a8defc0ab37569eb744e4afa4726` and the eighteen-channel data at commit
`76c4647b7de50c89aba82da63a3ee3d37f7c0cc3`, fetched as `refs/pull/556/head` of origin where the clone does not have it;
it stops if that ref points elsewhere or if `cell-inputs.npz` does not have its recorded SHA-256. It was tested from
an empty clone.

**Exact values between scripts.** `results.json` carries every allowance twice: as a rounded decimal for reading and
as the exact rational (`certified_exact`, `hypothetical_exact`, `gt_error_per_unit_exact`, `cell_truncation_exact`).
The other scripts read only the exact fields; weights and head intervals are stored exactly as well.

**Running times and what was run where.** `cell_grades.py` with 30 processes took 25 s for 126 grades and 145 s for
251 on a 32-core machine; `schur_tail.py` takes a few minutes; everything else takes seconds to a minute.
`grades-250.json` and `schur_tail.json` are the outputs of the 32-core machine; every other JSON file of `code/` is the
output of the chain above run from this folder on a laptop (all commands except `cell_grades.py` and
`schur_tail.py`), with the 24 channel vectors and `heads-250.json` byte-identical to those of the first machine. All
runs are of 24 November 2026; [`INVENTORY.md`](INVENTORY.md) says where the logs and the 24 channel vectors are.

| file | what it is |
|---|---|
| `README.md` | this file |
| [`STATUS.md`](STATUS.md) | the ledger: every result with its label, author and checker, and what a certificate needs |
| [`INVENTORY.md`](INVENTORY.md) | what is kept outside the repository |
| `code/` | the scripts and their small JSON results |

## Endpoint restrictions on rounding channels

For the common-map class, high alternating score and high first coefficient each impose a restriction on transfer. If the absolute alternating score approaches one, the transfer slope approaches minus one. If the first coefficient approaches $\pi/4$, the entire series approaches the phase series and the slope approaches $\pi/2-1$. Both limits hold uniformly over convex mixtures and dimensions. [Proofs and explicit thresholds](STATUS.md#7-rigidity-of-the-transfer-slope).
