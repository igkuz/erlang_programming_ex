-module(echo).
-export([start/0, stop/0, loop/0, print/1]).

start() ->
  Pid = spawn(echo, loop, []),
  register(loop, Pid),
  {ok, Pid}.

stop() ->
  loop ! stop,
  io:format("Server stopped~n"),
  ok.

print(Msg) ->
  loop ! {request, self(), Msg},
  receive
    {response, Msg} ->
      io:format("~w~n", [Msg])
  end.

loop() ->
  receive
    stop ->
      true;
    {request, Pid, Msg} ->
      Pid ! {response, Msg},
      loop()
  end.
