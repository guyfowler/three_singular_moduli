/*---------------------
Proof of Theorem 1.3
----------------------*/

/*---------------
Fields equal
-------------*/

/*-------------------
Delta1=Delta2=Delta3
--------------------*/

/*--------------------
Strict upper bound
--------------------*/

quot_bound_1()=
	{
	my(k);
	
	k=1;
	
	while(j_low_mult(k,1)*j_min_mult(k)*(1/j_max(k,2))<=j_max(k,2)*j_max(k,2)*(1/j_low_mult(k,1)),
	k=k+1);
	
	return(k);
}

/*---------------------------------------------------------------
Not all equal discriminants, but all equal fund discriminants
----------------------------------------------------------------*/

/*--------------------------
Delta1=Delta2=4*Delta3
---------------------------*/

/*----------------------------------------------------------
Strict upper bound when one of x_1', x_2' is dominant 
-----------------------------------------------------------*/

quot_bound_2a()=
{
my(k);

k=1;

while(j_low_mult(4*k,1)*j_min_mult(4*k)*(1/j_max(k,2))<=j_max(4*k,3)*j_max(4*k,3)*(1/j_low_mult(k,2)),
k=k+1);

return(k);
}

/*-------------------------------------------------------------
Strict upper bound when neither of x_1', x_2' is dominant 
---------------------------------------------------------------*/

quot_bound_2b()=
{
my(k);

k=1;

while(j_low_mult(4*k,1)*j_min_mult(4*k)*(1/j_max(k,2))<=j_max(4*k,3)*j_max(4*k,3)*(1/j_low_mult(k,1)),
k=k+1);

return(k);
}

/* 4,4,1 */

quot_bound_3()=
{
my(k);

k=1;

while(j_low_mult(k,1)*j_min_mult(k)*(1/j_max(4*k,3))<=j_max(k,1)*j_max(k,2)*(1/j_low_mult(4*k,1)),
k=k+1);

return(k);
}

/*----------------------------
4*Delta1=4*Delta2=Delta3
------------------------------*/

/*--------------------
Strict upper bound
--------------------*/

quot_bound_4()=
{
my(k);

k=1;

while(j_low_mult(4*k,1)*j_min_mult(k)*(1/j_max(4*k,3))<=j_max(4*k,3)*j_max(k,1)*(1/j_low_mult(4*k,1)),
k=k+1);

return(k);
}


/*-----------------------------
Delta1= 4*Delta2 = Delta3
-----------------------------*/

/*-------------------
Strict upper bound
--------------------*/

quot_bound_5a()=
{
my(k);

k=1;

while(j_low_mult(4*k,1)*j_min_mult(k)*(1/j_max(k,2))<=j_max(4*k,3)*j_max(k,2)*(1/j_low_mult(k,1)),
k=k+1);

return(k);
}

/*------------------------------
Delta1= 4*Delta2 = 4*Delta3
------------------------------*/

/*-------------------
Strict upper bound
--------------------*/

quot_bound_5b()=
{
my(k);

k=1;

while(j_low_mult(4*k,1)*j_min_mult(k)*(1/j_max(k,1))<=j_max(4*k,3)*j_max(k,2)*(1/j_low_mult(k,2)),
k=k+1);

return(k);
}


/*-------------------------
Q(x_3) a proper subfield
--------------------------*/

/*--------------------------
Same fund discriminants
-------------------------*/

/*---------------------------------
Delta1= Delta2 = (9/4)*Delta3
---------------------------------*/

 
 /*----------------------------------
Strict upper bound for k \geq 29
 ----------------------------------*/

quot_bound_6c()=
 {
 my(k);
 
 k=1;
 
 while(j_low_mult(9*k/4,1)*j_min_mult(9*k/4)*(1/j_max(k,1))<=j_max(9*k/4,7)*j_max(9*k/4,8)*(1/j_min_mult(k)),
 k=k+1);
 
 return(k);
 }
 
 /*----------------------------------
Strict upper bound for k \geq 31
 ----------------------------------*/

