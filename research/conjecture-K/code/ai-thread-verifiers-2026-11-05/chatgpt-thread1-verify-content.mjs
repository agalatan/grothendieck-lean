// content-proof/verify-content.mjs
// Exact dyadic enclosures, Node 20 or later. Default: application rows and quartics.
// --box: uniform content; --box-direct: uniform matched-variance comparison.
// --box-direct --part=i replays one of the eight profile intervals (i=0,...,7).
import assert from 'node:assert/strict';

const D = 2 ** 20;             // coordinates and function values
const M = 2 ** 30;             // cell masses
const L = 2 ** 13;             // extra accumulator precision
const N = 2 ** 14;             // dimensionless angular grid
const TERMS = 96;
const TILT = 512;              // radial bins per unit, for T and the remote driver
const GAUSS = 512;             // radial bins per unit, for the auxiliary Gaussian
const STOP = 5;
const BOXDIRECT = process.argv.includes('--box-direct');
const BOX = process.argv.includes('--box') || BOXDIRECT;
const MAXA = BOX ? 48 : 20;
const BIG = 1n << 60n;
const ROWS = [
  { eps: 7564, ell: 8456, beta: 1432, test: Math.floor(D / 5) },
  { eps: 7450, ell: 8534, beta: 1467, test: 11 * D / 64 },
  { eps: 7564, ell: 8770, beta: 1520, test: 5 * D / 32 },
];

function exactInteger(x) {
  assert.ok(Number.isSafeInteger(x), 'unsafe integer');
  return x;
}
function ceilBig(x, y) { return (x + y - 1n) / y; } // x >= 0
function bigBounds(x, y) { return [Number(x / y), Number(ceilBig(x, y))]; }
function minProduct(al, au, bl, bu) {
  return Math.min(exactInteger(al * bl), exactInteger(al * bu), exactInteger(au * bl), exactInteger(au * bu));
}
function maxProduct(al, au, bl, bu) {
  return Math.max(exactInteger(al * bl), exactInteger(al * bu), exactInteger(au * bl), exactInteger(au * bu));
}
function addLower(sum, mass, value) {
  return exactInteger(sum + Math.floor(exactInteger(mass * value) / (M / L)));
}
function addUpper(sum, mass, value) {
  return exactInteger(sum + Math.ceil(exactInteger(mass * value) / (M / L)));
}
function signedCellLower(m, lo, hi) {
  return Math.floor(minProduct(m.lo, m.hi, lo, hi) / (M / L));
}
function signedCellUpper(m, lo, hi) {
  return Math.ceil(maxProduct(m.lo, m.hi, lo, hi) / (M / L));
}

// e^(-i^2/n^2) on scale BIG. Alternating Taylor bounds at x/32 <= 25/32;
// square five times to recover e^(-x).
function expNode(i, n) {
  const z = BigInt(i) ** 2n, den = 32n * BigInt(n) ** 2n;
  let lo = BIG, hi = BIG, tl = BIG, th = BIG;
  for (let k = 1; k <= 24; k++) {
    tl = tl * z / (den * BigInt(k));
    th = ceilBig(th * z, den * BigInt(k));
    if (k % 2) { lo -= th; hi -= tl; }
    else { if (k < 24) lo += tl; hi += th; }
  }
  assert.ok(lo >= 0n && hi >= lo);
  for (let k = 0; k < 5; k++) {
    lo = lo * lo / BIG;
    hi = ceilBig(hi * hi, BIG);
  }
  return [lo, hi];
}

function radialCells(n) {
  const nodes = Array.from({ length: STOP * n + 1 }, (_, i) => expNode(i, n));
  const cells = [];
  for (let i = 0; i + 1 < nodes.length; i++) {
    const [al, au] = nodes[i], [bl, bu] = nodes[i + 1];
    const lo = Math.max(0, Number((al - bu) * BigInt(M) / BIG));
    const hi = Number(ceilBig((au - bl) * BigInt(M), BIG));
    const i2 = BigInt(i * i), j2 = BigInt((i + 1) ** 2);
    let ql = i2 * al - j2 * bu, qu = i2 * au - j2 * bl;
    if (i < n) [ql, qu] = [-qu, -ql];
    const den = BIG * BigInt(n * n);
    const sl = Math.max(0, Number(ql * BigInt(M) / den));
    const sh = Number(ceilBig(qu * BigInt(M), den));
    cells.push({ i, lo, hi, sl, sh, neg: i < n });
  }
  return cells;
}

