/*-----------------------------------
The general case of Theorem 1.1
-----------------------------------*/

/*--------------------------------------------------------------------------------------------------------
Two equal case
Output: 1 if this case may be elimated, 0 otherwise & prints exceptional pairs (Delta1, Delta2)
---------------------------------------------------------------------------------------------------------*/

twoeq_diff()=
{
my(v,n,l,Delta_1,Delta_2,x_1,x_2,a,b,c);

v=deg2;
n=length(v);
b=0;
c=0;

for(i=1,n,

l=length(v[i]);

for(j=1,l,

for(k=1,l,

if(j==k,next());

c=c+1;

Delta_1=v[i][j];
Delta_2=v[i][k];
x_1=abssingmods(Delta_1);
x_2=abssingmods(Delta_2);

if(abs(Delta_1)>abs(Delta_2),
a=((2*x_1[2]+x_2[1]+x_2[2])/x_1[1]);,
a=((2*(x_1[1]+x_1[2])+x_2[2])/x_2[1]);
);

if(abs(Delta_1)>abs(Delta_2),if(a<2,b=b+1,print([Delta_1,Delta_2])),if(a<1,b=b+1,print([Delta_1,Delta_2])));


);
);
);

if(b==c,return(1),return(0));


}


/*--------------------------
Q(x_1)=Q(x_2)=Q(x_3)
--------------------------*/

/*---------------------------
Different fundamental disc
-----------------------------*/

/*---------------------------------------------------------------------------------
Test triple, abs(Delta_1)>abs(Delta_2), deg 2
Input: triple of discriminants with abs(Delta_1)>abs(Delta_2) and of deg 2
Output: 1 if this triple may be eliminated, 0 otherwise
---------------------------------------------------------------------------------*/

testtrip_diff_deg2(triple)=
{
my([Delta_1, Delta_2, Delta_3]=triple);
my(x_1,x_2,x_3,a,b,k);

k=0;

x_1=abssingmods(Delta_1);
x_2=abssingmods(Delta_2);
x_3=abssingmods(Delta_3);

if(Delta_1==Delta_3,a=(2*x_3[2]+x_2[1]+x_2[2])/x_1[1]);
if(Delta_1==Delta_3,if(a<2,k=1,print([Delta_1,Delta_2,Delta_3])));

if(abs(Delta_1)>abs(Delta_3),a=(x_1[2]+x_2[1]+x_2[2]+x_3[1]+x_3[2])/x_1[1]);
if(abs(Delta_1)>abs(Delta_3),if(a<1,k=1,print([Delta_1,Delta_2,Delta_3])));

if(abs(Delta_3)>abs(Delta_1),a=(x_1[1]+x_1[2]+x_2[1]+x_2[2]+x_3[2])/x_3[1]);
if(abs(Delta_3)>abs(Delta_1),if(a<1,k=1,print([Delta_1,Delta_2,Delta_3])));

return(k);

}

/*-------------------------------------------------------------
Deg 2 triples
Output: list of triples of discriminants to check with deg 2
---------------------------------------------------------------*/

trips_diff_deg2()=
{
my(n,m,u,v);

v=deg2;
n=length(v);
u=[];

for(i=1,n,

m=length(v[i]);

for(j=2,m,

for(k=1,m,

for(l=1,j-1,

u=concat(u,[[v[i][j],v[i][l],v[i][k]]]);

);
);
);
);

return(u);
}

/*-----------------------------------------------------------------------------
Test a list of triples all with deg 2
Input: a list of triples of discriminants with deg 2
Output: 1 if all may be eliminated, 0 otherwise and prints all exceptions
-------------------------------------------------------------------------------*/

testall_diff_deg2(v)=
{
my(n,k);

n=length(v);
k=0;

for(i=1,n,

if(testtrip_diff_deg2(v[i])==1,k=k+1,print(v[i]));

);

if(k==n,return(1),return(0));
}

/*----------------------------------------------------------------------------
Check deg 2 case
Output: 1 if all may be eliminated, 0 otherwise and prints all exceptions
------------------------------------------------------------------------------*/

check_diff_deg2()=testall_diff_deg2(trips_diff_deg2());


