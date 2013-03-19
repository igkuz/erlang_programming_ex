- module(ex3_1).
- export([sum/1, sum/2]).

% Ex. 3.1

sum(N) -> sum_acc(1, N, 0).

sum_acc(Index, Boundary, Sum) when Index =< Boundary ->
	sum_acc(Index + 1, Boundary, Sum + Index);
sum_acc(_I, _B, Sum) ->
	Sum.
	
% Ex. 3.1 p2
% We need our process to terminate abnormally when N > M

sum(N,M) -> sum_acc2(N, M, 0).

sum_acc2 (Start, Boundary, Sum) when Start < Boundary ->
	sum_acc2(Start+1, Boundary, Sum + Start);
sum_acc2 (Start, Boundary, Sum) when Start == Boundary ->
	Sum + Boundary.