// codex-c7e2-round3/replay.mjs; Agent-ID: codex-c7e2.
import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

const root=path.dirname(fileURLToPath(import.meta.url));
let repo=path.join(root,'upstream'),quick=false;
for(let i=2;i<process.argv.length;i++){
  if(process.argv[i]==='--quick') quick=true;
  else if(process.argv[i]==='--repo' && process.argv[i+1]) repo=path.resolve(process.argv[++i]);
  else throw new Error('Usage: node replay.mjs [--quick] [--repo /absolute/checkout]');
}
const started=Date.now(),logs=path.join(root,'replay-results');
fs.mkdirSync(logs,{recursive:true});
const records=[];
const sha=p=>crypto.createHash('sha256').update(fs.readFileSync(p)).digest('hex');
const provenance=JSON.parse(fs.readFileSync(path.join(root,'upstream/PROVENANCE.json'),'utf8'));
for(const [name,digest] of Object.entries(provenance.files)){
  if(sha(path.join(repo,name))!==digest) throw new Error(`Upstream input differs from pinned version: ${name}`);
}
function run(name,command,args,expectedFailure=false){
  console.log(`${name}: running`);
  const t=Date.now();
  const r=spawnSync(command,args,{cwd:root,encoding:'utf8',maxBuffer:8*1024*1024});
  if(r.error) throw r.error;
  fs.writeFileSync(path.join(logs,`${name}.log`),(r.stdout??'')+(r.stderr??''));
  if(expectedFailure ? r.status===0 : r.status!==0)
    throw new Error(`${name}: unexpected exit ${r.status}; see replay-results/${name}.log`);
  records.push({name,status:expectedFailure?'REJECTED_AS_REQUIRED':'PASS',exit:r.status,seconds:(Date.now()-t)/1000});
  console.log(`${name}: ${records.at(-1).status}`);
}
run('odd_region',process.execPath,['odd-taylor/check_odd_region.mjs']);
run('weighted_polynomial',process.execPath,['gaussian-core/check_weighted_polynomial.mjs']);
run('genuine_core',process.execPath,['gaussian-core/check_genuine_core.mjs']);
run('rice_envelope','python3',['-O','gaussian-core/certify_rice_envelope.py']);
run('potential_tail','python3',['-O','odd-perturb/verify_recenter_constants.py']);
run('positive_part','python3',['joint/verify_positive_part.py','--repo',repo]);
run('reject_optimized_assertions','python3',['-O','joint/verify_positive_part.py','--repo',repo],true);

const temporary=fs.mkdtempSync(path.join(os.tmpdir(),'codex-c7e2-odd-controls-'));
try{
  fs.cpSync(path.join(root,'upstream'),temporary,{recursive:true});
  const file=path.join(temporary,'research/conjecture-K/code/odd-cubic-core-2026-11-15/results/all_bounds.txt');
  const original=fs.readFileSync(file,'utf8');
  fs.writeFileSync(file,original.split('\n').slice(1).join('\n'));
  run('reject_missing_matrix_cell','python3',['joint/verify_positive_part.py','--repo',temporary],true);
  const rows=original.split('\n'),columns=rows[0].trim().split(/\s+/);
  columns[3]='2'; rows[0]=columns.join(' ');
  fs.writeFileSync(file,rows.join('\n'));
  run('reject_excessive_matrix_bound','python3',['joint/verify_positive_part.py','--repo',temporary],true);
} finally { fs.rmSync(temporary,{recursive:true,force:true}); }

if(!quick) run('fresh_potential_cover','python3',['odd-perturb/verify_recentered.py']);
const receipt={agent_id:'codex-c7e2',status:quick?'QUICK_PASS_FULL_COVER_NOT_RECOMPUTED':'PASS',
  baseline:provenance.commit,full_cover_recomputed:!quick,node:process.version,
  seconds:(Date.now()-started)/1000,records,
  upstream:provenance.files,
  inputs:{'replay.mjs':sha(path.join(root,'replay.mjs'))}};
fs.writeFileSync(path.join(logs,'RECEIPT.json'),JSON.stringify(receipt,null,2)+'\n');
console.log(JSON.stringify(receipt,null,2));
