#!/usr/bin/env python3
"""Generate exact near-zero source rows from the compact frozen byte packet.

Agent-ID: codex-aa04. This generator reads rows.bin, ledger.jsonl, provenance.json,
and the three existing pinned conditional_source inputs. It never reads the
original full payload. Historical floating error claims are not consumed.
Generated arithmetic facts use decide +kernel, with at most 30 rows per chunk.
"""
from pathlib import Path
from fractions import Fraction as Q
from hashlib import sha256
import argparse
import ast
import json
import struct

ROOT = Path(__file__).resolve().parents[2]
ROWS_PER_MODULE = 30
EXPECTED_RANGES = ((3469, 988), (10710, 529), (17223, 320))
PROFILE_BLOCKS = ((102, 318), (521, 720), (933, 1118))
INPUT_HASHES = {
    'conditional_offsets.npy': '8bf1649d9620449873e32a8fa120709f29888885e8e43ae024c5305b95101c5c',
    'conditional_cutoffs.npy': 'b799d62d61e3183a13b16dbe3e0cd22ac8d3460779e0e0d561ecd11f63ebb10f',
    'exception-selection.json': '2e60b2f6ed08495047f67709a7589ad8962d2abc73062a6e3c819c8888d147a0',
}
PAYLOAD_SHA = '05dc2b1fcbb58807b66d1c8ba2df8dcaa0a0e049395cddf43c74a99db71378d6'
LEDGER_SHA = '7478713d2abd796c485054f8edf49d8e20670e9a953d182c82d3715f6b404c7a'


def digest(raw):
    return sha256(raw).hexdigest()


