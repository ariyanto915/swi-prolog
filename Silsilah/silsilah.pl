%anak laki - laki
lakilaki(doni).
lakilaki(mike).
lakilaki(anton).
lakilaki(andre).
lakilaki(alan).
lakilaki(john).

%anak perempuan
perempuan(melly).
perempuan(silvi).
perempuan(rossa).
perempuan(diana).
perempuan(emi).

%orangtua
ayah(doni,silvi).
ayah(doni,anton).
ayah(mike,diana).
ayah(mike,andre).
ayah(mike,alan).
ayah(anton,emi).
ayah(anton,john).
ibu(melly,silvi).
ibu(melly,anton).
ibu(silvi,diana).
ibu(silvi,andre).
ibu(silvi,alan).
ibu(rossa,emi).
ibu(rossa,john).

%aturan (rules) database pengetahuan
anaklakilaki(C,P):-ayah(P,C),perempuan(C).
anaklakilaki(C,P):-ibu(P,C),perempuan(C).

anakperempuan(C,P):-ayah(P,C),perempuan(C).
anakperempuan(C,P):-ibu(P,C),perempuan(C).

kakek(K,C):-ayah(A,C),ayah(K,A).
kakek(K,C):-ibu(I,C),ayah(K,I).

nenek(N,C):-ayah(A,C),ibu(N,A).
nenek(N,C):-ibu(I,C),ibu(N,I).

saudaraperempuan(B,C):-perempuan(B),ayah(A,B),ayah(A,C),ibu(I,B),ibu(I,C),\+(B==C).
saudaralakilaki(B,C):-lakilaki(B),ayah(A,B),ayah(A,C),ibu(I,B),ibu(I,C),\+(B==C).
saudarakandung(B,C):-ayah(A,B),ayah(A,C),ibu(I,B),ibu(I,C),\+(B==C).

saudaraseupupu(X,Y):-ayah(A1,X),ayah(A2,Y),saudarakandung(A1,A2),\+(X==Y).
saudarasepupu(X,Y):-ayah(A,X),ibu(I,Y),saudarakandung(A,I),\+(X==Y).
saudarasepupu(X,Y):-ibu(I,X),ayah(A,Y),saudarakandung(I,A),\+(X==Y).
saudarasepupu(X,Y):-ibu(I1,X),ibu(I2,Y),saudarakandung(I1,I2),\+(X==Y).
