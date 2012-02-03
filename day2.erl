-module(day2).
-export([task_one/2]).
-export([task_two/1]).
-export([task_three/1]).

%%% Task 1: Consider a list of keyword-value tuples, such as [{erlang, "a functional language"},
%%% {ruby, "an OO language"}]. Write a function that accepts the list and a keyword and returns the
%%% associated value for the keyword.
% The anonymous function unpacks a single value from the list, or fails if the list comprehension
% produced a list with more or less than one value.
task_one(List, Key) -> (fun([H]) -> H end)([V || {K, V} <- List, K == Key]).

%%% Task 2: Consider a shopping list that looks like [{item quantity price}, ...]. Write a list
%%% comprehension that builds a list of items of the form [{item total_price}, ...], where
%%% total_price is quantity times price.
task_two(List) -> [{I, Q*P} || {I, Q, P} <- List].

%%% Task 3: Write a program that reads a tic-tac-toe board presented as a list or a tuple of size
%%% nine. Return the winner (x or o) if a winner has been determined, cat if there are no more
%%% possible moves, or no_winner if no player has won yet.

% winning conditions:
task_three([P, P, P, _, _, _, _, _, _]) when ((P == x) orelse (P == o)) -> P;
task_three([_, _, _, P, P, P, _, _, _]) when ((P == x) orelse (P == o)) -> P;
task_three([_, _, _, _, _, _, P, P, P]) when ((P == x) orelse (P == o)) -> P;
task_three([P, _, _, P, _, _, P, _, _]) when ((P == x) orelse (P == o)) -> P;
task_three([_, P, _, _, P, _, _, P, _]) when ((P == x) orelse (P == o)) -> P;
task_three([_, _, P, _, _, P, _, _, P]) when ((P == x) orelse (P == o)) -> P;
task_three([P, _, _, _, P, _, _, _, P]) when ((P == x) orelse (P == o)) -> P;
task_three([_, _, P, _, P, _, P, _, _]) when ((P == x) orelse (P == o)) -> P;

% stalemate or still playing
task_three(Board) ->
	case lists:all(fun(P) -> (P == x) orelse (P == o) end, Board) of
		true -> cat; 
		false -> no_winner
	end.
