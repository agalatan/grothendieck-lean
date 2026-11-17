#!/usr/bin/env python3
"""Source hash of the node caps (Grothe/LowerAnalytic/CapRowKK/, CapPieces/, CapNodes), recorded in the verified build
cache, and the build registry of their native facts.

usage: python3 scripts/caps_stamp.py [--check-cache | --digest | --list | --mark-cache | --write-registry]

CI's heavy runner builds Grothe (node caps included) and checks the axiom report before recording the sources beside
the build products:
    python3 scripts/caps_stamp.py --mark-cache          # writes .lake/build/caps-closure.sha
CI restores the cache and calls
    python3 scripts/caps_stamp.py --check-cache         # (the default) exit 0 iff the verified caps match
On a match CI builds Grothe (Lake replays the verified facts) and checks the axiom report; on a mismatch or a missing
marker the caps are built on a heavy runner. --digest prints `sha256 <hex>` and the file count (the route job's cache
key) without reading or writing the marker; --list also lists the exact hashed files. Every mode fails (exit 1,
`FAIL: ...`) when the registry does not match the sources.

The layout (written by tools/gen_tail_caps.py): CapNodes.lean imports CapRowKK/Assembly and CapRowKK/Bridge of every cap
row K = 00, 01, .... The computational leaves hold one native fact each:
    CapRowKK/AnchorRangeJJ.lean   rowKKAnchorRangeJJ : rangeOKNu ... = true
    CapPieces/C<tag>.lean         pieceCover_<tag> : pieceCoverFastOK pieceNode_<tag> = true     (tag = KKx<node>)
    CapPieces/R<tag>_<J>.lean     pieceRange_<tag>_<J> : pieceRangeOKNu ... = true
    CapRowKK/Assembly.lean        chordsOKRowKK : chordOKLow capRowKK.nodeList capChordsKK = true
The other caps modules hold data (CapCommon, CapRowKK/Data, CapPieces/D<tag>) or proofs (CapCommonFacts,
CapPieces/N<tag>, CapRowKK/Bridge, and the theorems of the row assemblies).

The hash covers, in this order:
 (a) the Lean sources of the import closure of the leaves AnchorRange, C and R, of the rows' Data modules and of the
     quadrature-checker facts (QUAD_TOPS: Grothe/UpperQuad/Facts GradeBlock00-11, Even, Omitted);
 (b) directly, without following their imports: CapNodes.lean, GrotheCapsKernel.lean, lean-toolchain,
     lake-manifest.json, lakefile.toml, and the caps' proof modules (CapCommonFacts, CapPieces/N*, CapRowKK/Assembly,
     CapRowKK/Bridge);
 (c) the projection of the registry data/tail-caps/build.json (all of it but the generator command, the scope note,
     the counts and the cost estimates).
The row assemblies import the node theorems and the soundness chain, so they are hashed directly although they hold a
native fact: that fact evaluates only definitions of (a) (chordOKLow, the row's Data). An edit of the lower-bound proof
layer (e.g. Grothe/LowerAnalytic/Bridge.lean, CI's probe) therefore leaves the digest unchanged; Lake re-checks the
assemblies in seconds. The checker library root is hashed because its whole precompiled shared object is loaded by
every importer, and the Lake configuration controls native compilation.

The registry data/tail-caps/build.json (format caps-bounded-build-v3) is the design of record: the compute roots (every
module with a native fact) and their native declarations, the row assemblies among them, the topological order of the
pure prerequisites of the other roots, the directly hashed proof modules, the sha256 of each of these files and of the
extras, and the cost estimates of the generator's plan (read by scripts/build_caps_batches.py). Everything but the cost
estimates is derived from the sources; regenerate it with
    python3 scripts/caps_stamp.py --write-registry
which also runs `python3 tools/gen_tail_caps.py --plan --check` (the generated files must reproduce byte for byte, and
the plan names the cost of every leaf). A change of any pinned source (the caps modules, their computation imports, the
checker library, the lake files) makes every mode fail until the registry is regenerated in the same commit: such a
change means a full node-cap build (AGENTS.md §13).

Checks (fail closed): CapNodes assembles the rows 00, 01, ... (Assembly and Bridge each); every caps module on disk
(CapRowKK/, CapPieces/, CapRowKK.lean) is reached from CapNodes; each leaf holds exactly its one public native fact, of
the expected checker proposition, listed in data/tail-caps/native.txt (which lists exactly the leaves' facts) or
data/axioms/native.txt; no other caps module and no module of the computation closure holds a native fact; no leaf is
imported by the computation closure (leaves are independent); the closure holds no proof module of the caps and the
Data module of every row; GrotheCapsKernel imports only itself; every project import exists; no sorry, axiom, unsafe,
implemented_by, extern or Task.spawn in the parsed sources. This is a cache provenance check, not a full build
manifest: CI runs its workflow and axiom-report checks separately, and Lake checks its own traces.
Agent-ID: codex-0e12 (first version), claude-b9ee (registry of the identity-tail caps).
"""
import argparse, hashlib, io, json, os, re, stat, subprocess, sys
from pathlib import Path

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MARK = os.path.join(ROOT, ".lake", "build", "caps-closure.sha")
PROJECT_PREFIXES = ("Grothe.", "GrotheKernel.", "GrotheCapsKernel.", "GrotheQuadKernel.", "GrotheQuadExtKernel.")
PROJECT_ROOTS = ("Grothe", "GrotheKernel", "GrotheCapsKernel", "GrotheQuadKernel", "GrotheQuadExtKernel")
# The quadrature checker's native facts (Grothe/UpperQuad/Facts): one block of the energy table each, about ten hours
# single-threaded; built once on a heavy runner and cached like the node caps. Hashed with them, not registered.
QUAD_TOPS = [f"Grothe.UpperQuad.Facts.GradeBlock{b:02d}" for b in range(12)] + ["Grothe.UpperQuad.Facts.Even",
                                                                             "Grothe.UpperQuad.Facts.Omitted"]
