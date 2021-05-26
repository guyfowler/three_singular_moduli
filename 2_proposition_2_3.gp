/*--------------------------------
PARI scripts used in Section 2
--------------------------------*/

/*------------------------
Proof of Proposition 2.3
-------------------------*/

/*----------------------------------------------------
Lower bound for abs(x)-abs(x'), where k=disc(x)
----------------------------------------------------*/

dom_low(k)=
{
	my(a);
	
	a=(j_low(k,1)-j_max(k-1,1));
	
	return(a);
}

/*-----------------------------------------------------------
Output k such that abs(x)>abs(x') for all Delta, Delta'
with abs(Delta) \geq k and abs(Delta')<abs(Delta)
-----------------------------------------------------------*/

dom_bd()=
{
	my(k);

k=1;

while(dom_low(k)<=0,k=k+1);

return(k);
}