def npy_array(raw, code, descr):
    if raw[:8] != b'\x93NUMPY\x01\x00':
        raise ValueError('unsupported NPY version')
    size = int.from_bytes(raw[8:10], 'little')
    head = ast.literal_eval(raw[10:10+size].decode('ascii'))
    if head['descr'] != descr or head['fortran_order']:
        raise ValueError('unexpected NPY representation')
    payload = raw[10+size:]
    width = struct.calcsize(code)
    if len(payload) % width:
        raise ValueError('NPY payload is not a whole number of words')
    values = struct.unpack('<' + code*(len(payload)//width), payload)
    if head['shape'] != (len(values),):
        raise ValueError('unexpected NPY shape')
    return values


def decode(word):
    exponent = (word >> 52) & 2047
    if not (0 <= word < 2**64 and 1 <= exponent <= 1023):
        raise ValueError('word outside exact Lean decoder range')
    x = Q(2**52 + (word & (2**52-1)), 2**(1075-exponent))
    if word >> 63:
        x = -x
    if abs(x) > 1:
        raise ValueError('decoded word magnitude exceeds one')
    return x


def read_rows(data, source_data):
    """Return validated ordinal/sourceStart/cutoff/words/address records."""
    provenance = json.loads((data/'provenance.json').read_bytes())
    raw = (data/'rows.bin').read_bytes()
    ledger_raw = (data/'ledger.jsonl').read_bytes()
    if digest(raw) != PAYLOAD_SHA or provenance['payload_sha256'] != PAYLOAD_SHA:
        raise ValueError('compact source payload hash mismatch')
    if digest(ledger_raw) != LEDGER_SHA or provenance['selected_ledger_sha256'] != LEDGER_SHA:
        raise ValueError('selected ledger hash mismatch')
    inputs = {}
    for name, expected in INPUT_HASHES.items():
        inp = (source_data/name).read_bytes()
        key = 'data/q0_quadrature/conditional_source/'+name
        if digest(inp) != expected or provenance['input_sha256'][key] != expected:
            raise ValueError('pinned source input mismatch: '+name)
        inputs[name] = inp
    offsets = npy_array(inputs['conditional_offsets.npy'],'q','<i8')
    cutoffs = npy_array(inputs['conditional_cutoffs.npy'],'h','<i2')
    if len(offsets) != 21578 or len(cutoffs) != 21577 or offsets[0] != 0 or offsets[-1] != 421701618:
        raise ValueError('unexpected original metadata count/endpoints')
    selected = [i for i, k in enumerate(cutoffs) if k <= 2]
    expected = [i for start, count in EXPECTED_RANGES for i in range(start,start+count)]
    if selected != expected or len(selected) != 1837:
        raise ValueError('small-cutoff source coverage differs')
    selection = json.loads(inputs['exception-selection.json'])
    if selection['schema'] != 1 or selection['node_count'] != 21577:
        raise ValueError('unexpected original panel selection schema')
    addresses = []
    for panel, (lo,hi,order) in enumerate(selection['panels']):
        if not Q(lo) < Q(hi) or not 1 <= order <= 64:
            raise ValueError('invalid original panel')
        addresses.extend((panel,rule) for rule in range(order))
    if len(addresses) != 21577:
        raise ValueError('original panel addresses do not cover source ordinals')
    ledger = [json.loads(line) for line in ledger_raw.splitlines()]
    if [r['index'] for r in ledger] != selected:
        raise ValueError('ledger ordinal coverage/order differs')
    rows = []
    cursor = 0
    for ordinal,record in zip(selected,ledger):
        cutoff = cutoffs[ordinal]
        if cutoff not in (1,2):
            raise ValueError('invalid selected source cutoff')
        count = offsets[ordinal+1]-offsets[ordinal]
        if count != 2*cutoff+1 or record['cutoff'] != cutoff:
            raise ValueError('source offset/cutoff/ledger mismatch')
        if not 0 <= offsets[ordinal] < offsets[ordinal+1] <= 421701618:
            raise ValueError('invalid source value-record span')
        part = raw[cursor:cursor+8*count]
        cursor += 8*count
        if len(part) != 8*count or digest(part) != record['sha256']:
            raise ValueError('original ledger row hash differs at '+str(ordinal))
        words = struct.unpack('<'+'Q'*count,part)
        values = list(map(decode,words))
        if sum(x*x for x in values) > Q(121,100):
            raise ValueError('validRow norm cap fails')
        x00,x01,x10,x02,x11 = values + [Q(0)]*(5-count)
        fit = x10-x01
        residual = (1-x00)**2 + (x10+x01)**2/2 + x02*x02 + x11*x11
        if abs(fit) > Q(2,10**11) or residual > Q(2,10**22)**2:
            raise ValueError('exact proposed arithmetic rowOK fails')
        panel,rule = addresses[ordinal]
        if not any(a<=panel<=b for a,b in PROFILE_BLOCKS):
            raise ValueError('selected source address is outside profile blocks')
        rows.append({'ordinal':ordinal,'source_start':offsets[ordinal],
            'source_end':offsets[ordinal+1],'cutoff':cutoff,'words':words,
            'panel':panel,'rule':rule,'payload_bytes':8*count})
    if cursor != len(raw) or cursor != 65032:
        raise ValueError('compact payload has missing/trailing bytes')
    return rows


def split_rows(rows):
    parts=[]
    for r in rows:
        if not parts or len(parts[-1]) == ROWS_PER_MODULE or \
                r['ordinal'] != parts[-1][-1]['ordinal']+1 or \
                r['ordinal']//128 != parts[-1][0]['ordinal']//128:
            parts.append([])
        parts[-1].append(r)
    for part in parts:
        if not 1 <= len(part) <= 30 or len({r['ordinal']//128 for r in part}) != 1:
            raise ValueError('chunk policy failed')
    return parts


def check_source():
    return '''import Grothe.UpperChaos.Q0SourceSavedLinearModel

/-! Exact rational arithmetic for the original small-cutoff source rows.
Generated by tools/q0_quadrature/gen_near_zero_source.py.
Agent-ID: codex-aa04. Physical Gaussian bounds are established separately. -/
namespace Grothe.UpperChaos.Q0NearZeroSourceCheck

open Q0SourceExceptionCenters Q0SourceSavedLinearModel

/-- One coupled saved-model discrepancy and the fitted scalar magnitude. -/
def rowOK (r : Row) : Bool :=
  decide (|fitParameter r| ≤ (2 / 10 ^ 11 : ℚ) ∧
    modelErrorSq r (fitParameter r) ≤ (2 / 10 ^ 22 : ℚ) ^ 2)

theorem rowOK_sound (r : Row) (h : rowOK r = true) :
    |fitParameter r| ≤ (2 / 10 ^ 11 : ℚ) ∧
      modelErrorSq r (fitParameter r) ≤ (2 / 10 ^ 22 : ℚ) ^ 2 :=
  of_decide_eq_true h

end Grothe.UpperChaos.Q0NearZeroSourceCheck
'''.encode()


def chunk_source(index,part):
    name=f'Q0NearZeroSourceChunk{index:02}'
    first=part[0]['ordinal'];count=len(part)
    group=first//1024;subchunk=first%1024//128;within=first%128
    metadata=f'Q0ConditionalMetadataGroup{group:03}'
    source_slice=f'({metadata}.rows{subchunk}.drop {within}).take {count}'
    lines=[
        'import Grothe.UpperChaos.Q0NearZeroSourceCheck',
        'import Grothe.UpperChaos.Q0SourceExceptionMetadata',
        f'import Grothe.UpperChaos.{metadata}', '',
        '/-! Exact original source bytes and their genuine source metadata slice.',
        'Generated by tools/q0_quadrature/gen_near_zero_source.py.',
        'Agent-ID: codex-aa04. -/',
        f'namespace Grothe.UpperChaos.{name}', '',
        'open Q0SourceExceptionCenters Q0NearZeroSourceCheck', '',
        'set_option maxRecDepth 65536', 'set_option maxHeartbeats 0', '',
        'def rows : List Row := [',
    ]
    for i,r in enumerate(part):
        suffix=',' if i+1<len(part) else ''
        lines.append(f"  ⟨{r['ordinal']}, {r['source_start']}, {r['cutoff']}, [{', '.join(map(str,r['words']))}]⟩{suffix}")
    lines += [']','',
        'theorem all_valid : rows.all validRow = true := by decide +kernel','',
        'theorem all_fit : rows.all rowOK = true := by decide +kernel','',
        f"theorem ordinals : rows.map Row.ordinal = List.range' {first} {count} := by",
        '  decide +kernel','',
        f'theorem row_count : rows.length = {count} := by decide +kernel','',
        'def metadataRows : List Q0ConditionalMetadataCheck.Row :=',
        f'  {source_slice}','',
        'theorem metadata_aligned : rows.length = metadataRows.length ∧',
        '    (rows.zip metadataRows).all (fun pair => matchesMetadata pair.1 pair.2) = true := by',
        '  decide +kernel','',
        'theorem metadata_mem (m : Q0ConditionalMetadataCheck.Row) (hm : m ∈ metadataRows) :',
        f'    m ∈ {metadata}.rows := by',
        f'  change m ∈ {source_slice} at hm',
        f'  have hp : m ∈ {metadata}.rows{subchunk} :=',
        '    List.mem_of_mem_drop (List.mem_of_mem_take hm)',
        f'  simp only [{metadata}.rows, List.mem_append, or_assoc]',
        '  tauto','',
        f'end Grothe.UpperChaos.{name}','',
    ]
    return name+'.lean', '\n'.join(lines).encode()


def aggregate_source(names):
    lines=[f'import Grothe.UpperChaos.{name}' for name in names]
    lines += ['import Grothe.UpperChaos.Q0ConditionalMetadataAll',
        'import Lean.Util.CollectAxioms','import Lean.Elab.Command','',
        '/-! Exact small-cutoff source coverage and saved-data checks.',
        'Generated by tools/q0_quadrature/gen_near_zero_source.py.',
        'Agent-ID: codex-aa04. No Gaussian coefficient enclosure is inferred here. -/',
        'namespace Grothe.UpperChaos.Q0NearZeroSourceData','',
        'open Q0SourceExceptionCenters Q0NearZeroSourceCheck','',
        'set_option maxRecDepth 65536','set_option maxHeartbeats 0','',
        'def rows : List Row :=',
        '  '+' ++\n  '.join(name+'.rows' for name in names),'',
        'theorem all_valid : rows.all validRow = true := by',
        '  simp only [rows, List.all_append, '+',\n    '.join(name+'.all_valid' for name in names)+', Bool.and_true]','',
        'theorem all_fit : rows.all rowOK = true := by',
        '  simp only [rows, List.all_append, '+',\n    '.join(name+'.all_fit' for name in names)+', Bool.and_true]','',
        'theorem row_count : rows.length = 1837 := by',
        '  norm_num only [rows, List.length_append, '+',\n    '.join(name+'.row_count' for name in names)+']','',
        'theorem ordinals : rows.map Row.ordinal =',
        "    List.range' 3469 988 ++ List.range' 10710 529 ++ List.range' 17223 320 := by",
        '  simp only [rows, List.map_append, '+',\n    '.join(name+'.ordinals' for name in names)+', List.append_assoc]',
        '  decide +kernel','',
        '/-- Every decoded row is matched to its original source metadata. -/',
        'theorem each_row_source (r : Row) (hr : r ∈ rows) :',
        '    ∃ m ∈ Q0ConditionalMetadataAll.rows, matchesMetadata r m = true := by',
        '  simp only [rows, List.mem_append, or_assoc] at hr',
        '  rcases hr with '+' | '.join('hr' for _ in names),
    ]
    for name in names:
        lines += [f'  · obtain ⟨m, hm, hmatch⟩ := metadata_witness {name}.rows',
            f'      {name}.metadataRows {name}.metadata_aligned r hr',
            f'    have hs := {name}.metadata_mem m hm',
            '    refine ⟨m, ?_, hmatch⟩',
            '    simp only [Q0ConditionalMetadataAll.rows, List.mem_append, or_assoc]',
            '    tauto']
    lines += ['', 'end Grothe.UpperChaos.Q0NearZeroSourceData','',
        'open Lean Elab Command',
        'run_cmd do',
        '  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]',
        '  for target in #[``Grothe.UpperChaos.Q0NearZeroSourceCheck.rowOK_sound,',
        '      ``Grothe.UpperChaos.Q0NearZeroSourceData.all_valid,',
        '      ``Grothe.UpperChaos.Q0NearZeroSourceData.all_fit,',
        '      ``Grothe.UpperChaos.Q0NearZeroSourceData.row_count,',
        '      ``Grothe.UpperChaos.Q0NearZeroSourceData.ordinals,',
        '      ``Grothe.UpperChaos.Q0NearZeroSourceData.each_row_source] do',
        '    for dependency in (← Lean.collectAxioms target) do',
        '      unless allowed.contains dependency do',
        '        throwError m!"{target} uses unexpected axiom {dependency}"','']
    return '\n'.join(lines).encode()


def generate(data, source_data):
    rows=read_rows(data,source_data);parts=split_rows(rows)
    files={'Q0NearZeroSourceCheck.lean':check_source()};names=[]
    for index,part in enumerate(parts):
        name,raw=chunk_source(index,part);files[name]=raw;names.append(name[:-5])
    files['Q0NearZeroSourceData.lean']=aggregate_source(names)
    return files,parts


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--repo',type=Path,default=ROOT,help='repository root; defaults to two levels above tools/q0_quadrature')
    p.add_argument('--data',type=Path,help='override compact packet directory (rows.bin, ledger.jsonl, provenance.json only)')
    p.add_argument('--source-data',type=Path,help='override existing pinned conditional_source input directory')
    p.add_argument('--out',type=Path,help='override generated Lean destination (defaults to repo/Grothe/UpperChaos)')
    p.add_argument('--check',action='store_true',help='compare generated bytes with destination files')
    args=p.parse_args()
    data=args.data or args.repo/'data/q0_quadrature/near-zero-source'
    source_data=args.source_data or args.repo/'data/q0_quadrature/conditional_source'
    args.out=args.out or args.repo/'Grothe/UpperChaos'
    files,parts=generate(data,source_data)
    if not args.check:
        args.out.mkdir(parents=True,exist_ok=True)
    for name,raw in files.items():
        path=args.out/name
        if args.check:
            if path.read_bytes()!=raw:
                raise ValueError('generated file differs: '+str(path))
        else:
            path.write_bytes(raw)
    expected=set(files)
    actual={p.name for p in args.out.glob('Q0NearZeroSource*.lean')
            if p.name=='Q0NearZeroSourceCheck.lean' or p.name=='Q0NearZeroSourceData.lean' or p.name.startswith('Q0NearZeroSourceChunk')}
    if actual!=expected:
        raise ValueError('generated destination has stale/missing owned module names')
    print(json.dumps({'status':'GENERATED_NOT_LEAN_VERIFIED','rows':sum(map(len,parts)),
        'chunks':len(parts),'modules':len(files),'maximum_chunk_rows':max(map(len,parts)),
        'generated_bytes':sum(map(len,files.values())),
        'metadata_slices':len({part[0]['ordinal']//128 for part in parts}),
        'output_directory':str(args.out),'mode':'check' if args.check else 'write'},indent=2))


if __name__=='__main__':
    main()