NS = "Grothe.LowerAnalytic"
KERNEL = "GrotheCapsKernel"
CAP_NODES = "Grothe/LowerAnalytic/CapNodes.lean"
CONFIG = ["lean-toolchain", "lake-manifest.json", "lakefile.toml"]
EXTRA = [CAP_NODES, "GrotheCapsKernel.lean", *CONFIG]
REGISTRY = "data/tail-caps/build.json"
FORMAT = "caps-bounded-build-v3"
WRITE_COMMAND = "python3 scripts/caps_stamp.py --write-registry"
SCOPE = ("source/build plan of the node caps, derived from the sources (scripts/caps_stamp.py); not a verification "
         "receipt: CI's full Grothe build, axiom report and marker decide")
GENERATOR = "tools/gen_tail_caps.py"
TAIL_NATIVE = "data/tail-caps/native.txt"
AXIOMS_NATIVE = "data/axioms/native.txt"
NATIVE_SUFFIX = "._native.native_decide.ax_1_1"
FIELDS = ("format", "generator", "scope", "rows", "compute_roots", "assembly_roots", "native_declarations_by_root",
          "pure_roots", "direct_hash_roots", "source_sha256", "leaf_cost_seconds", "derived_counts")
# The registry's part in the digest (c): what decides the computation. Not the costs, comments or counts.
PROJECTED = ("format", "rows", "compute_roots", "assembly_roots", "native_declarations_by_root", "pure_roots",
             "direct_hash_roots", "source_sha256")
IMPORT = re.compile(r"\s*(?:public\s+)?(?:meta\s+)?import(?:\s+(.*))?$")
MODULE = re.compile(r"[A-Za-z_][A-Za-z0-9_']*(\.[A-Za-z_][A-Za-z0-9_']*)*$")

