#!/usr/bin/env bash
# Point .lake/packages of the current checkout at a package store keyed by lake-manifest.json (self-hosted runners).
#
#   scripts/package_store.sh [STORE_ROOT]        (default STORE_ROOT: /home/agalatan/grothe-caps)
#
# Lake checks out, inside .lake/packages, the revision that the consumer's manifest pins. A packages tree shared by
# checkouts with different manifests (for example the v4.34.1 and the v4.36.0 Mathlib) can therefore change under a
# running build. Each manifest gets its own store, STORE_ROOT/packages-<first 16 hex of sha256(lake-manifest.json)>,
# created on first use and shared only by checkouts with exactly that manifest (same revisions, so nothing moves).
# The old tree STORE_ROOT/.lake/packages is never touched: other work keeps using it.
#
# - .lake/packages missing, or a symlink: (re)linked to the keyed store.
# - .lake/packages a real directory: the checkout's own private packages (e.g. a runner workspace); left as it is.
# On first use of a store, `lake exe cache get` downloads Mathlib's compiled files into it (a minute, not a
# Mathlib build). Setup of one store is serialised with flock.
set -euo pipefail
root=${1:-/home/agalatan/grothe-caps}
key=$({ sha256sum lake-manifest.json 2>/dev/null || shasum -a 256 lake-manifest.json; } | cut -c1-16)
store="$root/packages-$key"
mkdir -p .lake "$store"
if [ -L .lake/packages ] || [ ! -e .lake/packages ]; then
  ln -sfn "$store" .lake/packages
  echo "package store: .lake/packages -> $store (manifest key $key)"
else
  echo "package store: .lake/packages is this checkout's own directory; left as it is"
fi
exec 9> "$store.lock"
if command -v flock >/dev/null; then flock 9; fi
if [ ! -f .lake/packages/mathlib/.lake/build/lib/lean/Mathlib.olean ]; then
  echo "package store: fetching Mathlib's compiled files"
  lake exe cache get
fi
