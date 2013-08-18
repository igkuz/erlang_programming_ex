-module(ex3_5).
-export([filter/2]).

% Excersize 3 part 5

filter(List, Boundary) -> filter_list(List, Boundary).

filter_list([], _) ->
  [];
filter_list([H|T], Boundary) when Boundary >= H ->
  [H| filter_list(T, Boundary)];
filter_list([_|T], Boundary) ->
  filter_list(T, Boundary).