# The caps layout: module name -> kind. Leaves hold one native fact each; their closure is hashed and pinned.
_N = re.escape(NS)
LAYOUT = (
    ("data", re.compile(_N + r"\.CapRow(\d\d)\.Data")),
    ("anchor", re.compile(_N + r"\.CapRow(\d\d)\.AnchorRange(\d\d)")),
    ("assembly", re.compile(_N + r"\.CapRow(\d\d)\.Assembly")),
    ("bridge", re.compile(_N + r"\.CapRow(\d\d)\.Bridge")),
    ("pieces", re.compile(_N + r"\.CapPieces\.D((\d\d)x\d+)")),
    ("cover", re.compile(_N + r"\.CapPieces\.C((\d\d)x\d+)")),
    ("range", re.compile(_N + r"\.CapPieces\.R((\d\d)x\d+)_(\d+)")),
    ("node", re.compile(_N + r"\.CapPieces\.N((\d\d)x\d+)")),
    ("common", re.compile(_N + r"\.CapCommon")),
    ("common_facts", re.compile(_N + r"\.CapCommonFacts")),
)
LEAF_KINDS = ("anchor", "cover", "range")                          # independent leaves
PROOF_KINDS = ("common_facts", "node", "assembly", "bridge")       # hashed directly, imports not followed
_KEYWORDS = (b"native_decide", b"sorry", b"unsafe", b"implemented_by", b"extern", b"axiom", b"Task.spawn")
_FORBIDDEN = re.compile(r"\b(?:sorry|unsafe|implemented_by|extern|axiom)\b|\bTask\.spawn\b")


class ClosureError(Exception):
    pass


def require(ok, message):
    if not ok:
        raise ClosureError(message)


def is_project(module):
    return module in PROJECT_ROOTS or module.startswith(PROJECT_PREFIXES)


def path_of(module):
    return module.replace(".", "/") + ".lean"


def module_of(path):
    return path[:-5].replace("/", ".")


def imports_of(path, source_bytes=None, name=None):
    """Read the import header, ignoring line and nested block comments."""
    name = name or os.path.relpath(path, ROOT)
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
                    raise ClosureError(f"{name}:{n}: unsupported import syntax: {line.rstrip()}")
                break  # first body command: subsequent text is not an import header
            names = (match.group(1) or "").split()
            if not names or any(not MODULE.fullmatch(m) for m in names):
                raise ClosureError(f"{name}:{n}: unsupported import syntax: {line.rstrip()}")
            out.extend(names)
        else:
            if depth:
                raise ClosureError(f"{name}: unterminated block comment in import header")
    return out


def lean_code(text, name="Lean source"):
    """Mask nested comments and strings by blanks, keeping the line breaks."""
    out, i, depth, quoted = [], 0, 0, False
    while i < len(text):
        if depth:
            if text.startswith("/-", i):
                depth += 1
                i += 2
            elif text.startswith("-/", i):
                depth -= 1
                i += 2
                out.append(" ")
            else:
                out.append("\n" if text[i] == "\n" else " ")
                i += 1
        elif quoted:
            if text[i] == "\\":
                out.append("  ")
                i += 2
            elif text[i] == '"':
                quoted = False
                out.append(" ")
                i += 1
            else:
                out.append("\n" if text[i] == "\n" else " ")
                i += 1
        elif text.startswith("--", i):
            end = text.find("\n", i)
            end = len(text) if end < 0 else end
            out.append(" " * (end - i))
            i = end
        elif text.startswith("/-", i):
            depth = 1
            i += 2
            out.append(" ")
        elif text[i] == '"':
            quoted = True
            out.append(" ")
            i += 1
        else:
            out.append(text[i])
            i += 1
    require(not depth and not quoted, f"{name}: unterminated Lean comment or string")
    return "".join(out)


