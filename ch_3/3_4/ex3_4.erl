-module(ex3_4).
-export([new/0, destroy/1, write/3, read/2]).

new() -> [].
destroy(_Db) -> ok.

write(Key, Value, []) ->
  [{Key, Value}];
write(Key, Value, [{Key, _}|Tail]) ->
  [{Key, Value} | Tail];
write(Key, Value, _Db) ->
  [{Key, Value} | _Db].

read(_, []) ->
  {error, instance};
read(Key, [{Key, Value} | _]) ->
  Value;
read(Key, [_|Tail]) ->
  read(Key, Tail).
