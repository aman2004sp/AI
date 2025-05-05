
% =============================================================================
% 1. Family Tree: Define family relationships
% =============================================================================

parent(john, mary).
parent(john, david).
parent(mary, alice).
parent(david, bob).

male(john).
male(david).
male(bob).
female(mary).
female(alice).

father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).

start_family :-
    write('Enter person to check if father: '), read(X),
    write('Enter child: '), read(Y),
    (father(X, Y) -> write(X), write(' is father of '), write(Y) ; write('Not father')).

% =============================================================================
% 2. Concatenate two lists
% =============================================================================

conc([], L, L).
conc([H|T], L2, [H|R]) :- conc(T, L2, R).

start_conc :-
    write('Enter first list (use dot notation, e.g. [1,2]): '), read(L1),
    write('Enter second list: '), read(L2),
    conc(L1, L2, R),
    write('Concatenated list: '), write(R), nl.

% =============================================================================
% 3. Reverse a list
% =============================================================================

reverse([], []).
reverse([H|T], R) :- reverse(T, RT), conc(RT, [H], R).

start_reverse :-
    write('Enter a list to reverse: '), read(L),
    reverse(L, R),
    write('Reversed list: '), write(R), nl.

% =============================================================================
% 4. Sum of two numbers
% =============================================================================

sum(X, Y, R) :- R is X + Y.

start_sum :-
    write('Enter first number: '), read(X),
    write('Enter second number: '), read(Y),
    sum(X, Y, R),
    write('Sum is: '), write(R), nl.

% =============================================================================
% 5. Maximum of two numbers
% =============================================================================

max(X, Y, X) :- X >= Y.
max(X, Y, Y) :- Y > X.

start_max :-
    write('Enter first number: '), read(X),
    write('Enter second number: '), read(Y),
    max(X, Y, M),
    write('Maximum is: '), write(M), nl.

% =============================================================================
% 6. Factorial of a number
% =============================================================================

factorial(0, 1).
factorial(N, F) :- N > 0, N1 is N-1, factorial(N1, F1), F is N * F1.

start_factorial :-
    write('Enter a number: '), read(N),
    factorial(N, F),
    write('Factorial is: '), write(F), nl.

% =============================================================================
% 7. Fibonacci term
% =============================================================================

generate_fib(0, 0).
generate_fib(1, 1).
generate_fib(N, T) :- N > 1,
                      N1 is N-1,
                      N2 is N-2,
                      generate_fib(N1, T1),
                      generate_fib(N2, T2),
                      T is T1 + T2.

start_fib :-
    write('Enter N to generate Nth Fibonacci term: '), read(N),
    generate_fib(N, T),
    write('Fibonacci term: '), write(T), nl.

% =============================================================================
% 8. Power of a number
% =============================================================================

power(_, 0, 1).
power(Num, Pow, Ans) :- Pow > 0,
                        P1 is Pow - 1,
                        power(Num, P1, A1),
                        Ans is Num * A1.

start_power :-
    write('Enter base number: '), read(Num),
    write('Enter power: '), read(Pow),
    power(Num, Pow, Ans),
    write('Result is: '), write(Ans), nl.

% =============================================================================
% 9. Multiply two numbers
% =============================================================================

multi(N1, N2, R) :- R is N1 * N2.

start_multi :-
    write('Enter first number: '), read(N1),
    write('Enter second number: '), read(N2),
    multi(N1, N2, R),
    write('Product is: '), write(R), nl.

% =============================================================================
% 10. Membership
% =============================================================================

memb(X, [X|_]).
memb(X, [_|T]) :- memb(X, T).

start_memb :-
    write('Enter element to search: '), read(X),
    write('Enter list: '), read(L),
    (memb(X, L) -> write('Element found.') ; write('Element not found.')), nl.

% =============================================================================
% 11. Sum of list elements
% =============================================================================

sumlist([], 0).
sumlist([H|T], S) :- sumlist(T, S1), S is H + S1.

start_sumlist :-
    write('Enter list: '), read(L),
    sumlist(L, S),
    write('Sum of elements: '), write(S), nl.

% =============================================================================
% 12. Even/Odd length
% =============================================================================

evenlength([]).
evenlength([_,_|T]) :- evenlength(T).

oddlength([_]).
oddlength([_,_|T]) :- oddlength(T).

start_length_check :-
    write('Enter list: '), read(L),
    (evenlength(L) -> write('Even length') ; write('Odd length')), nl.

% =============================================================================
% 13. Maximum in a list
% =============================================================================

maxlist([X], X).
maxlist([H|T], M) :- maxlist(T, M1), max(H, M1, M).

start_maxlist :-
    write('Enter list: '), read(L),
    maxlist(L, M),
    write('Maximum element: '), write(M), nl.

% =============================================================================
% 14. Insert at position
% =============================================================================

insert_at(1, E, L, [E|L]).
insert_at(N, E, [H|T], [H|R]) :- N > 1, N1 is N-1, insert_at(N1, E, T, R).

start_insert_at :-
    write('Enter position: '), read(N),
    write('Enter element to insert: '), read(E),
    write('Enter list: '), read(L),
    insert_at(N, E, L, R),
    write('Resultant list: '), write(R), nl.

% =============================================================================
% 15. Delete from position
% =============================================================================

delete_at(1, [_|T], T).
delete_at(N, [H|T], [H|R]) :- N > 1, N1 is N-1, delete_at(N1, T, R).

start_delete_at :-
    write('Enter position to delete: '), read(N),
    write('Enter list: '), read(L),
    delete_at(N, L, R),
    write('List after deletion: '), write(R), nl.