def native_facts(name, data):
    """[(declaration, proposition)] of the theorems of a source proved by `native_decide` (each on its own)."""
    if not any(word in data for word in _KEYWORDS):
        return []
    code = lean_code(data.decode("utf-8"), name)
    require(not _FORBIDDEN.search(code), f"{name}: sorry, axiom, unsafe, implemented_by, extern or Task.spawn")
    total = len(re.findall(r"\bnative_decide\b", code))
    if not total:
        return []
    declarations = list(re.finditer(r"^[ \t]*(private[ \t]+)?theorem[ \t]+([A-Za-z_][A-Za-z0-9_']*)", code, re.M))
    spaces = list(re.finditer(r"^[ \t]*(namespace|end)(?:[ \t]+([A-Za-z0-9_.]+))?[ \t]*$", code, re.M))
    facts = []
    for i, declaration in enumerate(declarations):
        body = code[declaration.end():declarations[i + 1].start() if i + 1 < len(declarations) else len(code)]
        count = len(re.findall(r"\bnative_decide\b", body))
        require(count <= 1, f"{name}: theorem {declaration[2]} holds more than one native_decide")
        if not count:
            continue
        require(not declaration[1], f"{name}: native fact {declaration[2]} is private")
        require([(m[1], m[2]) for m in spaces] == [("namespace", NS), ("end", NS)] and
                spaces[0].end() <= declaration.start() < spaces[1].start(),
                f"{name}: native fact {declaration[2]} must lie in the file's sole `namespace {NS}`")
        shape = re.match(r"\s*:\s*(.*?)\s*:=\s*by\s+native_decide\b", body, re.S)
        require(shape is not None, f"{name}: `theorem {declaration[2]} : <proposition> := by native_decide` expected")
        facts.append((f"{NS}.{declaration[2]}", " ".join(shape[1].split())))
    require(len(facts) == total, f"{name}: native_decide outside a theorem of its own")
    return facts


def layout_kind(module):
    """(kind, groups) of a module of the caps layout, (None, ()) otherwise."""
    for kind, pattern in LAYOUT:
        match = pattern.fullmatch(module)
        if match:
            return kind, match.groups()
    return None, ()


def row_of(kind, groups):
    if kind in ("data", "anchor", "assembly", "bridge"):
        return int(groups[0])
    if kind in ("pieces", "cover", "range", "node"):
        return int(groups[1])
    return None


def expected_fact(kind, groups):
    """(name, proposition pattern) of the one native fact of a leaf; the proposition binds it to its row or node."""
    if kind == "anchor":
        k, j = groups
        return (f"row{k}AnchorRange{j}", rf"rangeOKNu ε capNu capRow{k} capR{k} capChords{k} \(parseRecsNu capRecs{k}\) "
                rf"capGrids capExcl{k} \d+ (?:\d+|capRow{k}\.nodeList\.length) = true")
    if kind == "cover":
        tag = re.escape(groups[0])
        return f"pieceCover_{groups[0]}", rf"pieceCoverFastOK pieceNode_{tag} = true"
    if kind == "range":
        tag, k, j = groups
        return (f"pieceRange_{tag}_{j}",
                rf"pieceRangeOKNu ε capNu capRow{k} capR{k} pieceNode_{re.escape(tag)} \d+ \d+ = true")
    if kind == "assembly":
        k = groups[0]
        return f"chordsOKRow{k}", rf"chordOKLow capRow{k}\.nodeList capChords{k} = true"
    raise ClosureError(f"no native fact expected in a {kind} module")


class Sources:
    """Project files read once (one snapshot for the derivation and the hash); symlinks and escapes are refused."""

    def __init__(self, root=ROOT):
        self.root = Path(root).resolve()
        self.files, self.import_cache = {}, {}

    def path(self, rel, *, missing_ok=False):
        require(isinstance(rel, str) and rel and "\\" not in rel and "\0" not in rel, f"invalid repository path {rel!r}")
        parts = rel.split("/")
        require(not rel.startswith("/") and all(part not in ("", ".", "..") for part in parts),
                f"invalid repository path {rel!r}")
        target = self.root
        for part in parts:
            target = target / part
            require(not target.is_symlink(), f"symlink in a source path: {rel}")
        try:
            mode = target.lstat().st_mode
        except FileNotFoundError:
            if missing_ok:
                return None
            raise ClosureError(f"missing source: {rel}") from None
        require(stat.S_ISREG(mode), f"not a regular file: {rel}")
        return target

    def exists(self, rel):
        return rel in self.files or self.path(rel, missing_ok=True) is not None

    def read(self, rel):
        if rel not in self.files:
            self.files[rel] = self.path(rel).read_bytes()
        return self.files[rel]

    def imports(self, module):
        """Every import of a module whose source exists; a missing project module is an error."""
        if module not in self.import_cache:
            rel = path_of(module)
            if not self.exists(rel):
                require(not is_project(module), f"project module {module} is imported but {rel} does not exist")
                self.import_cache[module] = None
            else:
                self.import_cache[module] = imports_of(self.root / rel, self.read(rel), rel)
        return self.import_cache[module]


