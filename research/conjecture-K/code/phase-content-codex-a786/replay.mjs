// phase_content/replay.mjs
// Rebuild all deliverable certificates. Run from any directory.
import fs from 'node:fs';
import path from 'node:path';
import {fileURLToPath} from 'node:url';
import {spawnSync} from 'node:child_process';
import assert from 'node:assert/strict';
const root=path.dirname(fileURLToPath(import.meta.url));
const results=path.join(root,'results');fs.mkdirSync(results,{recursive:true});
const python=process.env.PHASE_CONTENT_PYTHON||'python3';
function run(exe,args,file){const r=spawnSync(exe,args,{cwd:root,encoding:'utf8',maxBuffer:20*1024*1024,timeout:180000});if(r.error)throw r.error;if(r.status!==0)throw new Error(file+': '+r.stderr+'\n'+r.stdout);fs.writeFileSync(path.join(results,file),r.stdout);return r.stdout;}
run(process.execPath,['verify_exact.mjs','results/exact.json'],'exact_stdout.txt');
const split=JSON.parse(run(process.execPath,['phase_split.mjs','example_tensor.json'],'example_split.json'));assert(split.passed&&split.below_11e_minus6);
const hp=run(python,['-B','upstream/content_profile.py','--certify'],'profile_replay.jsonl');
const hrows=hp.trim().split('\n').map(JSON.parse);const hlast=hrows.at(-1);assert.equal(hlast.claim,'C GLOBAL PROFILE CERTIFICATE');assert.equal(hlast.compact_boxes,111);
assert(hrows.filter(x=>x.claim==='C compact box').every(x=>x.result.passed));
const m3=run(python,['-B','upstream/content_next_m3.py'],'m3_replay.jsonl');
const mrows=m3.trim().split('\n').map(JSON.parse);assert(mrows.at(-1).passed);assert.equal(mrows.at(-1).boxes,120);
assert(mrows.filter(x=>x.x).every(x=>x.passed));
const m5=run(python,['-B','certify_m5.py'],'m5_replay.jsonl');
const frows=m5.trim().split('\n').map(JSON.parse);assert(frows.at(-1).passed);assert.equal(frows.at(-1).boxes,240);
assert(frows.filter(x=>x.x).every(x=>x.passed));
const summary={passed:true,exact:JSON.parse(fs.readFileSync(path.join(results,'exact.json'),'utf8')).passed,phaseSplit:true,profileBoxes:hlast.compact_boxes,m3Boxes:mrows.at(-1).boxes,m5Boxes:frows.at(-1).boxes,node:process.version,python,scope:'new exact controls, new fifth-derivative certificate, and two inherited scalar interval certificates; not the full repository remote or secant certificates'};
fs.writeFileSync(path.join(results,'replay_summary.json'),JSON.stringify(summary,null,2)+'\n');
console.log(JSON.stringify(summary,null,2));
