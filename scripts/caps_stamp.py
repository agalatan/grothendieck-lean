#!/usr/bin/env python3
"""Source hash of the node-cap modules (CapRowKK, CapNodes), recorded in the verified build cache.

The 15 original CapRowKK modules contain 60 single-threaded native_decide facts. Activated row12 adds
1307 separate computation leaves, listed by the bounded-build registry. The droplet's self-hosted runner
builds Grothe (node caps included) and checks the axiom report before recording the sources beside the build products:
    python3 scripts/caps_stamp.py --mark-cache          # writes .lake/build/caps-closure.sha
CI restores the cache and calls
    python3 scripts/caps_stamp.py --check-cache         # (the default) exit 0 iff the verified caps match
On a match CI builds Grothe (Lake replays the verified facts) and checks the axiom report. On a mismatch or
missing marker it dispatches a runner caps build instead. --digest prints the hash and file count without reading
or writing the marker; --list also lists the exact hashed files.

The hash covers the computation import closure of the CapRowKK modules, the thirteen quadrature-checker facts
(Grothe/UpperQuad/Facts: GradeBlock00-11 and Even) and every activated computation leaf, plus CapNodes.lean,
GrotheCapsKernel.lean, lean-toolchain, lake-manifest.json and lakefile.toml. Extras and the activated row assembly
and build registry are hashed directly,
without traversing their imports: lower-bound proof edits require re-checking the assembly, not the heavy facts.
The checker library root is pinned because its whole precompiled shared object is loaded by every importer, and
the Lake configuration controls native compilation. Analytic assembly imports are not traversed, so unrelated
proof-layer edits do not invalidate computation provenance. Import parsing fails closed on missing project modules (Grothe.*, GrotheKernel.* and
GrotheCapsKernel.*) or unsupported syntax. This is a cache provenance check, not a full build manifest; CI runs
its workflow and axiom-report checks separately.
Agent-ID: codex-0e12.
"""
import argparse, ast, hashlib, io, json, os, re, stat, sys
from pathlib import Path
from fractions import Fraction

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MARK = os.path.join(ROOT, ".lake", "build", "caps-closure.sha")
PROJECT_PREFIXES = ("Grothe.", "GrotheKernel.", "GrotheCapsKernel.", "GrotheQuadKernel.")
PROJECT_ROOTS = ("Grothe", "GrotheKernel", "GrotheCapsKernel", "GrotheQuadKernel")
CAP_ROWS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18]
# The legacy cap-row computation roots. The activated-registry and CapNodes checks below read exactly these:
# a row root missing from the registry or from CapNodes is an error.
ROW_TOPS = [f"Grothe.LowerAnalytic.CapRow{k:02d}" for k in CAP_ROWS]
# The quadrature checker's native facts (Grothe/UpperQuad/Facts): one block of the energy table each,
# about ten hours single-threaded; built once on the droplet and cached like the cap rows. They are hashed
# alongside the cap rows but are not cap-row roots: the registry and CapNodes checks use ROW_TOPS only.
QUAD_TOPS = [f"Grothe.UpperQuad.Facts.GradeBlock{b:02d}" for b in range(12)] + ["Grothe.UpperQuad.Facts.Even",
                                                                             "Grothe.UpperQuad.Facts.Omitted"]
# Every fixed root of the hashed computation closure. The localized cap pieces (row 14's node-150 proof included)
# are not listed here: they enter through the activated-leaf registry (activated_sources).
TOPS = ROW_TOPS + QUAD_TOPS
EXTRA = ["Grothe/LowerAnalytic/CapNodes.lean", "GrotheCapsKernel.lean", "lean-toolchain", "lake-manifest.json",
         "lakefile.toml"]
BUILD_REGISTRY = "data/caps-m/plan/row-certificates/row12-build.json"
ROW_ASSEMBLY = "Grothe/LowerAnalytic/CapRow12/Assembly.lean"
IMPORT = re.compile(r"\s*(?:public\s+)?(?:meta\s+)?import(?:\s+(.*))?$")
MODULE = re.compile(r"[A-Za-z_][A-Za-z0-9_']*(\.[A-Za-z_][A-Za-z0-9_']*)*$")


class ClosureError(Exception):
    pass


def is_project(module):
    return module in PROJECT_ROOTS or module.startswith(PROJECT_PREFIXES)


def imports_of(path, source_bytes=None):
    """Read the import header, ignoring line and nested block comments."""
    out = []
    depth = 0
    stream = open(path, encoding="utf-8") if source_bytes is None else io.StringIO(source_bytes.decode("utf-8"))
    with stream as source:
        for n, line in enumerate(source, 1):
            code = []
            i = 0
            while i < len(line):
                if depth:
                    if line.startswith("/-", i):
                        depth += 1
                        i += 2
                    elif line.startswith("-/", i):
                        depth -= 1
                        i += 2
                        code.append(" ")
                    else:
                        i += 1
                elif line.startswith("--", i):
                    break
                elif line.startswith("/-", i):
                    depth = 1
                    code.append(" ")
                    i += 2
                else:
                    code.append(line[i])
                    i += 1
            code = "".join(code)
            stripped = code.strip()
            if not stripped or stripped in {"module", "prelude"}:
                continue
            match = IMPORT.fullmatch(code.rstrip())
            if not match:
                if re.match(r"\s*(?:(?:public|meta)\s+)*import\b", code):
                    raise ClosureError(f"{os.path.relpath(path, ROOT)}:{n}: unsupported import syntax: {line.rstrip()}")
                break  # first body command: subsequent text is not an import header
            names = (match.group(1) or "").split()
            if not names or any(not MODULE.fullmatch(name) for name in names):
                raise ClosureError(f"{os.path.relpath(path, ROOT)}:{n}: unsupported import syntax: {line.rstrip()}")
            out.extend(names)
        else:
            if depth:
                raise ClosureError(f"{os.path.relpath(path, ROOT)}: unterminated block comment in import header")
    return out


def closure(tops):
    seen, todo = set(), list(tops)
    while todo:
        m = todo.pop()
        if m in seen:
            continue
        path = os.path.join(ROOT, *m.split(".")) + ".lean"
        if not os.path.exists(path):
            if is_project(m):
                raise ClosureError(f"project module {m} is imported but {os.path.relpath(path, ROOT)} does not exist")
            continue  # Mathlib, Lean core or another dependency
        seen.add(m)
        todo.extend(imports_of(path))
    return sorted(seen)


def registry_module(path):
    """Require a normalized in-repository project Lean source path."""
    if not isinstance(path, str) or not path.endswith(".lean") or "\\" in path:
        raise ClosureError(f"invalid computation registry source path: {path!r}")
    parts = path.split("/")
    module = path[:-5].replace("/", ".")
    if any(part in {"", ".", ".."} for part in parts) or not MODULE.fullmatch(module) or not is_project(module):
        raise ClosureError(f"invalid computation registry project path: {path!r}")
    resolved = os.path.realpath(os.path.join(ROOT, path))
    if os.path.commonpath((os.path.realpath(ROOT), resolved)) != os.path.realpath(ROOT):
        raise ClosureError(f"computation registry path escapes the repository: {path}")
    return module



# Shared source-only registry API. Agent-ID: codex-15b7.
ACTIVE_FORMAT = "caps-bounded-build-v2"
ACTIVE_CONFIG = ("lakefile.toml", "lake-manifest.json", "lean-toolchain")
ACTIVE_EXECUTION = ("scripts/build_caps_batches.py", "scripts/caps_stamp.py", "scripts/caps_coexist.py")
ACTIVE_GRIDS = [[400, 128, "1/50"], [1600, 256, "1/200"], [1600, 1024, "1/200"],
                [1600, 1152, "1/200"], [3200, 256, "1/400"]]