quot_bound_6d()=
 {
 my(k);
 
 k=1;
 
 while(j_low_mult(9*k/4,1)*j_min_mult(9*k/4)*(1/j_max(k,1))<=j_max(9*k/4,8)*j_max(9*k/4,8)*(1/j_min_mult(k)),
 k=k+1);
 
 return(k);
 }
 
 /*----------------------------------
Strict upper bound for k \geq 35
 ----------------------------------*/

quot_bound_6e()=
 {
 my(k);
 
 k=1;
 
 while(j_low_mult(9*k/4,1)*j_min_mult(9*k/4)*(1/j_max(k,1))<=j_max(9*k/4,8)*j_max(9*k/4,9)*(1/j_min_mult(k)),
 k=k+1);
 
 return(k);
 }
 
/*----------------------------------
Strict upper bound for k \geq 39
 ----------------------------------*/

quot_bound_6f()=
 {
 my(k);
 
 k=1;
 
 while(j_low_mult(9*k/4,1)*j_min_mult(9*k/4)*(1/j_max(k,1))<=j_max(9*k/4,9)*j_max(9*k/4,9)*(1/j_min_mult(k)),
 k=k+1);
 
 return(k);
 }
 
/*----------------------------------
Strict upper bound for k \geq 42
 ----------------------------------*/

quot_bound_6g()=
 {
 my(k);
 
 k=1;
 
 while(j_low_mult(9*k/4,1)*j_min_mult(9*k/4)*(1/j_max(k,1))<=j_max(9*k/4,9)*j_max(9*k/4,10)*(1/j_min_mult(k)),
 k=k+1);
 
 return(k);
 }
 
/*----------------------------------
Strict upper bound for k \geq 45
 ----------------------------------*/

quot_bound_6h()=
 {
 my(k);
 
 k=1;
 
 while(j_low_mult(9*k/4,1)*j_min_mult(9*k/4)*(1/j_max(k,1))<=j_max(9*k/4,10)*j_max(9*k/4,10)*(1/j_min_mult(k)),
 k=k+1);
 
 return(k);
 }
 
  /*----------------------------------
Strict upper bound for k \geq 49
 ----------------------------------*//

quot_bound_6i()=
 {
 my(k);
 
 k=1;
 
 while(j_low_mult(9*k/4,1)*j_min_mult(9*k/4)*(1/j_max(k,1))<=j_max(9*k/4,10)*j_max(9*k/4,11)*(1/j_min_mult(k)),
 k=k+1);
 
 return(k);
 }
 
/*----------------------------------
Strict upper bound for k \geq 53
 ----------------------------------*/

quot_bound_6j()=
 {
 my(k);
 
 k=1;
 
 while(j_low_mult(9*k/4,1)*j_min_mult(9*k/4)*(1/j_max(k,1))<=j_max(9*k/4,11)*j_max(9*k/4,11)*(1/j_min_mult(k)),
 k=k+1);
 
 return(k);
 }

/*----------------------------------
Strict upper bound for k \geq 55
 ----------------------------------*/

quot_bound_6k()=
 {
 my(k);
 
 k=1;
 
 while(j_low_mult(9*k/4,1)*j_min_mult(9*k/4)*(1/j_max(k,1))<=j_max(9*k/4,11)*j_max(9*k/4,12)*(1/j_min_mult(k)),
 k=k+1);
 
 return(k);
 }
 
/*----------------------------------
Strict upper bound for k \geq 57
 ----------------------------------*/

quot_bound_6l()=
 {
 my(k);
 
 k=1;
 
 while(j_low_mult(9*k/4,1)*j_min_mult(9*k/4)*(1/j_max(k,1))<=j_max(9*k/4,12)*j_max(9*k/4,12)*(1/j_min_mult(k)),
 k=k+1);
 
 return(k);
 }
 
 
/*---------------------------------
Delta1= Delta2 = 4*Delta3
---------------------------------*/
 
 /*----------------------------------
Strict upper bound for k \geq 11
 ----------------------------------*/

