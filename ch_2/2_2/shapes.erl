- module(shapes).
- export([area/1]).
- import(math, [sqrt/1]).
- import(math, [pi/0]).

% попробуем сделать свой первый модуль

area({square, Side}) ->
	Side * Side;
area({circle, Radius}) -> 
	pi() * Radius * Radius;
area({triangle, A, B, C}) ->
	S = (A+B+C)/2,
	sqrt(S*(S-A)*(S-B)*(S-C));
area(_Other) ->
	{error, invalid_object}.
	