/*------------------------
Corollaries 6.1 and 6.3
------------------------*/

/*----------------------------------------------------------------
Test all rational cases of Corollary 6.1 and 6.3
Input: a=1,2
Output: 1 if both results hold for that value of a, 0 otherwise
-----------------------------------------------------------------*/

fermat_rat(a)=
{
my(v,r,s,t);

v=rat_sing_mods();
r=0;
s=0;
t=0;

for(i=2,13,
for(j=i+1,13,
for(k=2,13,

if(v[i]^a+v[j]^a==v[k]^a,print([v[i],v[j],v[k]]),r=r+1);
if(v[i]^a+v[j]^a==-v[k]^a,print([v[i],v[j],v[k]]),s=s+1);
t=t+1;

);
);
);

if(r==t&&s==t,return(1),return(0));

}

/*---------------------------------------------------------------------------------------------------
test two deg 2 conjugate and one rat case of Corollaries 6.1 & 6.3
output: 1 if theorem holds for this case, 0 otherwise and prints all exceptional discriminats
----------------------------------------------------------------------------------------------------*/

fermat_deg2()=
{
	my(w,n,v,a,b,k,l);
	
	w=vector(13,i,abssingmods(rat_delta[i])[1]);
	n=length(deg2_delta);
	k=0;
	l=0;
	
	for(i=1,n,
		v=abssingmods(deg2_delta[i]);
		a=0.9*v[1];
		b=v[1]+v[2];
	
	for(j=1,13,
		if(a<=w[j]&&w[j]<=b,print([rat_delta[j],deg2[i]]),k=k+1);
	l=l+1;
	);
	
	);
	
	if(k==l,return(1),return(0));
	
}