def closure(tops, root=ROOT, src=None):
    """Sorted modules of the repository reachable from `tops` (Mathlib and Lean core are not followed)."""
    src = src or Sources(root)
    seen, todo = set(), list(tops)
    while todo:
        module = todo.pop()
        if module in seen:
            continue
        imported = src.imports(module)
        if imported is None:
            continue
        seen.add(module)
        todo.extend(imported)
    return sorted(seen)


def graph(src, roots):
    """Project modules reachable from `roots` in topological order (imports first), and their project imports."""
    order, imports, state = [], {}, {}
    for top in roots:
        stack = [[top, None]]
        while stack:
            frame = stack[-1]
            module = frame[0]
            if frame[1] is None:
                if state.get(module) == 2:
                    stack.pop()
                    continue
                require(is_project(module) and MODULE.fullmatch(module), f"invalid project module {module!r}")
                imported = src.imports(module)
                require(imported is not None, f"project module {module} has no source")
                state[module] = 1
                imports[module] = [m for m in imported if is_project(m)]
                frame[1] = iter(imports[module])
            following = next(frame[1], None)
            if following is None:
                state[module] = 2
                order.append(module)
                stack.pop()
            else:
                require(state.get(following) != 1, f"project import cycle at {following}")
                if state.get(following) != 2:
                    stack.append([following, None])
    return order, imports


def _native_list(src, rel):
    return {line.strip() for line in src.read(rel).decode().splitlines()
            if line.strip() and not line.lstrip().startswith("#")}


