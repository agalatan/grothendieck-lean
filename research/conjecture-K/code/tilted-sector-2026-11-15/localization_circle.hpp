// Agent-ID: codex-6e2b.
// Rigorous ranges for j(nu)=C'(nu)/nu, C(nu)=E_theta|1+nu exp(i theta)|.
// Include AFTER theta_verify.cpp's directed-rounding interval primitives.
// Requires FE_UPWARD and the same strict floating-point compilation flags.
// No floating-point optimization or sampled sign test is accepted here.
#pragma once

#include <algorithm>
#include <array>
#include <cassert>
#include <cmath>

constexpr int localization_circle_terms = 64;
std::array<I,localization_circle_terms> localization_circle_a;
std::array<I,localization_circle_terms> localization_circle_b;
I localization_circle_rem_small,localization_circle_rem_large;
I localization_circle_at_one,localization_circle_global_cap;
I localization_circle_peak,localization_circle_peak_value;
bool localization_circle_ready = false;

I localization_circle_pow(I x,int n){
    assert(n>=0);
    I out(1);
    while(n){
        if(n&1) out=out*x;
        n>>=1;
        if(n) x=sq(x);
    }
    return out;
}

int localization_circle_choose(int n,int k){
    if(k<0||k>n) return 0;
    int out=1;
    for(int j=1;j<=k;j++) out=out*(n-j+1)/j;
    return out;
}

// For 0<=t<=1, the exact reciprocal series is
// j(1/t)=t-sum_{k>=1} b_k t^(2k+1), b_k=(2k-1)binom(1/2,k)^2>0.
// p_N is its truncation (an upper bound), and q_N subtracts the total
// remaining coefficient times t^(2N+3) (a lower bound).
// Both polynomials are concave on [0,1].
std::array<I,2> localization_circle_reciprocal(I t){
    assert(t.l>=0&&t.h<=1);
    I z=sq(t),sum=localization_circle_b.back();
    for(int k=localization_circle_terms-2;k>=0;k--)
        sum=sum*z+localization_circle_b[k];
    I p=t-t*z*sum;
    I q=p-localization_circle_rem_large*t*
          localization_circle_pow(z,localization_circle_terms+1);
    return {q,p};
}

I localization_circle_upper_derivative(double t){
    assert(t>=0&&t<=1);
    I z=sq(I(t));
    I sum=I(2*localization_circle_terms+1)*localization_circle_b.back();
    for(int k=localization_circle_terms-2;k>=0;k--)
        sum=sum*z+I(2*(k+1)+1)*localization_circle_b[k];
    return I(1)-z*sum;
}

