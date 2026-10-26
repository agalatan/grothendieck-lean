# Frozen discovery dependency

The three discovery programs import the adjacent
`tools/fresh_lower_frozen_response_gram.py`, and check its SHA256 before loading
it. They do not read or import the original research checkout at replay time.
`tools/fresh_lower_exact.py` is independent and uses only the Python standard
library.

The frozen file is a byte-for-byte copy of
`/Users/alingalatan/workspaces/grothe/tools/screen_response_gram.py`, the response
fixture module used by the discovery runs. It was copied on 23 October 2026.
At freezing, the source repository HEAD was
`98f61ecceda6c8fc25e08b6efc63675b666ed80b`. The source fixture was untracked, so
the commit hash alone does not pin its contents. Its SHA256, matching the
frozen copy exactly, is:

`15a863df1e06635370165f3fa922ca019bd036a1652869168e10d7c6d4ba7ef0`.

The original source module was not edited. A fixture hash was not saved before
each initial run; the frozen module reproduces the same contact parameters
recorded in every saved discovery result. New portable replays record and
enforce the content hash explicitly.

The frozen module imports only the standard library, NumPy and SciPy at module
load time. There are no transitive repository-local imports. Its optional
`completion()` method imports CVXPY, but none of the fresh-lower replays calls
that method or requires CVXPY. The full module is retained verbatim rather than
silently trimming the fixture source.

Discovery environment: NumPy 2.3.5, SciPy 1.17.1. Directed interval arithmetic
is not used by these discovery programs. The exact replay requires neither
package. All output decimals remain discovery values rather than enclosures.

Run scripts by absolute path from any working directory, with the frozen module
kept beside them; output paths are supplied through `--out`. Python isolated
mode is supported because the fixture is loaded explicitly by file path.