def derive(src):
    """The registry without its cost estimates, from the sources alone (no Lean, no subprocess, no writes)."""
    # The rows: CapNodes.lean assembles CapRowKK/Assembly and CapRowKK/Bridge for K = 00, 01, ...
    top = [(m,) + layout_kind(m) for m in imports_of(src.root / CAP_NODES, src.read(CAP_NODES), CAP_NODES)]
    top = [(m, kind, groups) for m, kind, groups in top if kind is not None]
    assembled = sorted(int(groups[0]) for _, kind, groups in top if kind == "assembly")
    bridged = sorted(int(groups[0]) for _, kind, groups in top if kind == "bridge")
    require(assembled and assembled == list(range(len(assembled))),
            f"{CAP_NODES} must import CapRowKK.Assembly for K = 00, 01, ... (it imports rows {assembled})")
    require(bridged == assembled, f"{CAP_NODES} must import CapRowKK.Bridge of each row it assembles")
    require(all(kind in ("assembly", "bridge") for _, kind, _ in top),
            f"{CAP_NODES} imports a caps module other than the row assemblies and bridges")
    # The caps layer: every caps module reached from the assemblies and bridges through caps modules.
    layer, todo = {}, [m for m, _, _ in top]
    while todo:
        module = todo.pop()
        if module in layer:
            continue
        kind, groups = layout_kind(module)
        imported = src.imports(module)
        require(imported is not None, f"caps module {module} has no source")
        layer[module] = (kind, groups)
        todo.extend(m for m in imported if layout_kind(m)[0] is not None)
    for module, (kind, groups) in sorted(layer.items()):
        row = row_of(kind, groups)
        require(row is None or row in assembled, f"{module} belongs to row {row}, which {CAP_NODES} does not assemble")
    base = src.root / "Grothe" / "LowerAnalytic"
    on_disk = {module_of(p.relative_to(src.root).as_posix()) for pattern in
               ("CapRow[0-9][0-9]/**/*.lean", "CapPieces/**/*.lean", "CapRow[0-9][0-9].lean") for p in base.glob(pattern)}
    stray = sorted(on_disk - set(layer))
    require(not stray, f"caps modules not reached from {CAP_NODES} (stray or unregistered): "
            + ", ".join(stray[:5]) + (f" and {len(stray) - 5} more" if len(stray) > 5 else ""))
    # Each leaf holds exactly its native fact; no other caps module holds one.
    natives, counts = {}, dict.fromkeys(("anchor", "cover", "range", "assembly", "node"), 0)
    for module, (kind, groups) in sorted(layer.items()):
        rel = path_of(module)
        facts = native_facts(rel, src.read(rel))
        counts[kind] = counts.get(kind, 0) + 1
        if kind in LEAF_KINDS or kind == "assembly":
            name, proposition = expected_fact(kind, groups)
            require(len(facts) == 1 and facts[0][0] == f"{NS}.{name}" and re.fullmatch(proposition, facts[0][1]),
                    f"{rel}: expected exactly one native fact, `{name} : {proposition}`; found {facts}")
            natives[rel] = [facts[0][0]]
        else:
            require(not facts, f"{rel}: a {kind} module of the caps holds a native fact {facts}")
    compute = sorted(natives)
    assemblies = sorted(rel for rel in compute if layer[module_of(rel)][0] == "assembly")
    leaves = [rel for rel in compute if rel not in assemblies]
    leaf_modules = {module_of(rel) for rel in leaves}
    # The computation closure of the leaves: pure prerequisites only, in topological order, checker library first.
    order, imports = graph(src, [KERNEL] + sorted(leaf_modules))
    for module in order:
        dependent = sorted(set(imports[module]) & leaf_modules)
        require(not dependent, f"dependent native leaves: {module} imports {', '.join(dependent)}")
    pure = [path_of(m) for m in order if m not in leaf_modules]
    for rel in pure:
        kind, _ = layout_kind(module_of(rel))
        require(kind not in PROOF_KINDS, f"the computation closure of the leaves holds the proof module {rel}")
        if module_of(rel) not in layer:   # the caps layer was checked above
            require(not native_facts(rel, src.read(rel)), f"hidden native fact in the computation closure: {rel}")
    for row in assembled:
        require(f"Grothe/LowerAnalytic/CapRow{row:02d}/Data.lean" in pure,
                f"the Data module of row {row:02d} is not in the computation closure of the leaves")
    kernel, _ = graph(src, [KERNEL])
    require(all(m == KERNEL or m.startswith(KERNEL + ".") for m in kernel),
            "the checker library GrotheCapsKernel imports another project library")
    direct = sorted(path_of(m) for m, (kind, _) in layer.items() if kind in PROOF_KINDS)
    # Every native fact of a leaf is registered; the generator's list is exactly the leaves' facts.
    axioms = {name + NATIVE_SUFFIX for names in natives.values() for name in names}
    listed = _native_list(src, AXIOMS_NATIVE) if src.exists(AXIOMS_NATIVE) else set()
    if src.exists(TAIL_NATIVE):
        tail = _native_list(src, TAIL_NATIVE)
        require(tail == axioms, f"{TAIL_NATIVE} and the leaves' native facts differ: only listed "
                f"{sorted(tail - axioms)[:3]}, only in the leaves {sorted(axioms - tail)[:3]}")
        listed |= tail
    missing = sorted(axioms - listed)
    require(not missing, f"native facts of the leaves listed in neither {TAIL_NATIVE} nor {AXIOMS_NATIVE}: {missing[:3]}")
    pinned = sorted(set(compute) | set(pure) | set(direct) | set(EXTRA))
    return {"format": FORMAT, "generator": WRITE_COMMAND, "scope": SCOPE, "rows": assembled,
            "compute_roots": compute, "assembly_roots": assemblies, "native_declarations_by_root": natives,
            "pure_roots": pure, "direct_hash_roots": direct,
            "source_sha256": {rel: hashlib.sha256(src.read(rel)).hexdigest() for rel in pinned},
            "derived_counts": {"rows": len(assembled), "anchor_ranges": counts["anchor"], "covers": counts["cover"],
                               "piece_ranges": counts["range"], "assemblies": counts["assembly"],
                               "localised_nodes": counts["node"], "compute_roots": len(compute),
                               "native_facts": len(axioms), "pure_roots": len(pure), "direct_hash_roots": len(direct),
                               "pinned_sources": len(pinned)}}