// j(1-x,x)-(1-x) and its derivative with respect to the second argument
// before normalization. Both quantities increase with x.
function circularTable() {
  const dl = new Int32Array(N + 1), du = new Int32Array(N + 1);
  const kl = new Int32Array(N + 1), ku = new Int32Array(N + 1);
  const coeff = [[BIG, BIG], [BIG / 4n, BIG / 4n]];
  for (let n = 2; n <= TERMS; n++) {
    const a = BigInt((2 * n - 3) ** 2), b = BigInt((2 * n) ** 2);
    coeff.push([coeff[n - 1][0] * a / b, ceilBig(coeff[n - 1][1] * a, b)]);
  }
  for (let m = 0; m <= N; m++) {
    const small = m <= N / 2;
    const ma = BigInt(Math.max(m, N - m)), mi = BigInt(Math.min(m, N - m));
    const rl = mi * BIG / ma, ru = ceilBig(mi * BIG, ma);
    const zl = mi * mi * BIG / (ma * ma), zu = ceilBig(mi * mi * BIG, ma * ma);
    let pl = BIG, pu = BIG, sl = 0n, su = 0n, hl = 0n, hu = 0n;
    for (let n = 1; n <= TERMS; n++) {
      const [cl, cu] = coeff[n];
      const weight = BigInt(small ? 2 * n : 2 * n - 1);
      if (small) {
        hl += cl * weight * pl / BIG; hu += ceilBig(cu * weight * pu, BIG);
      }
      pl = pl * zl / BIG; pu = ceilBig(pu * zu, BIG);
      sl += cl * pl / BIG; su += ceilBig(cu * pu, BIG);
      if (!small) {
        hl += cl * weight * pl / BIG; hu += ceilBig(cu * weight * pu, BIG);
      }
    }
    // b_n <= 4/(27 n^3) for n>=2. Retain the ratio power in both tails.
    const next = ceilBig(pu * zu, BIG);
    su += ceilBig(2n * next, BigInt(27 * TERMS ** 2));
    if (small) {
      hu += ceilBig(8n * pu, BigInt(27 * TERMS));
      hl = hl * rl / BIG; hu = ceilBig(hu * ru, BIG);
    } else {
      hu += ceilBig(8n * next, BigInt(27 * TERMS));
      [hl, hu] = [BIG - hu, BIG - hl];
    }
    const base = BigInt(Math.max(0, 2 * m - N)) * BIG;
    dl[m] = Number((base + ma * sl) * BigInt(D) / (BigInt(N) * BIG));
    du[m] = Number(ceilBig((base + ma * su) * BigInt(D), BigInt(N) * BIG));
    kl[m] = Math.max(0, Number(hl * BigInt(D) / BIG));
    ku[m] = Math.min(D, Number(ceilBig(hu * BigInt(D), BIG)));
  }
  return { dl, du, kl, ku };
}

function gaussianTable(a, cells) {
  const dl = new Int32Array(N + 1), du = new Int32Array(N + 1);
  const kl = new Int32Array(N + 1), ku = new Int32Array(N + 1);
  const hats = BOX ? hatData(GAUSS) : null;
  for (let m = 0; m <= N; m++) {
    const rr = (N - m) * GAUSS;
    let sdl = 0, sdu = 0, skl = 0, sku = 0;
    for (const z of cells) {
      const yl = m * z.i, yu = m * (z.i + 1);
      const il = rr + yl ? Math.floor(N * yl / (rr + yl)) : 0;
      const iu = Math.ceil(N * yu / (rr + yu)) || 0;
      const vlo = Math.floor((rr + yl) * a.dl[il] / (N * GAUSS));
      const vhi = Math.ceil((rr + yu) * a.du[iu] / (N * GAUSS));
      if (BOX) {
        const yn=m*hats.meanLo[z.i], rn=(N-m)*D;
        const index=rn+yn ? Math.floor(N*yn/(rn+yn)) : 0;
        // Convexity in the Gaussian radius: Jensen below, chord above.
        const low=Math.floor(Math.floor((rn+yn)/N)*a.dl[index]/D);
        const lu=rr+yl ? Math.ceil(N*yl/(rr+yl)) : 0;
        const left=Math.ceil((rr+yl)*a.du[lu]/(N*GAUSS));
        sdl=addLower(sdl,z.lo,low);
        sdu=addUpper(sdu,hats.left[z.i],left);
        sdu=addUpper(sdu,hats.right[z.i],vhi);
      } else {
        sdl = addLower(sdl, z.lo, vlo); sdu = addUpper(sdu, z.hi, vhi);
      }
      skl = addLower(skl, z.lo, Math.floor(z.i * a.kl[il] / GAUSS));
      sku = addUpper(sku, z.hi, Math.ceil((z.i + 1) * a.ku[iu] / GAUSS));
    }
    dl[m] = Math.floor(sdl / L); du[m] = Math.ceil(sdu / L) + 1;
    kl[m] = Math.floor(skl / L); ku[m] = Math.ceil(sku / L) + 1;
    // E[|W|; |W|>5] <= (5+1/10)e^-25 < 1/D.
  }
  return { dl, du, kl, ku };
}

