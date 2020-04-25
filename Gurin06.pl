% 1-----------------------------------------------------------------------------------

% exercise1(avlTree(avlTree(nil,1,nil),2,avlTree(avlTree(nil,3,nil),4,avlTree(nil,5,nil))),X).
% [1,2,3,4,5]

exercise1(nil, []).
exercise1(avlTree(Left, Value, Right), ValueX) :- exercise1(Left, LeftX),
exercise1(Right, RightX),
append(LeftX, [Value|RightX], ValueX).


% 2-----------------------------------------------------------------------------------

% exercise2(2, avlTree(avlTree(nil,1,nil),2,avlTree(avlTree(nil,3,nil),4,avlTree(nil,5,nil)))).
% yes
% exercise2(10, avlTree(avlTree(nil,1,nil),2,avlTree(avlTree(nil,3,nil),4,avlTree(nil,5,nil)))).
% no

exercise2(Value, avlTree(_,Value,_)) :- !.
exercise2(Value, avlTree(Left,_,_)) :- exercise2(Value, Left).
exercise2(Value, avlTree(_,_,Right)) :- exercise2(Value, Right).


% 3------------------------------------------------------------------------------------

% exercise3(avlTree(avlTree(nil,1,nil),2,avlTree(avlTree(nil,3,nil),4,avlTree(nil,5,nil)))).
% yes
% exercise3(avlTree(avlTree(nil,1,nil),2,avlTree(avlTree(nil,3,nil),4,avlTree(nil,5,avlTree(nil,3,nil))))).
% no

exercise3(Tree):-exercise3(_,Tree).
exercise3(0,nil).
exercise3(H, avlTree(Left,Value,Right)):-exercise3(HLeft, Left), 
exercise3(HRight, Right),
(HLeft is HRight;
HLeft is HRight+1;
HLeft is HRight-1),
f(H,HLeft,HRight).

f(H,HLeft,HRight):- HLeft > HRight,
!, 
H is HLeft+1; 
H is HRight+1.


% 4---------------------------------------------------------------------------------------

% exercise4(3,nil,nil).
% 3 not found.
% exercise4(0,biTree(biTree(nil,1,nil),2,biTree(biTree(nil,3,nil),4,biTree(nil,5,nil))), X).
% X = biTree(biTree(nil,1,nil),2,biTree(biTree(nil,3,nil),4,biTree(nil,5,nil)))               - nothing changed
% exercise4(2,biTree(biTree(nil,1,nil),2,biTree(biTree(nil,3,nil),4,biTree(nil,5,nil))), X).
% X = biTree(nil,1,biTree(biTree(nil,3,nil),4,biTree(nil,5,nil)))                             - deleted

exercise4(Value, nil, nil):-write(Value), write(' not found.'),!.
exercise4(Value, biTree(Lelf, Value, nil), Lelf):-!.
exercise4(Value, biTree(nil, Value, Right), Right):-!.
exercise4(Value, biTree(Lelf, Value, Right), biTree(NLelf, Pred, Right)):-!, 
ff(Lelf, Pred, NLelf).
exercise4(Value, biTree(Lelf, V, Right), biTree(NLelf, V, Right)):-Value<V, !, 
exercise4(Value, Lelf, NLelf).
exercise4(Value, biTree(Lelf, V, Right), biTree(Lelf, V, NRight)):- exercise4(Value, Right, NRight).

ff(biTree(Lelf, Pred, nil), Pred, Lelf):-!.
ff(biTree(Lelf, Value, Right), Pred, biTree(Lelf, Value, NRight)):-ff(Right, Pred, NRight).