def same(left, right):
    """JSON equality without bool/float/integer aliases."""
    if type(left) is not type(right):
        return False
    if isinstance(left, dict):
        return set(left) == set(right) and all(same(left[k], right[k]) for k in left)
    if isinstance(left, list):
        return len(left) == len(right) and all(same(a, b) for a, b in zip(left, right))
    return left == right


def _difference(recorded, derived):
    """A short description of how the sources (derived) differ from the registry (recorded)."""
    if isinstance(recorded, dict) and isinstance(derived, dict):
        changes = ([f"new {k}" for k in sorted(set(derived) - set(recorded))] +
                   [f"gone {k}" for k in sorted(set(recorded) - set(derived))] +
                   [f"changed {k}" for k in sorted(set(recorded) & set(derived)) if not same(recorded[k], derived[k])])
    elif isinstance(recorded, list) and isinstance(derived, list):
        old, new = {json.dumps(v) for v in recorded}, {json.dumps(v) for v in derived}
        changes = [f"new {v}" for v in sorted(new - old)] + [f"gone {v}" for v in sorted(old - new)]
        changes = changes or ["the order differs"]
    else:
        changes = [f"{json.dumps(recorded)} -> {json.dumps(derived)}"]
    return ", ".join(changes[:5]) + (f" and {len(changes) - 5} more" if len(changes) > 5 else "")


def parse_json(data, name):
    def pairs(items):
        result = {}
        for key, value in items:
            require(key not in result, f"{name}: duplicate JSON key {key!r}")
            result[key] = value
        return result
    try:
        return json.loads(data, object_pairs_hook=pairs)
    except (ValueError, TypeError) as error:
        raise ClosureError(f"{name}: invalid JSON ({error})") from error


def render(value):
    return (json.dumps(value, indent=2, sort_keys=True, ensure_ascii=False) + "\n").encode()


def check_registry(src, value, data=None):
    """The registry's view, if it is exactly what the sources and its own cost estimates give."""
    require(isinstance(value, dict) and value.get("format") == FORMAT,
            f"{REGISTRY}: format {FORMAT} expected; regenerate it with `{WRITE_COMMAND}`")
    require(set(value) == set(FIELDS), f"{REGISTRY}: fields {sorted(set(value) ^ set(FIELDS))} differ from the format")
    derived = derive(src)
    for field in FIELDS:
        if field in derived and not same(value[field], derived[field]):
            raise ClosureError(
                f"{REGISTRY} does not match the sources ({field}: {_difference(value[field], derived[field])}). "
                f"A change of the node caps' sources means a full node-cap build: regenerate the registry with "
                f"`{WRITE_COMMAND}` in the same commit")
    costs = value["leaf_cost_seconds"]
    require(isinstance(costs, dict) and set(costs) == set(derived["compute_roots"]) and
            all(type(v) is int and v > 0 for v in costs.values()),
            f"{REGISTRY}: leaf_cost_seconds must give a positive integer for exactly the compute roots; "
            f"regenerate it with `{WRITE_COMMAND}`")
    view = dict(derived, leaf_cost_seconds=costs)
    require(data is None or data == render(view), f"{REGISTRY} is not in its canonical form; regenerate it with "
            f"`{WRITE_COMMAND}`")
    return view


def load_registry(src, rel=REGISTRY):
    require(src.exists(rel), f"missing {rel}; generate it with `{WRITE_COMMAND}`")
    data = src.read(rel)
    return check_registry(src, parse_json(data, rel), data)


def projection(view):
    return (json.dumps({k: view[k] for k in PROJECTED}, sort_keys=True, separators=(",", ":")) + "\n").encode()


