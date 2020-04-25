
fill :- fill(9).
fill(-1) :- !.
fill(X) :- asserta(d(X)), X1 is X-1, fill(X1).

%Скільки існує щасливих шестизначних білетів, таких, що сума перших трьох і трьох останніх рівна 10.
task11(X):- findall(R ,helper,Y), length(Y,X).
helper:- d(One), d(Two), d(Three), d(Four), d(Five), d(Six),
	10 is One*100 + Two*10 + Three + Four*100 + Five*10 + Six.

% task12
task12(X):- findall(R, task12_help,Y), length(Y,X).
task12_help :- d(Kop10), d(Kop25), d(Kop50),
            100 is Kop10*10 + Kop25*25 + Kop50*50.

% Two*Two=Three


task21(TWO, THREE):- d(T), d(W), d(O), d(H), d(R), d(E),
T \= W, T \= O, T \= H, T \= R, T \= E,
W \= O, W \= H, W \= R, W \= E,
O \= H, O \= R, O \= E,
H \= R, H \= E,
R \= E,
TWO is T*100 + W*10 + O,
THREE is TWO*TWO.

%Seven+Seven+Six=Twenty

task22(SEVEN, SIX, TWENTY):- d(S), d(E), d(V), d(N), d(I), d(X), d(T), d(W), d(Y),
S \= E, S \= V, S \= N, S \= I, S \= X, S \= T, S \= W, S \= Y,
E \= V, E \= N, E \= I, E \= X, E \= T, E \= W, E \= Y,
V \= N, V \= I, V \= X, V \= T, V \= W, V \= Y,
N \= I, N \= X, N \= T, N \= W, N \= Y,
I \= X, I \= T, I \= W, I \= Y,
X \= T, X \= W, X \= Y,
T \= W, T \= Y,
T \= Y,
SEVEN is S*10000 + E*1000 + V*100 + E*10 + N,
SIX is S*100 + I*10 + X,
TWENTY is SEVEN + SEVEN + SIX.


%task 5
pow_(_, 0, 1) :- !.
pow_(X, N, RES) :- N1 is N - 1,
                   pow_(X, N1, RES1),
                   RES is RES1 * X.


%task 3

		father(X) :- parents(_,X), married(X,_).
		sister(X) :- female(X), parents(X, Z), parents(Y, Z).
		granny(X) :- female(X), parents(Y, X), parents(Z, Y).
		uncle(X) :-  parents(Z, X), parents(Z, Y), parents(Y, _), married(X,_).
		motherinLaw(X, Y) :- female(X), parents(Z, X), female(Z), married(Y, Z).
		match(X,Y) :- married(M,F), parents(F, X), parents(M, Y).
		

female(agnes).
female(idit).
female(margo).
female(lussi).
female(sally).
female(holly).
female(gulia).
female(dori).
female(dayni).
female(matulda).
female(hortenzia).
female(depla).


	married(чоловік, дружина).
		married(mcqueen, sally).
		married(gry, lussi).
		married(mater, holly).
		married(ramone, flo).
		married(mayk, selia).

	parents(дитина, батьки).
		parents(margo, gry).
		parents(idit,gry).
		parents(agnes,lussi).
		parents(gry,gulia).
		parents(dru, gulia).
		parents(gulia, ghost).
		parents(nafario, ghost).
		parents(lussi, baltazar).
		parents(rom, baltazar).
		parents(kevin,rom ).
		parents(idit,rom ).
		parents(sally, ramon ).
		parents(ramon, doluvay).
		parents(luidgy, doluvay).
		parents(gvido,luidgy).
		parents(mcqueen, doc).
		parents(sally, flo).
		parents(carera, flo).
		parents(holly,carera).
		parents(dori, sally).
		parents(mac, sally).
		parents(donald, dak).
		parents(dayni, dak).
		parents(matulda, dayni).
		parents(donald, hortenzia).
		parents(depla,hortenzia).
		parents(huey, matulda).
		parents(dewey, matulda).
		parents(louie, matulda).
		parents(mayk, wazowski).
		parents(selia, vantuz).
		parents(wazowski, chak).
		parents(duck, chak).

