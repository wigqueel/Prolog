:-initialization(test).

%exercise 1 
exercise1(X, R) :- exercise1(X, [], 0, R).
exercise1([], X, _, R) :- reverse(X, R), !.
exercise1([H|T], X, I, R) :- H < 0,
NEXT is I + 1,
exercise1(T, [I|X], NEXT, R).
exercise1([H|T], X, I, R) :- H >= 0,
NEXT is I + 1,
exercise1(T, X, NEXT, R).

%exercise 2
exercise2(_,[],[]) :- !.
exercise2(X,[H|T],[H1|T1]) :- X =:= H, 
H1 = change_done, 
exercise2(X, T, T1); 
H1 = H,
exercise2(X,T,T1),!.

% 3
exercise3(Arabic, Romanic):- form(Arabic, [], Romanic),!.

form([], Romanic, Romanic):-!.
form([H|T], Romanic1, Romanic2):- f(H, [] ,Romanic), 
name(ResRomanic, Romanic),
append(Romanic1, [ResRomanic], Rr), 
form(T, Rr, Romanic2).

f(0,Romanic,Romanic ):-!.
f(N,Romanic1,Romanic) :- N < 4,append(Romanic1, "I", Rr),
M is N - 1, f(M, Rr,Romanic).

f(N,Romanic1, Romanic) :- N = 4,append(Romanic1, "IV", Rr), 
Romanic = Rr.

f(N,Romanic1, Romanic) :- N = 5,append(Romanic1,  "V", Rr), 
Romanic = Rr.

f(N,Romanic1, Romanic) :- N < 9, append(Romanic1, "V", Rr), 
M is N - 5, f(M,Rr,Romanic).

f(N, Romanic1, Romanic) :- N = 9,append(Romanic1, "IX", Rr), 
Romanic = Rr.

f(N,Romanic1,Romanic) :- N < 40, append(Romanic1, "X", Rr), 
M is N - 10, f(M,Rr,Romanic).

f(N, Romanic1,Romanic) :- N < 50,append(Romanic1, "XL", Rr), 
M is N - 40, f(M,Rr,Romanic).

f(N,Romanic1,  Romanic) :- N = 50, append(Romanic1, "L", Rr), 
Romanic = Rr.

% 4
exercise4(Input,Output):- reverse(Input,[A|T]), 
reverse(T,N), 
append([A],N,Output),!.


% 5
exercise5(Matrix,Vector,Res):- f2(Matrix,Vector,Vector,Res),!.

f2([],_,_,[]).
f2([[H | []] | T],[VecH | []], V, [ResH | ResT]):-
ResH is H * VecH,
f2(T, V, V, ResT),!.

f2([[H | T] | T1], [VecH | V], V1, [Z | ZT]):-
f2([T | T1], V, V1, [Z1 | ZT]),
Z is VecH * H + Z1,!.


test:-exercise1([-5,-20,01,55,-5],Answer1),write(exercise1),tab(1),write(input),tab(1),write([-5,-20,01,55,-5]),tab(1),write(output),tab(1), write(Answer1),nl,
exercise2(4,[4,5,6,1,3,2,4,6,7,3,2], Answer2),write(exercise2),tab(1),write(input),tab(1),write([4,5,6,1,3,2,4,6,7,3,2]),tab(1),write(element),tab(1),write(1),tab(1),write(output),tab(1), write(Answer2),nl,
exercise3([2,3,6,41,8,31,4,14,42],Answer3),write(exercise3),tab(1),write(input),tab(1),write([2,3,6,41,8,31,4,14,42]),tab(1),write(output),tab(1), write(Answer3),nl,
exercise4([1,2,3,4,5,6,1],Answer4),write(exercise4),tab(1),write(input),tab(1),write([1,2,3,4,5,6,1]),tab(1),write(output),tab(1), write(Answer4),nl,
exercise5([[2,6,3],[3,1,5],[4,2,4]],[2,3,4],Answer5),write(exercise5),tab(1),write(input),tab(1),write([[2,6,3],[3,1,5],[4,2,4]]),tab(1),write(inputVector),tab(1),write([2,3,4]),tab(1),write(output),tab(1), write(Answer5),nl.