quot_bound_7b()=
{
my(k);

k=1;

while(j_low_mult(4*k,1)*j_min_mult(4*k)*(1/j_max(k,1))<=j_max(4*k,5)*j_max(4*k,5)*(1/j_min_mult(k)),
k=k+1);

return(k);
}

 /*----------------------------------
Strict upper bound for k \geq 13
 ----------------------------------*/

quot_bound_7c()=
{
my(k);

k=1;

while(j_low_mult(4*k,1)*j_min_mult(4*k)*(1/j_max(k,1))<=j_max(4*k,5)*j_max(4*k,6)*(1/j_min_mult(k)),
k=k+1);

return(k);
}

 /*----------------------------------
Strict upper bound for k \geq 15
 ----------------------------------*/

quot_bound_7d()=
{
my(k);

k=1;

while(j_low_mult(4*k,1)*j_min_mult(4*k)*(1/j_max(k,1))<=j_max(4*k,6)*j_max(4*k,6)*(1/j_min_mult(k)),
k=k+1);

return(k);
}

 /*----------------------------------
Strict upper bound for k \geq 19
 ----------------------------------*/

quot_bound_7e()=
{
my(k);

k=1;

while(j_low_mult(4*k,1)*j_min_mult(4*k)*(1/j_max(k,1))<=j_max(4*k,6)*j_max(4*k,7)*(1/j_min_mult(k)),
k=k+1);

return(k);
}


 /*----------------------------------
Strict upper bound for k \geq 23
 ----------------------------------*/

quot_bound_7f()=
{
my(k);

k=1;

while(j_low_mult(4*k,1)*j_min_mult(4*k)*(1/j_max(k,1))<=j_max(4*k,7)*j_max(4*k,7)*(1/j_min_mult(k)),
k=k+1);

return(k);
}

 /*----------------------------------
Strict upper bound for k \geq 25
 ----------------------------------*/

quot_bound_7g()=
{
my(k);

k=1;

while(j_low_mult(4*k,1)*j_min_mult(4*k)*(1/j_max(k,1))<=j_max(4*k,7)*j_max(4*k,8)*(1/j_min_mult(k)),
k=k+1);

return(k);
}

 /*----------------------------------
Strict upper bound for k \geq 27
 ----------------------------------*/

quot_bound_7h()=
{
my(k);

k=1;

while(j_low_mult(4*k,1)*j_min_mult(4*k)*(1/j_max(k,1))<=j_max(4*k,8)*j_max(4*k,8)*(1/j_min_mult(k)),
k=k+1);

return(k);
}

/*---------------------------------
Delta1= Delta2 = 9*Delta3
---------------------------------*/

 /*----------------------------------
Strict upper bound for k \geq 9
 ----------------------------------*/

quot_bound_8a()=
{
my(k);

k=1;

while(j_low_mult(9*k,1)*j_min_mult(9*k)*(1/j_max(k,1))<=j_max(9*k,3)*j_max(9*k,4)*(1/j_min_mult(k)),
k=k+1);

return(k);
}

 /*----------------------------------
Strict upper bound for k \geq 11
 ----------------------------------*/
 
quot_bound_8b()=
{
my(k);

k=1;

while(j_low_mult(9*k,1)*j_min_mult(9*k)*(1/j_max(k,1))<=j_max(9*k,4)*j_max(9*k,4)*(1/j_min_mult(k)),
k=k+1);

return(k);
}

 /*----------------------------------
Strict upper bound for k \geq 13
 ----------------------------------*/

quot_bound_8c()=
{
my(k);

k=1;

while(j_low_mult(9*k,1)*j_min_mult(9*k)*(1/j_max(k,1))<=j_max(9*k,4)*j_max(9*k,5)*(1/j_min_mult(k)),
k=k+1);

return(k);
}


 /*----------------------------------
Strict upper bound for k \geq 15
 ----------------------------------*/

quot_bound_8d()=
{
my(k);

k=1;

while(j_low_mult(9*k,1)*j_min_mult(9*k)*(1/j_max(k,1))<=j_max(9*k,5)*j_max(9*k,5)*(1/j_min_mult(k)),
k=k+1);

return(k);
}

/*---------------------------------
Delta1= Delta2 = 16*Delta3
---------------------------------*/

 /*----------------------------------
Strict upper bound for k \geq 5
 ----------------------------------*/

