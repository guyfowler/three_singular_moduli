/*****************************************
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
PARI scripts used throughout
----------------------------------------------------------
IMPORTANT: Always load this file before running any 
of the other files!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
*****************************************/

/*****************************************
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Field theory scripts
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
*****************************************/

/*--------------------------------------------------------------------
Return 1 if x is a root of unity in the number field L, 0 otherwise
---------------------------------------------------------------------*/
root1(L,x)=
{
my (u,u0);

x = nfbasistoalg(L,x);

u0 = nfbasistoalg(L, nfrootsof1(L)[2]);
u=u0;

while(u!=1&&u!=x,u*=u0);

return(u!=1);
}


/*****************************************
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
General scripts on discriminants
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
*****************************************/

/*------------------------------------------------------
Discriminants with absolute value \leq n
input: n positive integer
output: discriminants Delta with abs(Delta) \leq n 
------------------------------------------------------*/

deltas(n)=
{
my(v,j,u);

v=vector(n,i,0);
j=1;

for(i=1,n,

if(Mod(-i,4)==0||Mod(-i,4)==1,
v[j]=-i;
j=j+1;
);
);

u=vector(j-1,i,0);
u=v[1..j-1];

return(u);
}

/*-----------------------------------------------------------------------------
Discriminants with absolute value \leq n and class number \geq h
input: n, h positive integers
output: discriminants Delta with abs(Delta) \leq n and  h(Delta) \geq h
------------------------------------------------------------------------------*/

deltas_ge_h(n,h)=
{
my(u,v,w,m,i,j);

u=deltas(n);
m=length(u);
v=vector(n,i,0);

j=1;

for(i=1,m,

if(qfbclassno(u[i])>=h, 
v[j]=u[i];
j=j+1;
);
);


w=vector(j-1,i,0);
w=v[1..j-1];

return(w);
}


/*-----------------------------------------------------------------------------------
list of discriminants up to n with class number at least k and at most h
input: n, h, k positive integers
output: discriminants Delta with abs(Delta) \leq n and k \leq h(Delta) \leq h
------------------------------------------------------------------------------------*/

deltas_ge_le_h(n,k,h)=
{
my(u,v,w,m,j);

u=deltas(n);
m=length(u);
v=vector(m,i,0);
j=1;

for(i=1,m,
if(qfbclassno(u[i])<=h&&qfbclassno(u[i])>=k, 
v[j]=u[i];
j=j+1;
);
);

w=vector(j-1,i,0);
w=v[1..j-1];

return(w);
}

/*--------------------------------------------------------------------------
list of discriminants up to n with class number exactly h
input: n, h positive integers
output: discriminants Delta with abs(Delta) \leq n and h(Delta) = h
---------------------------------------------------------------------------*/

deltas_eq_h(n,h)=
{
my(u,v,w,m,j);

u=deltas(n);
m=length(u);
v=vector(m,i,0);
j=1;

for(i=1,m,
if(qfbclassno(u[i])==h, 
v[j]=u[i];
j=j+1;
);
);

w=vector(j-1,i,0);
w=v[1..j-1];

return(w);
}

/*****************************************
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Scripts on singular moduli
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
*****************************************/

/*-------------------------------------------------------
Upper bound for abs value of singular modulus of 
discriminant k corresponding to a triple (a,b,c)
input: k, a positive integers
output: upper bound
-------------------------------------------------------*/

j_max(k,a)=(exp(Pi*(k^0.5)/a)+2079);

/*-------------------------------------------------------
Lower bound for abs value of a singular modulus of 
discriminant k corresponding to a triple (a,b,c)
input: k, a positive integers
output: lower bound
-------------------------------------------------------*/

j_min(k,a)=(exp(Pi*(k^0.5)/a)-2079);

/*-------------------------------------------------------
Lower bound for abs value of a non-zero singular 
modulus of discriminant k 
input: k positive integer
output: upper bound
-------------------------------------------------------*/

j_min_mult(k)=min(4.4*10^(-5),3500*k^(-3));

/*---------------------------------------------------------------
Non-negative lower bound for abs value of a singular
modulus of discriminant k corresponding to a triple (a,b,c)
input: k, a positive integers
output: lower bound
---------------------------------------------------------------*/

j_low(k,a)=max(0,j_min(k,a));

/*-----------------------------------------------------------------
Lower bound for abs value of a non-zero singular modulus of 
discriminant k corresponding to a triple (a,b,c)
input: k, a positive integers
output: lower bound
------------------------------------------------------------------*/

j_low_mult(k,a)=max(j_min_mult(k),j_min(k,a));

/*-----------------------------------------------------------------
Lower bound for abs value of the difference of two distinct 
singular moduli of discriminants k_1, k_2 
input: k_1, k_2 positive integers
output: lower bound
------------------------------------------------------------------*/

j_diff(k1, k2)=(800*(max(k1,k2))^(-4));

/*----------------------------------------------------------------------------------
List of the tau of a discriminant Delta
input: Delta<0, Delta \equiv 0,1 mod 4
output: list of quadratic tau in fundamental domain with discriminant Delta
---------------------------------------------------------------------------------*/

taus(Delta) =
{
    my(a,b,c,h,l,v); 
   
    h=qfbclassno(Delta);
    v=vector(h,i,0); 
    k= floor(sqrt(abs(Delta)/3));
    l=0;

    for(a=1,k,
	for(b=-a+1,a,
	    
	    if((b^2-Delta)%(4*a) == 0, 
	    c=(b^2 - Delta)/(4*a),
	    next()
	    );
	    
		if(c<a,next());
	    if((a==c) && (b<0),next());
	    if(gcd(a,gcd(b,c))!=1,next());
	    
	    
	    l = l + 1;
		
			
v[l]=(b+I*sqrt(abs(Delta)))/(2*a);		 
	);
    );
    
    return(v);
}

