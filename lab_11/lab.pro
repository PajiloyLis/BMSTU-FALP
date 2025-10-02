domains
integer_list = integer*
list = integer_list*
predicates
nondeterm len(list, integer).
nondeterm len(integer_list, integer).
nondeterm recLen(list, integer, integer).
nondeterm recLen(integer_list, integer, integer).
nondeterm sum(integer_list, integer, integer).
nondeterm sum(integer_list, integer).
nondeterm oddSum(integer_list, integer).
nondeterm oddSum(integer_list, integer, integer, integer).
nondeterm filter(integer_list, integer, integer_list).
nondeterm removeElem(integer_list, integer, integer_list).
nondeterm extend(integer_list, integer_list, integer_list).
clauses
	recLen([], Ans, Ans) :- !.
	recLen([_|Tail], Ans, CurAns) :-
		NewCurAns = CurAns+1,
		recLen(Tail, Ans, NewCurAns).
	len(List, Ans) :-
		recLen(List, Ans, 0).
		
	sum([], Ans, Ans) :- !.
	sum([Head|Tail], Ans, Acc):- 
		NewAcc = Acc + Head,
		sum(Tail, Ans, NewAcc).
	sum(List, Ans):-
		sum(List, Ans, 0).
		
	oddSum([], Ans, Ans, _):- !.
	oddSum([_|Tail], Ans, Acc, 0):- oddSum(Tail, Ans, Acc, 1), !.
	oddSum([Head|Tail], Ans, Acc, 1):- NewAcc = Acc+Head, oddSum(Tail, Ans, NewAcc, 0).
	oddSum(List, Ans) :- oddSum(List, Ans, 0, 0).
	
	filter([], _, []):- !.
	filter([Head|Tail], Barier, Ans) :- Head<= Barier, filter(Tail, Barier, Ans), !.
	filter([Head|Tail], Barier, [Head|Ans]) :- filter(Tail, Barier, Ans).
	
	removeElem([], _, []):- !.
	removeElem([Elem|Tail], Elem, Ans) :- removeElem(Tail, Elem, Ans), !	.
	removeElem([Head|Tail], Elem, [Head|Ans]) :- removeElem(Tail, Elem, Ans).
	
	extend([], Second, Second) :- !.
	extend([Head|Tail], Second, [Head|Ans]):-extend(Tail, Second, Ans).
goal
	%len([[1], [2, 3]], X). 
	%len([], X).
	%len([1, 2, 3], X).
	%sum([1, 2, 3, 4, 5, -1], X).
	%oddSum([1], X).
	%oddSum([], X).
	%oddSum([1, 2, 3,4 ,5 ,6], X).
	%filter([1, 5, 2, 3, 4, 6], 3, X).
	%filter([], 10, X).
	%filter([1, 2, 3], 4, X).
	%filter([11, 2, 3], 0, X).
	%removeElem([1, 2, 1, 2, 1], 1, X).
	%removeElem([], 4, X).
	%removeElem([1, 2, 3, 4, 5], 6, X).
	%removeElem([1,1,1,1,1], 1, X).
	%extend([1, 2, 3], [4, 5, 6], X).
	%extend([], [1, 2, 3], X).
	extend([1, 2, 3], [], X).
