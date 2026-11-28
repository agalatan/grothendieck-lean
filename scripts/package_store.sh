#!/usr/bin/env bash
# Give the current checkout the Lean packages of its own lake-manifest.json (CI runners and the laptop).
#
#   scripts/package_store.sh [STORE_ROOT]
#     default STORE_ROOT: /home/agalatan/grothe-caps on Linux, /Users/alingalatan/workspaces/grothe-packages on macOS
#
# Lake checks out, inside .lake/packages, the revisions that the consumer's manifest pins. A packages tree shared by
# checkouts with different manifests (the v4.34.1 and the v4.36.0 Mathlib) can therefore change under a running
# build. Each manifest gets its own store, STORE_ROOT/packages-<first 16 hex of sha256(lake-manifest.json)>, created
# on first use and shared only by checkouts with exactly that manifest (same revisions, so nothing moves). The old
# shared trees (~/grothe-caps/.lake/packages on the droplets, the main checkout's .lake/packages on the laptop) are
# never touched: the checkouts already linked to them keep using them.
#
# - .lake/packages missing, or a symlink: (re)linked to the keyed store, which records the manifest's full sha256
#   and refuses any other manifest.
# - .lake/packages a real directory: the checkout's own private packages; left in place.
# - Either way the compiled Mathlib is (re)fetched with `lake exe cache get` unless the stamp
#   .lake/packages/.cache-stamp records a successful fetch for exactly this manifest and toolchain, and afterwards
#   the Mathlib checkout must be at the revision the manifest pins. A keyed store whose Mathlib checkout is not at
#   that revision is refused (something else moved it). Setup is serialised per store with flock where it exists.
#
# lean.yml runs this in a workspace of its own per manifest (ws-<key>), so a job of another Lean/Mathlib generation,
# which keeps its own .lake/packages in the runner's root checkout, never meets this store, and vice versa.
set -euo pipefail
if [ $# -ge 1 ]; then root=$1
elif [ "$(uname)" = Darwin ]; then root=/Users/alingalatan/workspaces/grothe-packages
else root=/home/agalatan/grothe-caps; fi
sha() { { sha256sum "$1" 2>/dev/null || shasum -a 256 "$1"; } | cut -d' ' -f1; }
full=$(sha lake-manifest.json); key=${full:0:16}
store="$root/packages-$key"
mkdir -p .lake
linked=no
if [ -L .lake/packages ] || [ ! -e .lake/packages ]; then
  mkdir -p "$store"
  ln -sfn "$store" .lake/packages; linked=yes
  echo "package store: .lake/packages -> $store (manifest key $key)"
  exec 9> "$store.lock"
else
  echo "package store: .lake/packages is this checkout's own directory; kept"
  exec 9> .lake/packages.lock
fi
if command -v flock >/dev/null; then flock 9; fi
if [ "$linked" = yes ]; then
  if [ -f "$store/.manifest-sha256" ]; then
    [ "$(cat "$store/.manifest-sha256")" = "$full" ] || {
      echo "package store: $store was created for another manifest; refusing to use it" >&2; exit 1; }
  else
    echo "$full" > "$store/.manifest-sha256"
  fi
fi
want_rev=$(python3 -c 'import json; m=json.load(open("lake-manifest.json")); print(next((p["rev"] for p in m.get("packages", []) if p.get("name") == "mathlib"), ""))')
mathlib_rev() { git -C .lake/packages/mathlib rev-parse HEAD 2>/dev/null || true; }
toolchain=$(cat lean-toolchain 2>/dev/null || echo none)
stamp="$full $toolchain"
have=$(mathlib_rev)
if [ "$linked" = yes ] && [ -n "$have" ] && [ -n "$want_rev" ] && [ "$have" != "$want_rev" ]; then
  echo "package store: .lake/packages/mathlib is at $have, the manifest pins $want_rev; refusing to use it" >&2; exit 1
fi
if [ "$(cat .lake/packages/.cache-stamp 2>/dev/null || true)" != "$stamp" ] \
   || [ ! -f .lake/packages/mathlib/.lake/build/lib/lean/Mathlib.olean ]; then
  echo "package store: fetching Mathlib's compiled files for this manifest and toolchain"
  rm -f .lake/packages/.cache-stamp
  lake exe cache get
  have=$(mathlib_rev)
  if [ -n "$want_rev" ] && [ "$have" != "$want_rev" ]; then
    echo "package store: after the fetch, Mathlib is at ${have:-nothing}, the manifest pins $want_rev" >&2; exit 1
  fi
  echo "$stamp" > .lake/packages/.cache-stamp
elif [ -n "$want_rev" ] && [ "$have" != "$want_rev" ]; then
  echo "package store: the stamp matches but Mathlib is at ${have:-nothing}, the manifest pins $want_rev" >&2; exit 1
fi
