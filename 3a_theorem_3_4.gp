/*---------------------
Proof of Theorem 3.4
-----------------------*/

/*-------------------------------
3.1.1 Delta_1=Delta_2 case
------------------------------*/

/*---------------------------
Test function for this case
----------------------------*/

low_fieldsum_1(k)=
{
	my(a);
	
	a=(j_low(k,1)/j_max(k,2));
	
	return(a);
}

/*-----------------
Bound in this case
------------------*/

bd_fieldsum_1()=
{
	my(k);

k=1;

while(low_fieldsum_1(k)<=3,k=k+1);

return(k);
}

/*---------------------------------------------------------------------
3.1.2 Delta_1 \neq Delta_2 (WLOG abs(Delta_1)>abs(Delta_2))
---------------------------------------------------------------------*/

/*--------------
Subcase: D_1 \neq D_2
---------------*/

/*----------------------------------------------------------
Test a pair in this case
Input: pair of discriminants (Delta_1, Delta_2)
Output: 1 if the pair may be eliminated; 0 otherwise
----------------------------------------------------------*/

testpair_fieldsum(pair)=
{
my([Delta_1, Delta_2]=pair);
my(x_1,x_2,a,b);

x_1=abssingmods(Delta_1);
x_2=abssingmods(Delta_2);

a=1-(x_2[1]/x_1[1]);
b=(x_1[2]/x_1[1])+(x_2[1]/x_1[1]);

if(a>b,return(1),return(0));
}

/*----------------------------------------------------------
Test a list of pairs in this case
Input: list of pairs of discriminants (Delta_1, Delta_2)
Output: 1 if all pairs may be eliminated; 0 otherwise
----------------------------------------------------------*/

testall_fieldsum(v)=
{
my(n,k);

n=length(v);
k=0;

for(i=1,n,

if(testpair_fieldsum(v[i])==1,k=k+1,print(v[i]));

);

if(k==n,return(1),return(0));
}

/*----------------------------------------------------------------------
Eliminate this case
Output: 1 if all the relevant pairs may be eliminated, 0 otherwise
-----------------------------------------------------------------------*/

checkcase_fieldsum()=testall_fieldsum(badpairs);

/*---------------------
Subcase: D_1 = D_2
----------------------*/

/*---------------------------
Test function for this case
----------------------------*/

low_fieldsum_2(k)=
{
	my(a);
	
	a=(j_low(4*k,1)/j_max(k,1));
	
	return(a);
}

/*-----------------
Bound in this case
------------------*/

bd_fieldsum_2()=
{
	my(k);

k=1;

while(low_fieldsum_2(k)<=3,k=k+1);

return(k);
}