/* 1,1,16 with 3,4 */

quot_bound_9b()=
{
my(k);

k=1;

while(j_low_mult(16*k,1)*j_min_mult(16*k)*(1/j_max(k,1))<=j_max(16*k,3)*j_max(16*k,4)*(1/j_min_mult(k)),
k=k+1);

return(k);
}


 /*----------------------------------
Strict upper bound for k \geq 7
 ----------------------------------*/

quot_bound_9c()=
{
my(k);

k=1;

while(j_low_mult(16*k,1)*j_min_mult(16*k)*(1/j_max(k,1))<=j_max(16*k,4)*j_max(16*k,4)*(1/j_min_mult(k)),
k=k+1);

return(k);
}

 /*----------------------------------
Strict upper bound for k \geq 9
 ----------------------------------*/

quot_bound_9d()=
{
my(k);

k=1;

while(j_low_mult(16*k,1)*j_min_mult(16*k)*(1/j_max(k,1))<=j_max(16*k,4)*j_max(16*k,5)*(1/j_min_mult(k)),
k=k+1);

return(k);
}



/*---------------------
Finding discriminants
-----------------------*/

/*---------------------------
1. Q(x_1)=Q(x_2)=Q(x_3)
----------------------------*/

/*---------------------------
1.1 Delta1=Delta2=Delta3
---------------------------*/

quot_deltas1()=
{
my(v,w);

v=deltas_ge_h(42,3);

w=vector(length(v),i,[v[i],v[i],v[i]]);

return(w);
}

/*----------------------------------------
1.2 Distinct fundamental discriminants
----------------------------------------*/

quot_deltas2()=
{
my(m,n,v,a,b,c);

n=length(ListA);

v=[];

for(i=1,n,

m=length(ListA[i]);

for(j=1,m,

b=ListA[i][j];

for(k=j,m,

a=ListA[i][k];

for(l=1,m,

if(j==k&&j==l,next());

c=ListA[i][l];

v=concat(v,[[a,b,c]]);

);
);
);
);

return(v);


}

/*--------------------------------------
1.3 Equal fundamental discriminants
---------------------------------------*/

/*---------------------------------
1.3.1 Delta1=Delta2=4*Delta3
--------------------------------*/

quot_deltas3()=
{
my(v,n,w,k,m,u);

v=deltas_ge_h(28,2);
n=length(v);

w=vector(n,i,0);

k=1;

for(i=1,n,
if(qfbclassno(4*v[i])==qfbclassno(v[i]),
w[k]=[4*v[i],4*v[i],v[i]];
k=k+1;
);
);

u=vector(k-1,i,0);
u=w[1..k-1];

return(u);
}

/*-----------------------------------
1.3.2 4*Delta1=4*Delta2=Delta3
-----------------------------------*/

quot_deltas4()=
{
my(v,n,w,k,m,u);

v=deltas_ge_h(18,2);
n=length(v);

w=vector(n,i,0);

k=1;

for(i=1,n,
if(qfbclassno(4*v[i])==qfbclassno(v[i]),
w[k]=[v[i],v[i],4*v[i]];
k=k+1;
);
);

u=vector(k-1,i,0);
u=w[1..k-1];

return(u);
}

/*--------------------------------
1.3.3 Delta1=4*Delta2=Delta3
---------------------------------*/

quot_deltas5()=
{
my(v,n,w,k,m,u);

v=deltas_ge_h(7,2);
n=length(v);

w=vector(n,i,0);

k=1;

for(i=1,n,
if(qfbclassno(4*v[i])==qfbclassno(v[i]),
w[k]=[4*v[i],v[i],4*v[i]];
k=k+1;
);
);

u=vector(k-1,i,0);
u=w[1..k-1];

return(u);
}

/*-----------------------------------
1.3.4 Delta1=4*Delta2=4*Delta3
------------------------------------*/