function visibleNodes(row, n) {
  const alpha = BigInt(row.ell - 2 * row.beta), beta = BigInt(row.beta);
  const den = 10000n * BigInt(n) ** 3n;
  return Array.from({ length: STOP * n + 1 }, (_, i) => {
    const j = BigInt(i);
    return bigBounds(BigInt(D) * j * (alpha * BigInt(n) ** 2n + beta * j * j), den);
  });
}

// Three monotone potentials versus a: norm increment G(a) and the positive
// and negative t-weights of its signed derivative. Grid adapts in large tails.
function aGrid() {
  const out = [0];
  for (const [end, step] of [[1, D / 2048], [4, D / 512], [MAXA, D / 64]]) {
    for (let v = out.at(-1) + step; v <= end * D; v += step) out.push(v);
  }
  return out;
}
function aIndex(x, up) {
  assert.ok(x >= 0 && x <= MAXA * D);
  const rnd = up ? Math.ceil : Math.floor;
  if (x <= D) return rnd(x / (D / 2048));
  if (x <= 4 * D) return 2048 + rnd((x - D) / (D / 512));
  return 3584 + rnd((x - 4 * D) / (D / 64));
}

function potentials(row, tab, cells, grid) {
  const rs = visibleNodes(row, TILT);
  const hats = BOX ? hatData(TILT) : null;
  const out = [];
  for (const y of grid) {
    let gl = 0, gu = 0, pl = 0, pu = 0, nl = 0, nu = 0;
    for (const z of cells) {
      const rlo = rs[z.i][0], rhi = rs[z.i + 1][1];
      const sumLo = rhi + y, sumHi = rlo + y;
      const il = sumLo ? Math.floor(N * y / sumLo) : 0;
      const iu = sumHi ? Math.ceil(N * y / sumHi) : N;
      const vl = 2 * Math.floor(sumLo * tab.dl[il] / D);
      const vu = 2 * Math.ceil(sumHi * tab.du[iu] / D);
      if (BOX) {
        const i=z.i, frac=(hats.meanHi[i]-i*D/TILT)*TILT;
        const rr=rs[i][1]+Math.ceil(frac*(rs[i+1][1]-rs[i][1])/D);
        const k=rr+y?Math.floor(N*y/(rr+y)):0;
        gl=addLower(gl,z.lo,2*Math.floor((rr+y)*tab.dl[k]/D));
        const right=rs[i+1][0], j=right+y?Math.ceil(N*y/(right+y)):0;
        gu=addUpper(gu,hats.left[i],vu);
        gu=addUpper(gu,hats.right[i],2*Math.ceil((right+y)*tab.du[j]/D));
      } else {
        gl = addLower(gl, z.lo, vl); gu = addUpper(gu, z.hi, vu);
      }
      if (z.neg) {
        nl = addLower(nl, z.sl, tab.kl[il]); nu = addUpper(nu, z.sh, tab.ku[iu]);
      } else {
        pl = addLower(pl, z.sl, tab.kl[il]); pu = addUpper(pu, z.sh, tab.ku[iu]);
      }
    }
    // Omitted T>25: 2*y*exp(-25) < 1/D for y<=48; 25*exp(-25)<1/D.
    // Normalized box mode uses beta<=0.365: twice the integrated r-chord
    // error is <= 3*beta*(1+1/TILT)/(2*TILT^2) <= 1/TILT^2.
    out.push({ gl: Math.floor(gl / L), gu: Math.ceil(gu / L) + 1 + (BOX?Math.ceil(D/TILT**2):0),
      pl: Math.floor(pl / L), pu: Math.ceil(pu / L) + 1,
      nl: Math.floor(nl / L), nu: Math.ceil(nu / L) });
  }
  return out;
}

