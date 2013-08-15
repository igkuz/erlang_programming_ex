- module(ex3_3).
- export([print_numbers/1]).

% Ex. 3.3 prin numbers from 1 to N

print_numbers(0) -> ok;
print_numbers(N) -> print_num(1, N).

print_num(1, 0) -> ok;
print_num(Index, Boundary) when Index =< Boundary ->
  io:format("Number: ~p~n", [Index]),
  print_num(Index + 1, Boundary);
print_num(_Index, _Boundary) -> ok.
