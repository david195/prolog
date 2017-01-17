%proveedores(Scodigo,Snombre,estatus,ciudad).
proveedores(s1,juan,20,madrid).
proveedores(s2,pedro,10,castellon).
proveedores(s3,raquel,30,alicante).
proveedores(s4,maria,20,valencia).
proveedores(s5,luis,30,castellon).

%partes(Pcodigo,Pnombre,Color,Peso,Ciudad).
partes(p1,mesa,verde,20,castellon).
partes(p2,silla,verde,6,castellon).
partes(p3,armario,azul,60,alicante).
partes(p4,sofa,amarillo,55,valencia).
partes(p5,cama,marron,20,madrid).
partes(p6,libreria,roja,70,castellon).

%Proveedores_partes(Pcodigo,Scodigo,Cantidad)
prov_part(s1,p1,300).
prov_part(s1,p2,200).
prov_part(s1,p3,400).
prov_part(s1,p4,300).
prov_part(s1,p5,700).
prov_part(s1,p6,100).
prov_part(s2,p1,300).
prov_part(s2,p2,400).
prov_part(s3,p2,200).
prov_part(s4,p2,200).
prov_part(s4,p4,300).
prov_part(s4,p6,400).
prov_part(s5,p5,100).

color(Color,Name):- partes(Pr,_,Color,_,_),prov_part(S,Pr,_),proveedores(S,Name,_,_).
ciudad(Ciudad,Name):- partes(Pr,_,_,_,Ciudad),prov_part(S,Pr,_),proveedores(S,Name,_,_).
notP(Pr,Name):- prov_part(S,Px,_),Pr\=Px,not(prov_part(S,Pr,_)),proveedores(S,Name,_,_).

totalPartes(Pr,N):- prov_part(_,Pr,N).
totalProv(S,N):- prov_part(S,_,N).

suma([],0).
suma([X|R],N):- suma(R,Nr),N is (Nr+X).

consulta(a,Color,Z):-setof(X,color(Color,X),Z).
consulta(b,Ciudad,Z):-setof(X,ciudad(Ciudad,X),Z).
consulta(c,Pn,Z):-setof(X,notP(Pn,X),Z).

consulta(d,S,N):-bagof(X,totalProv(S,X),Z),suma(Z,N).
consulta(d,Pn,N):-bagof(X,totalPartes(Pn,X),Z),suma(Z,N).
consulta(d,S,Pr,N):-prov_part(S,Pr,N).