function remoteCells(kind, cells) {
  const shift = kind === 1 ? 2 : 1;
  return cells.map(z => {
    const x0 = z.i * D / TILT, x1 = (z.i + 1) * D / TILT;
    const q0 = Math.floor(x0 * x0 / D) - shift * D;
    const q1 = Math.ceil(x1 * x1 / D) - shift * D;
    const al = Math.max(0, q0, -q1), au = Math.max(-q0, q1);
    return { ...z, al: kind === 1 ? Math.floor(al * x0 / D) : al,
      au: kind === 1 ? Math.ceil(au * x1 / D) : au,
      mult: kind === 1 ? [x0, x1] : [D, D],
      sign: q0 >= 0 ? 1 : q1 <= 0 ? -1 : 0 };
  });
}

// Verify a continuous coefficient interval, then sum the true remote law.
function certifyRow(row, kind, pot, gaussian, cells) {
  const tau2 = kind === 1 ? 2 : 1;
  const scenarios = remoteCells(kind, cells);
  const witness = row.test;
  const bench = gaussian[aIndex(witness, false)].gl
      - Math.ceil(10000 * witness * witness / (row.eps * D));
  let smallest = Infinity, worstRatio = 0, count = 0;
  // c-grid 1/4096, keeping every cell that can meet 551/100000<=u<=463/10000.
  for (let j = 0; j <= 900; j++) {
    if (tau2 * (j + 1) ** 2 * 100000 < 551 * 4096 ** 2
        || tau2 * j ** 2 * 10000 > 463 * 4096 ** 2) continue;
    const cl = j * D / 4096, cu = (j + 1) * D / 4096;
    let upper = 0, acl = 0, acu = 0;
    for (const z of scenarios) {
      const lo = pot[aIndex(Math.floor(cl * z.al / D), false)];
      const hi = pot[aIndex(Math.ceil(cu * z.au / D), true)];
      upper = addUpper(upper, z.hi, hi.gu);
      let al = lo.pl - hi.nu, au = hi.pu - lo.nl;
      if (z.sign < 0) [al, au] = [-au, -al];
      if (!z.sign) { const abs = Math.max(Math.abs(al), Math.abs(au)); al = -abs; au = abs; }
      const vl = Math.floor(minProduct(z.mult[0], z.mult[1], al, au) / D);
      const vu = Math.ceil(maxProduct(z.mult[0], z.mult[1], al, au) / D);
      acl += signedCellLower(z, vl, vu); acu += signedCellUpper(z, vl, vu);
    }
    // For x>5 both models have |H| bounded in mean by c*(x^3+2x+x^2+1)
    // in the corresponding conditional Gaussian representation. The tail of
    // the increment and each content tail is <1/D; see the proof.
    upper = Math.ceil(upper / L) + 1;
    const amax = Math.max(-Math.floor(acl / L) + 1, Math.ceil(acu / L) + 1);
    const pen = Math.floor(10000 * tau2 * cl * cl / (row.eps * D));
    const slack = bench - upper + pen;
    const margin = exactInteger(19 * slack * D - 100 * amax * amax);
    assert.ok(margin > 0, JSON.stringify({ row, kind, j, slack, amax, margin }));
    smallest = Math.min(smallest, margin);
    worstRatio = Math.max(worstRatio, Math.ceil(1000 * amax * amax / (D * slack)));
    count++;
  }
  return { count, strictMarginNumerator: smallest, ratioUpperPerThousand: worstRatio };
}

