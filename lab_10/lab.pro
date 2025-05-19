predicates
nondeterm factorial(integer, integer, integer).
nondeterm factorial(integer, integer).

nondeterm fibonacci(integer, integer).
nondeterm fibonacci(integer, integer, integer, integer).

clauses
factorial(N, Ans) :- factorial(N, 1, Ans).
factorial(0, Acc, Acc) :- !.
factorial(N, Acc, Ans) :- 
    Acc1 = Acc*N,
    N1 = N - 1,
    factorial(N1, Acc1, Ans).
fibonacci(N, Ans) :- 
	fibonacci(N, Ans, 1, 0).
fibonacci(0, Ans, _, Ans) :- !.
fibonacci(1, Ans, Ans, _) :- !.
fibonacci(N, Ans, Prev, PrevPrev) :- 
	N1 = N-1,
	NewPrev = Prev+PrevPrev,
	fibonacci(N1, Ans, NewPrev, Prev).

goal
%factorial(6, X).
%factorial(5, X).
%factorial(1, X).
%factorial(0, X).
%fibonacci(0, X).
%fibonacci(1, X).
%fibonacci(2, X).
%fibonacci(3, X).
%fibonacci(5, X).
fibonacci(10, X).