quot_deltas6()=
{
my(v,n,w,k,m,u);

v=deltas_ge_h(91,2);
n=length(v);

w=vector(n,i,0);

k=1;

for(i=1,n,
if(qfbclassno(4*v[i])==qfbclassno(v[i]),
if(nfisincl(polclass(4*v[i]),polclass(v[i]))!=0,
w[k]=[4*v[i],v[i],v[i]];
k=k+1;
);
);
);

u=vector(k-1,i,0);
u=w[1..k-1];

return(u);
}

/*-----------------------------
2. Q(x1) = Q(x2) \neq Q(x3)
------------------------------*/

/*-----------------------------------------
2.1 Distinct fundamental discriminants
-----------------------------------------*/

/*----------------------------
2.1.1 Delta1 listed in ListB
-----------------------------*/

quot_deltas_a()=List2biiA;

/*---------------------------
2.1.2 Delta3 listed in ListB
---------------------------*/

quot_deltas_b()=
{
my(v);

v=concat(List2biiB2,List2biiB4);
v=concat(v,List2biiB8);
v=concat(v,List2biiB16);

return(v);
}

/*--------------------------------------
2.2 Equal fundamental discriminants

For the upper bounds on the absolute values of discriminants of a given class number which are mentioned below, see e.g. 
p19 of J Klaise "ORDERS IN QUADRATIC IMAGINARY FIELDS OF SMALL CLASS NUMBER", Master's thesis, University of Warwick, 2012.
Available online (as of 2022/07/15) at:
https://warwick.ac.uk/fac/cross_fac/complexity/people/students/dtc/students2013/klaise/janis_klaise_ug_report.pdf
---------------------------------------*/

/*---------------------------------------------------------
2.2.1 Delta1=Delta2= (9/4)*Delta3 (c. 10 mins to run)
----------------------------------------------------------*/

/*---------
Unfiltered
-----------*/
quot_deltas7()=
{
my(v,n,w,k,m,u,v_1,v_2,v_3,v_4,v_5,v_6,v_7,v_8,v_9,v_10,v_11);

v_1=deltas_ge_le_h(30067,2,14); /*We only need check up to 30067 here, because all Delta with h(Delta) \le 14 have abs(Delta) \le 30067*/
v_2=deltas_eq_h(22443,15);
v_3=deltas_ge_le_h(11576,16,17);
v_4=deltas_ge_le_h(7484,18,19);
v_5=deltas_eq_h(5076,20);
v_6=deltas_ge_le_h(3820,21,22);
v_7=deltas_ge_le_h(2929,23,24);
v_8=deltas_ge_le_h(2384,25,26);
v_9=deltas_eq_h(1957,27);
v_10=deltas_eq_h(1669,28);
v_11=deltas_ge_h(1430,29);

v=concat(v_1,concat(v_2,concat(v_3,concat(v_4,concat(v_5,concat(v_6,concat(v_7,concat(v_8,concat(v_9,concat(v_10,v_11))))))))));
n=length(v);

w=vector(n,i,0);

k=1;

for(i=1,n,

if(9*v[i]%4==0,

if(Mod(9*v[i]/4,4)==0||Mod(9*v[i]/4,4)==1,

if(qfbclassno(9*v[i]/4)==2*qfbclassno(v[i]),

if(nfisincl(polclass(v[i]),polclass(9*v[i]/4))!=0,
w[k]=[9*v[i]/4,9*v[i]/4,v[i]];
k=k+1;
);
);
);
);
);

u=vector(k-1,i,0);
u=w[1..k-1];

return(u);
}

/*-----------------------------------------------------------------
Filter for this case
Input: triple of discriminants
Output: [a, x] where a=1 if x>0 and a=0 otherwise,
where x is the difference between two sides of the inequality
-----------------------------------------------------------------*/

quot_test_spec_trip(triple)=
{
	my([Delta_1,Delta_2,Delta_3]=triple);
	my(a,b,h_3,h_1,l,up,low);
	
	if(Delta_1!=Delta_2,return("error"));
	
	a=abssingmods(Delta_1);
	b=abssingmods(Delta_3);
	
	h_3=qfbclassno(Delta_3);
	h_1=h_3*2;
	
	l=floor(h_1/2);
	
	up=(a[l]*a[l+1]*(1/b[h_3]));
	
	low=(a[1]*a[h_1]*(1/b[1]));
	
	if(low>up,return([1, low-up]),return([0,low-up]));
}

