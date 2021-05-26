/*----------------------------------------------------------------
The epsilon_1= epsilon_2 = epsilon_3 case of Theorem 1.1
------------------------------------------------------------------*/

/*------------------------------------------------------------
Two of x_1, x_2, x_3 are equal
Output: 1 if all the non-trivial cases may be eliminated,
	    0 otherwise
------------------------------------------------------------*/

sum_twoeq()=
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

b=b+1;

Delta_1=v[i][j];
Delta_2=v[i][k];
x_1=abssingmods(Delta_1);
x_2=abssingmods(Delta_2);

if(abs(Delta_1)>abs(Delta_2),
a=((2*x_1[2]+x_2[1]+x_2[2])/x_1[1]);,
a=((2*(x_1[1]+x_1[2])+x_2[2])/x_2[1]);
);

if(abs(Delta_1)>abs(Delta_2),if(a<2,c=c+1,print([Delta_1,Delta_2])),if(a<1,c=c+1,print([Delta_1,Delta_2])));


);
);
);

if(b==c,return(1),return(0));

}


/*--------------
4.1 h1=h2=h3
---------------*/

/*----------------------------
4.1.1 Equal disc
---------------------------*/

/*-------------
Test function
-------------*/

sum_low_1(k)=
{
	my(a);
	
	a=(j_low(k,1)/j_max(k,2));
	
	return(a);
}

/*----------------------------
(Strict) bound in this case
----------------------------*/

sum_bd_1()=
{
	my(k);

k=1;

while(sum_low_1(k)<=5,k=k+1);

return(k);
}

/*------------------------
4.1.2 Not all equal disc
------------------------*/

/*---------------------------------------
Subcase: different fundamental disc
-----------------------------------------*/

/*----------------------------------------------------------------
Test triple, abs(Delta_1)>abs(Delta_3)>abs(Delta_2), deg 2
Output: 1 if triple may be eliminated, 0 otherwise
-----------------------------------------------------------------*/

testtrip_sum_deg2(triple)=
{
my([Delta_1, Delta_2, Delta_3]=triple);
my(x_1,x_2,x_3,a,b);

x_1=abssingmods(Delta_1);
x_2=abssingmods(Delta_2);
x_3=abssingmods(Delta_3);

a=((x_1[2]+x_2[1]+x_2[2]+x_3[1]+x_3[2])/x_1[1]);

if(a<1,return(1),return(0));
}

/*---------------------------------------------
Test a list of triples in this case of deg 2
Output: 1 if all triples may be eliminated, 
		0 otherwise
-----------------------------------------------*/

testall_sum_deg2(v)=
{
my(n,k);

n=length(v);
k=0;

for(i=1,n,

if(testtrip_sum_deg2(v[i])==1,k=k+1,print(v[i]));

);

if(k==n,return(1),return(0));
}

/*----------------------
Deg 2 triples to check
-----------------------*/

trips_sum_deg2()=
{
my(n,m,u,v);

v=deg2;
n=length(v);
u=[];

for(i=1,n,

m=length(v[i]);

if(m<=2,next());

for(j=3,m,

for(k=2,j-1,

for(l=1,k-1,

u=concat(u,[[v[i][j],v[i][l],v[i][k]]]);

);
);
);
);

return(u);
}

/*--------------------------------------------------------
Check the deg 2 case
Output: 1 if this case may be eliminated, 0 otherwise
-----------------------------------------------------------*/

check_sum_deg2()=testall_sum_deg2(trips_sum_deg2());

/*--------------------------------------------------------------------------------------------------------
Test triple with abs(Delta_1)>abs(Delta_2), abs(Delta_1) \geq abs(Delta_3) \geq abs(Delta_2), 
and deg \geq 4
Output: 1 if triple may be eliminated, 0 otherwise
---------------------------------------------------------------------------------------------------------*/

