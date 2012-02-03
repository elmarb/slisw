-module(day1).
-export([count_words/1]).
-export([count_to/1]).
-export([message/1]).

count_words(S) -> count_words(0, S).

% skip leading spaces
count_words(Acc, [32 | Tail]) -> count_words(Acc, Tail);

% first two characters are [non-space, space]
% that's one more word, and continue counting after the space
count_words(Acc, [_, 32 | Tail]) -> count_words(Acc+1, Tail);

% first two character are both non-spaces
% advance one character and keep going
count_words(Acc, [_, Second | Tail]) -> count_words(Acc, [Second | Tail]);

% terminate when there are no more characters left
count_words(Acc, "") -> Acc;

% exactly one non-space character left
% that's one more word
count_words(Acc, [_]) -> Acc+1.


count_to(N) -> count_to(N, 1).

count_to(N, N) ->
	    io:format("~w~n", [N]);
count_to(N, M) ->
	    io:format("~w~n", [M]),
	    count_to(N, M+1).


message({error, Message}) -> io:format("error: ~w~n", Message);
message(success) -> io:format("success~n", []).