quicktaus(Delta) =
{
    my(a,b,c,l,v,t); 
   

    v=[];
    k= floor(sqrt(abs(Delta)/3));
    l=0;

    for(a=1,k,
	for(b=-a+1,a,
	    
	    if((b^2-Delta)%(4*a) == 0, 
	    c=(b^2 - Delta)/(4*a),
	    next()
	    );
	    
		if(c<a,next());
	    if((a==c) && (b<0),next());
	    if(gcd(a,gcd(b,c))!=1,next());
	    
	    
	    l = l + 1;
		
			
t=(b+I*sqrt(abs(Delta)))/(2*a);	
v=concat(v,[t]);
	);
    );
    
    return(v);
}

/*------------------------------------------------------------
List of the singular moduli of given discriminant Delta
input: Delta<0, Delta \equiv 0,1 mod 4
output: list of singular moduli with discriminant Delta
--------------------------------------------------------------*/

singmods(Delta) = 
{
    my(v,w,h);    
   
    h =qfbclassno(Delta);
	
	v=taus(Delta);
	
	w=vector(h,i,ellj(v[i])); 
	
        return(w);
}

/*----------------------------------------------------------------------------------------------------------------------
Absolute values of the singular moduli of discriminant Delta, sorted in decreasing order
input: Delta<0, Delta \equiv 0,1 mod 4
output: list of the asbolute values of the singular moduli with discriminant Delta, sorted in decreasing order
------------------------------------------------------------------------------------------------------------------------*/

abssingmods(Delta)=
{
my(v,n,w);

v=singmods(Delta);

n=length(v);

w=vector(n,i,abs(v[i]));

w=vecsort(w,,4);

return(w);
}

/*****************************************
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Some particular discriminants
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
*****************************************/

/*-------------------------------------------------
List of all discriminants Delta with h(Delta)=1
----------------------------------------------------*/

rat_delta=[-3,-4,-7,-8,-11,-12,-16,-19,-27,-28,-43,-67,-163];

/*---------------------------------------
List of all the rational singular moduli
---------------------------------------*/

rat_sing_mods()=
{
my(v,n,w);

v=rat_delta;
n=length(v);

w=vector(n,i,-Vec(polclass(v[i]))[2]);

return(w);

}

/*------------------------------------------------
List of all discriminants Delta with h(Delta)=2
--------------------------------------------------*/
	
deg2_delta=[-24,-32,-64,-88,-36,-48,-15,-20,-35,-40,-60,-75,-100,-115,-235,-72,-112,-52,-91,-403,-51,-187,-147,-232,-99,-123,-427,-148,-267];

/*-----------------------------------------------------------------------------------------------------------------------
List of pairs (Delta_1, Delta_2) with abs(Delta_1)>abs(Delta_2) such that Q(x_1)=Q(x_2) \ne Q and D_1 \neq D_2
for some singular moduli x_1, x_2 of discriminants Delta_1, Delta_2, where D_1, D_2 are the respective
fundamental discriminants.
Source: Table 2 ABPM15
-----------------------------------------------------------------------------------------------------------------------*/

badpairs=[[-32,-24],[-64,-24],[-64,-32],[-88,-24],[-88,-32],[-88,-64],[-48,-36],[-20,-15],[-35,-15],[-35,-20],[-40,-15],[-40,-20],[-40,-35],[-60,-15],[-60,-20],[-60,-35],[-60,-40],[-75,-15],[-75,-20],[-75,-35],[-75,-40],[-75,-60],[-100,-15],[-100,-20],[-100,-35],[-100,-40],[-100,-60],[-100,-75],[-115,-15],[-115,-20],[-115,-35],[-115,-40],[-115,-60],[-115,-75],[-115,-100],[-235,-15],[-235,-20],[-235,-35],[-235,-40],[-235,-60],[-235,-75],[-235,-100],[-235,-115],[-91,-52],[-403,-52],[-403,-91],[-187,-51],[-192,-96],[-288,-96],[-288,-192],[-240,-180],[-520,-195],[-715,-195],[-715,-520],[-160,-120],[-280,-120],[-280,-160],[-760,-120],[-760,-160],[-760,-280],[-595,-340],[-960,-480]];


/*----------------------------------------------------------------------------------------------------------------------
The entries of ListA are, for each number field L \neq Q which arises as Q(x1) and Q(x2) for some singular 
moduli x_1, x_2 with distinct fundamental discriminants, a list of the (non-fundamental) discriminants Delta 
such that L=Q(x) for some singular modulus x of discriminant Delta
Source: Table 2 ABPM15
-----------------------------------------------------------------------------------------------------------------------*/

ListA=
{
[[-24,-32,-64,-88],[-36,-48],[-15,-20,-35,-40,-60,-75,-100,-115,-235],[-52,-91,-403],[-51,-187],[-96,-192,-288],[-180,-240],
[-195,-520,-715],[-120,-160,-280,-760],[-340,-595],[-480,-960]];
}

/*------------------------------------------------------------------------------------------------------------------
Entries in ListA with [L : Q] = 2
N.B. This includes all discriminants Delta_1 \neq Delta_2 such that Q(x_1)=Q(x_2) is a field of degree 2
------------------------------------------------------------------------------------------------------------------*/
deg2=[[-24,-32,-64,-88],[-36,-48],[-15,-20,-35,-40,-60,-75,-100,-115,-235],[-52,-91,-403],[-51,-187]];

/*-----------------------------------------------------------
Entries in ListA with [L : Q] > 2
N.B. All the corresponding fields L have degree \geq 4
------------------------------------------------------------*/

bigdeg=[[-96,-192,-288],[-180,-240],[-195,-520,-715],[-120,-160,-280,-760],[-340,-595],[-480,-960]];