// Dimensionless verification for every profile in the box. Lower potential
// endpoints come from k_hi and upper endpoints from k_lo, k=beta/alpha.
function boxContent(kind, upper, lower, gaussianLower, cells) {
  const tau2 = kind === 1 ? 2 : 1, n = 8192;
  const root = Number(1414213n * BigInt(D) / 1000000n); // <= sqrt(2)*D
  const scenarios = remoteCells(kind, cells), hats=hatData(TILT), grid=aGrid();
  function chordUpper(y) {
    const li=aIndex(y,false),hi=aIndex(y,true);
    if(li===hi)return upper[li].gu;
    return upper[li].gu+Math.ceil((upper[hi].gu-upper[li].gu)*(y-grid[li])/(grid[hi]-grid[li]));
  }
  function tangentLower(y) {
    const i=aIndex(y,false),a=gaussianLower[i].gl;
    if(i===0)return a;
    return a+Math.max(0,Math.floor((a-gaussianLower[i-1].gu)*(y-grid[i])/(grid[i]-grid[i-1])));
  }
  let worstRatio = 0, smallest = Infinity, count = 0;
  for (let j=0;j<4100;j++) {
    // u = tau2*(j/n)^2*alpha^2, 11/25<=alpha<=33/50.
    if (tau2*(j+1)**2*33**2*100000 < 551*n*n*50**2 ||
        tau2*j*j*11**2*10000 > 463*n*n*25**2) continue;
    const cl = j*D/n, cu = (j+1)*D/n;
    const sig = tau2 === 2 ? Math.floor(cl*root/D) : cl;
    const bench = tangentLower(sig);
    let up=0, al=0, au=0;
    for (const z of scenarios) {
      const lo=lower[aIndex(Math.floor(cl*z.al/D),false)];
      const hi=upper[aIndex(Math.ceil(cu*z.au/D),true)];
      let vl=lo.pl-hi.nu, vu=hi.pu-lo.nl;
      if (z.sign<0) [vl,vu]=[-vu,-vl];
      if (!z.sign) {const m=Math.max(Math.abs(vl),Math.abs(vu)); vl=-m;vu=m;}
      const yl=Math.floor(minProduct(z.mult[0],z.mult[1],vl,vu)/D);
      const yu=Math.ceil(maxProduct(z.mult[0],z.mult[1],vl,vu)/D);
      al+=signedCellLower(z,yl,yu); au+=signedCellUpper(z,yl,yu);
    }
    for(let i=0;i<hats.weights.length;i++){
      const x=i*D/TILT, q=Math.abs(x*x/D-(kind===1?2:1)*D);
      const z=kind===1?Math.ceil(q*x/D):q;
      up=addUpper(up,hats.weights[i],chordUpper(Math.ceil(cu*z/D)));
    }
    const slack=bench-Math.ceil(up/L)-1-Math.ceil(2*D/TILT**2);
    const amp=Math.max(-Math.floor(al/L)+1, Math.ceil(au/L)+1);
    // Compare Content^2 <= (19/100)*(11/25)*normalized matched slack.
    const limit=kind===1?138:135;
    const margin=exactInteger(limit*11*slack*D-25000*amp*amp);
    if(margin<=0) return {pass:false,kind,j,amp,slack,margin};
    smallest=Math.min(margin,smallest);
    worstRatio=Math.max(worstRatio,Math.ceil(25000*amp*amp/(11*D*slack)));
    count++;
  }
  return {pass:true,kind,count,smallest,worstRatio};
}

// Upper masses of the piecewise linear nodal basis on [0,5]. On [i/n,(i+1)/n]
// the right hat's mass is avg(e^-x^2)-e^-b^2; the left one's is e^-a^2-avg.
const hatCache = new Map();
function hatData(n) {
  if(hatCache.has(n)) return hatCache.get(n);
  const nodes = Array.from({ length: STOP * n + 1 }, (_, i) => expNode(i, n));
  const weights = Array(STOP * n + 1).fill(0);
  const meanLo=[],meanHi=[],left=[],right=[];
  for (let i = 0; i < STOP * n; i++) {
    let lo = BIG, hi = BIG, fact = 1n;
    for (let k = 1; k <= 10; k++) {
      fact *= BigInt(k);
      let fl = 0n, fh = 0n, bin = 1n;
      for (let j = 0; j <= k; j++) {
        const a = BIG * bin * BigInt(2 * i) ** BigInt(k - j);
        const b = BigInt(k + j + 1) * BigInt(n) ** BigInt(2 * k) * fact;
        fl += a / b; fh += ceilBig(a, b);
        if (j < k) bin = bin * BigInt(k - j) / BigInt(j + 1);
      }
      if (k % 2) { lo -= fh; hi -= fl; }
      else { if (k < 10) lo += fl; hi += fh; }
    }
    const avgLo = nodes[i][0] * lo / BIG;
    const avgHi = ceilBig(nodes[i][1] * hi, BIG);
    left[i]=Number(ceilBig((nodes[i][1] - avgLo) * BigInt(M), BIG));
    right[i]=Number(ceilBig((avgHi - nodes[i+1][0]) * BigInt(M), BIG));
    weights[i]+=left[i]; weights[i+1]+=right[i];
    const mlo=nodes[i][0]-nodes[i+1][1], mhi=nodes[i][1]-nodes[i+1][0];
    const low=avgLo-nodes[i+1][1], high=avgHi-nodes[i+1][0], x=i*D/n;
    meanLo[i]=x+Math.max(0,Number(low*BigInt(D)/(BigInt(n)*mhi)));
    meanHi[i]=x+(mlo>0n?Math.min(D/n,Number(ceilBig(high*BigInt(D),BigInt(n)*mlo))):D/n);
  }
  const result={weights,meanLo,meanHi,left,right};
  hatCache.set(n,result);
  return result;
}