def generator_costs(root):
    """Cost estimates (seconds of one Lean process) of `tools/gen_tail_caps.py --plan --check`, by module."""
    run = subprocess.run([sys.executable, GENERATOR, "--plan", "--check"], cwd=root, capture_output=True, text=True,
                         check=False)
    tail = " | ".join((run.stdout + run.stderr).strip().splitlines()[-5:])
    require(run.returncode == 0, f"{GENERATOR} --plan --check failed (exit {run.returncode}): {tail}")
    costs = {}
    for line in run.stdout.splitlines():
        match = re.fullmatch(r"\s*(\d+) s  (\S+)", line)
        if match:
            require(match[2] not in costs, f"{GENERATOR} plans {match[2]} twice")
            costs[match[2]] = int(match[1])
    return costs


def write_registry(root=ROOT, costs=None, rel=REGISTRY):
    """Derive the registry and write it; `costs` (module -> seconds) defaults to the generator's plan."""
    src = Sources(root)
    view = derive(src)
    plan = generator_costs(src.root) if costs is None else costs
    planned = {path_of(m) for m in plan}
    if costs is None:   # the generator plans the leaves, the node theorems and the bridges: exactly these modules
        modules = set(view["compute_roots"]) | {p for p in view["direct_hash_roots"]
                                                if layout_kind(module_of(p))[0] in ("node", "bridge")}
        require(planned == modules, f"{GENERATOR}'s plan and the sources differ: "
                f"{_difference(sorted(planned), sorted(modules))}")
    missing = sorted(set(view["compute_roots"]) - planned)
    require(not missing, f"no cost estimate for the leaves {missing[:3]}")
    view["leaf_cost_seconds"] = {p: plan[module_of(p)] for p in view["compute_roots"]}
    require(all(type(v) is int and v > 0 for v in view["leaf_cost_seconds"].values()), "costs must be positive integers")
    target = src.path(rel, missing_ok=True) or src.root / rel
    target.parent.mkdir(parents=True, exist_ok=True)
    temp = target.with_name(target.name + f".{os.getpid()}.tmp")
    temp.write_bytes(render(view))
    os.replace(temp, target)
    return view


def hashed_files(src, view):
    """(a) the computation closure, (b) the extras and the caps' proof modules, (c) the registry, in hash order."""
    roots = set(view["assembly_roots"])
    tops = QUAD_TOPS + [module_of(r) for r in view["compute_roots"] if r not in roots] + \
        [f"{NS}.CapRow{row:02d}.Data" for row in view["rows"]]
    files = [path_of(m) for m in closure(tops, src=src)]
    seen = set(files)
    for rel in EXTRA + view["direct_hash_roots"] + [REGISTRY]:
        if rel not in seen:
            files.append(rel)
            seen.add(rel)
    return files


def stamp(root=ROOT):
    """(digest, hashed files) of the current sources; raises ClosureError if the registry does not match them."""
    src = Sources(root)
    view = load_registry(src)
    files = hashed_files(src, view)
    h = hashlib.sha256()
    for rel in files:
        h.update(rel.encode() + b"\0")
        h.update(projection(view) if rel == REGISTRY else src.read(rel))
    return h.hexdigest(), files


def digest(root=ROOT):
    d, files = stamp(root)
    return d, len(files)


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
    modes.add_argument("--write-registry", action="store_true",
                       help=f"derive {REGISTRY} from the sources and the generator's plan, and write it")
    args = parser.parse_args(argv)
    try:
        if args.write_registry:
            view = write_registry()
            counts = view["derived_counts"]
            print(f"wrote {REGISTRY}: {counts['compute_roots']} compute roots ({counts['native_facts']} native facts), "
                  f"{counts['pure_roots']} pure prerequisites, {counts['direct_hash_roots']} directly hashed proof "
                  f"modules, {counts['pinned_sources']} pinned sources; no Lean build or verification performed")
            return 0
        d, files = stamp()
    except (ClosureError, OSError, UnicodeDecodeError) as e:
        print(f"FAIL: {e}")
        return 1
    n = len(files)
    if args.list:
        print("\n".join(files))
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
