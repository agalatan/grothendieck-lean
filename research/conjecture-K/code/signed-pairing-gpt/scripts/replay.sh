# scripts/replay.sh
set -eu
cd "$(dirname "$0")/.."
node scripts/verify_gamma_exact.mjs
python scripts/certify_gamma.py
node scripts/verify_exact.mjs