function sqrtUpper(n) {
  exactInteger(n);
  let r = Math.ceil(Math.sqrt(n));
  assert.ok(Number.isSafeInteger(r));
  // The only use of sqrt for this bound is as an integer guess.
  while (r * r < n) r++;
  while (r > 0 && (r - 1) * (r - 1) >= n) r--;
  exactInteger(r * r);
  return r;
}

function directUpper(row, kind, tab, mesh, ci, di, ei, par=64) {
  const { n, weights, rs } = mesh;
  const den = par * n * n;
  const dScale = D / den;   // exact binary fraction
  const shift = kind === 1 ? 2 : 1;
  const remote = weights.map((_, j) => dScale * ci * (j * j - shift * n * n));
  let upper = 0;
  for (let i = 0; i < weights.length; i++) {
    const r = rs[i][0], re = dScale * di * (i * i - n * n);
    const im = Math.ceil(Math.abs(dScale * ei * (i * i - n * n))), im2 = im * im;
    let inner = 0;
    for (let j = 0; j < weights.length; j++) {
      const x = Math.ceil(Math.abs(re + remote[j]));
      let p = sqrtUpper(x * x + im2);
      if (kind === 1) p = Math.ceil(j * p / n);
      const sum = r + p;
      const idx = sum ? Math.ceil(N * p / sum) : 0;
      const value = 2 * Math.ceil(sum * tab.du[idx] / D);
      inner = addUpper(inner, weights[j], value);
    }
    upper = addUpper(upper, weights[i], Math.ceil(inner / L));
  }
  // h^2 [3(beta+c)(1+h)+|d|]/2 ; |d| <= (|di|+ei)/64.
  const dd = Math.abs(di) + ei;
  const num = D * (3 * (row.beta * par + 10000 * ci) * (n + 1) + 10000 * dd * n);
  const error = Math.ceil(num / (2 * 10000 * par * n ** 3));
  return Math.ceil(upper / L) + error + 1;
}

function directRow(row, kind, tab, gaussian) {
  const tau2 = kind === 1 ? 2 : 1;
  const bench = gaussian[aIndex(row.test, false)].gl -
    Math.ceil(10000 * row.test * row.test / (row.eps * D));
  // Uniform price of trilinear parameter interpolation on a mesh of width 1/64.
  const allowance = Math.ceil((tau2 + 2) * D * 10000 / (4 * row.eps * 64 ** 2));
  const meshes = [16, 32, 64, 128].map(n => ({
    n, weights: hatData(n).weights, rs: visibleNodes(row, n),
  }));
  const replays = { 16: 0, 32: 0, 64: 0, 128: 0 };
  let smallest = Infinity;
  const cmin = kind === 1 ? 3 : 4, cmax = kind === 1 ? 10 : 14;
  for (let ci = cmin; ci <= cmax; ci++) {
    for (let di = -10; di <= 10; di++) for (let ei = 0; ei <= 10; ei++) {
      // Keep vertices of every parameter cell meeting the disk w<=0.0223.
      const mind = Math.max(0, Math.abs(di) - 1), mine = Math.max(0, ei - 1);
      if (10000 * (mind * mind + mine * mine) > 223 * 64 ** 2) continue;
      const pen = Math.floor(D * 10000 * (tau2 * ci * ci + di * di + ei * ei) /
        (row.eps * 64 ** 2));
      let margin;
      for (const mesh of meshes) {
        const upper = directUpper(row, kind, tab, mesh, ci, di, ei);
        margin = bench + pen - upper - allowance;
        if (margin > 0) {
          replays[mesh.n]++;
          smallest = Math.min(smallest, margin);
          break;
        }
      }
      assert.ok(margin > 0, JSON.stringify({ row, kind, ci, di, ei, margin, bench, pen, allowance }));
    }
  }
  return { marginUnits: smallest, successfulMeshes: replays };
}