/*------------------------------------------------------------------------------------------------------------------------
List of discriminants with class number \geq 2, class group annihilated by 2, and fundamental discriminant
not equal to the single (possibly non-existent) exceptional Siegel--Tatuzawa fundamental discriminant
Source: Table 1 of ABPM15
Note: the class numbers of the discriminants in ListB are all in the set {4,8,16} (easy check with clno_ListB())
-------------------------------------------------------------------------------------------------------------------------*/
 
 ListB=
 {
 [-3*4^2,-3*5^2,-3*7^2,-4*3^2,-4*4^2,-4*5^2,-7*4^2,-8*2^2,-8*3^2,-11*3^2,
 -15,-15*2^2,-20,-24,-35,-40,-51,-52,-88,-91,-115,-123,-148,
 -187,-232,-235,-267,-403,-427,-3*8^2,-7*8^2,-8*6^2,-15*4^2,-15*8^2,-20*3^2,-24*2^2,-35*3^2,-40*2^2,
 -84,-88*2^2,-120,-120*2^2,-132,-168,-168*2^2,-195,-228,-232*2^2,
 -280,-280*2^2,-312,-312*2^2,-340,-372,-408,-408*2^2,-420,-435,
 -483,-520,-520*2^2,-532,-555,-595,-627,-660,-708,-715,
 -760,-760*2^2,-795,-840,-840*2^2,-1012,-1092,-1155,-1320,-1320*2^2,
 -1380,-1428,-1435,-1540,-1848,-1848*2^2,-1995,-3003,-3315,-5460]
 };
 
 /*---------------------------------------------------------------------------------
List of discriminants with class number =2 and class group annihilated by 2 
Source: Table 1 of ABPM15
----------------------------------------------------------------------------------*/
 
 ListC=
 {
 [-3*4^2,-3*5^2,-3*7^2,-4*3^2,-4*4^2,-4*5^2,-7*4^2,-8*2^2,-8*3^2,-11*3^2,
 -15,-15*2^2,-20,-24,-35,-40,-51,-52,-88,-91,-115,-123,-148,
 -187,-232,-235,-267,-403,-427]
 };
 
 /*------------------------------------------------------------------------------------
List of discriminants with class number \geq 4 and class group annihilated by 2 
Source: Table 1 of ABPM15
--------------------------------------------------------------------------------------*/

ListD=
 {
 [-3*8^2,-7*8^2,-8*6^2,-15*4^2,-15*8^2,-20*3^2,-24*2^2,-35*3^2,-40*2^2,
 -84,-88*2^2,-120,-120*2^2,-132,-168,-168*2^2,-195,-228,-232*2^2,
 -280,-280*2^2,-312,-312*2^2,-340,-372,-408,-408*2^2,-420,-435,
 -483,-520,-520*2^2,-532,-555,-595,-627,-660,-708,-715,
 -760,-760*2^2,-795,-840,-840*2^2,-1012,-1092,-1155,-1320,-1320*2^2,
 -1380,-1428,-1435,-1540,-1848,-1848*2^2,-1995,-3003,-3315,-5460]
 };


/*---------------------------------------------------------------------------------
 Class numbers corresponding to singular moduli with discriminants in ListB
 Note that they are all in {4,8,16}
 --------------------*/

clno_ListB()=qfbclassno(ListB);
 
 
 /*-------------------------------------------------------------------------------------------
List of triples (Delta_1, Delta_2, Delta_3) where Delta_1 = Delta_2, Delta_1 is listed
in List B, and Q(x_1) = Q(x_2) \supset \Q(x_3) with [Q(x_1) : Q(x_3)] = 2
Run time approx. 6 mins
 --------------------------------------------------------------------------------------------*/
 
 delta1_listed_triples()=
 {
 my(n,deltas,h,d3,m,v);
 
 n=length(ListB);
 deltas=[];
 v=clno_ListB();
 
 for(i=1,n,
 
 h=v[i];
 f=polclass(ListB[i]);
 d3=deltas_eq_h(7987,h/2); /*7987 hard code upper bound for discriminants with class number \leq 8, 
                                                since h3 \leq 8 as every delta in ListA has class number \leq 16*/
 m=length(d3);
 
 u=vector(m,j,0);
 l=1;
 
 for(k=1,m,
 
 if(nfisincl(polclass(d3[k]),f)==0,
 ,
 u[l]=[ListB[i],ListB[i],d3[k]];
 l=l+1;
 );
 );
 
 w=vector(l,j,0);
w=u[1..l-1];
 
 deltas=concat(deltas,w);
 );
 
 return(deltas);
 }


/*------------------------------------------------------------
Output of delta1_listed_triples(), saved for convenience
------------------------------------------------------------*/

