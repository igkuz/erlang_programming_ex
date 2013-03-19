- module(bool).
- export([b_not/1, b_and/2, b_nand/2]).

% отрицание

b_not(Value) ->
	true /= Value.

b_and(Value1, Value2) ->
	(true == Value1) == Value2.

b_nand(Value1, Value2) ->
	b_not(b_and(Value1, Value2)).