// Uniform matched-variance comparison, by convex interpolation in
// (c,Re d,Im d). Lower signed gains for the Gaussian use k_hi, upper
// gains for the actual polynomial use k_lo.
function directProfileBox(kl,kh,kind,tab,gaussianLower,grid) {
  const P=256, tau2=kind===1?2:1, row={ell:10000+2*kl,beta:kl};
  const meshes=[16,32,64,128,256].map(n=>({n,weights:hatData(n).weights,rs:visibleNodes(row,n)}));
  const vertices=new Map(),counts={}, leafMargins=[];
  let fail=null;
  function gaussianBound(ci,di,ei) {
    const z=(tau2*ci*ci+di*di+ei*ei)*(D/P)**2;
    let y=sqrtUpper(z);if(y*y>z)y--;
    const i=aIndex(y,false), a=gaussianLower[i].gl;
    if(i===0)return a;
    return a+Math.max(0,Math.floor((a-gaussianLower[i-1].gu)*(y-grid[i])/(grid[i]-grid[i-1])));
  }
  function vertex(ci,di,ei,side,cost) {
    const key=(ci*1024+di+512)*512+ei;
    let state=vertices.get(key);
    if(!state){state={bench:gaussianBound(ci,di,ei),margin:-Infinity,next:0};vertices.set(key,state);}
    const maxMesh=side>=16?0:side>=8?1:side>=4?2:side>=2?3:4;
    while(state.margin<=cost && state.next<=maxMesh) {
      const up=directUpper(row,kind,tab,meshes[state.next++],ci,di,ei,P);
      state.margin=Math.max(state.margin,state.bench-up);
    }
    return state.margin;
  }
  function cell(c,d,e,side) {
    if(fail)return;
    const dc=Math.max(0,d,-(d+side));
    if(10000*(dc*dc+e*e)*121>223*P*P*625)return;
    if(tau2*(c+side)**2*33**2*100000<551*P*P*50**2 ||
       tau2*c*c*11**2*10000>463*P*P*25**2)return;
    const cost=Math.ceil(D*(tau2+2)*side**2/(4*P*P));
    let margin=Infinity;
    for(const ci of [c,c+side])for(const di of [d,d+side])for(const ei of [e,e+side])
      margin=Math.min(margin,vertex(ci,di,ei,side,cost)-cost);
    if(margin>0) {
      counts[side]=(counts[side]||0)+1;leafMargins.push(margin);return;
    }
    if(side===1){fail={c,d,e,side,margin};return;}
    const h=side/2;
    for(const cc of [c,c+h])for(const dd of [d,d+h])for(const ee of [e,e+h])cell(cc,dd,ee,h);
  }
  for(let c=16;c<128;c+=16)for(let d=-96;d<96;d+=16)for(let e=0;e<96;e+=16)cell(c,d,e,16);
  return {kl,kh,kind,fail,counts,vertices:vertices.size,
    smallest:leafMargins.length?leafMargins.reduce((a,b)=>Math.min(a,b)):null};
}