List2biiA=[[-192, -192, -24], [-192, -192, -32], [-192, -192, -36], [-192, -192, -48], [-192, -192, -64], [-192, -192, -72], [-192, -192, -88], [-448, -448, -24], [-448, -448, -32], [-448, -448, -64], [-448, -448, -88], [-448, -448, -112], [-288, -288, -24], [-288, -288, -32], [-288, -288, -36], [-288, -288, -48], [-288, -288, -64], [-288, -288, -72], [-288, -288, -88], [-240, -240, -15], [-240, -240, -20], [-240, -240, -35], [-240, -240, -36], [-240, -240, -40], [-240, -240, -48], [-240, -240, -60], [-240, -240, -75], [-240, -240, -100], [-240, -240, -115], [-240, -240, -235], [-960, -960, -96], [-960, -960, -120], [-960, -960, -160], [-960, -960, -180], [-960, -960, -192], [-960, -960, -240], [-960, -960, -280], [-960, -960, -288], [-960, -960, -760], [-180, -180, -15], [-180, -180, -20], [-180, -180, -35], [-180, -180, -36], [-180, -180, -40], [-180, -180, -48], [-180, -180, -60], [-180, -180, -75], [-180, -180, -100], [-180, -180, -115], [-180, -180, -235], [-96, -96, -24], [-96, -96, -32], [-96, -96, -36], [-96, -96, -48], [-96, -96, -64], [-96, -96, -72], [-96, -96, -88], [-315, -315, -15], [-315, -315, -20], [-315, -315, -35], [-315, -315, -40], [-315, -315, -60], [-315, -315, -75], [-315, -315, -100], [-315, -315, -115], [-315, -315, -147], [-315, -315, -235], [-160, -160, -15], [-160, -160, -20], [-160, -160, -24], [-160, -160, -32], [-160, -160, -35], [-160, -160, -40], [-160, -160, -60], [-160, -160, -64], [-160, -160, -75], [-160, -160, -88], [-160, -160, -100], [-160, -160, -115], [-160, -160, -235], [-84, -84, -36], [-84, -84, -48], [-84, -84, -112], [-84, -84, -147], [-352, -352, -24], [-352, -352, -32], [-352, -352, -64], [-352, -352, -88], [-120, -120, -15], [-120, -120, -20], [-120, -120, -24], [-120, -120, -32], [-120, -120, -35], [-120, -120, -40], [-120, -120, -60], [-120, -120, -64], [-120, -120, -75], [-120, -120, -88], [-120, -120, -100], [-120, -120, -115], [-120, -120, -235], [-480, -480, -96], [-480, -480, -120], [-480, -480, -160], [-480, -480, -180], [-480, -480, -192], [-480, -480, -240], [-480, -480, -280], [-480, -480, -288], [-480, -480, -760], [-132, -132, -36], [-132, -132, -48], [-132, -132, -99], [-168, -168, -72], [-168, -168, -147], [-672, -672, -84], [-672, -672, -96], [-672, -672, -168], [-672, -672, -192], [-672, -672, -288], [-672, -672, -448], [-195, -195, -15], [-195, -195, -20], [-195, -195, -35], [-195, -195, -40], [-195, -195, -52], [-195, -195, -60], [-195, -195, -75], [-195, -195, -91], [-195, -195, -100], [-195, -195, -115], [-195, -195, -235], [-195, -195, -403], [-228, -228, -36], [-228, -228, -48], [-928, -928, -24], [-928, -928, -32], [-928, -928, -64], [-928, -928, -88], [-928, -928, -232], [-280, -280, -15], [-280, -280, -20], [-280, -280, -24], [-280, -280, -32], [-280, -280, -35], [-280, -280, -40], [-280, -280, -60], [-280, -280, -64], [-280, -280, -75], [-280, -280, -88], [-280, -280, -100], [-280, -280, -115], [-280, -280, -235], [-1120, -1120, -120], [-1120, -1120, -160], [-1120, -1120, -280], [-1120, -1120, -448], [-1120, -1120, -760], [-312, -312, -24], [-312, -312, -32], [-312, -312, -52], [-312, -312, -64], [-312, -312, -88], [-312, -312, -91], [-312, -312, -403], [-1248, -1248, -96], [-1248, -1248, -192], [-1248, -1248, -288], [-1248, -1248, -312], [-340, -340, -15], [-340, -340, -20], [-340, -340, -35], [-340, -340, -40], [-340, -340, -51], [-340, -340, -60], [-340, -340, -75], [-340, -340, -100], [-340, -340, -115], [-340, -340, -187], [-340, -340, -235], [-372, -372, -36], [-372, -372, -48], [-408, -408, -24], [-408, -408, -32], [-408, -408, -51], [-408, -408, -64], [-408, -408, -88], [-408, -408, -187], [-1632, -1632, -96], [-1632, -1632, -192], [-1632, -1632, -288], [-1632, -1632, -408], [-420, -420, -84], [-420, -420, -180], [-420, -420, -240], [-420, -420, -315], [-435, -435, -15], [-435, -435, -20], [-435, -435, -35], [-435, -435, -40], [-435, -435, -60], [-435, -435, -75], [-435, -435, -100], [-435, -435, -115], [-435, -435, -232], [-435, -435, -235], [-483, -483, -147], [-520, -520, -15], [-520, -520, -20], [-520, -520, -35], [-520, -520, -40], [-520, -520, -52], [-520, -520, -60], [-520, -520, -75], [-520, -520, -91], [-520, -520, -100], [-520, -520, -115], [-520, -520, -235], [-520, -520, -403], [-2080, -2080, -120], [-2080, -2080, -160], [-2080, -2080, -195], [-2080, -2080, -280], [-2080, -2080, -312], [-2080, -2080, -520], [-2080, -2080, -715], [-2080, -2080, -760], [-532, -532, -112], [-555, -555, -15], [-555, -555, -20], [-555, -555, -35], [-555, -555, -40], [-555, -555, -60], [-555, -555, -75], [-555, -555, -100], [-555, -555, -115], [-555, -555, -148], [-555, -555, -235], [-595, -595, -15], [-595, -595, -20], [-595, -595, -35], [-595, -595, -40], [-595, -595, -51], [-595, -595, -60], [-595, -595, -75], [-595, -595, -100], [-595, -595, -115], [-595, -595, -187], [-595, -595, -235], [-627, -627, -99], [-660, -660, -132], [-660, -660, -180], [-660, -660, -240], [-708, -708, -36], [-708, -708, -48], [-715, -715, -15], [-715, -715, -20], [-715, -715, -35], [-715, -715, -40], [-715, -715, -52], [-715, -715, -60], [-715, -715, -75], [-715, -715, -91], [-715, -715, -100], [-715, -715, -115], [-715, -715, -235], [-715, -715, -403], [-760, -760, -15], [-760, -760, -20], [-760, -760, -24], [-760, -760, -32], [-760, -760, -35], [-760, -760, -40], [-760, -760, -60], [-760, -760, -64], [-760, -760, -75], [-760, -760, -88], [-760, -760, -100], [-760, -760, -115], [-760, -760, -235], [-3040, -3040, -120], [-3040, -3040, -160], [-3040, -3040, -280], [-3040, -3040, -760], [-795, -795, -15], [-795, -795, -20], [-795, -795, -35], [-795, -795, -40], [-795, -795, -60], [-795, -795, -75], [-795, -795, -100], [-795, -795, -115], [-795, -795, -235], [-840, -840, -168], [-840, -840, -315], [-3360, -3360, -420], [-3360, -3360, -480], [-3360, -3360, -672], [-3360, -3360, -840], [-3360, -3360, -960], [-3360, -3360, -1120], [-1092, -1092, -84], [-1155, -1155, -315], [-5280, -5280, -480], [-5280, -5280, -660], [-5280, -5280, -960], [-5280, -5280, -1320], [-1380, -1380, -180], [-1380, -1380, -240], [-1428, -1428, -84], [-1435, -1435, -15], [-1435, -1435, -20], [-1435, -1435, -35], [-1435, -1435, -40], [-1435, -1435, -60], [-1435, -1435, -75], [-1435, -1435, -100], [-1435, -1435, -115], [-1435, -1435, -123], [-1435, -1435, -235], [-7392, -7392, -672], [-7392, -7392, -1848], [-1995, -1995, -315], [-3315, -3315, -195], [-3315, -3315, -340], [-3315, -3315, -520], [-3315, -3315, -595], [-3315, -3315, -715], [-5460, -5460, -420], [-5460, -5460, -1092]];

 /*--------------------------------------------------------------------------------------------------
Triples of discriminants (Delta_1, Delta_2, Delta_3) with Delta_1 = Delta_2, Delta_3 listed
in List B, Q(x_1) = Q(x_2) \supset \Q(x_3) with [Q(x_1) : Q(x_3)] = 2, and h(Delta3)=2
 ---------------------------------------------------------------------------------------------------*/
 
 delta3_listed_deg2()=
{
my(n,v,a,m,u,deltas,w);

n=length(ListC);
v=vector(n,i,polclass(ListC[i]));
a=deltas_eq_h(1555,4); /* 1555 hardcode upper bound for discriminants with class number = 4 */

m=length(a);
u=vector(m,i,polclass(a[i]));
deltas=[];

for(i=1,n,
for(j=1,m,
w=[];
if(nfisincl(v[i],u[j])==0,,w=[[a[j],a[j],ListC[i]]]);

deltas=concat(deltas,w);
);
);

return(deltas);

}

