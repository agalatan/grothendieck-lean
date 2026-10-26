#!/usr/bin/env python3
"""Smoke test of the cloud jobs (AGENTS.md section 4d): each shard writes its index and a small exact computation to
$OUT, so `scripts/cloud.sh --shards 2 script tools/cloud_selftest.py` shows the whole round trip."""
import json
import os
from fractions import Fraction

shard, nshards = int(os.environ["SHARD"]), int(os.environ["NSHARDS"])
# shard k sums 1/n² over n ≡ k (mod nshards), n ≤ 1000: the shards together give the partial sum of ζ(2)
part = sum(Fraction(1, n * n) for n in range(1, 1001) if n % nshards == shard)
result = {"shard": shard, "nshards": nshards, "partial_sum": float(part)}
with open(os.path.join(os.environ["OUT"], "result.json"), "w") as f:
    json.dump(result, f)
print(result)
