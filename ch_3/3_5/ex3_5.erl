-module(ex3_5).
-export([filter/2, reverse/1, concatenate/1]).

% Excersize 3 part 5 filter function

filter(List, Boundary) -> filter_list(List, Boundary).

filter_list([], _) ->
  [];
filter_list([H|T], Boundary) when Boundary >= H ->
  [H| filter_list(T, Boundary)];
filter_list([_|T], Boundary) ->
  filter_list(T, Boundary).

% Excersize 3 part 5 reverse function

reverse(List) -> reverse_acc(List, []).

reverse_acc([], Acc) ->
  Acc;
reverse_acc([H | T], Acc) ->
  reverse_acc(T, [H | Acc]).

% Excersize 3 part 5 concatenate func

concatenate(List) -> conc_acc(List, []).

conc_acc([H | T], Acc) ->
  conc_acc(T, Acc ++ H);
conc_acc([], Acc) ->
  Acc.
