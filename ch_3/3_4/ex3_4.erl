-module(ex3_4).
-export([new/0, destroy/1, write/3]).

new() -> [].
destroy(_Db) -> ok.

write(Key, Value, []) ->
  [{Key, Value}];
write(Key, Value, _Db) ->
  [{Key, Value} | _Db].
