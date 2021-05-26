/*--------------
Theorem 1.2
--------------*/

/*---------------------------------------------------
Many of these scripts were previously used
for the author's article:
``Triples of singular moduli with rational product'' 
IJNT 16 (2020), no 10, 2149--2166.
----------------------------------------------------*/

/*------------------------------------------------------------------------------------------------
Disriminants to check for the proof of Theorem 1.2

Find the triples of discriminants satisfying one of the conditions listed in Subsection 7.2
------------------------------------------------------------------------------------------------*/

/*-------------------------------------------
Scripts for 1a
-----------------------------------------*/

/*-----------------------
Discriminants for 1ai
---------------------------*/

deltas1ai()=
{
my(u,n,deltas);

u=deltas_ge_le_h(15667,4,11); /* 15667 hardcode upper bound for discriminants of class number \leq 11 */
n=length(u);

deltas=vector(n,i,[u[i],u[i],u[i]]);
return(deltas);
}

/*-----------------------
Discriminants for 1aii
---------------------------*/

deltas1aii()=
{
my(u,n,deltas);

u=deltas_ge_le_h(30339,12,13);
n=length(u);

deltas=vector(n,i,[u[i],u[i],u[i]]);
return(deltas);
}

/*-----------------------
Discriminants for 1aiii
---------------------------*/

deltas1aiii()=
{
my(u,n,deltas);

u=deltas_ge_le_h(4124,14,15);
n=length(u);

deltas=vector(n,i,[u[i],u[i],u[i]]);
return(deltas);
}

/*-----------------------
Discriminants for 1aiv
---------------------------*/

deltas1aiv()=
{
my(u,n,deltas);

u=deltas_ge_le_h(1045,16,17);
n=length(u);

deltas=vector(n,i,[u[i],u[i],u[i]]);
return(deltas);
}

/*-----------------------
Discriminants for 1av
---------------------------*/

deltas1av()=
{
my(u,n,deltas);

u=deltas_ge_le_h(488,18,19);
n=length(u);

deltas=vector(n,i,[u[i],u[i],u[i]]);
return(deltas);
}

/*-----------------------
Discriminants for 1avi
---------------------------*/

deltas1avi()=
{
my(u,n,deltas);

u=deltas_ge_h(334,20);
n=length(u);

deltas=vector(n,i,[u[i],u[i],u[i]]);
return(deltas);
}

/* ---------------------------
Scripts for 1bi
----------------------------- */

/*-----------------------
Discriminants for 1bi
------------------*/

deltas1bi()=
{
my(l,v,n,delta1,delta2,delta3);

l=length(ListA);
v=[];

for(i=1,l,

n=length(ListA[i]);

for(j=1,n-1,
for(k=j+1,n,
for(r=j,n,

delta1=ListA[i][k];
delta2=ListA[i][j];
delta3=ListA[i][r];

v=concat(v,[[delta1,delta2,delta3]]);

););););

return(v);
}

/* ---------------------
Scripts for 1bii
---------------------- */

/* ------------------
Discriminants satisfying additional conditions on Delta3 in 1bii
input: list of discriminants
output: sublist of those discriminants which are 1 mod 8 and such that 4 * them is also a discriminant of the same class number (``good'')
---------------------- */

gooddelt(v)=
{
my(u,w,n,i,j);

n=length(v);
w=vector(n,i,0);
j=1;

for(i=1,n,
if(Mod(v[i],8)==1&&qfbclassno(4*v[i])==qfbclassno(v[i]),
w[j]=v[i];
j=j+1;););

u=vector(j-1,i,0);
u=w[1..j-1];
return(u);
}

/*-------------------------
Discriminants for 1biiA
-------------------------*/

deltas1biiA()=
{
my(u1,u2,u3,u4,w,deltas,n);

u1=deltas_ge_le_h(907,2,3); /* 907 hardcode upper bound for discriminants of class number \leq 3 */
u2=deltas_ge_le_h(367,4,5);
u3=deltas_ge_le_h(163,6,7);
u4=deltas_ge_h(93,8);

w=concat(u1,concat(u2,concat(u3,u4)));

deltas=gooddelt(w);

n=length(deltas);

return(vector(n,i,[4*deltas[i],deltas[i],deltas[i]]));
}