/*------------------------------------------------------------
Output of delta3_listed_deg2(), saved for convenience
------------------------------------------------------------*/

List2biiB2=[[-84, -84, -48], [-96, -96, -48], [-132, -132, -48], [-144, -144, -48], [-180, -180, -48], [-192, -192, -48], [-228, -228, -48], [-240, -240, -48], [-288, -288, -48], [-372, -372, -48], [-708, -708, -48], [-55, -55, -75], [-80, -80, -75], [-120, -120, -75], [-155, -155, -75], [-160, -160, -75], [-180, -180, -75], [-195, -195, -75], [-220, -220, -75], [-240, -240, -75], [-275, -275, -75], [-280, -280, -75], [-315, -315, -75], [-340, -340, -75], [-355, -355, -75], [-400, -400, -75], [-435, -435, -75], [-475, -475, -75], [-520, -520, -75], [-555, -555, -75], [-595, -595, -75], [-715, -715, -75], [-760, -760, -75], [-795, -795, -75], [-955, -955, -75], [-1435, -1435, -75], [-1555, -1555, -75], [-63, -63, -147], [-84, -84, -147], [-168, -168, -147], [-252, -252, -147], [-315, -315, -147], [-483, -483, -147], [-84, -84, -36], [-96, -96, -36], [-132, -132, -36], [-144, -144, -36], [-180, -180, -36], [-192, -192, -36], [-228, -228, -36], [-240, -240, -36], [-288, -288, -36], [-372, -372, -36], [-708, -708, -36], [-56, -56, -64], [-96, -96, -64], [-120, -120, -64], [-128, -128, -64], [-160, -160, -64], [-184, -184, -64], [-192, -192, -64], [-256, -256, -64], [-280, -280, -64], [-288, -288, -64], [-312, -312, -64], [-352, -352, -64], [-408, -408, -64], [-448, -448, -64], [-568, -568, -64], [-760, -760, -64], [-928, -928, -64], [-55, -55, -100], [-80, -80, -100], [-120, -120, -100], [-155, -155, -100], [-160, -160, -100], [-180, -180, -100], [-195, -195, -100], [-220, -220, -100], [-240, -240, -100], [-275, -275, -100], [-280, -280, -100], [-315, -315, -100], [-340, -340, -100], [-355, -355, -100], [-400, -400, -100], [-435, -435, -100], [-475, -475, -100], [-520, -520, -100], [-555, -555, -100], [-595, -595, -100], [-715, -715, -100], [-760, -760, -100], [-795, -795, -100], [-955, -955, -100], [-1435, -1435, -100], [-1555, -1555, -100], [-84, -84, -112], [-196, -196, -112], [-448, -448, -112], [-532, -532, -112], [-56, -56, -32], [-96, -96, -32], [-120, -120, -32], [-128, -128, -32], [-160, -160, -32], [-184, -184, -32], [-192, -192, -32], [-256, -256, -32], [-280, -280, -32], [-288, -288, -32], [-312, -312, -32], [-352, -352, -32], [-408, -408, -32], [-448, -448, -32], [-568, -568, -32], [-760, -760, -32], [-928, -928, -32], [-96, -96, -72], [-168, -168, -72], [-192, -192, -72], [-288, -288, -72], [-132, -132, -99], [-363, -363, -99], [-627, -627, -99], [-55, -55, -15], [-80, -80, -15], [-120, -120, -15], [-155, -155, -15], [-160, -160, -15], [-180, -180, -15], [-195, -195, -15], [-220, -220, -15], [-240, -240, -15], [-275, -275, -15], [-280, -280, -15], [-315, -315, -15], [-340, -340, -15], [-355, -355, -15], [-400, -400, -15], [-435, -435, -15], [-475, -475, -15], [-520, -520, -15], [-555, -555, -15], [-595, -595, -15], [-715, -715, -15], [-760, -760, -15], [-795, -795, -15], [-955, -955, -15], [-1435, -1435, -15], [-1555, -1555, -15], [-55, -55, -60], [-80, -80, -60], [-120, -120, -60], [-155, -155, -60], [-160, -160, -60], [-180, -180, -60], [-195, -195, -60], [-220, -220, -60], [-240, -240, -60], [-275, -275, -60], [-280, -280, -60], [-315, -315, -60], [-340, -340, -60], [-355, -355, -60], [-400, -400, -60], [-435, -435, -60], [-475, -475, -60], [-520, -520, -60], [-555, -555, -60], [-595, -595, -60], [-715, -715, -60], [-760, -760, -60], [-795, -795, -60], [-955, -955, -60], [-1435, -1435, -60], [-1555, -1555, -60], [-55, -55, -20], [-80, -80, -20], [-120, -120, -20], [-155, -155, -20], [-160, -160, -20], [-180, -180, -20], [-195, -195, -20], [-220, -220, -20], [-240, -240, -20], [-275, -275, -20], [-280, -280, -20], [-315, -315, -20], [-340, -340, -20], [-355, -355, -20], [-400, -400, -20], [-435, -435, -20], [-475, -475, -20], [-520, -520, -20], [-555, -555, -20], [-595, -595, -20], [-715, -715, -20], [-760, -760, -20], [-795, -795, -20], [-955, -955, -20], [-1435, -1435, -20], [-1555, -1555, -20], [-56, -56, -24], [-96, -96, -24], [-120, -120, -24], [-128, -128, -24], [-160, -160, -24], [-184, -184, -24], [-192, -192, -24], [-256, -256, -24], [-280, -280, -24], [-288, -288, -24], [-312, -312, -24], [-352, -352, -24], [-408, -408, -24], [-448, -448, -24], [-568, -568, -24], [-760, -760, -24], [-928, -928, -24], [-55, -55, -35], [-80, -80, -35], [-120, -120, -35], [-155, -155, -35], [-160, -160, -35], [-180, -180, -35], [-195, -195, -35], [-220, -220, -35], [-240, -240, -35], [-275, -275, -35], [-280, -280, -35], [-315, -315, -35], [-340, -340, -35], [-355, -355, -35], [-400, -400, -35], [-435, -435, -35], [-475, -475, -35], [-520, -520, -35], [-555, -555, -35], [-595, -595, -35], [-715, -715, -35], [-760, -760, -35], [-795, -795, -35], [-955, -955, -35], [-1435, -1435, -35], [-1555, -1555, -35], [-55, -55, -40], [-80, -80, -40], [-120, -120, -40], [-155, -155, -40], [-160, -160, -40], [-180, -180, -40], [-195, -195, -40], [-220, -220, -40], [-240, -240, -40], [-275, -275, -40], [-280, -280, -40], [-315, -315, -40], [-340, -340, -40], [-355, -355, -40], [-400, -400, -40], [-435, -435, -40], [-475, -475, -40], [-520, -520, -40], [-555, -555, -40], [-595, -595, -40], [-715, -715, -40], [-760, -760, -40], [-795, -795, -40], [-955, -955, -40], [-1435, -1435, -40], [-1555, -1555, -40], [-68, -68, -51], [-136, -136, -51], [-323, -323, -51], [-340, -340, -51], [-408, -408, -51], [-595, -595, -51], [-1003, -1003, -51], [-1411, -1411, -51], [-39, -39, -52], [-156, -156, -52], [-195, -195, -52], [-208, -208, -52], [-312, -312, -52], [-507, -507, -52], [-520, -520, -52], [-715, -715, -52], [-1027, -1027, -52], [-56, -56, -88], [-96, -96, -88], [-120, -120, -88], [-128, -128, -88], [-160, -160, -88], [-184, -184, -88], [-192, -192, -88], [-256, -256, -88], [-280, -280, -88], [-288, -288, -88], [-312, -312, -88], [-352, -352, -88], [-408, -408, -88], [-448, -448, -88], [-568, -568, -88], [-760, -760, -88], [-928, -928, -88], [-39, -39, -91], [-156, -156, -91], [-195, -195, -91], [-208, -208, -91], [-312, -312, -91], [-507, -507, -91], [-520, -520, -91], [-715, -715, -91], [-1027, -1027, -91], [-55, -55, -115], [-80, -80, -115], [-120, -120, -115], [-155, -155, -115], [-160, -160, -115], [-180, -180, -115], [-195, -195, -115], [-220, -220, -115], [-240, -240, -115], [-275, -275, -115], [-280, -280, -115], [-315, -315, -115], [-340, -340, -115], [-355, -355, -115], [-400, -400, -115], [-435, -435, -115], [-475, -475, -115], [-520, -520, -115], [-555, -555, -115], [-595, -595, -115], [-715, -715, -115], [-760, -760, -115], [-795, -795, -115], [-955, -955, -115], [-1435, -1435, -115], [-1555, -1555, -115], [-328, -328, -123], [-1435, -1435, -123], [-259, -259, -148], [-555, -555, -148], [-592, -592, -148], [-68, -68, -187], [-136, -136, -187], [-323, -323, -187], [-340, -340, -187], [-408, -408, -187], [-595, -595, -187], [-1003, -1003, -187], [-1411, -1411, -187], [-203, -203, -232], [-435, -435, -232], [-667, -667, -232], [-928, -928, -232], [-55, -55, -235], [-80, -80, -235], [-120, -120, -235], [-155, -155, -235], [-160, -160, -235], [-180, -180, -235], [-195, -195, -235], [-220, -220, -235], [-240, -240, -235], [-275, -275, -235], [-280, -280, -235], [-315, -315, -235], [-340, -340, -235], [-355, -355, -235], [-400, -400, -235], [-435, -435, -235], [-475, -475, -235], [-520, -520, -235], [-555, -555, -235], [-595, -595, -235], [-715, -715, -235], [-760, -760, -235], [-795, -795, -235], [-955, -955, -235], [-1435, -1435, -235], [-1555, -1555, -235], [-39, -39, -403], [-156, -156, -403], [-195, -195, -403], [-208, -208, -403], [-312, -312, -403], [-507, -507, -403], [-520, -520, -403], [-715, -715, -403], [-1027, -1027, -403]];