_RETAINED_NODE = "Grothe/LowerAnalytic/CapPieces/Node14x150.lean"
_RETAINED_ROOTS = {
    "Grothe/LowerAnalytic/CapPieces/C14x150.lean": ["Grothe.LowerAnalytic.pieceCover_14x150"],
    "Grothe/LowerAnalytic/CapPieces/R14x150_0.lean": ["Grothe.LowerAnalytic.pieceRange_14x150_0"],
    "Grothe/LowerAnalytic/CapPieces/R14x150_1.lean": ["Grothe.LowerAnalytic.pieceRange_14x150_1"],
    "Grothe/LowerAnalytic/CapPieces/R14x150p0Repair.lean": ["Grothe.LowerAnalytic.pieceRepair_14x150p0_check"],
}


def _active_require(ok, message):
    if not ok:
        raise ClosureError(message)


def _active_nat(value, label, *, positive=False):
    _active_require(type(value) is int and value >= (1 if positive else 0), label + " must be an exact integer")
    return value


def _active_rational(value):
    _active_require(type(value) is str, "expected canonical rational text")
    try:
        result = Fraction(value)
    except (ValueError, ZeroDivisionError) as error:
        raise ClosureError("invalid rational text") from error
    _active_require(str(result) == value, "noncanonical rational text")
    return result


def _active_equal(left, right):
    """JSON structural equality with no bool/float/integer aliases."""
    if type(left) is not type(right):
        return False
    if isinstance(left, dict):
        return set(left) == set(right) and all(_active_equal(left[k], right[k]) for k in left)
    if isinstance(left, (list, tuple)):
        return len(left) == len(right) and all(_active_equal(a, b) for a, b in zip(left, right))
    return left == right


