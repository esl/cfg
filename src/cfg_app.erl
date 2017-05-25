-module(cfg_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

-spec start(Type :: application:start_type(), Args :: term()) ->
  {ok, Pid :: pid()} |
  {error, Reason :: term()}.
start(_Type, _Args) ->
  case cfg_sup:start_link() of
    {ok, Pid} ->
      {ok, Pid};
    Else ->
      {error, Else}
  end.

-spec stop(State :: term()) ->
  ok.
stop(_State) ->
  ok.