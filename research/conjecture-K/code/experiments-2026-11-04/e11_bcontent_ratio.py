import numpy as np
exec(open('bcontent.py').read().split("kA,kB,kAB")[0])
rho=GB/G
for lo,hi in [(0,0.05),(0.05,0.5),(0.5,2),(2,5),(5,20),(20,60)]:
    m=(vg>=lo)&(vg<=hi); print(f"v in [{lo},{hi}]: rho=gB/g in [{rho[m].min():.4f}, {rho[m].max():.4f}]  |g| in [{abs(G[m]).min():.3f},{abs(G[m]).max():.3f}]")
# bound: C_B <= rho_bar C_A + sup|rho-rho_bar| * sqrt(u) * sup|g| ; evaluate at u=0.0463 with rho_bar chosen on v<=5
m=vg<=5; rb=(rho[m].min()+rho[m].max())/2; dev=(rho[m].max()-rho[m].min())/2
print(f"rho_bar={rb:.4f} dev={dev:.4f}; error term at u=0.0463: {dev*np.sqrt(0.0463)*abs(G[m]).max():.2e} vs C_A ~ 0.033 (ratio {dev*np.sqrt(0.0463)*abs(G[m]).max()/0.033:.3f})")
np.save('GB_table.npy',GB)
