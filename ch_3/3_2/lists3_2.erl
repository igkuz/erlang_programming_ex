- module(lists3_2).
- export([create/1, reverse_create/1]).

% Ex. 3.2 create list

create(N) -> create_list(N-1, [N]).


create_list(Index, List) when Index > 0 ->
	create_list(Index-1, [Index | List]);
create_list(0, List) ->
	List;	
create_list(_ , _List) ->
	{error, badarg}.
	
% Ex. 3.2 reverse_create list

reverse_create(N) -> reverse_list(N-1, [N]).

reverse_list(Index, List) when Index > 0 ->
	reverse_list(Index-1, [List | [Index]]);
reverse_list(0, List) ->
	[List | []];
reverse_list(_, _List) ->
	{error, badarg}.