void setup_circle_improved(){
    assert(std::fegetround()==FE_UPWARD);
    I pi(rat(3141592653589793.0,1000000000000000.0).l,
         rat(3141592653589794.0,1000000000000000.0).h);
    // This pi interval has the independent exact Machin-series certificate
    // in verify.py; the interval code does not call a libm pi constant.
    localization_circle_at_one=I(2)/pi;
    localization_circle_global_cap=rat(11,16);

    I ck=rat(1,4),sa(0),sb(0);
    for(int k=1;k<=localization_circle_terms;k++){
        localization_circle_a[k-1]=I(2*k)*ck;
        localization_circle_b[k-1]=I(2*k-1)*ck;
        sa=sa+localization_circle_a[k-1];
        sb=sb+localization_circle_b[k-1];
        ck=ck*sq(rat(2*k-1,2*k+2));
    }
    localization_circle_rem_small=localization_circle_at_one-sa;
    localization_circle_rem_large=I(1)-localization_circle_at_one-sb;
    assert(localization_circle_rem_small.l>0);
    assert(localization_circle_rem_large.l>0);

    // Cheap GLOBAL bound j<=11/16. On nu<=1, j increases to2/pi.
    assert(localization_circle_at_one.h<localization_circle_global_cap.l);
    // On nu>=1, j<=p_3(t)=t-t^3/4-3t^5/64-5t^7/256.
    // Q=11/16-p_3 has positive degree7 Bernstein coefficients on every
    // closed interval [cell/8,(cell+1)/8]. In exact rational arithmetic
    // the minimum coefficient is13/16384; here every sign is rechecked
    // with outward interval arithmetic.
    std::array<I,8> Q{rat(11,16),I(-1),I(0),rat(1,4),I(0),rat(3,64),I(0),rat(5,256)};
    for(int cell=0;cell<8;cell++){
        I left=rat(cell,8),width=rat(1,8);
        std::array<I,8> power;
        for(int k=0;k<=7;k++){
            power[k]=I(0);
            for(int j=k;j<=7;j++)
                power[k]=power[k]+Q[j]*I(localization_circle_choose(j,k))*
                  localization_circle_pow(left,j-k)*localization_circle_pow(width,k);
        }
        for(int i=0;i<=7;i++){
            I bern(0);
            for(int k=0;k<=i;k++)
                bern=bern+power[k]*rat(localization_circle_choose(i,k),
                                       localization_circle_choose(7,k));
            assert(bern.l>0);
        }
    }

    // p_N' is strictly decreasing on (0,1), so its unique zero is the
    // global maximizer of p_N. Interval signs, never approximate signs,
    // preserve the bracket. Near a rounding-indeterminate sign we keep
    // the current valid bracket rather than narrowing it speculatively.
    double lo=0,hi=1;
    assert(localization_circle_upper_derivative(lo).l>0);
    assert(localization_circle_upper_derivative(hi).h<0);
    for(int iter=0;iter<60;iter++){
        if(hi-lo<1e-12) break;
        double mid=(lo+hi)/2;
        if(!(lo<mid&&mid<hi)) break;
        I derivative=localization_circle_upper_derivative(mid);
        if(derivative.l>0) lo=mid;
        else if(derivative.h<0) hi=mid;
        else break;
    }
    assert(localization_circle_upper_derivative(lo).l>=0);
    assert(localization_circle_upper_derivative(hi).h<=0);
    localization_circle_peak=I(lo,hi);
    localization_circle_peak_value=localization_circle_reciprocal(localization_circle_peak)[1];
    assert(localization_circle_peak_value.h<localization_circle_global_cap.l);
    assert(localization_circle_at_one.h<localization_circle_peak_value.l);
    localization_circle_ready=true;
}

I localization_circle_small_point(double x){
    assert(x>=0&&x<=1);
    if(x==0) return rat(1,2);
    if(x==1) return localization_circle_at_one;
    I z=sq(I(x)),sum=localization_circle_a.back();
    for(int k=localization_circle_terms-2;k>=0;k--)
        sum=sum*z+localization_circle_a[k];
    I upper=sum+localization_circle_rem_small*
                    localization_circle_pow(z,localization_circle_terms);
    return {sum.l,std::min(upper.h,localization_circle_at_one.h)};
}

I jrange_improved(double lo,double hi){
    assert(localization_circle_ready&&lo>=0&&hi>=lo);
    if(hi<=1){
        // Positive coefficients prove j is increasing on [0,1].
        return {localization_circle_small_point(lo).l,
                localization_circle_small_point(hi).h};
    }
    if(lo<1) return hull(jrange_improved(lo,1),jrange_improved(1,hi));

    // t=1/nu. Outward reciprocal endpoints include infinite nu via t=0.
    double tl=std::isinf(hi)?0.0:std::max(0.0,dndiv(1,hi));
    double th=std::min(1.0,1/lo);
    assert(tl<=th);
    auto vl=localization_circle_reciprocal(I(tl));
    auto vh=localization_circle_reciprocal(I(th));
    // q_N is concave, so its minimum on this interval is an endpoint.
    double lower=std::max(0.0,std::min(vl[0].l,vh[0].l));
    double upper;
    if(th<=localization_circle_peak.l) upper=vh[1].h;
    else if(tl>=localization_circle_peak.h) upper=vl[1].h;
    else upper=localization_circle_peak_value.h;
    upper=std::min(upper,localization_circle_global_cap.h);
    // At the shared endpoint nu=1 the exact value2/pi is tighter than
    // either reciprocal polynomial (and also covers the zero-width case).
    if(lo==1&&hi==1) return localization_circle_at_one;
    assert(lower<=upper);
    return {lower,upper};
}
