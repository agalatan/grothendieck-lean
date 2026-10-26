#!/usr/bin/env python3
"""Exact certificate, obstruction and supplemental-provenance retry regressions."""
import copy
from contextlib import redirect_stdout
from fractions import Fraction as F
import io,json
from pathlib import Path
import sys,tempfile,unittest
sys.dont_write_bytecode=True
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'tools'))
import caps_centre_retry as R


def fixture():
    matrix=[[F(int(i==j)) for j in range(13)] for i in range(13)]
    zero=[[F(0) for _ in range(13)] for _ in range(13)]
    return {'k':12,'i':280,'j':103,'grid':3,'grid_spec':[1600,1152,'1/200'],
            'capPad':'1/100000000000','encl':True,'polyOK':True,'ok':True,'N':matrix,
            'cons':[{'A':copy.deepcopy(zero),'B':copy.deepcopy(zero),'lo':F(0),'hi':F(1),'lam':F(0),'mu':F(0)}]}


class RetryTests(unittest.TestCase):
    def test_exact_kernel(self):
        a=[[F(1),F(2),F(3)],[F(2),F(4),F(6)]]
        basis=R.nullspace(a,3)
        self.assertEqual(len(basis),2)
        for v in basis:
            self.assertTrue(all(sum(x*y for x,y in zip(row,v))==0 for row in a))

    def test_zero_seed_passes_without_sdp(self):
        result,attempts,obstruction=R.retry(fixture(),[('stored',[['0','0']])],max_solves=0)
        self.assertEqual(result['cap_up'],'0')
        self.assertEqual(result['status'],'fixed')
        self.assertTrue(attempts[0]['exact_feasible'])
        self.assertIsNone(obstruction)

    def test_exact_schur_cap_shift(self):
        d=fixture();d['N'][0][0]=F(1,2);d['N'][0][1]=d['N'][1][0]=F(1)
        c=R.schur_candidate(d,[(F(0),F(0))])
        self.assertEqual(F(c['cap_up']),F(1,2)+F(1,10**18))
        self.assertTrue(c['exact_ldl_ok'])

    def test_singular_bottom_out_of_range_has_no_finite_shift(self):
        d=fixture();d['N'][1][1]=F(0);d['N'][0][1]=d['N'][1][0]=F(1)
        self.assertIsNone(R.schur_candidate(d,[(F(0),F(0))]))

    def test_exact_obstruction_immune_to_multiplier_and_cap_shift(self):
        d=fixture();d['N'][3][3]=F(-1);d['cons'][0]['A'][1][1]=F(-1)
        proof=R.common_kernel_obstruction(d)
        self.assertTrue(R.check_obstruction(d,proof))
        v=list(map(F,proof['vector']))
        self.assertEqual(v[0],0)
        self.assertLess(R.quadratic(d['N'],v),0)
        for up in [F(0),F(100000)]:
            N=copy.deepcopy(d['N']);N[0][0]+=up
            self.assertEqual(R.quadratic(N,v),F(proof['negative_quadratic']))

    def test_psd_matrix_has_no_false_obstruction(self):
        self.assertIsNone(R.common_kernel_obstruction(fixture()))

    def test_reject_invalid_obstruction_transcript(self):
        d=fixture();d['N'][3][3]=F(-1)
        proof=R.common_kernel_obstruction(d)
        bad=copy.deepcopy(proof);bad['vector'][0]='1'
        self.assertFalse(R.check_obstruction(d,bad))
        bad=copy.deepcopy(proof);bad['negative_quadratic']='-2'
        self.assertFalse(R.check_obstruction(d,bad))

    def test_float_export_coefficients_rejected(self):
        d=fixture()
        with tempfile.TemporaryDirectory() as td:
            p=Path(td)/'export.jsonl';serial=json.loads(json.dumps(d,default=str));serial['N'][0][0]=1.0
            p.write_text(json.dumps(serial)+'\n')
            with self.assertRaises(ValueError):R.load_export(p,(12,280,103))

    def test_supplement_copies_math_provenance_and_binds_retry_separately(self):
        with tempfile.TemporaryDirectory() as td:
            export,primary,output=[Path(td)/s for s in ['export.jsonl','primary.json','retry.json']]
            export.write_text(json.dumps(fixture(),default=str)+'\n')
            provenance={'baseline_capPad':'1/100000000000','export_sha256':R.digest(export),
                        'fingerprint':'unchanged-primary-mathematical-binding',
                        'grid_spec':[1600,1152,'1/200']}
            primary.write_text(json.dumps([{'k':12,'i':280,'j':103,'grid':3,'grid_spec':[1600,1152,'1/200'],
                                           'status':'fail','provenance':provenance}]))
            original=primary.read_bytes()
            argv=[str(export),'--piece','12:280:103','--primary',str(primary),'--output',str(output),
                  '--agent-id','codex-test','--max-solves','0']
            with redirect_stdout(io.StringIO()):R.main(argv)
            result=json.loads(output.read_text())[0]
            self.assertEqual(result['provenance'],provenance)
            self.assertTrue(result['method'])
            self.assertEqual(result['retry_provenance']['hashes']['primary'],R.digest(primary))
            self.assertEqual(primary.read_bytes(),original)
            before=output.read_bytes()
            with redirect_stdout(io.StringIO()):R.main(argv)
            self.assertEqual(output.read_bytes(),before)


if __name__=='__main__':unittest.main()
