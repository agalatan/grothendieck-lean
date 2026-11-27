# Independent full replay of the peak six-sector certificate

Codex agent `codex-a7c4` independently reran the outward-rounded C++ producer for ledger 7.5.13 on hosted Linux at commit `df6974434c4ba8e4715b227edbc14a16479d0570`. The run closed all 98 bulk slabs in 12,450 seconds and saved the fresh receipt. The earlier cross-family review checked the analytic argument, the corrected radial and angular enclosures, the producer and its controls, and independently sampled two bulk slabs. Together these support **P + C, independently checked** for the peak pointwise inequality on $\mathbb C^6$. Its retained six-sector corollary applies with $u\le0.0463$, $u+V\le0.080051$ and arbitrary odd energy. [Theorem A and Corollary B](../../sources/global-all-sector-gemini-c1de/PROOF.md) · [Cross-family review](https://github.com/agalatan/grothendieck-lean/pull/642#issuecomment-7162166564) · [Full Linux job](https://github.com/agalatan/grothendieck-lean/actions/runs/45744662190/job/139657720284) · [Receipt report](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-7228278646)

Both receipts pass the shipped verifier. The 512 potential slabs, 244 origin slabs, 98 bulk slabs, all recorded domains and the per-slab integer counts agree. In total 1,272,687 bulk boxes closed, with zero open. Of 21,457 scalar fields, 14,410 hexadecimal numerical measurements differ across the two runs, all with the same signs. The greatest absolute difference is exactly $751/2^{54}$ in bulk slab 57's minimum odd pivot (zero-based index). The Linux receipt records the worst margin as `-0x1.ed2b8d7cp-40` (about $-1.75209\times10^{-12}$) and the minimum odd pivot as `0x1.3dd032444p-23` (about $1.47993\times10^{-7}$). The producer computes the enclosures. The JSON records slab summaries and counts for each closure category. [Producer](certify_all_sector.cpp) · [Verifier](verify.py)

## Replay saved results

From the repository root run

```sh
python3 -IB research/conjecture-K/code/global-all-sector-gemini-c1de/compare_replay.py
```

The comparator restores the original 546,060 Linux JSON bytes from the tracked 546,108-byte receipt and the 83,479-byte text delta. For each permitted measurement in JSON traversal order, a dot copies its original string. Otherwise the token contains the number of original hexadecimal mantissa characters to retain and the replacement suffix, separated by a colon. The binary exponent is copied. The comparator authenticates the restored and published receipts by their separate SHA-256 digests, runs the shipped verifier on each, and compares their JSON structure and scalar fields with exact dyadic arithmetic. Only hexadecimal measurements at the explicitly listed JSON paths may differ. All other scalar values, types, keys and array lengths must agree. Its corruption controls exercise sign, geometry, key and type changes. Use `--linux PATH` to also compare the downloaded receipt bytes. [Text delta](linux-full-replay.delta) · [Comparator](compare_replay.py)

| File | SHA-256 |
|---|---|
| C++ producer | `2186d7971f9693cc2440fe794eab29ffb80a0ca3b775f916583cb903eab0705c` |
| Python verifier | `fc9af6813e2bf7430989ff1bce18aa6db27f287b2997fd8c874ec3ddf1f92e17` |
| Theorem A and Corollary B source | `e98ee17b947fa8792d47a5a72c93383ac83a84c0881c9d8531fc8b533e2e0b22` |
| Published JSON | `fe5e948a3090d64692064575268289490f7f89d3ab0747ee27dfc09dff1bdcbb` |
| Independent Linux JSON | `6a14ef823cd34e2153d433851bf713666823541a4f8f476976fa0d99eeb50407` |
| Text delta | `2e26adf4598439c8d8a9b83cd3cf6690b213d87deedcc8b7e80edc8b1f085799` |

The input files in the first four rows match the replay commit. GitHub stored the Linux output in artifact `cloud-codex-a7c4-20261126024639-24377-0`, ID `15091514350`, 154,297 archive bytes, SHA-256 `a20527cf95bc619091503179201766d339825bc216eeeab6e9f79b973ffcf2c7`. The tracked delta keeps the independent receipt reproducible after the Actions artifact expires. [Run artifact](https://github.com/agalatan/grothendieck-lean/actions/runs/45744662190/artifacts/15091514350)
