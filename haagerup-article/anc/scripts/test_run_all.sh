#!/usr/bin/env bash
# Tests of run_all.sh's comparison and --save rules, on a disposable copy, without running the scripts:
# a stub interpreter prints the stored reference output of each script.
#   ./test_run_all.sh      exit status 0 if every case behaves as documented
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
fail=0
setup() {
  rm -rf "$tmp/s" "$tmp/ref"
  mkdir -p "$tmp/s"
  cp "$here"/run_all.sh "$here"/*.py "$tmp/s/"
  cp -R "$here/expected_output" "$tmp/s/expected_output"
  cp -R "$here/expected_output" "$tmp/ref"
  cat > "$tmp/stub" <<STUB
#!/usr/bin/env bash
f="\$1"; shift
cat "$tmp/ref/\${f%.py}.txt"
STUB
  chmod +x "$tmp/stub"
}
expect() {  # expect <0|nonzero> <description> <run_all arguments...>
  local want="$1" what="$2" code=0
  shift 2
  PYTHON="$tmp/stub" "$tmp/s/run_all.sh" "$@" > "$tmp/out" 2>&1 || code=$?
  if { [ "$want" = 0 ] && [ "$code" = 0 ]; } || { [ "$want" = nonzero ] && [ "$code" != 0 ]; }; then
    echo "ok    $what (exit $code)"
  else
    echo "FAIL  $what (exit $code, wanted $want)"; cat "$tmp/out"; fail=1
  fi
}
setup; expect 0 "unchanged references pass" --quick
setup; rm "$tmp/s/expected_output/01_certificate_arithmetic.txt"
expect nonzero "a missing reference of an exact script fails" --quick
setup; echo "edited" >> "$tmp/s/expected_output/05_head.txt"
expect nonzero "an edited reference of an exact script fails" --quick
setup; rm "$tmp/s/expected_output/03_cell_maps.txt"
expect nonzero "a missing reference of a floating-point script fails" --quick
edit() {  # edit <file> <python expression on the list of lines L>: a portable in-place edit
  python3 - "$1" "$2" <<'PY'
import sys
path, expr = sys.argv[1], sys.argv[2]
L = open(path).read().split("\n")
exec(expr)
open(path, "w").write("\n".join(L))
PY
}
setup; edit "$tmp/s/expected_output/02_gamma_dagger.txt" '
i = next(k for k, l in enumerate(L) if l[-1:].isdigit() and "[ok]" not in l)
L[i] = L[i][:-1] + str((int(L[i][-1]) + 1) % 10)'
expect 0 "a last-digit change outside the [ok] lines of a floating-point script passes" --quick
setup; edit "$tmp/s/expected_output/06_tails.txt" '
i = next(k for k, l in enumerate(L) if "[ok]" in l)
L[i] = L[i] + " edited"'
expect nonzero "an edited [ok] line of a floating-point script fails" --quick
setup; rm "$tmp/s/expected_output/01_certificate_arithmetic.txt"; mkdir "$tmp/s/expected_output/01_certificate_arithmetic.txt"
expect nonzero "--save fails when it cannot write a reference output" --quick --save
if [ "$fail" = 0 ]; then echo "ALL CASES PASS"; fi
exit "$fail"