/*----------------------------------------------------------------------------------
List of discriminants with class number =4 and class group annihilated by 2 
------------------------------------------------------------------------------------*/

List4()=
{
my(n,v,j,u);

n=length(ListD);
v=vector(n,i,0);
j=1;

for(i=1,n,

if(qfbclassno(ListD[i])==4,
v[j]=ListD[i];
j=j+1;
);
);

u=vector(j-1,i,0);
u=v[1..j-1];

return(u);
}


/*---------------------------------------------------------------------------------------------------
Triples of discriminants (Delta_1, Delta_2, Delta_3) with Delta_1 = Delta_2, Delta_3 listed
in List B, Q(x_1) = Q(x_2) \supset \Q(x_3) with [Q(x_1) : Q(x_3)] = 2, and h(Delta3)=4
 ---------------------------------------------------------------------------------------------------*/
 
 delta3_listed_deg4()=
{
my(b,n,v,a,m,u,deltas,w);

b=List4();
n=length(b);
v=vector(n,i,polclass(b[i]));
a=deltas_eq_h(7987,8); /* 7987 hardcode upper bound for discriminants with class number =8 */

m=length(a);
u=vector(m,i,polclass(a[i]));
deltas=[];

for(i=1,n,
for(j=1,m,
w=[];
if(nfisincl(v[i],u[j])==0,,w=[[a[j],a[j],b[i]]]);

deltas=concat(deltas,w);
);
);

return(deltas);

}