testtrip_sum_bigdeg(triple)=
{
my([Delta_1, Delta_2, Delta_3]=triple);
my(x_1,x_2,x_3,a,b);

x_1=abssingmods(Delta_1);
x_2=abssingmods(Delta_2);
x_3=abssingmods(Delta_3);

if(Delta_1==Delta_3,
a=((x_1[2]+x_2[1]+x_2[2]+x_3[2]+x_3[3])/x_1[1]),
a=((x_1[2]+x_2[1]+x_2[2]+x_3[1]+x_3[2])/x_1[1]));

if(a<1,return(1),return(0));
}

/*-------------------------------------------------------------------------------------------------------------------
Test a list of triples with abs(Delta_1)>abs(Delta_2), abs(Delta_1) \geq abs(Delta_3) \geq abs(Delta_2), 
and deg \geq 4
Output: 1 if all triples may be eliminated, 0 otherwise
-------------------------------------------------------------------------------------------------------------------*/

testall_sum_bigdeg(v)=
{
my(n,k);

n=length(v);
k=0;

for(i=1,n,

if(testtrip_sum_bigdeg(v[i])==1,k=k+1,print(v[i]));

);

if(k==n,return(1),return(0));
}

/*---------------------------------------------------------------------------------------------------------------
Triples to check with abs(Delta_1)>abs(Delta_2), abs(Delta_1) \geq abs(Delta_3) \geq abs(Delta_2), 
and deg \geq 4
----------------------------------------------------------------------------------------------------------------*/

trips_sum_bigdeg()=
{
my(n,m,u,v);

v=bigdeg;
n=length(v);
u=[];

for(i=1,n,

m=length(v[i]);

for(j=2,m,

for(k=1,j,

for(l=1,if(k==j,k-1,k),

u=concat(u,[[v[i][j],v[i][l],v[i][k]]]);

);
);
);
);

return(u);
}

/*---------------------------------------------------------------------------------------------------------------
Check the case with abs(Delta_1)>abs(Delta_2), abs(Delta_1) \geq abs(Delta_3) \geq abs(Delta_2), 
and deg \geq 4
Output: 1 if this case may be eliminated, 0 otherwise
----------------------------------------------------------------------------------------------------------------*/

check_sum_bigdeg()=testall_sum_bigdeg(trips_sum_bigdeg());

/*---------------------------------------------
Subcase: same fundamental discriminants
----------------------------------------------*/

/*---------------------------------------------------------------------------------------------------------------
Either Delta1=Delta3=4*Delta2 & Delta=Delta2, or Delta1=4Delta2=4Delta3 & Delta2=Delta3=Delta
----------------------------------------------------------------------------------------------------------------*/

/*-------------
Test function
--------------*/

sum_low_2(k)=
{
my(a);

a=(j_low(4*k,1)/j_max(k,1));

return(a);
}


/*----------------------------------
Strict upper bound for this case
-----------------------------------*/

sum_bd_2()=
{
	my(k);

k=1;

while(sum_low_2(k)<=5,k=k+1);

return(k);
}

/*-----------------
4.2 h1=h2=2*h3
-------------------*/

/*---------------------
4.2.1 Equal fund disc
----------------------*/

/*---------------------------------------------
Delta3=Delta, Delta1=Delta2=(9/4)*Delta
----------------------------------------------*/

/*------------
Test function
-------------*/

sum_low_4(k)=
{
my(a);

a=(j_low((9/4)*k,1)/j_max(k,1));

return(a);
}

/*----------------------------------
Strict upper bound for this case
-----------------------------------*/

sum_bd_4()=
{
	my(k);

k=1;

while(sum_low_4(k)<=5,k=k+1);

return(k);
}


/*-----------------------------------------
Delta3=Delta, Delta1=Delta2=9*Delta
-----------------------------------------*/

sum_low_6(k)=
{
my(a);

a=(j_low(9*k,1)/j_max(9*k,2));

return(a);
}

/*----------------------------------
Strict upper bound for this case
-----------------------------------*/

