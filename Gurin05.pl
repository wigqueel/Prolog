

%exercise 1

exercise1(nil, []).
exercise1(tree(L, X, R), Res) :- exercise1(L, L1), 
exercise1(R, R1), 
append(L1, [X|R1], Res).



%exercise 2

exercise2(nil,0).
exercise2(tree(nil,X,nil),1).
exercise2(tree(Left,X,Right), R):- exercise2(Left,Ll),
exercise2(Right,Rr),
R is Ll+Rr.



%exercise 3

exercise3(nil,0).
exercise3(tree(Left, _, Right), R) :- exercise3(Left, Height0), 
exercise3(Right, Height1),
Height2 is max(Height0, Height1), 
R is Height2+1.



%exercise 4

exercise4(nil, 0).
exercise4(tree(Left, _, Right), R) :- exercise4(Left, Ll),
exercise4(Right, Rr), 
R is 1+Ll + Rr.



%exercise 5

exercise5(Tree):- write('up to: '), show(Tree,0).
show(nil,_).
show(l(A), H):- write(A).
show(n2(TL, M, TR), H):- H1 is H + 1, 
show(TR,H1),
write(M), 
write(','), 
tab(1), 
show(TL,H1).
show(n3(TL, M, TM, M1, TR), H):- H1 is H + 1 , 
show(TR, H1), 
write(M1),
write(','), 
tab(1), 
show(TM, H1), 
write(M), 
write(','), 
tab(1), 
show(TL, H1).
 
 
 
 
%exercise 6

exercise6(X, a2(_,X,_)):- write('El found - '), 
write(X),!.
exercise6(X,a3(_,X,_,_,_)):- write('El found - '), 
write(X),!.
exercise6(X,a3(_,_,_,X,_)):- write('El found - '), 
write(X),!.
exercise6(X,a2(T1,_,_)):-exercise6(X,T1).
exercise6(X,a2(_,_,T2)):-exercise6(X,T2).
exercise6(X,a3(T1,_,T2,_,T3)):-exercise6(X,T1), 
exercise6(X,T2), 
exercise6(X,T3).

%exercise 7.1

exercise71(nil).
exercise71(tree(Left, _, Right)):- exercise71(Left),
exercise71(Right).

%exercise 7.2

exercise72(nil).
exercise72(tree(Left, _, Right)):- exercise72(Left), 
exercise72(Right).
exercise72(tree(Left, _, Right, R)):- exercise72(Left), 
exercise72(Right), 
exercise72(R).


% exercise1(tree(tree(tree(nil, 1, nil), 2, tree(nil, 3, nil)), 4, tree(tree(tree(nil, 5, nil), 6, tree(nil, 7, nil)), 8, tree(nil, 9, nil))),X).
% [1,2,3,4,5,6,7,8,9]

% exercise2(tree(tree(tree(nil, 1, nil), 2, tree(nil, 3, nil)), 4, tree(tree(tree(nil, 5, nil), 6, tree(nil, 7, nil)), 8, tree(nil, 9, nil))),X).
% 5

% exercise3(tree(tree(tree(nil, 1, nil), 2, tree(nil, 3, nil)), 4, tree(tree(tree(nil, 5, nil), 6, tree(nil, 7, nil)), 8, tree(nil, 9, nil))),X).
% 4

% exercise4(tree(tree(tree(nil, 1, nil), 2, tree(nil, 3, nil)), 4, tree(tree(tree(nil, 5, nil), 6, tree(nil, 7, nil)), 8, tree(nil, 9, nil))),X).
% 9

% exercise5(n2(n2(n3(n2(nil,1,nil),3,n2(nil,3,nil),4,n2(nil,4,nil)),5,n2(n2(nil,5,nil),7,n2(nil,7,nil))),8,n2(n3(n2(nil,8,nil),10,n2(nil,10,nil),12,n2(nil,12,nil)),13,n2(nil,15,nil)))).
% 15, 13, 12, 12, 10, 10, 8, 8, 7, 7, 5, 5, 4, 4, 3, 3, 1,

% exercise6(n2(n2(nil,7,nil),1,n2(nil,20,nil)),30).
% no

% exercise71(tree(tree(tree(nil, 1, nil), 2, tree(nil, 3, nil)), 4, tree(tree(nil, 5, nil), 6, tree(nil, 7, nil)))).
% yes 

% exercise71(tree(tree(nil, nil), 1, tree(nil, 1, nil))).
% no

% exercise72(tree(tree(nil,1,nil),2,tree(nil,3,nil))).
% yes