/*------------------------------------------------------------
Output of delta3_listed_deg4(), saved for convenience
------------------------------------------------------------*/

List2biiB4 = [[-384, -384, -192], [-480, -480, -192], [-576, -576, -192], [-672, -672, -192], [-768, -768, -192], [-960, -960, -192], [-1152, -1152, -192], [-1248, -1248, -192], [-1632, -1632, -192], [-224, -224, -448], [-672, -672, -448], [-1120, -1120, -448], [-1792, -1792, -448], [-384, -384, -288], [-480, -480, -288], [-576, -576, -288], [-672, -672, -288], [-768, -768, -288], [-960, -960, -288], [-1152, -1152, -288], [-1248, -1248, -288], [-1632, -1632, -288], [-420, -420, -240], [-480, -480, -240], [-660, -660, -240], [-720, -720, -240], [-900, -900, -240], [-960, -960, -240], [-1380, -1380, -240], [-420, -420, -180], [-480, -480, -180], [-660, -660, -180], [-720, -720, -180], [-900, -900, -180], [-960, -960, -180], [-1380, -1380, -180], [-384, -384, -96], [-480, -480, -96], [-576, -576, -96], [-672, -672, -96], [-768, -768, -96], [-960, -960, -96], [-1152, -1152, -96], [-1248, -1248, -96], [-1632, -1632, -96], [-420, -420, -315], [-840, -840, -315], [-1155, -1155, -315], [-1995, -1995, -315], [-320, -320, -160], [-480, -480, -160], [-600, -600, -160], [-640, -640, -160], [-960, -960, -160], [-1120, -1120, -160], [-1240, -1240, -160], [-1600, -1600, -160], [-2080, -2080, -160], [-3040, -3040, -160], [-336, -336, -84], [-420, -420, -84], [-672, -672, -84], [-1008, -1008, -84], [-1092, -1092, -84], [-1428, -1428, -84], [-1408, -1408, -352], [-320, -320, -120], [-480, -480, -120], [-600, -600, -120], [-640, -640, -120], [-960, -960, -120], [-1120, -1120, -120], [-1240, -1240, -120], [-1600, -1600, -120], [-2080, -2080, -120], [-3040, -3040, -120], [-528, -528, -132], [-660, -660, -132], [-672, -672, -168], [-840, -840, -168], [-260, -260, -195], [-2080, -2080, -195], [-2275, -2275, -195], [-3315, -3315, -195], [-912, -912, -228], [-3712, -3712, -928], [-320, -320, -280], [-480, -480, -280], [-600, -600, -280], [-640, -640, -280], [-960, -960, -280], [-1120, -1120, -280], [-1240, -1240, -280], [-1600, -1600, -280], [-2080, -2080, -280], [-3040, -3040, -280], [-832, -832, -312], [-1248, -1248, -312], [-2080, -2080, -312], [-2392, -2392, -312], [-1275, -1275, -340], [-1360, -1360, -340], [-3315, -3315, -340], [-1488, -1488, -372], [-544, -544, -408], [-952, -952, -408], [-1632, -1632, -408], [-580, -580, -435], [-2755, -2755, -435], [-260, -260, -520], [-2080, -2080, -520], [-2275, -2275, -520], [-3315, -3315, -520], [-2128, -2128, -532], [-2035, -2035, -555], [-1275, -1275, -595], [-1360, -1360, -595], [-3315, -3315, -595], [-2832, -2832, -708], [-260, -260, -715], [-2080, -2080, -715], [-2275, -2275, -715], [-3315, -3315, -715], [-320, -320, -760], [-480, -480, -760], [-600, -600, -760], [-640, -640, -760], [-960, -960, -760], [-1120, -1120, -760], [-1240, -1240, -760], [-1600, -1600, -760], [-2080, -2080, -760], [-3040, -3040, -760], [-1060, -1060, -795], [-4048, -4048, -1012], [-820, -820, -1435]];

