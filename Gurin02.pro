%division
subs(X,Y):-Y is X-1.         
minim(X,Y,Z):-Z is X-Y.
divide(_,0,_,_,_):-!.
divide(X,Y,Z,C,K):-C is Z*(-1),K is X,X<Y.
divide(X,Y,Z,C,K):-minim(X,Y,X1),subs(Z,Z1),divide(X1,Y,Z1,C,K).
resultdivide(X,Y,Z,C):-divide(X,Y,0,Z,C).

%power
pow(X, 0, 1):-!.
pow(X, Y, R):-Y>0,!,Y1 is Y-1,pow(X,Y1,N),R is N*X.

powLog(_, 0, 1) :- !.
powLog(X, POW, RES) :- mod(POW, 2) =:= 1, X1 is X ** 2,
                   POW_N is POW >> 1,powLog(X1, POW_N, RES1),
                   RES is X * RES1, !.
powLog(X, POW, RES) :- mod(POW, 2) =:= 0,X1 is X ** 2,
                   POW_N is POW >> 1,powLog(X1, POW_N, RES1),
                   RES is RES1, !.

%fibonacci
fib(0, 1) :- !.
fib(1, 1) :- !.
fib(N, Result) :- N1 is N - 1, N2 is N - 2, fib(N1, Result1), fib(N2, Result2), Result is Result1 + Result2.

%simple
simple(A):-A<2,!.
simple(A):-prime(A,R,2),write(R),nl,A1 is A div R, simple(A1). 
prime(A,_,Z):-A<Z,!.
prime(A,X,Z):-I is A mod Z, I=0, X is Z,!.
prime(A,X,Z):-Z1=Z+1, prime(A,X,Z1).	

%sumOfNumbers 
factorial(0,1):-!.
factorial(X,Y):-X1 is X-1, factorial(X1,Y1), Y is X*Y1.
sum(X,Y,Z,Y):-X<Z,!.
sum(X,Y,Z,E):-factorial(Z, D), E1 is E+(1/D), Z1 is Z+1, sum(X,Y,Z1,E1).
ressum(X,Y):-sum(X,Y,1,0).