/*------------------------
Discriminants for 1biiB
-----------------------*/

deltas1biiB()=
{
my(u1,u2,u3,u4,u5,w,deltas,n);

u1=deltas_ge_le_h(907,2,3); /* 907 hardcode upper bound for discriminants of class number \leq 3 */
u2=deltas_ge_le_h(5781,4,5);
u3=deltas_ge_le_h(650,6,7);
u4=deltas_ge_le_h(192,8,9);
u5=deltas_ge_h(92,10);

w=concat(u1,concat(u2,concat(u3,concat(u4,u5))));

deltas=gooddelt(w);

n=length(deltas);

return(vector(n,i,[4*deltas[i],deltas[i],4*deltas[i]]));
}

/*-----------------
Scripts for 2b
-------------------*/

/*-----------------
Scripts for 2bi
-------------------*/

/*-----------------------
Discriminants for 2biAI
-----------------------*/

deltas2biAI()=
{
my(deltas,v,n);

deltas=[];

for(i=2,9,

v=deltas_eq_h(10627,i); /* 10627 hardcoded upper bound for all discriminants with class number \leq 9*/

n=length(v);

for(j=1,n,
if((Mod(v[j],4)==0&&(Mod((9/4)*v[j],4)==0||Mod((9/4)*v[j],4)==1))&&qfbclassno((9/4)*v[j])==2*i&&nfisincl(polclass(v[j]),polclass(9*v[j]/4))!=0,
deltas=concat(deltas,[[(9/4)*v[j],(9/4)*v[j],v[j]]]);
);
);
);

return(deltas);
}

/*---------------------------
Discriminants for 2biAII-V
---------------------------*/

deltas2biArest()=
{
my(u1,u2,u3,u4,w,n,v,k,u);

u1=deltas_ge_le_h(5076,10,11);
u2=deltas_ge_le_h(1430,12,13);
u3=deltas_ge_le_h(255,14,15);
u4=deltas_ge_h(164,16);


w=concat(u1,concat(u2,concat(u3,u4)));

n=length(w);
v=vector(n,i,0);
k=1;

for(i=1,n,
if((Mod(w[i],4)==0&&(Mod((9/4)*w[i],4)==0||Mod((9/4)*w[i],4)==1))&&qfbclassno((9/4)*w[i])==2*qfbclassno(w[i])&&nfisincl(polclass(w[i]),polclass(9*w[i]/4))!=0,
v[k]=[(9/4)*w[i],(9/4)*w[i],w[i]];
k=k+1;
);
);

u=vector(k-1,i,0);
u=v[1..k-1];

return(u);
}

/*------------------------
Discriminants for 2biBI
----------------------*/

deltas2biBI()=
{
my(deltas,v,n);

deltas=[];

for(i=2,9,

v=deltas_eq_h(10627,i); /* 10627 hardcoded upper bound for all discriminants with class number \leq 9 */

n=length(v);

for(j=1,n,
if(qfbclassno(4*v[j])==2*i,
deltas=concat(deltas,[[4*v[j],4*v[j],v[j]]]);
);
);
);

return(deltas);
}

/*---------------------------
Discriminants for 2biBII-V
----------------------------*/

deltas2biBrest()=
{
my(u0,u1,u2,u3,w,n,v,k,u);

u0=deltas_ge_le_h(650,10,11);
u1=deltas_ge_le_h(317,12,13);
u2=deltas_ge_le_h(236,14,15);
u3=deltas_ge_h(129,16);

w=concat(u0, concat(u1,concat(u2,u3)));

n=length(w);
v=vector(n,i,0);
k=1;

for(i=1,n,
if(qfbclassno(4*w[i])==2*qfbclassno(w[i]),
v[k]=[4*w[i],4*w[i],w[i]];
k=k+1;
);
);

u=vector(k-1,i,0);
u=v[1..k-1];

return(u);
}

/*----------------------
Discriminants for 2biCI
------------------------*/

