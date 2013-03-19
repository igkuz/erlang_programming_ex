- module(demo).
- export([double/1]).

% пробный комментарий
% сейчас посмотрим как вообще работать с этим эрлангом

double(Value) ->
	times(Value,2).
times(X,Y) ->
	X*Y.
