
% 2. Concatenate Two Lists
conc([], L, L).
conc([H|T], L2, [H|R]) :- conc(T, L2, R).

concat_user_input :-
    write('Enter first list (e.g. [1,2]): '), read(L1),
    write('Enter second list (e.g. [3,4]): '), read(L2),
    conc(L1, L2, L3),
    format('Concatenated List: ~w~n', [L3]).

% 3. Reverse a List
reverse_list([], []).
reverse_list([H|T], R) :- reverse_list(T, RT), conc(RT, [H], R).

reverse_user_input :-
    write('Enter list to reverse (e.g. [1,2,3]): '), read(L),
    reverse_list(L, R),
    format('Reversed List: ~w~n', [R]).

% 4. Sum of Two Numbers
sum_user_input :-
    write('Enter first number: '), read(X),
    write('Enter second number: '), read(Y),
    S is X + Y,
    format('Sum: ~w~n', [S]).

% 5. Maximum of Two Numbers
max_user_input :-
    write('Enter first number: '), read(X),
    write('Enter second number: '), read(Y),
    (X >= Y -> M = X ; M = Y),
    format('Maximum: ~w~n', [M]).

% 6. Factorial
factorial(0, 1).
factorial(N, F) :- N > 0, N1 is N - 1, factorial(N1, F1), F is N * F1.

factorial_user_input :-
    write('Enter a number: '), read(N),
    factorial(N, F),
    format('Factorial: ~w~n', [F]).

% 7. Fibonacci Nth Term
fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, F) :- N > 1, N1 is N - 1, N2 is N - 2,
                   fibonacci(N1, F1), fibonacci(N2, F2),
                   F is F1 + F2.

fibonacci_user_input :-
    write('Enter N: '), read(N),
    fibonacci(N, F),
    format('Nth Fibonacci: ~w~n', [F]).

% 8. Power of Number
power(_, 0, 1).
power(X, N, R) :- N > 0, N1 is N - 1, power(X, N1, R1), R is X * R1.

power_user_input :-
    write('Enter base: '), read(X),
    write('Enter exponent: '), read(N),
    power(X, N, R),
    format('Result: ~w~n', [R]).

% 9. Multiply Two Numbers
multiply(X, Y, R) :- R is X * Y.

multiply_user_input :-
    write('Enter first number: '), read(X),
    write('Enter second number: '), read(Y),
    multiply(X, Y, R),
    format('Product: ~w~n', [R]).

% 10. Member of a List
memb(X, [X|_]).
memb(X, [_|T]) :- memb(X, T).

member_user_input :-
    write('Enter element to search: '), read(X),
    write('Enter list: '), read(L),
    (memb(X, L) -> writeln('Found.') ; writeln('Not found.')).

% 11. Sum of List
sumlist([], 0).
sumlist([H|T], S) :- sumlist(T, ST), S is H + ST.

sumlist_user_input :-
    write('Enter a list of numbers: '), read(L),
    sumlist(L, S),
    format('Sum of list: ~w~n', [S]).

% 12. Even/Odd Length List
evenlength([]).
evenlength([_,_|T]) :- evenlength(T).

oddlength([_]).
oddlength([_,_|T]) :- oddlength(T).

length_type_user_input :-
    write('Enter a list: '), read(L),
    (evenlength(L) -> writeln('Even length') ; writeln('Odd length')).

% 13. Max Element in List
maxlist([X], X).
maxlist([H|T], M) :- maxlist(T, M1), M is max(H, M1).

maxlist_user_input :-
    write('Enter a list of numbers: '), read(L),
    maxlist(L, M),
    format('Maximum: ~w~n', [M]).

% 14. Insert at Nth Position
insert_at(0, X, L, [X|L]).
insert_at(N, X, [H|T], [H|R]) :- N > 0, N1 is N - 1, insert_at(N1, X, T, R).

insert_user_input :-
    write('Enter element to insert: '), read(X),
    write('Enter position (0-based): '), read(N),
    write('Enter list: '), read(L),
    insert_at(N, X, L, R),
    format('Updated List: ~w~n', [R]).

% 15. Delete Nth Element
delete_at(0, [_|T], T).
delete_at(N, [H|T], [H|R]) :- N > 0, N1 is N - 1, delete_at(N1, T, R).

delete_user_input :-
    write('Enter position to delete (0-based): '), read(N),
    write('Enter list: '), read(L),
    delete_at(N, L, R),
    format('Updated List: ~w~n', [R]).
