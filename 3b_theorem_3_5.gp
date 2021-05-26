/*-----------------------------------
Proof of Theorem 3.5
------------------------------------*/

/*-------------------------------------------------------------------
Test a pair (Delta_1, Delta_2) of discriminants in the case that
Delta_1=Delta_2 and epsilon=1
Output: 1 if this pair may be eliminated, 0 otherwise
--------------------------------------------------------------------*/

testpair_fieldprod_1(pair)=
{
my([Delta_1, Delta_2]=pair);
my(f_1,f_2,f_3,L,x,y,z,G,n,u,v,w,m);

if(qfbclassno(Delta_1)==1,return(1));
if(qfbclassno(Delta_2)==1,return(1));

f_1=polclass(Delta_1,0,'y);
f_2=polclass(Delta_2,0,'y);

if(quaddisc(Delta_1)==quaddisc(Delta_2),
L=subst(rnfequation(polredbest(f_1),'x^2-Delta_1),'x,'y),
L=f_1);

L=nfinit(polredbest(L));
x_1=nfroots(L,subst(f_1,'y,'x));
x_2=nfroots(L,subst(f_2,'y,'x));

G=nfgaloisconj(L);
n=length(G);

for(i=if(Delta_1==Delta_2,2,1),length(x_2),
for(k=1,n,

u=nfgaloisapply(L,G[k],x_1[1]);
v=nfgaloisapply(L,G[k],x_2[i]);

if(u==x_1[1],next());
if(v==x_1[1],next());

w=(x_1[1]*x_2[i])/(u*v);

if(root1(L,w)==1,return(0));

);
);

return(1);
}

/*---------------------------------------------------------------------------
Test a list of pairs (Delta_1, Delta_2) of discriminants in the case that
Delta_1=Delta_2 and epsilon=1
Output: 1 if all pairs may be eliminated, 0 otherwise
-----------------------------------------------------------------------------*/

testall_fieldprod_1(v)=
{
my(n,k);

n=length(v);
k=0;

for(i=1,n,

if(testpair_fieldprod_1(v[i])==1,k=k+1,print(v[i]));

);

if(k==n,return(1),return(0));
}


/*-------------------------------------------------------------------
Test a pair (Delta_1, Delta_2) of discriminants in the case that
Delta_1 \neq Delta_2 and epsilon=1
Output: 1 if this pair may be eliminated, 0 otherwise
--------------------------------------------------------------------*/

testpair_fieldprod_2(pair)=
{
my([Delta_1, Delta_2]=pair);
my(f_1,f_2,f_3,L,x,y,z,G,n,u,v,w,m);

if(qfbclassno(Delta_1)==1,return(1));
if(qfbclassno(Delta_2)==1,return(1));

f_1=polclass(Delta_1,0,'y);
f_2=polclass(Delta_2,0,'y);

if(quaddisc(Delta_1)==quaddisc(Delta_2),
L=subst(rnfequation(polredbest(f_1),'x^2-Delta_1),'x,'y),
L=f_1);

L=nfinit(polredbest(L));
x_1=nfroots(L,subst(f_1,'y,'x));
x_2=nfroots(L,subst(f_2,'y,'x));

G=nfgaloisconj(L);
n=length(G);

for(i=if(Delta_1==Delta_2,2,1),length(x_2),
for(k=1,n,

u=nfgaloisapply(L,G[k],x_1[1]);
v=nfgaloisapply(L,G[k],x_2[i]);

if(u==x_1[1],next());

w=(x_1[1]*x_2[i])/(u*v);

if(root1(L,w)==1,return(0));

);
);

return(1);
}

/*---------------------------------------------------------------------------
Test a list of pairs (Delta_1, Delta_2) of discriminants in the case that
Delta_1 \neq Delta_2 and epsilon=1
Output: 1 if all pairs may be eliminated, 0 otherwise
-----------------------------------------------------------------------------*/

testall_fieldprod_2(v)=
{
my(n,k);

n=length(v);
k=0;

for(i=1,n,

if(testpair_fieldprod_2(v[i])==1,k=k+1,print(v[i]));

);

if(k==n,return(1),return(0));
}


/*-------------------------------------------------------------------
Test a pair (Delta_1, Delta_2) of discriminants in the case that
epsilon=-1
Output: 1 if this pair may be eliminated, 0 otherwise
--------------------------------------------------------------------*/

testpair_fieldprod_3(pair)=
{
my([Delta_1, Delta_2]=pair);
my(f_1,f_2,f_3,L,x,y,z,G,n,u,v,w,m);

if(qfbclassno(Delta_1)==1,return(1));
if(qfbclassno(Delta_2)==1,return(1));

f_1=polclass(Delta_1,0,'y);
f_2=polclass(Delta_2,0,'y);

if(quaddisc(Delta_1)==quaddisc(Delta_2),
L=subst(rnfequation(polredbest(f_1),'x^2-Delta_1),'x,'y),
L=f_1);

L=nfinit(polredbest(L));
x_1=nfroots(L,subst(f_1,'y,'x));
x_2=nfroots(L,subst(f_2,'y,'x));

G=nfgaloisconj(L);
n=length(G);

for(i=if(Delta_1==Delta_2,2,1),length(x_2),
for(k=1,n,

u=nfgaloisapply(L,G[k],x_1[1]);
v=nfgaloisapply(L,G[k],x_2[i]);

if(u==x_1[1],next());

w=(x_1[1]*v)/(u*x_2[i]);

if(root1(L,w)==1,return(0));

);
);

return(1);
}

/*---------------------------------------------------------------------------
Test a list of pairs (Delta_1, Delta_2) of discriminants in the case that
epsilon=-1
Output: 1 if all pairs may be eliminated, 0 otherwise
-----------------------------------------------------------------------------*/

testall_fieldprod_3(v)=
{
my(n,k);

n=length(v);
k=0;

for(i=1,n,

if(testpair_fieldprod_3(v[i])==1,k=k+1,print(v[i]));

);

if(k==n,return(1),return(0));
}



/*--------------------------------------
Pairs to test with Delta_1 = Delta_2
---------------------------------------*/

equalpairs_fieldprod()=
{
my(v,w,n);

v=deltas(395);

n=length(v);

w=vector(n,i,[v[i],v[i]]);

return(w);
}

/*-------------------------------------------------------
Pairs to test with Delta_1 \neq Delta_2, D_1 = D_2
-------------------------------------------------------*/

samefundpairs_fieldprod()=
{
my(v,w,n);

v=deltas(98);

n=length(v);

w=vector(n,i,[4*v[i],v[i]]);

return(w);
}

/*-----------------------------------
Pairs to test with D_1 \neq D_2
------------------------------------*/

distinctfundpairs_fieldprod()=badpairs;

/*--------------------------------------------------------------
Completing the proof of Theorem 3.5
Output: 1 if all the cases may be eliminated, 0 otherwise
---------------------------------------------------------------*/

checkcase_fieldprod()=
{
my(k,v,w,u);

v=equalpairs_fieldprod();

k=testall_fieldprod_1(v);

k=k*testall_fieldprod_3(v);

w=samefundpairs_fieldprod();

k=k*testall_fieldprod_2(w);

k=k*testall_fieldprod_3(w);

u=distinctfundpairs_fieldprod();

k=k*testall_fieldprod_2(u);

k=k*testall_fieldprod_3(u);

return(k);


}


