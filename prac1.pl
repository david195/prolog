persona(maria,50,negro,marrones,si_gafas).
persona(pedro,60,negro,rojos,no_gafas).
persona(juan,60,negro,rojos,no_gafas).
persona(poncho,60,negro,rojos,no_gafas).

a(P1,P2):-persona(P1,Alt,_,Oj1,_),persona(P2,Alt,_,Oj2,_), Oj1\=Oj2.
b(P1,P2):-persona(P1,_,Cab1,Oj,Gf1),persona(P2,_,Cab2,Oj,Gf2), Cab1\=Cab2,gafas(Gf1,Gf2).
c(P1,P2):-persona(P1,Alt1,Cab,_,_),persona(P2,Alt2,Cab,_,_),altura(Alt1,Alt2).

pareja(P1,P2):- a(P1,P2)|b(P1,P2)|c(P1,P2).

gafas(G1,G2):- G1=no_gafas | G2=no_gafas.
altura(A1,A2):- (A1-10)>=A2 | (A2-10)>=A1.