deltas2biCI()=
{
my(deltas,v,n);

deltas=[];

for(i=2,7,

v=deltas_eq_h(5923,i); /* 5923 hardcoded upper bound for all discriminants with class number \leq 7*/

n=length(v);

for(j=1,n,
if((Mod(9*v[j],4)==0||Mod(9*v[j],4)==1)&&qfbclassno(9*v[j])==2*i,
deltas=concat(deltas,[[9*v[j],9*v[j],v[j]]]);
);
);
);

return(deltas);
}

/*----------------------------
Discriminants for 2biCII-III
----------------------------*/

deltas2biCrest()=
{
my(u1,u2,w,n,v,k,u);

u1=deltas_ge_le_h(255,8,9);
u2=deltas_ge_h(85,10);


w=concat(u1,u2);

n=length(w);
v=vector(n,i,0);
k=1;

for(i=1,n,
if((Mod(9*w[i],4)==0||Mod(9*w[i],4)==1)&&qfbclassno(9*w[i])==2*qfbclassno(w[i]),
v[k]=[9*w[i],9*w[i],w[i]];
k=k+1;
);
);

u=vector(k-1,i,0);
u=v[1..k-1];

return(u);
}

/*-----------------------
Discriminants for 2biDI
------------------------*/

deltas2biDI()=
{
my(deltas,v,n);

deltas=[];

for(i=2,7,

v=deltas_eq_h(5923,i); /* 5923 hardcode upper bound for discriminants with class number \leq 7 */

n=length(v);

for(j=1,n,
if(qfbclassno(16*v[j])==2*i,
deltas=concat(deltas,[[16*v[j],16*v[j],v[j]]]);
);
);
);

return(deltas);
}

/*----------------------------
Discriminants for 2biDII-III
-----------------------------*/

deltas2biDrest()=
{
my(u1,u2,w,n,v,k,u);

u1=deltas_ge_le_h(79,8,9);
u2=deltas_ge_h(52,10);

w=concat(u1,u2);

n=length(w);
v=vector(n,i,0);
k=1;

for(i=1,n,
if(qfbclassno(16*w[i])==2*qfbclassno(w[i]),
v[k]=[16*w[i],16*w[i],w[i]];
k=k+1;
);
);

u=vector(k-1,i,0);
u=v[1..k-1];

return(u);
}

/*---------------
Scripts for 2bii
---------------*/
 
 /*------------------------
 Discriminants for 2biiC
 ------------------------*/
 
 deltas2biiC()=
 {
 return(deltas_ge_h(488,128));
 }
 
 /*---------------------------
 Eliminating discriminants
 ---------------------------*/

/*---------------------------------------------------
Test triple of discriminants not in 2biiB
Input: triple of discriminants not in 2biiB
Output: 1 if triple may be eliminated, 0 otherwise
----------------------------------------------------*/

