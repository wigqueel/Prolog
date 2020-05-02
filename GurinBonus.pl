% FOR TEST: 
% answer(FishMan).


home(_,_,_,_,_).


answer(Fishman) :- einstein(Fishman, Susid).



einstein(Fishman, Susid) :-

Susid = [_,_,_,_,_],

numEl(1, Susid, home(norw,_,_,_,_)),

member(home(eng,_,_,_,red), Susid),

f(home(_,_,_,_,green), home(_,_,_,_,white), Susid),

member(home(dane,_,_,tea,_), Susid),

areNeighbours(home(_,_,marlboro,_,_), home(_,cat,_,_,_), Susid),

member(home(_,_,dunhill,_,yellow), Susid),

member(home(german,_,rothmans,_,_), Susid),

numEl(3, Susid, home(_,_,_,milk,_)),

areNeighbours(home(_,_,marlboro,_,_), home(_,_,_,water,_), Susid),

member(home(_,bird,pallmall,_,_), Susid),

member(home(swed,dog,_,_,_), Susid),

areNeighbours(home(norw,_,_,_,_), home(_,_,_,_,blue), Susid),

member(home(_,horse,_,_,blue), Susid),

member(home(_,_,winfield,beer,_), Susid),

member(home(_,_,_,coffee,green), Susid),

member(home(Fishman,fish,_,_,_), Susid), !.


f(Left, Right, [Left, Right | _]).

f(Left, Right, [_ | Rest]) :- f(Left, Right, Rest).


areNeighbours(X, Y, List) :- f(X, Y, List).

areNeighbours(X, Y, List) :- f(Y, X, List).


numEl(1, [Elem | _], Elem).

numEl(N, [_ | Rest], Elem) :- N > 1,

N1 is N-1, 

numEl(N1, Rest, Elem).