/*----------------------------------------------------------------------------------
List of discriminants with class number =8 and class group annihilated by 2 
Source: Table 1 of ABPM15
-----------------------------------------------------------------------------------*/

List8()=
{
my(n,v,j,u);

n=length(ListD);
v=vector(n,i,0);
j=1;

for(i=1,n,

if(qfbclassno(ListD[i])==8,
v[j]=ListD[i];
j=j+1;
);
);

u=vector(j-1,i,0);
u=v[1..j-1];

return(u);
}


/*---------------
 Triples of discriminants (Delta_1, Delta_2, Delta_3) with Delta_1 = Delta_2, Delta_3 listed
in List B, Q(x_1) = Q(x_2) \supset \Q(x_3) with [Q(x_1) : Q(x_3)] = 2, and h(Delta3)=8
 Run time approx. 21 mins
 -----------------*/

delta3_listed_deg8()=
{
my(b,n,v,a,m,u,deltas,w);

b=List8();
n=length(b);
v=vector(n,i,polclass(b[i]));
a=deltas_eq_h(35275,16); /* 35275 hardcode upper bound for discriminants with class number = 16*/

m=length(a);
u=vector(m,i,polclass(a[i]));
deltas=[];

for(i=1,n,
for(j=1,m,
w=[];
if(nfisincl(v[i],u[j])==0,,w=[[a[j],a[j],b[i]]]);

deltas=concat(deltas,w);
);
);

return(deltas);

}


/*------------------------------------------------------------
Output of delta3_listed_deg8(), saved for convenience
------------------------------------------------------------*/

List2biiB8 = [[-1440, -1440, -960], [-1920, -1920, -960], [-2400, -2400, -960], [-2880, -2880, -960], [-3360, -3360, -960], [-3840, -3840, -960], [-5280, -5280, -960], [-1440, -1440, -480], [-1920, -1920, -480], [-2400, -2400, -480], [-2880, -2880, -480], [-3360, -3360, -480], [-3840, -3840, -480], [-5280, -5280, -480], [-1344, -1344, -672], [-2016, -2016, -672], [-2688, -2688, -672], [-3360, -3360, -672], [-4032, -4032, -672], [-7392, -7392, -672], [-3360, -3360, -1120], [-4480, -4480, -1120], [-2496, -2496, -1248], [-4992, -4992, -1248], [-6528, -6528, -1632], [-1680, -1680, -420], [-2100, -2100, -420], [-3360, -3360, -420], [-5460, -5460, -420], [-1560, -1560, -2080], [-3640, -3640, -2080], [-8320, -8320, -2080], [-2640, -2640, -660], [-5280, -5280, -660], [-12160, -12160, -3040], [-3360, -3360, -840], [-4368, -4368, -1092], [-5460, -5460, -1092], [-5280, -5280, -1320], [-5520, -5520, -1380], [-5712, -5712, -1428], [-6160, -6160, -1540], [-7392, -7392, -1848], [-4420, -4420, -3315]];

/*-----------------------------------------------------------------------------------
List of discriminants with class number =16 and class group annihilated by 2
Source: Table 1 of ABPM15
-------------------------------------------------------------------------------------*/

List16()=
{
my(n,v,j,u);

n=length(ListD);
v=vector(n,i,0);
j=1;

for(i=1,n,

if(qfbclassno(ListD[i])==16,
v[j]=ListD[i];
j=j+1;
);
);

u=vector(j-1,i,0);
u=v[1..j-1];

return(u);
}


/*--------------------------------------------------------------------------------------------------
Triples of discriminants (Delta_1, Delta_2, Delta_3) with Delta_1 = Delta_2, Delta_3 listed
in List B, Q(x_1) = Q(x_2) \supset \Q(x_3) with [Q(x_1) : Q(x_3)] = 2, and h(Delta3)=16
Run time approx. 5 hours (CAUTION!)
 ----------------------------------------------------------------------------------------------------*/

delta3_listed_deg16()=
{
my(b,n,v,a,m,u,deltas,w);

b=List16();
n=length(b);
v=vector(n,i,polclass(b[i]));
a=deltas_eq_h(164803,32); /* Hardcode upper bound for discriminants with class number = 32 */

m=length(a);
u=vector(m,i,polclass(a[i]));
deltas=[];

for(i=1,n,
for(j=1,m,
w=[];
if(nfisincl(v[i],u[j])==0,,w=[[a[j],a[j],b[i]]]);

deltas=concat(deltas,w);
);
);

return(deltas);

}

/*------------------------------------------------------------
Output of delta3_listed_deg16(), saved for convenience
------------------------------------------------------------*/

List2biiB16 = [[-6720, -6720, -3360], [-10080, -10080, -3360], [-13440, -13440, -3360], [-10560, -10560, -5280], [-21120, -21120, -5280], [-29568, -29568, -7392], [-21840, -21840, -5460]];