testtrip_prod(triple)=
{
my([Delta_1, Delta_2, Delta_3]=triple);
my(f_1,f_2,f_3,L,x,y,z,G,n,u,v,w,m,a);

if(qfbclassno(Delta_1)==1,return(1));
if(qfbclassno(Delta_2)==1,return(1));
if(qfbclassno(Delta_3)==1,return(1));

f_1=polclass(Delta_1,0,'y);
f_2=polclass(Delta_2,0,'y);
f_3=polclass(Delta_3,0,'y);

if(quaddisc(Delta_1)==quaddisc(Delta_2)&&quaddisc(Delta_1)==quaddisc(Delta_3),
L=subst(rnfequation(polredbest(f_1),'x^2-Delta_1),'x,'y),
L=f_1);

L=nfinit(polredbest(L));
x_1=nfroots(L,subst(f_1,'y,'x));
x_2=nfroots(L,subst(f_2,'y,'x));
x_3=nfroots(L,subst(f_3,'y,'x));

G=nfgaloisconj(L);
n=length(G);

for(i=if(Delta1==Delta2,2,1),length(x_2),
for(j=if(Delta_1==Delta_3,2,1),length(x_3),

if(Delta_2==Delta_3&&i==j,next());

m=0;

for(k=1,n,

u=nfgaloisapply(L,G[k],x_1[1]);
v=nfgaloisapply(L,G[k],x_2[i]);
w=nfgaloisapply(L,G[k],x_3[j]);

a=(x_1[1]*x_2[i]*x_3[j])/(u*v*w);

if(root1(L,a)==1,m=m+1,return(1));

);

if(m==n,return(0),print(Error));

);
);

}

/*--------------------------------------------------------------------------
Test a list of triples of discriminants (not in 2biiB)
Input: list of triples of discriminants (not in 2biiB)
Output: 1 if all may be eliminated, 0 otherwise and prints exceptions
--------------------------------------------------------------------------*/

testall_prod(v)=
{
my(n,k);

n=length(v);
k=0;

for(i=1,n,

if(testtrip_prod(v[i])==1,k=k+1,print(v[i]));

);

if(k==n,return(1),return(0));
}

/*-----------------------------------------------------
Test triple of discriminants in 2biiB
Input: triple of discriminants in 2biiB
Output: 1 if triple may be eliminated, 0 otherwise
------------------------------------------------------*/

testtrip_prod2biiB(triple)=
{
my([Delta_1, Delta_2, Delta_3]=triple);
my(f_1,f_2,f_3,L,x,y,z,G,n,u,v,w,m,a);

if(qfbclassno(Delta_1)==1,return(1));
if(qfbclassno(Delta_2)==1,return(1));
if(qfbclassno(Delta_3)==1,return(1));

f_1=polclass(Delta_1,0,'y);
f_2=polclass(Delta_2,0,'y);
f_3=polclass(Delta_3,0,'y);

L=subst(rnfequation(polredbest(f_1),'x^2-Delta_1),'x,'y);

L=nfinit(polredbest(L));
x_1=nfroots(L,subst(f_1,'y,'x));
x_2=nfroots(L,subst(f_2,'y,'x));
x_3=nfroots(L,subst(f_3,'y,'x));

G=nfgaloisconj(L);
n=length(G);

for(i=if(Delta1==Delta2,2,1),length(x_2),
for(j=if(Delta_1==Delta_3,2,1),length(x_3),

if(Delta_2==Delta_3&&i==j,next());

m=0;

for(k=1,n,

u=nfgaloisapply(L,G[k],x_1[1]);
v=nfgaloisapply(L,G[k],x_2[i]);
w=nfgaloisapply(L,G[k],x_3[j]);

a=(x_1[1]*x_2[i]*x_3[j])/(u*v*w);

if(root1(L,a)==1,m=m+1,return(1));

);

if(m==n,return(0),print(Error));

);
);

}

/*--------------------------------------------------------------------------
Test a list of triples of discriminants in 2biiB
Input: list of triples of discriminants in 2biiB
Output: 1 if all may be eliminated, 0 otherwise and prints exceptions
--------------------------------------------------------------------------*/

testall_prod2biiB(v)=
{
my(n,k);

n=length(v);
k=0;

for(i=1,n,

if(testtrip_prod2biiB(v[i])==1,k=k+1,print(v[i]));

);

if(k==n,return(1),return(0));
}

/*-------------------------------------------------
Find and eliminate all possible discriminants
Output: 1 if Theorem 1.2 holds
		otherwise outputs 0.

Caution: takes a long time to run, c.12 hours
-------------------------------------------------*/

elimall_prod()=
{
my(u,a,w,b);

u=deltas1ai();
u=concat(u,deltas1aii());
u=concat(u,deltas1aiii());
u=concat(u,deltas1aiv());
u=concat(u,deltas1av());
u=concat(u,deltas1avi());

u=concat(u,deltas1bi());
u=concat(u,deltas1biiA());
u=concat(u,deltas1biiB());

u=concat(u,deltas2biAI());
u=concat(u,deltas2biArest());
u=concat(u,deltas2biBI());
u=concat(u,deltas2biBrest());
u=concat(u,deltas2biCI());
u=concat(u,deltas2biCrest());
u=concat(u,deltas2biDI());
u=concat(u,deltas2biDrest());

u=concat(u,List2biiA);
/*2biiB must be handled separately*/
u=concat(u,deltas2biiC());

a=0;
b=0;

if(testall_prod(u)==1,a=1,return(0));

/*Now we handle 2biiB separately*/

w=List2biiB2;
w=concat(w,List2biiB4);
w=concat(w,List2biiB8);
w=concat(w,List2biiB16);

if(testall_prod2biiB(w)==1,b=1,return(0));

if(a*b==1,return(1),return(0));

}