/*------
Filtered
-------*/

quot_deltas7_filtered()=
{
my(u,v,w,n,k);

v=quot_deltas7();
n=length(v);
k=1;
u=vector(n,i,0);

for(i=1,n,

if(quot_test_spec_trip(v[i])[1]==0,
u[k]=v[i];
k=k+1);

);

w=vector(k-1,i,u[i]);

return(w);

}

/*---------------------------------
2.2.2 Delta1=Delta2= 4*Delta3 
----------------------------------*/

quot_deltas8()=
{
my(v,n,w,k,m,u,v_1,v_2,v_3,v_4,v_5,v_6,v_7,v_8);

v_1=deltas_ge_le_h(2683,2,5); /*We only need check up to 2683 here, because all Delta with h(Delta) \le 5 have abs(Delta) \le 2683*/
v_2=deltas_eq_h(3397,6);
v_3=deltas_eq_h(1393,7);
v_4=deltas_ge_le_h(650,8,9);
v_5=deltas_ge_le_h(403,10,11);
v_6=deltas_eq_h(293,12);
v_7=deltas_eq_h(236,13);
v_8=deltas_ge_h(194,14);

v=concat(v_1,concat(v_2,concat(v_3,concat(v_4,concat(v_5,concat(v_6,concat(v_7,v_8)))))));
n=length(v);

w=vector(n,i,0);

k=1;

for(i=1,n,


if(Mod(4*v[i],4)==0||Mod(4*v[i],4)==1,

if(qfbclassno(4*v[i])==2*qfbclassno(v[i]),

if(nfisincl(polclass(v[i]),polclass(4*v[i]))!=0,
w[k]=[4*v[i],4*v[i],v[i]];
k=k+1;
);
);
);
);

u=vector(k-1,i,0);
u=w[1..k-1];

return(u);
}

/*---------------------------------
2.2.3 Delta1=Delta2= 9*Delta3 
----------------------------------*/

quot_deltas9()=
{
my(v,n,w,k,m,u,v_1,v_2,v_3,v_4,v_5);

v_1=deltas_ge_le_h(1555,2,4); /*We only need check up to 1555 here, because all Delta with h(Delta) \le 4 have abs(Delta) \le 1555*/
v_2=deltas_eq_h(2131,5);
v_3=deltas_eq_h(255,6);
v_4=deltas_eq_h(126,7);
v_5=deltas_ge_h(71,8);

v=concat(v_1,concat(v_2,concat(v_3,concat(v_4,v_5))));
n=length(v);

w=vector(n,i,0);

k=1;

for(i=1,n,


if(Mod(9*v[i],4)==0||Mod(9*v[i],4)==1,

if(qfbclassno(9*v[i])==2*qfbclassno(v[i]),

if(nfisincl(polclass(v[i]),polclass(9*v[i]))!=0,
w[k]=[9*v[i],9*v[i],v[i]];
k=k+1;
);
);
);
);

u=vector(k-1,i,0);
u=w[1..k-1];

return(u);
}


/*-----------------------------------
2.2.4 Delta1=Delta2= 16*Delta3 
-----------------------------------*/

quot_deltas10()=
{
my(v,n,w,k,m,u,v_1,v_2,v_3,v_4);

v_1=deltas_eq_h(427,2); /*We only need check up to 427 here, because all Delta with h(Delta) \le 2 have abs(Delta) \le 427*/
v_2=deltas_eq_h(143,3);
v_3=deltas_eq_h(48,4);
v_4=deltas_eq_h(28,5);

v=concat(v_1,concat(v_2,concat(v_3,v_4)));
n=length(v);

w=vector(n,i,0);

k=1;

for(i=1,n,


if(Mod(16*v[i],4)==0||Mod(16*v[i],4)==1,

if(qfbclassno(16*v[i])==2*qfbclassno(v[i]),

if(nfisincl(polclass(v[i]),polclass(16*v[i]))!=0,
w[k]=[16*v[i],16*v[i],v[i]];
k=k+1;
);
);
);
);

u=vector(k-1,i,0);
u=w[1..k-1];

return(u);
}

