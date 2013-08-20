-module(my_db).
-export([start/0, stop/0, loop/1]).
-export([write/2, read/1, match/1]).

start() ->
  Pid = spawn_link(my_db, loop, [[]]),
  register(db_main_loop, Pid),
  ok.

stop() ->
  db_main_loop ! stop,
  ok.

write(Key, Value) ->
  db_main_loop ! {write, Key, Value},
  ok.

read(Key) ->
  db_main_loop ! {read, self(), Key},
  receive
    Reply -> Reply
  end.

match(Value) ->
  db_main_loop ! {match, self(), Value},
  receive
    Reply -> Reply
  end.

loop(Db) ->
  receive
    stop ->
      true;
    {write, Key, Value} ->
      NewDb = write(Key, Value, Db),
      loop(NewDb);
    {read, Pid, Key} ->
      Pid ! read(Key, Db),
      loop(Db);
    {match, Pid, Value} ->
      Pid ! match(Value, Db),
      loop(Db)
  end.

% functionality


% writing to Db

write(Key, Value, Db) ->
  write(Key, Value, Db, []).

write(Key, Value, [], NewDb) ->
  [{Key, Value} | NewDb];
write(Key, Value, [{Key, _} | Tail], NewDb) ->
  [{Key,Value} | NewDb] ++ Tail;
write(Key, Value, [H | T], NewDb) ->
  write(Key, Value, T, [H | NewDb]).

% reading element from Db

read(_, []) ->
  {error, instance};
read(Key, [{Key, Value} | _]) ->
  {ok, Value};
read(Key, [_ | T]) ->
  read(Key, T).

% finding Keys for giving value

match(Value, Db) ->
  match(Value, Db, []).

match(_, [], _KeyList) ->
  [];
match(Value, [ {Key, Value} | T], KeyList) ->
  match(Value, T, KeyList) ++ [Key | KeyList];
match(Value, [_ | T], KeyList) ->
  match(Value, T, KeyList).
