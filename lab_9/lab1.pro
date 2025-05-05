predicates
nondeterm max(real, real, real).
nondeterm cutted_max(real, real, real).
nondeterm max(real, real, real, real).
nondeterm cutted_max(real, real, real, real).

clauses
max(A, B, A) :- A >= B.
max(A, B, B) :- B > A.

cutted_max(A, B, A) :- A>=B, !.
cutted_max(_, B, B).

max(A, B, C, A) :- A>B, A>C.
max(A, B, C, B) :- B>=A, B>=C.
max(A, B, C, C) :- C>=A, C>B.

cutted_max(A, B, C, A) :- A>=B, A>=C, !.
cutted_max(_, B, C, B) :- B>=C, !.
cutted_max(_, _, C, C).

goal
%max(2, 3, X).
%max(5, 3, X).
%max(-1.5, -1.5, X).

%cutted_max(2, 3, X).
%cutted_max(5, 3, X).
%cutted_max(1.5, 1.5, X).

%max(3, 2, 1, X).
%max(2, 3, 1, X).
%max(1, 2, 3, X).
%max(1, 1, 2, X).
%max(2, 1, 1, X).
%max(1, 2, 1, X).
%max(2, 2, 2, X).
%max(2, 2, 1, X).
%max(1, 2, 2, X).
%max(2, 1, 2, X).

%cutted_max(3, 2, 1, X).
%cutted_max(2, 3, 1, X).
%cutted_max(1, 2, 3, X).
%cutted_max(1, 1, 2, X).
%cutted_max(2, 1, 1, X).
%cutted_max(1, 2, 1, X).
%cutted_max(2, 2, 2, X).
%cutted_max(2, 2, 1, X).
%cutted_max(1, 2, 2, X).
cutted_max(2, 1, 2, X).