/*---------------------------
Eliminating discriminants
---------------------------*/

/*--------------------------------------------------------------
Test triple of discriminants not from Delta_3 listed case
Input: triple of discriminats, not in the Delta_3 listed case
Output: 1 if this triple may be eliminated, 0 otherwise
--------------------------------------------------------------*/

testtrip_quot(triple)=
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

for(i=if(Delta_1==Delta_2,2,1),length(x_2),
for(j=if(Delta_1==Delta_3,2,1),length(x_3),

if(Delta_2==Delta_3&&i==j,next());

m=0;

for(k=1,n,

u=nfgaloisapply(L,G[k],x_1[1]);
v=nfgaloisapply(L,G[k],x_2[i]);
w=nfgaloisapply(L,G[k],x_3[j]);

a=(x_1[1]*x_2[i]*w)/(u*v*x_3[j]);

if(root1(L,a)==1,m=m+1,return(1));

);

if(m==n,return(0),print(Error));

);
);

}

/*----------------------------------------------------------------------------------
Test a list of triples of discriminants, of which none are Delta_3 listed case
Input: a list of triples of discriminants, of which none are Delta_3 listed case
Output: 1 if all triples may be eliminated, 0 otherwise and prints exceptions
-----------------------------------------------------------------------------------*/

testall_quot(v)=
{
my(n,k);

n=length(v);
k=0;

for(i=1,n,

if(testtrip_quot(v[i])==1,k=k+1,print(v[i]));

);

if(k==n,return(1),return(0));
}

/*-----------------------------------------------------------
Test triple of discriminants from Delta_3 listed case
Input: triple of discriminats in the Delta_3 listed case
Output: 1 if this triple may be eliminated, 0 otherwise
-----------------------------------------------------------*/

testtrip_quot2(triple)=
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

for(i=if(Delta_1==Delta_2,2,1),length(x_2),
for(j=if(Delta_1==Delta_3,2,1),length(x_3),

if(Delta_2==Delta_3&&i==j,next());

m=0;

for(k=1,n,

u=nfgaloisapply(L,G[k],x_1[1]);
v=nfgaloisapply(L,G[k],x_2[i]);
w=nfgaloisapply(L,G[k],x_3[j]);

a=(x_1[1]*x_2[i]*w)/(u*v*x_3[j]);

if(root1(L,a)==1,m=m+1,return(1));

);

if(m==n,return(0),print(Error));

);
);

}

/*----------------------------------------------------------------------------------
Test a list of triples of discriminants all of which are in Delta_3 listed case
Input: a list of triples of discriminants, all of which are Delta_3 listed case
Output: 1 if all triples may be eliminated, 0 otherwise and prints exceptions
-----------------------------------------------------------------------------------*/

testall_quot2(v)=
{
my(n,k);

n=length(v);
k=0;

for(i=1,n,

if(testtrip_quot2(v[i])==1,k=k+1,print(v[i]));

);

if(k==n,return(1),return(0));
}

/*------------------------------------------------------------------------------------------------------
Complete proof of Theorem 1.3
Output: 1 if all triples of discriminants may be eliminated, 0 otherwise (and prints exceptions)
------------------------------------------------------------------------------------------------------*/

elimall_quot()=
{
my(u,a,w,b);

a=0;
b=0;

u=quot_deltas1();
u=concat(u, quot_deltas2());
u=concat(u, quot_deltas3());
u=concat(u, quot_deltas4());
u=concat(u, quot_deltas5());
u=concat(u, quot_deltas6());
u=concat(u, quot_deltas_a());
u=concat(u, quot_deltas7_filtered());
u=concat(u, quot_deltas8());
u=concat(u, quot_deltas9());
u=concat(u, quot_deltas10());

if(testall_quot(u)==1,a=1,return(0));

/* Delta_3 listed handled separately */

v=quot_deltas_b();

if(testall_quot2(v)==1,b=1, return(0));

if(a*b==1,return(1),print(Error));

}
