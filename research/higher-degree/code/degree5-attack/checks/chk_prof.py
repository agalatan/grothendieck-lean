import sys; import os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import d5, numpy as np, json, math
R='/Users/alingalatan/workspaces/grothe/research/higher-degree/code/degree5-content/'
z,w=d5.zgrid(npan=120,nth=512)
for path in ('profiles_low/band_row_0.70.json','profiles/band_row_0.84.json'):
    d=json.load(open(R+path)); rec=d['row']; S=np.array(d['S'])
    B=d5.base(z,rec['l'],rec['beta'],rec['nu5']); Dz=d5.Dz(z,rec['bA'],rec['bB']); e11=d5.e11(z); e20=d5.e20(z)
    print(path, 'row', {k:rec[k] for k in ('t','l','beta','bA','bB','nu5')}, 'tilt', d.get('tilt'), 'len S', len(S))
    for i in (40, 150, 300, 513, 600):
        s=S[i]; Ap,Am=B+s*Dz,B-s*Dz; pP,pM=Ap/np.abs(Ap),Am/np.abs(Am)
        psi=(np.abs(Ap)+np.abs(Am))@w; GA=np.real((np.conj(e11)*(pP-pM))@w); GB=np.real((np.conj(e20)*(pP-pM))@w); G0=np.real((pP-pM)@w)
        print('  s=%.4f  psi %.6f/%.6f  GA %.6f/%.6f  GB %.6f/%.6f  G0 %.6f/%.6f   (definition/table)'%(s,psi,d['psi'][i],GA,d['GA'][i],GB,d['GB'][i],G0,d['G0'][i]))
    # h(0) = G'(0) and decay
    GAs=np.array(d['GA'])+0.4*np.array(d['G0']); print('  G_A(s)/s near 0:', GAs[1]/S[1], GAs[5]/S[5], ' G_A(6)=',GAs[-1], ' G_B(6)=',d['GB'][-1]+0.3*d['G0'][-1])
