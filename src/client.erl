-module(client).

-export([main/1]).

main(_Args) ->
    {ok, Context} = erlzmq:context(),
    {ok, Socket} = erlzmq:socket(Context, req),

    case erlzmq:connect(Socket, "ipc:///home/test") of
        ok ->
            Message = io:get_line("Input text> "),
            erlzmq:send(Socket, list_to_binary(Message)),
            {ok, Recv} = erlzmq:recv(Socket),
            io:format("Server msg: ~p\n", [Recv]);
        {error, Error} ->
            io:format("Error connect: ~p", [Error])
    end,

    erlzmq:close(Socket),
    erlang:halt(0).