sum_bd_6()=
{
	my(k);

k=1;

while(sum_low_6(k)<=5,k=k+1);

return(k);
}


/*------------------------------------------
Delta3=Delta, Delta1=Delta2=16*Delta
------------------------------------------*/

sum_low_7(k)=
{
my(a);

a=(j_low(16*k,1)/j_max(16*k,2));

return(a);
}

/*----------------------------------
Strict upper bound for this case
-----------------------------------*/

sum_bd_7()=
{
	my(k);

k=1;

while(sum_low_7(k)<=5,k=k+1);

return(k);
}


/*--------------------
4.2.2 Diff fund disc
---------------------*/

/*------------
Delta1 Listed
---------------*/

 /*------------------------------------------------------------------------------
Test triple with abs(Delta_1)>abs(Delta_3) 
Input: triple of discriminants
Output: 1 if triple may be eliminated, 0 otherwise
[Also returns 1 for degenerate triples with abs(Delta_3)>abs(Delta_1)]
-------------------------------------------------------------------------------*/

testtrip_sum_sub1(triple)=
{
my([Delta_1, Delta_2, Delta_3]=triple);
my(x_1,x_2,x_3,a,b);

x_1=abssingmods(Delta_1);
x_2=abssingmods(Delta_2);
x_3=abssingmods(Delta_3);

if(abs(Delta_1)<=abs(Delta_3),
return(1),
a=((x_1[2]+x_2[2]+x_2[3]+x_3[1]+x_3[1])/x_1[1]));

if(a<1,return(1),return(0));
}

/*----------------------------------------------------------------------------------------
Test a list of triples with abs(Delta_1)>abs(Delta_3)
Input: list of triples of discriminants
Output: 1 if all triples may be eliminated, 0 otherwise [and prints all exceptions]
[Ignores degenerate triples with abs(Delta_3)>abs(Delta_1)]
----------------------------------------------------------------------------------------*/ 

testall_sum_sub1(v)=
{
my(n,k);

n=length(v);
k=0;

for(i=1,n,

if(testtrip_sum_sub1(v[i])==1,k=k+1,print(v[i]));

);

if(k==n,return(1),return(0));
}

/*------------------------------------------------------------------------------------------
Check all the triples with abs(Delta_1)>abs(Delta_3) 
[ignores degenerate triples with abs(Delta_3)>abs(Delta_1)]
Output: 1 if all triples may be eliminated, 0 otherwise [and prints all exceptions]
------------------------------------------------------------------------------------------*/

check_sum_sub1()=testall_sum_sub1(List2biiA);

/*------------------------------------------------------
Degenerate triples
Output: list of triples with abs(Delta3)>abs(Delta1)
-------------------------------------------------------*/

degen()=
{
my(v,n,u,j,w);

v=List2biiA;
n=length(v);

u=vector(n,i,0);
j=1;

for(i=1,n,

if(abs(v[i][3])>abs(v[i][1]),
u[j]=v[i];
j=j+1;
);
);

w=vector(j-1,i,u[i]);

return(w);
}

/*-------------------------------------------------------------
List of degenerate triples with abs(Delta3)>abs(Delta1)
Saved for convenience
--------------------------------------------------------------*/

List_degen=[[-180,-180,-235],[-160,-160,-235],[-84,-84,-112],[-84,-84,-147],[-120,-120,-235],[-480,-480,-760],[-195,-195,-235],[-195,-195,-403],[-312,-312,-403]];

/*----------------------------------------------------------------
Test degenerate triple with abs(Delta3)>abs(Delta1)
Input: triple of discriminants with abs(Delta3)>abs(Delta1)
Output: 1 if triple may be eliminated, 0 otherwise
----------------------------------------------------------------*/

testtrip_sum_d(triple)=
{
my([Delta_1, Delta_2, Delta_3]=triple);
my(x_1,x_2,x_3,a,b);

x_1=abssingmods(Delta_1);
x_2=abssingmods(Delta_2);
x_3=abssingmods(Delta_3);


a=((x_1[1]+x_1[2]+x_2[1]+x_2[2]+x_3[2])/x_3[1]);

if(a<1,return(1),return(0));
}

