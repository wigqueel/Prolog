d(0). d(1). d(2). d(3). d(4). d(5). d(6). d(7). d(8). d(9).

odd(X) :- 1 is mod(X, 2).

% Task 1
task1(X):-
	d(A), A>0,odd(A),
	d(B),odd(B),d(C),odd(C),
	
	X is 100*A+B*10+C,
    Y is 10*A+C,
    0 is mod(X, Y).

% Task 2
task2(X) :-
    d(A),A>0,
    d(B),
    d(C),
    d(D),A = B,C = D,

    X is 1000*A+B*100+C*10+D,
    Z is round(sqrt(X)),
    X is Z*Z.

% Task 3
task3_help(Y) :-
    d(A),
    d(B),
    d(C),
    d(D),
    Y is 1000*A+100*B+C*10+D,
    Y > 0,
    Y < 1999,
    \+ 0 is mod(Y, 6),
    \+ 0 is mod(Y, 10),
    \+ 0 is mod(Y, 15).

task3(X) :- 
    findall(Q, task3_help(Q), Y),
    length(Y, X).

% Task 4
task4_helper(X, Y, Res) :-
    X < Y,
    X1 is X + 1,
    task4_helper(X1, Y, TempRes),
    Res is X + TempRes, !.

task4(X) :-
    d(A),
    d(B),
    d(C),
    d(D),
    
    X is 1000*A + 100*B + 10 * C + D,
    Z is X*X + (X+1) * (X+1) + (X+2) * (X+2) + (X+3) * (X+3) + (X+4) * (X+4)
    + (X+5) * (X+5) + (X+6) * (X+6) + (X+7) * (X+7) + (X+8) * (X+8) + (X+9) * (X+9)
    + (X+10) * (X+10),
    Q is round(sqrt(Z)),
    Z is Q*Q.

% Task 5
task5_helper(1, 9, 9, 8, I, I) :- !.
task5_helper(A, B, C, D, C, R) :-
    Sum is A + B + C + D,
    Next is mod(Sum, 10),
    C1 is C + 1,
    helper5(B, C, D, Next, C1, R).

task5(R) :-
    helper5(8, 7, 3, 7, 7, R),
    !.