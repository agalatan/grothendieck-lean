# cubic_l1_gram_certificate/basis.py
"""Numerical discovery, never a certificate by itself."""
import numpy as np

KNOTS=np.array([0,.002,.01,.03,.07,.15,.3,.5,.7,1,1.3,1.7,2.3,3,4,5.5,7,9,12,16,22,30.])

KNOTS=np.sort(np.r_[KNOTS,(KNOTS[:-1]+KNOTS[1:])/2])

def basis(r):
    r=np.asarray(r); n=len(KNOTS)
    G=np.zeros((len(r),2*n));Der=G.copy()
    for i,x in enumerate(r):
        j=min(np.searchsorted(KNOTS,x,side='right')-1,n-1)
        if j==n-1:
            R=KNOTS[-1]
            G[i,-2]=1;G[i,-1]=(x*x-R*R)/(2*R);Der[i,-1]=x/R
        else:
            a,b=KNOTS[j:j+2];h=b-a;t=(x-a)/h
            G[i,2*j:2*j+4]=[2*t**3-3*t*t+1,h*(t**3-2*t*t+t),-2*t**3+3*t*t,h*(t**3-t*t)]
            Der[i,2*j:2*j+4]=[(6*t*t-6*t)/h,3*t*t-4*t+1,(-6*t*t+6*t)/h,3*t*t-2*t]
    K=(r[:,None]/2)*Der
    return G,G+K,K

def linear_basis(r):
    L=np.zeros((len(r),len(KNOTS)))
    for i,x in enumerate(r):
        j=min(np.searchsorted(KNOTS,x,side='right')-1,len(KNOTS)-1)
        if j==len(KNOTS)-1:L[i,j]=1
        else:
            t=(x-KNOTS[j])/(KNOTS[j+1]-KNOTS[j]);L[i,j]=1-t;L[i,j+1]=t
    return L