// Outward rational integration for I_2 and D_j=Delta^2 B_j(0).
// Return integer endpoints in units of 1/100; these are independent of
// the content and direct certificates.
function quarticEnclosures(row) {
  const B = 1n << 40n, n = 2048;
  const floor = (x, y) => x >= 0n ? x / y : -ceilBig(-x, y);
  const ceil = (x, y) => -floor(-x, y);
  const frac = (x, y) => [floor(x * B, y), ceil(x * B, y)];
  const fixed = k => [BigInt(k) * B, BigInt(k) * B];
  const add = (a, b) => [a[0] + b[0], a[1] + b[1]];
  const sub = (a, b) => [a[0] - b[1], a[1] - b[0]];
  const times = (a, b) => {
    const p = [a[0]*b[0], a[0]*b[1], a[1]*b[0], a[1]*b[1]];
    const lo = p.reduce((x,y) => x < y ? x : y);
    const hi = p.reduce((x,y) => x > y ? x : y);
    return [floor(lo, B), ceil(hi, B)];
  };
  const inv = a => { assert.ok(a[0] > 0n); return [floor(B*B, a[1]), ceil(B*B, a[0])]; };
  const alpha = frac(BigInt(row.ell - 2*row.beta), 10000n);
  const beta = frac(BigInt(row.beta), 10000n);
  const acc = Array.from({ length:6 }, () => fixed(0));
  let left = expNode(0,n);
  for (let i=0; i<8*n; i++) {
    const right = expNode(i+1,n);
    const e = [floor(right[0]*B,BIG), ceil(left[1]*B,BIG)];
    left = right;
    const t = [BigInt(i*i)*B/BigInt(n*n), BigInt((i+1)**2)*B/BigInt(n*n)];
    const a = inv(add(alpha, times(beta,t)));
    const g = inv(add(alpha, times(fixed(3),times(beta,t))));
    const log = add(fixed(1),add(times(beta,a),times(fixed(3),times(beta,g))));
    const weight = times(fixed(4),times(e,times(a,times(a,g))));
    const z = sub(t,fixed(1));
    let power = fixed(1), prev = fixed(0);
    acc[0] = add(acc[0],times(fixed(2),times(e,times(a,times(t,sub(t,fixed(2)))))));
    for (let j=0;j<5;j++) {
      acc[j+1] = add(acc[j+1],times(weight,sub(times(fixed(j),prev),times(power,log))));
      prev=power; power=times(power,z);
    }
  }
  return acc.map(([lo,hi]) => [
    Number(floor(100n*(floor(lo,BigInt(n))-2n),B)),
    Number(ceil(100n*(ceil(hi,BigInt(n))+2n),B)),
  ]);
}

const cells = radialCells(TILT), grid = aGrid();
console.log('Building exact angular and Gaussian tables.');
const angular = circularTable();
const gaussian = gaussianTable(angular, GAUSS === TILT ? cells : radialCells(GAUSS));
if (BOX) {
  const cache = new Map();
  function at(k) {
    if (!cache.has(k)) {
      const row={ell:10000+2*k,beta:k};
      cache.set(k,[potentials(row,angular,cells,grid),potentials(row,gaussian,cells,grid)]);
    }
    return cache.get(k);
  }
  function verify(kl,kh) {
    const lo=at(kl),hi=at(kh);
    const rs=[1,2].map(kind=>boxContent(kind,lo[kind-1],hi[kind-1],hi[1],cells));
    if(rs.every(x=>x.pass)) {console.log('box',kl,kh,rs);return;}
    assert.ok(kh-kl>1, JSON.stringify({kl,kh,rs}));
    const mid=Math.floor((kl+kh)/2); verify(kl,mid); verify(mid,kh);
  }
  if (BOXDIRECT) {
    function verifyDirect(kl,kh) {
      // Only the Gaussian benchmark needs a potential table.
      if(!cache.has(kh))cache.set(kh,potentials({ell:10000+2*kh,beta:kh},gaussian,cells,grid));
      const rs=[1,2].map(kind=>directProfileBox(kl,kh,kind,kind===1?angular:gaussian,cache.get(kh),grid));
      if(rs.every(x=>!x.fail)) {console.log('matched box',JSON.stringify(rs));return;}
      console.log('subdividing profile',kl,kh,rs.map(x=>x.fail));
      assert.ok(kh-kl>1,JSON.stringify(rs));
      const mid=Math.floor((kl+kh)/2);verifyDirect(kl,mid);verifyDirect(mid,kh);
    }
    const bounds=[1800,2031,2262,2493,2725,2956,3187,3418,3650];
    const part=process.argv.find(x=>x.startsWith('--part='));
    for(let i=0;i<8;i++)if(!part || Number(part.slice(7))===i)verifyDirect(bounds[i],bounds[i+1]);
  } else verify(1800,3650);
} else for (const row of ROWS) {
  console.log('I2, D0,...,D4 (hundredths)',row.ell,quarticEnclosures(row));
  const p1 = potentials(row, angular, cells, grid);
  const p2 = potentials(row, gaussian, cells, grid);
  for (const [kind, pot] of [[1, p1], [2, p2]]) {
    console.log(row.eps, row.ell, row.beta, kind, certifyRow(row, kind, pot, p2, cells));
    if (!process.argv.includes('--content-only')) {
      console.log('direct', row.eps, kind, directRow(row, kind,
        kind === 1 ? angular : gaussian, p2));
    }
  }
}