def _active_json_sha(value):
    return hashlib.sha256((json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()).hexdigest()


def _active_path(root, name, *, optional=False):
    _active_require(type(name) is str and name and "\\" not in name and "\0" not in name, "invalid registry path")
    rel = Path(name)
    _active_require(not rel.is_absolute() and ".." not in rel.parts and rel.as_posix() == name and name != ".",
                    "noncanonical registry path: " + name)
    root = Path(root)
    _active_require(root.is_absolute() and root.resolve() == root, "aliased registry root")
    target = root / rel
    for part in (target, *target.parents):
        if part == root:
            break
        _active_require(not part.is_symlink(), "symlink in registry path: " + name)
    _active_require(target.resolve() == target, "aliased registry source: " + name)
    if target.exists():
        _active_require(stat.S_ISREG(target.stat().st_mode), "nonregular registry source: " + name)
    else:
        _active_require(optional, "missing registry source: " + name)
    return target


def _active_json(data):
    def pairs(items):
        result = {}
        for key, value in items:
            _active_require(key not in result, "duplicate JSON key: " + key)
            result[key] = value
        return result
    try:
        return json.loads(data, object_pairs_hook=pairs)
    except (ValueError, TypeError) as error:
        raise ClosureError("invalid registry JSON") from error


def _active_claims(value):
    if isinstance(value, dict):
        for key, item in value.items():
            if key in {"native_verified", "cache_uploaded", "cache_published", "pilot_attested", "global_capsRest_discharged"}:
                _active_require(item is False, "source inventory cannot attest " + key)
            _active_claims(item)
    elif isinstance(value, list):
        for item in value:
            _active_claims(item)


class _ActiveReads:
    def __init__(self, root):
        self.root = Path(root).absolute()
        _active_require(self.root.resolve(strict=True) == self.root, "aliased registry root")
        self.files = {}
        self.inputs = set()
        self.computation_inputs = {}
        self.absent = set()

    def read(self, name, *, input_file=False):
        if name not in self.files:
            self.files[name] = _active_path(self.root, name).read_bytes()
        if input_file:
            self.inputs.add(name)
        return self.files[name]

    def value(self, name):
        value = _active_json(self.read(name, input_file=True))
        _active_claims(value)
        return value

    def computation_input(self, name, value):
        self.computation_inputs[name] = _active_json_sha(value)

    def exists(self, name):
        present = _active_path(self.root, name, optional=True).exists()
        if not present: self.absent.add(name)
        return present

    def unchanged(self):
        for name, data in self.files.items():
            _active_require(_active_path(self.root, name).read_bytes() == data, "source changed while deriving: " + name)
        for name in self.absent:
            _active_require(not _active_path(self.root, name, optional=True).exists(), "new unregistered source while deriving: " + name)


def _active_code(text, *, mask_strings=True):
    """Mask nested comments/strings, retaining line boundaries for declarations."""
    out, i, depth, quoted = [], 0, 0, False
    while i < len(text):
        if depth:
            if text.startswith("/-", i): depth += 1; i += 2
            elif text.startswith("-/", i): depth -= 1; i += 2; out.append(" ")
            else: out.append("\n" if text[i] == "\n" else " "); i += 1
        elif quoted:
            if text[i] == "\\": out.append("  " if mask_strings else text[i:i+2]); i += 2
            elif text[i] == '"': quoted = False; out.append(" " if mask_strings else '"'); i += 1
            else: out.append(("\n" if text[i] == "\n" else " ") if mask_strings else text[i]); i += 1
        elif text.startswith("--", i):
            end = text.find("\n", i); end = len(text) if end < 0 else end; out.extend(" " * (end-i)); i = end
        elif text.startswith("/-", i): depth = 1; i += 2; out.append(" ")
        elif text[i] == '"': quoted = True; out.append(" " if mask_strings else '"'); i += 1
        else: out.append(text[i]); i += 1
    _active_require(not depth and not quoted, "unterminated Lean comment/string")
    return "".join(out)


def _active_native_names(data):
    code = _active_code(data.decode())
    _active_require(not re.search(r"\b(?:sorry|unsafe|implemented_by|extern|axiom)\b|\bTask\.spawn\b", code),
                    "unapproved declaration in caps source")
    declarations = list(re.finditer(r"^[ \t]*(?:private\s+)?theorem\s+([A-Za-z_][A-Za-z0-9_']*)\b", code, re.M))
    names = []
    namespace_commands = list(re.finditer(r"^[ \t]*(namespace|end)(?:[ \t]+([A-Za-z0-9_.]+))?[ \t]*$", code, re.M))
    for i, declaration in enumerate(declarations):
        body = code[declaration.end():declarations[i+1].start() if i+1 < len(declarations) else len(code)]
        count = len(re.findall(r"\bnative_decide\b", body))
        _active_require(count <= 1, "a native theorem must be sequential and singular")
        if count:
            _active_require(not re.match(r"\s*private\b", declaration[0]), "native facts must have public names")
            _active_require([(m[1], m[2]) for m in namespace_commands] ==
                            [("namespace", "Grothe.LowerAnalytic"), ("end", "Grothe.LowerAnalytic")] and
                            namespace_commands[0].end() <= declaration.start() < namespace_commands[1].start(),
                            "native fact must be inside its sole explicit public namespace")
            names.append("Grothe.LowerAnalytic." + declaration[1])
    _active_require(len(re.findall(r"\bnative_decide\b", code)) == len(names), "unaccounted native declaration")
    return names


def _active_native_shape(reads, path, expected):
    """Bind names to actual checker propositions, not a theorem of True."""
    code = _active_code(reads.read(path).decode())
    for name, proposition in expected.items():
        match = re.search(r"\btheorem\s+" + re.escape(name.rsplit(".", 1)[-1]) +
                          r"\s*:\s*(.*?)\s*:=\s*by\s+native_decide\b", code, re.S)
        _active_require(match is not None and re.sub(r"\s+", "", match[1]) == re.sub(r"\s+", "", proposition),
                        "nongenuine computation proposition: " + path)


def _active_public_theorem(data, name):
    code = _active_code(data.decode())
    commands = list(re.finditer(r"^[ \t]*(namespace|end)(?:[ \t]+([A-Za-z0-9_.]+))?[ \t]*$", code, re.M))
    declarations = list(re.finditer(r"^[ \t]*theorem\s+"+re.escape(name.rsplit('.',1)[-1])+r"\b", code, re.M))
    _active_require(len(declarations) == 1 and [(m[1],m[2]) for m in commands] ==
                    [("namespace","Grothe.LowerAnalytic"),("end","Grothe.LowerAnalytic")] and
                    commands[0].end() <= declarations[0].start() < commands[1].start(),
                    "missing public source theorem: " + name)
    return code


def _active_literal_text(data, name):
    """Read a complete generated literal body, rejecting appended expressions."""
    text = _active_code(data.decode(), mask_strings=False)
    matches = list(re.finditer(r"\bdef\s+" + re.escape(name) + r"\b[^:=]*:[^=]*:=\s*([\[(])", text))
    _active_require(len(matches) == 1, "missing/duplicated generated literal: " + name)
    match = matches[0]
    start, stack, quoted, escaped = match.start(1), [], False, False
    for pos in range(start, len(text)):
        char = text[pos]
        if quoted:
            if escaped: escaped = False
            elif char == "\\": escaped = True
            elif char == '"': quoted = False
        elif char == '"': quoted = True
        elif char in "([": stack.append(char)
        elif char in ")]":
            _active_require(stack and stack.pop() == (")" == char and "(" or "["), "malformed generated literal")
            if not stack:
                tail = re.split(r"^[ \t]*(?:def|end)\b", text[pos+1:], maxsplit=1, flags=re.M)[0]
                _active_require(not tail.strip(), "generated definition must be its complete literal: " + name)
                return text[start:pos+1]
    raise ClosureError("unterminated generated literal: " + name)


def _active_literal(data, name):
    """Parse generated data literals without evaluating Lean/Python code."""
    try: return ast.literal_eval(_active_literal_text(data, name))
    except (ValueError, SyntaxError) as error: raise ClosureError("invalid generated literal: " + name) from error


def _active_vector(value):
    _active_require(type(value) is str, "expected serialized rational vector")
    result = [_active_rational(v) for v in value.split(",")]
    _active_require(len(result) == 12, "recipe/direction vector must have12 entries")
    return result


def _active_recipe(value):
    _active_require(type(value) is str, "expected serialized recipe")
    parts = value.split("|")
    _active_require(len(parts) >= 2, "incomplete recipe")
    for part in parts[:-1]: _active_vector(part)
    _active_require(_active_rational(parts[-1]) > 0, "recipe scale must be positive")


def _active_constraint(value, directions):
    _active_require(type(value) is str, "expected serialized chosen constraint")
    parts = value.split(",")
    _active_require(len(parts) == 6 and parts[0] in {"0", "1", "2"} and parts[1] in {"+", "-"},
                    "invalid serialized constraint identity")
    _active_require(any(_active_vector(directions[int(parts[0])])), "constraint has zero direction")
    lo = _active_rational(parts[2]); hi = None if parts[3] == "*" else _active_rational(parts[3])
    _active_require(hi is None or lo <= hi, "constraint interval reversed")
    _active_require(_active_rational(parts[4]) >= 0 and _active_rational(parts[5]) >= 0, "negative ordered multiplier")


def _active_graph(reads, roots, *, check_native=None):
    """Pure import graph shared by future builder consumers; no processes."""
    ordered, active, done, dependencies = [], set(), set(), {}
    def visit(name):
        _active_require(name not in active, "project import cycle at " + name)
        if name in done:
            return
        _active_require(MODULE.fullmatch(name) and is_project(name), "invalid project computation module")
        path = name.replace(".", "/") + ".lean"
        data = reads.read(path)
        active.add(name)
        project_imports = [d for d in imports_of(reads.root / path, data) if is_project(d)]
        reachable = set()
        for dep in project_imports:
            visit(dep)
            dep_path = dep.replace('.', '/')+'.lean'
            reachable.add(dep_path); reachable.update(dependencies[dep_path])
        dependencies[path] = reachable
        active.remove(name); done.add(name); ordered.append(path)
        if check_native is not None:
            actual = _active_native_names(data)
            _active_require(actual == check_native.get(path, []), "hidden, missing or differently named native facts: " + path)
            if actual:
                # Roots may not depend on another native root, directly or transitively.
                _active_require(not reachable.intersection(check_native), "dependent native compute leaves: " + path)
    for name in roots:
        visit(name)
    return ordered


def _active_chords(reads, row):
    code = _active_code(reads.read("Grothe/LowerAnalytic/CapChordData.lean", input_file=True).decode())
    match = re.search(r"\bdef\s+capChords\b[^=]*:=\s*(\[)", code)
    _active_require(match is not None, "unrecognized canonical chord table")
    start = match.start(1); depth = 0; end = None
    for pos in range(start, len(code)):
        if code[pos] == "[": depth += 1
        elif code[pos] == "]":
            depth -= 1
            if not depth: end = pos + 1; break
    _active_require(end is not None, "incomplete canonical chord table")
    tail = re.split(r"^\S", code[end:], maxsplit=1, flags=re.M)[0]
    _active_require(not tail.strip(), "canonical chord table must be its complete literal")
    try: rows = ast.literal_eval(code[start:end])
    except (ValueError, SyntaxError) as error: raise ClosureError("unsupported canonical chord syntax") from error
    _active_require(isinstance(rows, list) and len(rows) == 19, "canonical chord table must retain all19 rows")
    reads.computation_input("Grothe/LowerAnalytic/CapChordData.lean", rows)
    triples = rows[row]
    _active_require(isinstance(triples, list) and all(type(v) is tuple and len(v) == 3 and
                    all(type(i) is int for i in v) for v in triples), "invalid canonical chord identities")
    return triples


def _active_row(reads, item, retained, native, direct, owned, shapes, literals, row_imports, soundness):
    keys = {"row", "generation_config", "pieces", "selection", "anchors", "assembly", "vertex_theorem", "retained_nodes"}
    _active_require(isinstance(item, dict) and set(item) == keys, "unexpected active-row fields")
    row = _active_nat(item["row"], "row")
    _active_require(row in (12, 13, 14, 15), "only the remaining whole rows may be independently assembled")
    _active_require(item["assembly"] == f"Grothe/LowerAnalytic/CapRow{row}/Assembly.lean" and
                    item["vertex_theorem"] == f"Grothe.LowerAnalytic.vertexCapsRow{row}", "wrong whole-row assembly/theorem")
    for name, suffix in (("generation_config", "-generation"), ("pieces", "-pieces"), ("selection", "-selection"), ("anchors", "-anchors")):
        path = item[name]
        _active_require(type(path) is str and path.startswith("data/caps-m/plan/row-certificates/") and
                        Path(path).name == f"row{row}{suffix}.json", "wrong row input path")
    config = reads.value(item["generation_config"])
    _active_require(isinstance(config, dict) and config.get("format") == "caps-row-generation-config/v1" and type(config.get("row")) is int
                    and config["row"] == row, "wrong generation configuration")
    chunk = _active_nat(config.get("piece_chunk"), "piece chunk", positive=True)
    span = _active_nat(config.get("anchor_range_size"), "anchor range size", positive=True)
    _active_require(_active_equal(config.get("certificate_grids"), ACTIVE_GRIDS), "stable five-grid catalogue differs")
    reads.computation_input(item["generation_config"], {k: config[k] for k in ("row", "piece_chunk", "anchor_range_size", "certificate_grids")})
    pieces, selection, anchor = (reads.value(item[name]) for name in ("pieces", "selection", "anchors"))
    canonical = reads.value(f"data/lower-rows/row{row+1:02d}.json")
    _active_require(isinstance(canonical, dict) and type(canonical.get("nodes")) is str, "missing canonical row nodes")
    try: nodes = [tuple(_active_rational(v) for v in cell.split(":")) for cell in canonical["nodes"].split(";")]
    except (ValueError, TypeError) as error: raise ClosureError("malformed canonical row nodes") from error
    _active_require(nodes and all(len(v) == 2 for v in nodes), "malformed canonical row node pair")
    length = len(nodes)
    reads.computation_input(f"data/lower-rows/row{row+1:02d}.json", {"nodes": canonical["nodes"]})
    triples = _active_chords(reads, row); chords = {t[0] for t in triples}
    _active_require(len(chords) == len(triples) and all(0 <= lo < i < hi < length and lo not in chords and hi not in chords
                    for i, lo, hi in triples), "wrong canonical chord endpoints")
    for i, lo, hi in triples:
        a, m, b = nodes[lo], nodes[i], nodes[hi]
        _active_require(a[0] < m[0] < b[0] and a[1] + (b[1]-a[1])/(b[0]-a[0])*(m[0]-a[0]) <= m[1], "chord arithmetic differs")
    pad = _active_code(reads.read("Grothe/Lower/RowDataTypes.lean", input_file=True).decode())
    pad_defs = re.findall(r"^def[ \t]+capPad\b.*?(?=^\S|\Z)", pad, re.M | re.S)
    _active_require(len(pad_defs) == 1 and re.sub(r"\s+", "", pad_defs[0]) == "defcapPad:ℚ:=1/100000000000", "capPad must stay exactly1e-11")
    reads.computation_input("Grothe/Lower/RowDataTypes.lean", {"capPad": "1/100000000000"})
    _active_require(isinstance(pieces, list) and pieces and all(isinstance(n, dict) and type(n.get("k")) is int and n["k"] == row
                    and type(n.get("i")) is int for n in pieces), "wrong localized node identities")
    indices = [n["i"] for n in pieces]
    _active_require(indices == sorted(set(indices)) and all(0 <= i < length and i not in chords for i in indices), "duplicate/nonvertex localized node")
    _active_require(isinstance(selection, dict) and set(selection) == {f"{row}:{i}" for i in indices}, "selection omits/adds a localized node")
    _active_require(isinstance(anchor, dict) and anchor.get("row_index") == row and type(anchor.get("row_index")) is int and anchor.get("capPad") == "1/100000000000"
                    and anchor.get("range_size") == span and type(anchor.get("range_size")) is int, "wrong anchor row/padding/profile")
    expected_anchors = set(range(length)) - chords - set(indices)
    _active_require(isinstance(anchor.get("anchors"), list) and all(isinstance(a, dict) for a in anchor["anchors"]), "malformed anchor list")
    actual_anchors = [a.get("node_index") for a in anchor.get("anchors", [])]
    _active_require(all(type(i) is int for i in actual_anchors) and actual_anchors == sorted(expected_anchors)
                    and _active_equal(anchor.get("localized_exclusions"), indices) and _active_equal(anchor.get("chord_indices"), sorted(chords)), "anchor/chord/localized partition differs")
    census = {"nodes": length, "chords": len(chords), "vertices": length-len(chords), "localized": len(indices), "anchors": len(expected_anchors)}
    _active_require(_active_equal(anchor.get("census"), census), "anchor census differs")
    anchor_grids = anchor.get("grids")
    _active_require(isinstance(anchor_grids, list) and 0 < len(anchor_grids) <= len(ACTIVE_GRIDS) and
                    _active_equal(anchor_grids, ACTIVE_GRIDS[:len(anchor_grids)]), "anchor grid catalogue differs")
    for a in anchor["anchors"]:
        _active_require(type(a.get("grid_index")) is int and 0 <= a["grid_index"] < len(anchor_grids), "invalid anchor grid")
        _active_require((_active_rational(a.get("s")), _active_rational(a.get("cap"))) == nodes[a["node_index"]], "anchor location/cap differs")
        _active_recipe(a.get("recipe"))
    recipes = f"Grothe/LowerAnalytic/CapRow{row}/Recipes.lean"
    literals[recipes] = {f"row{row}AnchorRecipes": [(a["node_index"], a["grid_index"], a["recipe"]) for a in anchor["anchors"]],
                        f"row{row}LocalizedExclusions": indices}
    row_imports[item["assembly"]] = set()
    ranges = anchor.get("ranges"); expected_ranges = [(lo, min(lo+span, length)) for lo in range(0, length, span)]
    _active_require(isinstance(ranges, list) and len(ranges) == len(expected_ranges), "anchor ranges omit a range")
    for j, (part, (lo, hi)) in enumerate(zip(ranges, expected_ranges)):
        _active_require(isinstance(part, dict) and all(type(part.get(k)) is int for k in ("index", "lo", "hi")) and
                        (part["index"], part["lo"], part["hi"]) == (j, lo, hi) and
                        part.get("hi_lean") == (f"(rowData.getD {row} row01).nodeList.length" if hi == length else str(hi)) and
                        _active_equal(part.get("anchor_indices"), sorted(expected_anchors.intersection(range(lo, hi)))), "anchor range coverage differs")
        path = f"Grothe/LowerAnalytic/CapRow{row}/AnchorRange{j:02d}.lean"
        native[path] = [f"Grothe.LowerAnalytic.row{row}AnchorRange{j:02d}"]
        shapes[path] = {native[path][0]: f"rangeOK {row} (parseRecs row{row}AnchorRecipes) row{row}AnchorGrids row{row}LocalizedExclusions {lo} {part['hi_lean']} = true"}
        row_imports[item["assembly"]].add(path)
        owned.add(path)
    reuse = item["retained_nodes"]
    _active_require(isinstance(reuse, list) and all(isinstance(v, dict) and set(v) == {"node", "proof"} and type(v["node"]) is int and type(v["proof"]) is str for v in reuse), "invalid retained-node selections")
    reused = {v["node"]: v["proof"] for v in reuse}
    _active_require(len(reused) == len(reuse) and set(reused) <= set(indices), "duplicated or foreign retained node")
    cover_policy_path = "data/caps-m/plan/row-certificates/coverage-slicing.json"
    cover_policy = None
    if reads.exists(cover_policy_path):
        cover_policy = reads.value(cover_policy_path)
        _active_require(isinstance(cover_policy, dict) and set(cover_policy) == {"format", "rows", "threshold", "pieces_per_slice"}
                        and cover_policy["format"] == "caps-coverage-slicing/v1", "unsupported coverage slicing policy")
        _active_require(isinstance(cover_policy["rows"], list) and all(type(k) is int and k in (12, 13, 14, 15) for k in cover_policy["rows"])
                        and cover_policy["rows"] == sorted(set(cover_policy["rows"])), "invalid coverage slicing rows")
        for key in ("threshold", "pieces_per_slice"): _active_nat(cover_policy[key], "coverage " + key, positive=True)
        reads.computation_input(cover_policy_path, cover_policy)
    for node in pieces:
        i = node["i"]; spec = selection[f"{row}:{i}"]
        _active_require(isinstance(node.get("pieces"), list) and node["pieces"], "empty/unsupported piece inventory")
        _active_require(isinstance(node.get("ds"), list) and len(node["ds"]) == 3, "chosen node requires three directions")
        for direction in node["ds"]: _active_vector(direction)
        _active_require((_active_rational(node.get("s")), _active_rational(node.get("cap"))) == nodes[i], "localized cap/location differs")
        _active_require(isinstance(spec, dict) and set(spec) == {"chunk", "excl", "grids"} and type(spec.get("chunk")) is int and spec["chunk"] == chunk and spec.get("excl") == [] and
                        isinstance(spec.get("grids"), list) and len(spec["grids"]) == len(node["pieces"]), "piece range/grid selection differs")
        for piece, grid in zip(node["pieces"], spec["grids"]):
            # Historical nq records the seed exporter. Explicit selection is
            # authoritative for adopted fine grids; the D literal binds it below.
            _active_require(type(grid) is int and 0 <= grid < len(ACTIVE_GRIDS) and isinstance(piece, dict) and
                            type(piece.get("nq")) is int and piece["nq"] in {g[1] for g in ACTIVE_GRIDS} and
                            type(piece.get("recipe")) is str and isinstance(piece.get("cons"), list) and piece["cons"], "invalid chosen piece/grid/recipe")
            _active_require(not any(k in piece for k in ("children", "partition", "chosen", "leaves", "interval")), "unsupported chosen interval leaf layout")
            _active_require(set(piece) <= {"nq", "recipe", "cons", "slack"}, "unrecognized chosen piece input")
            _active_recipe(piece["recipe"])
            for constraint in piece["cons"]: _active_constraint(constraint, node["ds"])
        if i in reused:
            proof = retained.get(reused[i])
            _active_require(proof is not None and (proof["row"], proof["node"]) == (row, i), "retained proof does not cover chosen node")
            row_imports[item["assembly"]].add(proof["root"])
            continue
        tag = f"{row}x{i}"
        cover = f"Grothe/LowerAnalytic/CapPieces/C{tag}.lean"
        fast = cover_policy is not None and row in cover_policy["rows"]
        slices = ((len(node["pieces"]) + cover_policy["pieces_per_slice"] - 1) // cover_policy["pieces_per_slice"]
                  if fast and len(node["pieces"]) >= cover_policy["threshold"] else 1)
        if slices > 1:
            direct.add(cover)
            for part in range(slices):
                path = f"Grothe/LowerAnalytic/CapPieces/C{tag}_{part}.lean"
                fact = f"Grothe.LowerAnalytic.pieceCoverSlice_{tag}_{part}"
                native[path] = [fact]
                shapes[path] = {fact: f"pieceCoverSliceOK pieceNode_{tag} {part} {slices} = true"}
                owned.add(path)
            if reads.exists(cover):
                imports = {m.replace('.', '/')+'.lean' for m in imports_of(reads.root / cover, reads.read(cover))}
                _active_require({f"Grothe/LowerAnalytic/CapPieces/C{tag}_{part}.lean" for part in range(slices)} <= imports,
                                "coverage assembly omits a slice: " + cover)
                code = _active_public_theorem(reads.read(cover), "Grothe.LowerAnalytic.pieceCover_"+tag)
                _active_require(re.search(r"\btheorem\s+pieceCover_"+tag+r"\s*:\s*pieceCoverOK\s+pieceNode_"+tag+r"\s*=\s*true\s*:=", code),
                                "coverage assembly proposition differs: " + cover)
        else:
            fact = "Grothe.LowerAnalytic.pieceCover" + ("Fast_" if fast else "_") + tag
            native[cover] = [fact]
            shapes[cover] = {fact: ("pieceCoverFastOK" if fast else "pieceCoverOK") + " pieceNode_"+tag+" = true"}
        for j, lo in enumerate(range(0, len(node["pieces"]), chunk)):
            path = f"Grothe/LowerAnalytic/CapPieces/R{tag}_{j}.lean"
            native[path] = [f"Grothe.LowerAnalytic.pieceRange_{tag}_{j}"]
            shapes[path] = {native[path][0]: f"pieceRangeOK pieceNode_{tag} {lo} {min(lo+chunk,len(node['pieces']))} = true"}
        literals[f"Grothe/LowerAnalytic/CapPieces/D{tag}.lean"] = {"pieceNode_"+tag: (row, i, node["ds"],
                        [str(grid)+";"+piece["recipe"]+";"+";".join(piece["cons"]) for piece, grid in zip(node["pieces"], spec["grids"])])}
        row_imports[item["assembly"]].add(f"Grothe/LowerAnalytic/CapPieces/N{tag}.lean")
        soundness[f"Grothe/LowerAnalytic/CapPieces/N{tag}.lean"] = ("Grothe.LowerAnalytic.nodeCap_"+tag, row, i)
        owned.update([f"Grothe/LowerAnalytic/CapPieces/{kind}{tag}.lean" for kind in ("D", "C", "N")])
        owned.update(path for path in native if path.startswith(f"Grothe/LowerAnalytic/CapPieces/R{tag}_"))
    direct.add(item["assembly"])
    owned.update([item["assembly"], f"Grothe/LowerAnalytic/CapRow{row}/Recipes.lean"])
    reads.computation_input(item["pieces"], [{k: n[k] for k in ("k", "i", "s", "cap", "ds")} |
                    {"pieces": [{k: p[k] for k in ("nq", "recipe", "cons")} for p in n["pieces"]]} for n in pieces])
    reads.computation_input(item["selection"], selection)
    reads.computation_input(item["anchors"], {k: anchor[k] for k in ("row_index", "capPad", "range_size", "census", "chord_indices", "localized_exclusions", "grids", "ranges")} |
                    {"anchors": [{k: a[k] for k in ("node_index", "grid_index", "s", "cap", "recipe")} for a in anchor["anchors"]]})
    return {"row": row, "assembly": item["assembly"], "vertex_theorem": item["vertex_theorem"], "localized": len(indices),
            "pieces": sum(len(n["pieces"]) for n in pieces), "anchors": len(expected_anchors), "nodes": length}


def derive_active_registry(root, registry, *, require_materialized=True):
    """Pure shared v2 derivation. No writes, Lean, search, subprocess or Git.

    Declaration-only mode is for source producers planning missing generated
    outputs. CI/stamp/build consumers must require materialized validation.
    Full source-generation provenance is validated separately, outside cache key.
    """
    reads = _ActiveReads(root); _active_require(type(require_materialized) is bool, "materialization gate must be boolean")
    allowed = {"format", "scope", "legacy_rows_input", "legacy_rows", "active_rows", "retained_proofs", "provenance",
               "compute_roots", "direct_hash_roots", "pure_roots", "native_declarations_by_root", "input_sha256", "source_sha256",
               "execution_source_sha256", "computation_input_sha256", "max_parallel_leaves", "lean_child_threads", "derived_counts"}
    _active_require(isinstance(registry, dict) and set(registry) <= allowed and registry.get("format") == ACTIVE_FORMAT,
                    "unsupported active registry format/fields")
    _active_claims(registry)
    _active_require(registry.get("legacy_rows_input") == "data/cap-nodes/rows.txt" and registry.get("legacy_rows") == CAP_ROWS
                    and all(type(k) is int for k in registry["legacy_rows"]), "original legacy row set must remain unchanged")
    legacy_text = reads.read(registry["legacy_rows_input"], input_file=True).decode().split()
    _active_require(legacy_text == ["--size", "49", *map(str, CAP_ROWS)], "legacy rows/49-node range profile differs")
    reads.computation_input(registry["legacy_rows_input"], {"rows": CAP_ROWS, "range_size": 49})
    native = {f"Grothe/LowerAnalytic/CapRow{k:02d}.lean": [f"Grothe.LowerAnalytic.capRange{k:02d}_{j}" for j in range(len(range(0, 196, 49)))] for k in CAP_ROWS}
    shapes = {f"Grothe/LowerAnalytic/CapRow{k:02d}.lean": {f"Grothe.LowerAnalytic.capRange{k:02d}_{j}":
                f"rangeOK {k} (parseRecs capRecipes{k:02d}) capGrids (capExcl {k}) {49*j} " +
                (str(49*(j+1)) if j < 3 else f"(rowData.getD {k} row01).nodeList.length") + " = true" for j in range(4)} for k in CAP_ROWS}
    literals, row_imports, soundness = {}, {}, {}
    direct, owned, retained = {"Grothe/LowerAnalytic/CapNodes.lean"}, set(), {}
    proofs = registry.get("retained_proofs", [])
    _active_require(isinstance(proofs, list) and len(proofs) <= 1, "unsupported retained proof selection")
    for proof in proofs:
        _active_require(proof == {"id": "node14x150", "row": 14, "node": 150, "root": _RETAINED_NODE,
                        "theorem": "Grothe.LowerAnalytic.nodeCap_14x150_done", "repair_input": "data/caps-m-pieces/repairs.json"}
                        and type(proof["row"]) is int and type(proof["node"]) is int, "unreviewed retained-node proof alternative")
        retained[proof["id"]] = proof; native.update(_RETAINED_ROOTS); direct.add(proof["root"])
        soundness["Grothe/LowerAnalytic/CapPieces/N14x150.lean"] = ("Grothe.LowerAnalytic.nodeCap_14x150", 14, 150)
        soundness[_RETAINED_NODE] = (proof["theorem"], 14, 150)
        repair = reads.value(proof["repair_input"])
        _active_require(isinstance(repair, dict) and set(repair) == {"14:150"} and isinstance(repair["14:150"], dict)
                        and set(repair["14:150"]) == {"0"}, "retained repair selection differs")
        chosen = repair["14:150"]["0"]
        _active_require(isinstance(chosen, dict) and set(chosen) == {"grid", "lm", "cap_up"} and
                        type(chosen["grid"]) is int and chosen["grid"] == 2 and _active_rational(chosen["cap_up"]) == 0 and
                        isinstance(chosen["lm"], list) and len(chosen["lm"]) == 1 and isinstance(chosen["lm"][0], list)
                        and len(chosen["lm"][0]) == 2 and all(_active_rational(v) >= 0 for v in chosen["lm"][0]), "retained repair input differs")
        reads.computation_input(proof["repair_input"], repair)
        shapes.update({
            "Grothe/LowerAnalytic/CapPieces/C14x150.lean": {"Grothe.LowerAnalytic.pieceCover_14x150": "pieceCoverOK pieceNode_14x150 = true"},
            "Grothe/LowerAnalytic/CapPieces/R14x150_0.lean": {"Grothe.LowerAnalytic.pieceRange_14x150_0": "pieceRangeOK pieceNode_14x150 1 5 = true"},
            "Grothe/LowerAnalytic/CapPieces/R14x150_1.lean": {"Grothe.LowerAnalytic.pieceRange_14x150_1": "pieceRangeOK pieceNode_14x150 5 9 = true"},
            "Grothe/LowerAnalytic/CapPieces/R14x150p0Repair.lean": {"Grothe.LowerAnalytic.pieceRepair_14x150p0_check": "pieceRepairOK pieceNode_14x150 pieceRepair_14x150p0 0 0 = true"},
        })
    _active_require(not reads.exists(_RETAINED_NODE) or retained,
                    "existing independent master node proof must be retained")
    rows = registry.get("active_rows")
    _active_require(isinstance(rows, list) and all(isinstance(v, dict) and type(v.get("row")) is int for v in rows), "malformed active rows")
    row_ids = [v["row"] for v in rows]
    _active_require(row_ids == sorted(set(row_ids)) and not set(row_ids).intersection(CAP_ROWS), "duplicate/legacy active row")
    row_views = [_active_row(reads, v, retained, native, direct, owned, shapes, literals, row_imports, soundness) for v in rows]
    if any(v["row"] == 14 for v in rows) and retained:
        row = next(v for v in rows if v["row"] == 14)
        _active_require({"node": 150, "proof": "node14x150"} in row["retained_nodes"], "row14 must explicitly reuse the existing master node proof")
    roots = sorted(native); direct = sorted(direct)
    pure = []
    if require_materialized:
        for row in (12, 13, 14, 15):
            _active_require(not reads.exists(f"Grothe/LowerAnalytic/CapRow{row}/Assembly.lean") or row in row_ids,
                            "canonical whole-row assembly is unregistered")
        order = _active_graph(reads, ["GrotheCapsKernel", *[n[:-5].replace("/", ".") for n in roots]], check_native=native)
        pure = [name for name in order if name not in native]
        kernel = _active_graph(reads, ["GrotheCapsKernel"])
        _active_require(all(n == "GrotheCapsKernel.lean" or n.startswith("GrotheCapsKernel/") for n in kernel), "checker image imports another project library")
        for name in sorted(owned | set(direct)):
            data = reads.read(name)
            _active_require(_active_native_names(data) == native.get(name, []), "hidden native fact in owned proof source: " + name)
        for name, expected in shapes.items(): _active_native_shape(reads, name, expected)
        for name, definitions in literals.items():
            for definition, value in definitions.items():
                _active_require(_active_equal(_active_literal(reads.read(name), definition), value), "generated data literal disagrees: " + name)
        for name, (theorem, row, node) in soundness.items():
            code = _active_public_theorem(reads.read(name), theorem)
            _active_require(re.search(r"\btheorem\s+"+re.escape(theorem.rsplit('.',1)[-1])+r"\b(?:(?!\btheorem\b).)*?\bNodeCap\s+"+
                            str(row)+r"\s+"+str(node)+r"\b", code, re.S), "missing chosen-node soundness theorem: "+name)
        for name, required in row_imports.items():
            actual = {n.replace(".", "/")+".lean" for n in imports_of(_active_path(reads.root, name), reads.read(name))}
            _active_require(required <= actual, "row assembly omits chosen node/anchor proof: " + name)
        node_imports = set(imports_of(_active_path(reads.root, "Grothe/LowerAnalytic/CapNodes.lean"), reads.read("Grothe/LowerAnalytic/CapNodes.lean")))
        _active_require(set(ROW_TOPS) | {v["assembly"][:-5].replace("/", ".") for v in row_views} <= node_imports,
                        "CapNodes omits legacy/active row imports")
        imported_rows = {int(m[1]) for name in node_imports if (m := re.fullmatch(r"Grothe\.LowerAnalytic\.CapRow(12|13|14|15)\.Assembly", name))}
        _active_require(imported_rows == set(row_ids), "CapNodes imports an undeclared whole-row assembly")
        for row in rows:
            code = _active_code(reads.read(f"Grothe/LowerAnalytic/CapRow{row['row']}/Recipes.lean").decode())
            anchor = _active_json(reads.files[row["anchors"]])
            grid_text = "["+", ".join(f"({g[0]}, {g[1]}, {Fraction(g[2]).numerator} / {Fraction(g[2]).denominator})" for g in anchor["grids"])+"]"
            name = "row"+str(row["row"])+"AnchorGrids"
            _active_require(re.search(r"\bdef\s+"+name+r"\s*:\s*List\s*\(Nat\s*×\s*Nat\s*×\s*Rat\)\s*:=", code), "generated anchor grid type differs")
            actual = _active_literal_text(reads.read(f"Grothe/LowerAnalytic/CapRow{row['row']}/Recipes.lean"), name)
            _active_require(re.sub(r"\s+", "", actual) == re.sub(r"\s+", "", grid_text), "generated anchor grid literal differs")
        for row in row_views:
            code = _active_public_theorem(reads.read(row["assembly"]), row["vertex_theorem"])
            _active_require(re.search(r"\btheorem\s+vertexCapsRow"+str(row["row"])+r"\s*:\s*VertexCapsRow\s+"+str(row["row"])+r"\b", code), "missing row soundness theorem")
        if retained:
            code = _active_code(reads.read(_RETAINED_NODE).decode())
            _active_require(re.search(r"\btheorem\s+nodeCap_14x150_done\s*:\s*NodeCap\s+14\s+150\b", code), "retained proof theorem/type differs")
        for name in ACTIVE_CONFIG: reads.read(name)
    input_pins = {name: hashlib.sha256(reads.files[name]).hexdigest() for name in sorted(reads.inputs)}
    source_names = sorted(set(roots + pure + direct + list(ACTIVE_CONFIG)))
    source_pins = {name: hashlib.sha256(reads.files[name]).hexdigest() for name in source_names} if require_materialized else {}
    executions = {name: hashlib.sha256(reads.read(name)).hexdigest() for name in ACTIVE_EXECUTION} if require_materialized else {}
    view = {"format": ACTIVE_FORMAT, "legacy_rows": list(CAP_ROWS), "active_rows": row_views,
            "proved_rows": {str(v["row"]): {"assembly": v["assembly"], "theorem": v["vertex_theorem"]} for v in row_views},
            "compute_roots": roots, "direct_hash_roots": direct, "pure_roots": pure, "native_declarations_by_root": dict(sorted(native.items())),
            "input_sha256": input_pins, "computation_input_sha256": dict(sorted(reads.computation_inputs.items())),
            "source_sha256": source_pins, "execution_source_sha256": executions,
            "derived_counts": {"compute_modules": len(roots), "native_facts": sum(map(len, native.values()))},
            "max_parallel_leaves": 2, "lean_child_threads": 1, "materialized": require_materialized,
            "row_source_paths": sorted(owned), "retained_proof_roots": [p["root"] for p in proofs],
            "native_verified": False, "cache_uploaded": False}
    view["native_declarations"] = sorted(n for names in native.values() for n in names)
    view["required_declarations"] = sorted(set(view["native_declarations"]) | {v[0] for v in soundness.values()} |
                {v["vertex_theorem"] for v in row_views} | {f"Grothe.LowerAnalytic.vertexCapsRow{k:02d}" for k in CAP_ROWS} |
                {"Grothe.LowerAnalytic.pieceCover_"+m[1]+"x"+m[2] for path in owned
                 if (m := re.fullmatch(r"Grothe/LowerAnalytic/CapPieces/C(\d+)x(\d+)\.lean", path))})
    view["required_axiom_prints"] = list(view["required_declarations"])
    view["native_axioms"] = [n+"._native.native_decide.ax_1_1" for n in view["native_declarations"]]
    for field in ("compute_roots", "direct_hash_roots", "native_declarations_by_root", "input_sha256", "computation_input_sha256", "derived_counts"):
        if field in registry: _active_require(_active_equal(registry[field], view[field]), "declared registry disagrees with derived " + field)
    if require_materialized:
        for field in ("pure_roots", "source_sha256", "execution_source_sha256"):
            if field in registry: _active_require(_active_equal(registry[field], view[field]), "materialized registry source/order mismatch: " + field)
        if "max_parallel_leaves" in registry:
            _active_require(type(registry["max_parallel_leaves"]) is int and registry["max_parallel_leaves"] == 2, "invalid caps parallel budget")
        if "lean_child_threads" in registry:
            _active_require(type(registry["lean_child_threads"]) is int and registry["lean_child_threads"] == 1, "native leaves require explicit-j1")
    # Only computation selection and actual compute/pure/direct/config bytes enter
    # this projection. Provenance references/full analytic source maps do not.
    view["cache_projection"] = {k: view[k] for k in ("format", "legacy_rows", "active_rows", "compute_roots", "direct_hash_roots", "pure_roots",
                                "native_declarations_by_root", "computation_input_sha256", "source_sha256", "execution_source_sha256", "max_parallel_leaves", "lean_child_threads")}
    reads.unchanged()
    return view


def read_active_registry(root, registry=None, *, require_materialized=True):
    """Shared reader; v1 is explicit Row12 compatibility, never silently multirow."""
    root = Path(root).absolute()
    _active_require(root.resolve(strict=True) == root, "aliased registry root")
    _active_require(type(require_materialized) is bool, "materialization gate must be boolean")
    path = None if isinstance(registry, dict) else _active_path(root, BUILD_REGISTRY if registry is None else registry)
    serialized = path.read_bytes() if path is not None else None
    value = _active_json(serialized) if path is not None else registry
    _active_require(isinstance(value, dict), "active registry must be an object")
    if value.get("format") == ACTIVE_FORMAT:
        if require_materialized:
            fields = {"compute_roots", "direct_hash_roots", "pure_roots", "native_declarations_by_root", "input_sha256",
                      "computation_input_sha256", "source_sha256", "execution_source_sha256", "derived_counts",
                      "max_parallel_leaves", "lean_child_threads"}
            _active_require(fields <= set(value), "materialized v2 registry omits derived fields/pins")
        result = derive_active_registry(root, value, require_materialized=require_materialized)
        if path is not None:
            _active_require(_active_path(root, path.relative_to(root).as_posix()).read_bytes() == serialized, "active registry changed while reading")
        return result
    _active_require(value.get("format") == "caps-bounded-build-v1" and type(value.get("row")) is int and value["row"] == 12,
                    "unsupported active registry")
    roots, direct = value.get("compute_roots"), value.get("direct_hash_roots")
    _active_claims(value)
    _active_require(isinstance(roots, list) and roots and all(type(n) is str for n in roots) and len(roots) == len(set(roots)) and
                    isinstance(direct, list) and all(type(n) is str for n in direct) and len(direct) == 2 and
                    set(direct) == {EXTRA[0], ROW_ASSEMBLY}, "invalid v1 root inventory")
    _active_require(set(ROW_TOPS) <= {n[:-5].replace("/", ".") for n in roots} and
                    type(value.get("compute_count")) is int and value["compute_count"] == len(roots) and
                    type(value.get("row12_compute_count")) is int and value["row12_compute_count"] == len(roots)-len(ROW_TOPS), "v1 census differs")
    for name in roots + direct:
        _active_require(name.endswith('.lean') and MODULE.fullmatch(name[:-5].replace('/', '.')) and
                        is_project(name[:-5].replace('/', '.')), "invalid v1 project root")
        _active_path(root, name, optional=not require_materialized)
    if path is not None:
        _active_require(_active_path(root, path.relative_to(root).as_posix()).read_bytes() == serialized, "active registry changed while reading")
    declaration = {"format": ACTIVE_FORMAT, "legacy_rows_input": "data/cap-nodes/rows.txt", "legacy_rows": list(CAP_ROWS),
                   "active_rows": [{"row": 12, "generation_config": "data/caps-m/plan/row-certificates/row12-generation.json",
                        "pieces": "data/caps-m/plan/row-certificates/row12-pieces.json",
                        "selection": "data/caps-m/plan/row-certificates/row12-selection.json",
                        "anchors": "data/caps-m/plan/row-certificates/row12-anchors.json", "assembly": ROW_ASSEMBLY,
                        "vertex_theorem": "Grothe.LowerAnalytic.vertexCapsRow12", "retained_nodes": []}], "retained_proofs": []}
    adapted = derive_active_registry(root, declaration, require_materialized=require_materialized)
    _active_require(set(roots) == set(adapted["compute_roots"]), "v1 row12 selected compute inventory differs")
    if require_materialized and "source_sha256" in value:
        _active_require(_active_equal(value["source_sha256"], adapted["source_sha256"]), "v1 source pins differ")
    # Preserve the historical raw-registry cache projection and ordering. v1's
    # execution pins remain the existing builder's separate validation contract;
    # this source adapter does not silently rewrite that historical registry.
    adapted.update(format="caps-bounded-build-v1", compute_roots=list(roots), direct_hash_roots=list(direct), cache_projection=None)
    if path is not None:
        _active_require(_active_path(root, path.relative_to(root).as_posix()).read_bytes() == serialized, "active registry changed while reading")
    return adapted


def validate_active_provenance(root, registry, manifest):
    """Independently validate FULL proof-source hashes; excluded from heavy key.

    Callers must use this source-adoption gate before activating/publishing a new
    source transaction. It never changes a proof/native/cache status flag.
    """
    root = Path(root).absolute(); view = read_active_registry(root, registry)
    reads = _ActiveReads(root)
    data = _active_json(reads.read(manifest))
    _active_require(isinstance(data, dict) and set(data) == {"format", "source_sha256"} and
                    data["format"] == "caps-active-source-provenance/v1" and isinstance(data["source_sha256"], dict), "wrong full provenance manifest")
    required = set(view.get("row_source_paths", []))
    proof_roots = [v["assembly"][:-5].replace("/", ".") for v in view["active_rows"]] + [n[:-5].replace("/", ".") for n in view.get("retained_proof_roots", [])]
    required.update(_active_graph(reads, proof_roots))
    _active_require(required <= set(data["source_sha256"]), "full provenance omits owned or transitive proof sources")
    for name, digest_value in data["source_sha256"].items():
        _active_require(type(digest_value) is str and re.fullmatch("[0-9a-f]{64}", digest_value), "invalid full provenance SHA")
        _active_require(hashlib.sha256(reads.read(name)).hexdigest() == digest_value, "full proof provenance source changed: " + name)
    reads.unchanged()
    return {"full_source_files_checked": len(data["source_sha256"]), "native_verified": False, "cache_uploaded": False}


def validate_active_registrations(root, registry, *, native="data/axioms/native.txt",
                                  required="data/axioms/required.txt", report="scratch/Axioms.lean"):
    """Check only the caps-owned registration subset, preserving global owners.

    Global allowlist/report bytes are deliberately absent from cache_projection.
    A source registration is not an executed strict audit or a native result.
    """
    view = read_active_registry(root, registry)
    reads = _ActiveReads(root)
    native_names = {line.strip() for line in reads.read(native).decode().splitlines() if line.strip() and not line.lstrip().startswith('#')}
    required_names = {line.strip() for line in reads.read(required).decode().splitlines() if line.strip() and not line.lstrip().startswith('#')}
    printed = set(re.findall(r"^\s*#print\s+axioms\s+([A-Za-z0-9_'.]+)\s*$", _active_code(reads.read(report).decode()), re.M))
    _active_require(set(view["native_axioms"]) <= native_names, "native allowlist omits a caps-owned fact")
    _active_require(set(view["required_declarations"]) <= required_names, "required inventory omits a caps-owned declaration")
    _active_require(set(view["required_axiom_prints"]) <= printed, "axiom report omits a caps-owned print")
    reads.unchanged()
    return {"caps_native_entries_checked": len(view["native_axioms"]), "caps_required_entries_checked": len(view["required_declarations"]),
            "native_verified": False, "cache_uploaded": False}

def activated_sources():
    """Read activated compute roots; never recurse into their analytic assembly."""
    path = os.path.join(ROOT, BUILD_REGISTRY)
    if not os.path.exists(path):
        if os.path.exists(os.path.join(ROOT, ROW_ASSEMBLY)):
            raise ClosureError(f"activated row12 assembly requires {BUILD_REGISTRY}")
        return [], []
    try:
        with open(path, encoding="utf-8") as stream:
            registry = json.load(stream)
    except (ValueError, OSError) as error:
        raise ClosureError(f"cannot read {BUILD_REGISTRY}: {error}") from error
    if isinstance(registry, dict) and registry.get("format") == ACTIVE_FORMAT:
        view = read_active_registry(ROOT, registry)
        return [n[:-5].replace("/", ".") for n in view["compute_roots"]], view["direct_hash_roots"]
    if not isinstance(registry, dict) or registry.get("format") != "caps-bounded-build-v1" or registry.get("row") != 12:
        raise ClosureError(f"unsupported activated computation registry: {BUILD_REGISTRY}")
    roots, direct = registry.get("compute_roots"), registry.get("direct_hash_roots")
    if not isinstance(roots, list) or not roots or not isinstance(direct, list):
        raise ClosureError("activated registry must list compute_roots and direct_hash_roots")
    modules = [registry_module(name) for name in roots]
    direct_modules = [registry_module(name) for name in direct]
    if len(modules) != len(set(modules)) or len(direct_modules) != len(set(direct_modules)):
        raise ClosureError("duplicate activated computation registry roots")
    if not set(ROW_TOPS) <= set(modules):
        raise ClosureError("activated registry omits an original cap-row computation root")
    if set(direct) != {EXTRA[0], ROW_ASSEMBLY}:
        raise ClosureError("activated direct hash roots must be CapNodes and the row12 assembly")
    if registry.get("compute_count") != len(roots) or registry.get("row12_compute_count") != len(set(modules) - set(ROW_TOPS)):
        raise ClosureError("activated computation registry census differs from its roots")
    return modules, direct


def source_files():
    """Sorted computation closure, followed by directly hashed assembly/config files."""
    roots, direct = activated_sources()
    files = [os.path.join(*module.split(".")) + ".lean" for module in closure(TOPS + roots)]
    # v2 hashes mathematical JSON projections in its registry projection; raw
    # manifests carry full provenance metadata and must not enter this boundary.
    extra = EXTRA + direct + ([BUILD_REGISTRY] if roots else [])
    return files + list(dict.fromkeys(name for name in extra if name not in files))


def digest():
    h = hashlib.sha256()
    files = source_files()
    for f in files:
        h.update(f.encode() + b"\0")
        with open(os.path.join(ROOT, f), "rb") as source:
            data = source.read()
        if f == BUILD_REGISTRY:
            value = _active_json(data)
            if isinstance(value, dict) and value.get("format") == ACTIVE_FORMAT:
                data = (json.dumps(read_active_registry(ROOT, value)["cache_projection"], sort_keys=True, separators=(",", ":")) + "\n").encode()
        h.update(data)
    return h.hexdigest(), len(files)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__, allow_abbrev=False,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    modes = parser.add_mutually_exclusive_group()
    modes.add_argument("--check-cache", action="store_true",
                       help="check that the cached node-cap build is verified for these sources (default)")
    modes.add_argument("--digest", action="store_true", help="print the current source hash and file count")
    modes.add_argument("--list", action="store_true", help="list the exact hashed source files, hash and count")
    modes.add_argument("--mark-cache", action="store_true",
                       help="record that the node-cap build in .lake/build was verified for these sources")
    args = parser.parse_args(argv)
    try:
        d, n = digest()
    except ClosureError as e:
        print(f"FAIL: {e}")
        return 1
    if args.list:
        print("\n".join(source_files()))
        print(f"{n} files; sha256 {d}")
        return 0
    if args.digest:
        print(f"sha256 {d}\nfiles {n}")
        return 0
    if args.mark_cache:
        os.makedirs(os.path.dirname(MARK), exist_ok=True)
        with open(MARK, "w") as f:
            f.write(d + "\n")
        print(f"marked the cached node-cap build as verified for sources {d} ({n} files)")
        return 0
    if not os.path.exists(MARK):
        print(f"FAIL: no verified node-cap build in the cache (current sources {d}, {n} files)")
        return 1
    with open(MARK) as mark:
        rec = mark.read().strip()
    if rec != d:
        print(f"FAIL: the cached node-cap build was verified for sources {rec}; current sources are {d} ({n} files)")
        return 1
    print(f"the cached node-cap build is verified for the current sources {d} ({n} files)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