/*--------------------------------------------------------------------------------------
Test a list of degenerate triples with abs(Delta3)>abs(Delta1)
Input: list of triples with abs(Delta3)>abs(Delta1)
Output: 1 if all triples may be eliminated, 0 otherwise [and prints all exceptions]
----------------------------------------------------------------------------------------*/

testall_sum_d(v)=
{
my(n,k);

n=length(v);
k=0;

for(i=1,n,

if(testtrip_sum_d(v[i])==1,k=k+1,print(v[i]));

);

if(k==n,return(1),return(0));
}

/*---------------------------------------------------------------------------------------
Check all the degenerate triples abs(Delta3)>abs(Delta1)
Output: 1 if all triples may be eliminated, 0 otherwise [and prints all exceptions]
-----------------------------------------------------------------------------------------*/

check_sum_degen()=testall_sum_d(degen());

/*-------------------------------------------------------------
Test the exceptional triple [-240,-240, -235]
Output: 1 if this triple may be eliminated, 0 otherwise
--------------------------------------------------------------*/

testtrip_sum_ex()=
{
my(x_1,x_2,x_3,a,b);

x_1=abssingmods(-240);
x_2=abssingmods(-240);
x_3=abssingmods(-235);


a=((x_1[2]+x_2[2]+x_2[2]+x_3[1]+x_3[2])/x_1[1]);

if(a<1,return(1),return(0));
}

/*--------------
Delta_3 listed
----------------*/

/*------------------------------------------------------
Test triple with Delta_3 listed
Input: triple of discriminants
Output: 1 if triple may be eliminated, 0 otherwise
-----------------------------------------------------*/

testtrip_sum_sub2(triple)=
{
my([Delta_1, Delta_2, Delta_3]=triple);
my(x_1,x_2,x_3,a,b);

x_1=abssingmods(Delta_1);
x_2=abssingmods(Delta_2);
x_3=abssingmods(Delta_3);


if(abs(Delta_1)<=abs(Delta_3),
a=((x_1[1]+x_1[2]+x_2[2]+x_2[1]+x_3[2])/x_3[1]),
a=((x_1[2]+x_2[2]+x_2[3]+x_3[1]+x_3[1])/x_1[1]));

if(a<1,return(1),return(0));
}

/*-----------------------------------------------------------------------------------------
Test a list of triples with Delta_3 listed
Input: list of triples
Output: 1 if all triples may be eliminated, 0 otherwise [and prints all exceptions]
-----------------------------------------------------------------------------------------*/

testall_sum_sub2(v)=
{
my(n,k);

n=length(v);
k=0;

for(i=1,n,

if(testtrip_sum_sub2(v[i])==1,k=k+1,print(v[i]));

);

if(k==n,return(1),return(0));
}

/*----------------------------------------------------------------------------------------
Check case Delta3 listed
Output: 1 if all triples may be eliminated, 0 otherwise [and prints all exceptions]
-----------------------------------------------------------------------------------------*/

check_sum_sub2()=
{
my(v,k);

v=concat(List2biiB2,List2biiB4);
v=concat(v,List2biiB8);
v=concat(v,List2biiB16);

k=testall_sum_sub2(v);

return(k);

}

/*-------------------------
Large class number case
--------------------------*/

/*--------------
Test function 1
---------------*/

sum_low_9(k)=
{
my(a);

a=(j_low(k,1)-j_max(k-1,1));

return(a);
}

/*---------------
Test function 2
----------------*/

sum_up_9(k)=
{
my(a);

a=(4*j_max(k,2));

return(a);
}

/*------------------
Strict upper bound
-------------------*/

sum_bd_9()=
{
	my(k);

k=1;

while(sum_up_9(k)>=sum_low_9(k),k=k+1);

return(k);
}
