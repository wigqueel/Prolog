%product product(id_product,title,id_store, id_producer)
product(001, eq2, store(0001, pushkinska_31, 0674324684), producer(02, adidas, 0991223334)).
product(002, mercurial, store(0002, zhukova_12, 0675324456), producer(01, nike, 0991223334)).
product(003, buen,store(0001, pushkinska_31, 0674324684), producer(02, adidas, 0991223334)).
product(004, huarachi, store(0003, perova_4, 0953324684), producer(01, nike, 0991223334)).
product(005, glat, store(0002, zhukova_12, 0675324456), producer(03, puma, 0953228334)).
product(006, loonlight11, store(0004, bandery_11, 0953324684), producer(01, nike, 0991223334)).
product(007, classic_cl, store(0002, zhukova_12, 0675324456), producer(04, reebok, 09132283554)).
product(008, air_max, store(0004, bandery_11, 0953324684), producer(01, nike, 0991223334)).

%producer producer(id_producer,name,phone)
producer(01, nike, 0991223334).
producer(02, adidas, 0991223334).
producer(03, puma, 0953228334).
producer(04, reebok, 09132283554).

%store store(id_store, adress, phone)
store(0001, pushkinska_31, 0674324684).
store(0002, zhukova_12, 0675324456).
store(0003, perova_4, 0953324684).
store(0004, bandery_11, 0953324684).

%правила

%1) Адресa товару за його назвою; X - назва товару(title), Y - адерса(adress) , Z - (id магазину)id_store

shoeAdress(X,Y):-product(_, X, store(_, Y, _), producer(_,_,_)).

%2) Телефони магазинів, в яких є товар заданного виробника ; X - ім'я виробника(name) Y - телефон(phone) 

%phoneBrand(X,Y):-producer(K,X,_), product(_,_,Z,K),store(Z,_,Y).

phoneBrand(X,Y):-product(_,_, store(_, Y, _), producer(_,X,_)).

%3) Всі товари заданного виробника, а також його телефон ; X - виробник(name) Y -  товар(tittle) Z - телефон(phone)

%phoneItem(X,Y,Z):- producer(K,X,Z), product(_,Y,_,K).

phoneItem(X,Y,Z):-product(_,Y, store(_, _, _), producer(_,X,Z)).

%4) Товари і виробник за телефоном магазину X - телефон(phone) Y - товар(tittle), Z - виробник(name)

%itemProducer(X,Y,Z):- store(K,_,X), product(K,Z,_,M), producer(M,Y,_).
itemProducer(X,Y,Z):-product(_,Y, store(_, _, X), producer(_,Z,_)).

%5) за назвою товару знайти все(ім'я виробника, його телефон, адресу мгазину і його телефон) X - товар(tittle) Y - ім'я(name), K - телефон виробника(phone), M - магазин(адреса) O - телефон магазину(phone)

%nameAll(X,Y,K,M,O):- product(_,X,D,Q), producer(Q,Y,K), store(D,M,O). 

nameAll(X,Y,K,M,O):-product(_, X, store(_, M, O), producer(_,Y,K)).

:- initialization(run).
run :-
  write('-------shoeAdress: (eq2)\n'),
  forall(shoeAdress(eq2,Y), (write(Y), nl)),

  write('-------phoneBrand: (nike)\n'),
  forall(phoneBrand(X,nike), (write(X), nl)),

  write('-------phoneItem: (adidas)\n'),
  forall(phoneItem(adidas,Y,Z), (write(Y), nl, write(Z), nl)),

  write('-------itemProducer: (0674324684)\n'),
  forall(itemProducer(0674324684,Y,Z), (write(Y), nl, write(Z), nl )),

  write('-------nameAll: (huarachi)\n'),
  forall(nameAll(huarachi,Y,K,M,O), (write(Y), nl, write(K), nl, write(M),nl,write(O), nl)).