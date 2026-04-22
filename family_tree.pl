% ==========================================
% Family Tree Program in Prolog
% ==========================================

% ---------- Basic Facts ----------
% Gender facts
male(john).
male(mike).
male(david).
male(tom).
male(chris).
male(kevin).
male(alex).

female(mary).
female(susan).
female(linda).
female(emma).
female(anna).
female(sophia).

% Parent facts
parent(john, mike).
parent(mary, mike).

parent(john, susan).
parent(mary, susan).

parent(mike, chris).
parent(linda, chris).

parent(mike, emma).
parent(linda, emma).

parent(susan, kevin).
parent(david, kevin).

parent(susan, anna).
parent(david, anna).

parent(chris, alex).
parent(sophia, alex).

parent(tom, john).
parent(emma, john).

% ---------- Derived Relationships ----------

% Child
child(X, Y) :-
    parent(Y, X).

% Father
father(X, Y) :-
    parent(X, Y),
    male(X).

% Mother
mother(X, Y) :-
    parent(X, Y),
    female(X).

% Grandparent
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% Grandfather
grandfather(X, Y) :-
    grandparent(X, Y),
    male(X).

% Grandmother
grandmother(X, Y) :-
    grandparent(X, Y),
    female(X).

% Sibling
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

% Brother
brother(X, Y) :-
    sibling(X, Y),
    male(X).

% Sister
sister(X, Y) :-
    sibling(X, Y),
    female(X).

% Cousin
cousin(X, Y) :-
    parent(A, X),
    parent(B, Y),
    sibling(A, B),
    X \= Y.

% Descendant (recursive)
descendant(X, Y) :-
    parent(Y, X).

descendant(X, Y) :-
    parent(Z, X),
    descendant(Z, Y).