/*-----------------------------------------------------------------------------------------------------
Test triple,  abs(Delta_1) \geq abs(Delta_2), abs(Delta_3), deg \geq 4
Input: triple of discriminants with abs(Delta_1) \geq abs(Delta_2), abs(Delta_3), deg \geq 4
Output: 1 if this may be eliminated, 0 otherwise
-----------------------------------------------------------------------------------------------------*/

testtrip_diff_bigdeg1(triple)=
{
my([Delta_1, Delta_2, Delta_3]=triple);
my(x_1,x_2,x_3,a,b);

if(quaddisc(Delta_1)==quaddisc(Delta_2)&&quaddisc(Delta_1)==quaddisc(Delta_3),return(1));

x_1=abssingmods(Delta_1);
x_2=abssingmods(Delta_2);
x_3=abssingmods(Delta_3);

if(Delta_1==Delta_3,
a=((x_1[2]+x_2[1]+x_2[2]+x_3[2]+x_3[3])/x_1[1]),
if(Delta_1==Delta_2,
a=((x_1[2]+x_2[2]+x_2[3]+x_3[1]+x_3[2])/x_1[1]),
a=((x_1[2]+x_2[1]+x_2[2]+x_3[1]+x_3[2])/x_1[1]);
);
);

if(a<1,return(1),return(0));
}

/*-------------------------------------------------------------------------------------------------------
Test triple,  abs(Delta_3) > abs(Delta_1) \geq abs(Delta_1), deg \geq 4
Input: triple of discriminants with abs(Delta_3) > abs(Delta_1) \geq abs(Delta_1), deg \geq 4
Output: 1 if this may be eliminated, 0 otherwise
--------------------------------------------------------------------------------------------------------*/

testtrip_diff_bigdeg2(triple)=
{
my([Delta_1, Delta_2, Delta_3]=triple);
my(x_1,x_2,x_3,a,b);

if(quaddisc(Delta_1)==quaddisc(Delta_2)&&quaddisc(Delta_1)==quaddisc(Delta_3),return(1));

x_1=abssingmods(Delta_1);
x_2=abssingmods(Delta_2);
x_3=abssingmods(Delta_3);

a=((x_1[1]+x_1[2]+x_2[1]+x_2[2]+x_3[2])/x_3[1]);

if(a<1,return(1),return(0));
}

/*--------------------------------------------------------------------
Big degree triples
Output: list of triples of discriminants to check with deg \geq 4
---------------------------------------------------------------------*/

trips_diff_bigdeg()=
{
my(n,m,u,v);

v=bigdeg;
n=length(v);
u=[];

for(i=1,n,

m=length(v[i]);

for(j=1,m,

for(k=1,j,

for(l=1,m,

u=concat(u,[[v[i][j],v[i][k],v[i][l]]]);

);
);
);
);

return(u);
}

/*----------------------------------------------------------------------------------
Test a list of triples of discriminants with deg \geq 4
Input: a list of triples of discriminants with deg \geq 4
Output: 1 if all may be eliminated, 0 otherwise and prints exceptional cases
-----------------------------------------------------------------------------------*/

testall_diff_bigdeg(v)=
{
my(n,k);

n=length(v);
k=0;

for(i=1,n,

Delta_1=v[i][1];
Delta_3=v[i][3];


if(abs(Delta_1)>=abs(Delta_3),if(testtrip_diff_bigdeg1(v[i])==1,k=k+1,print(v[i])));
if(abs(Delta_1)<abs(Delta_3),if(testtrip_diff_bigdeg2(v[i])==1,k=k+1,print(v[i])));

);

if(k==n,return(1),return(0));
}

/*-----------------------------------------------------------------------------------
Check all triples of discriminants with deg \geq 4
Output: 1 if all may be eliminated, 0 otherwise and prints exceptional cases
-------------------------------------------------------------------------------------*/

check_diff_bigdeg()=testall_diff_bigdeg(trips_diff_bigdeg());

/*----------------------------------
Same fundamental discriminant
----------------------------------*/

/*------------------------------------------
Delta1=Delta2=Delta, Delta_3=4*Delta
------------------------------------------*/

/*-------------
Test function
-------------*/

low_diff(k)=
{
my(a);

a=(j_low(4*k,1)/j_max(k,1));

return(a);
}

/*------------------
Strict upper bound
-------------------*/

bd_diff()=
{
	my(k);

k=1;

while(low_diff(k)<=5,k=k+1);

return(k);
}
