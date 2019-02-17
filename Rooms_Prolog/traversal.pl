/* COMP 3220 - Project 3 */
/* Dargo Wang */

%%%%%%%%% facts %%%%%%%%%

%% changable
phone(5).
phone(9).
phone(16).

%% non-changable
door(1,2).
door(5,6).
door(1,7).
door(2,8).
door(3,8).
door(4,8).
door(4,9).
door(5,9).
door(6,9).
door(7,8).
door(7,9).
door(7,10).
door(7,11).
door(7,12).
door(7,13).
door(7,14).
door(14,15).
door(15,16).


%%%%%%%%% basic rules %%%%%%%%%

connected(X,Y) :- door(X,Y); door(Y,X).

path_to_phone(Start, End, Path) :-
                phone(End),
                travel(Start, End, Path, []).

travel(Start, End, [Start|Path], Visited) :-
                phone(End),
                connected(Start, Next),
                Next \== End,
                \+member(Start, Visited),
                travel(Next, End, Path, [Start|Visited]).

travel(Start, End, Path, Visited) :-
                phone(End),
                connected(Start, End),
                \+member(Start, Visited),
                nth1(1, Path, Start),
                nth1(2, Path, End),
                length(Path, 2).


%%%%%%%%% Bonus - min %%%%%%%%%

min_path_to_phone(Start, End, Path, Distance) :-
                phone(End),
                findall(Path, path_to_phone(Start, End, Path), List),
                min(Path, List),
                length(Path, Num),
                Distance is Num - 1.

min(Path, List) :-
    List = [H|T],
    T = [],
    Path = H.

min(Path, List) :-
    List = [H|T],
    length(T, 1),
    min(D, T),
    length(H, S),
    length(D, SS),
    S @> SS,
    Path = D.

min(Path, List) :-
    List = [H|T],
    length(T, 1),
    min(D, T),
    length(H, S),
    length(D, SS),
    S @=< SS,
    Path = H.

min(Path, List) :-
    List = [H|T],
    T \== [],
    \+length(T, 1),
    min(Pnext, T),
    NewList = [H, Pnext],
    min(Path, NewList).

%%%%%%%% Bonus - max %%%%%%%%%

max_path_to_phone(Start, End, Path, Distance) :-
                phone(End),
                findall(Path, path_to_phone(Start, End, Path), List),
                max(Path, List),
                length(Path, Num),
                Distance is Num-1.

max(Path, List) :-
    List = [H|T],
    T = [],
    Path = H.

max(Path, List) :-
    List = [H|T],
    length(T, 1),
    max(D, T),
    length(H, S),
    length(D, SS),
    S @< SS,
    Path = D.

max(Path, List) :-
    List = [H|T],
    length(T, 1),
    max(D, T),
    length(H, S),
    length(D, SS),
    S @>= SS,
    Path = H.

max(Path, List) :-
    List = [H|T],
    T \== [],
    \+length(T, 1),
    max(Pnext, T),
    NewList = [H, Pnext],
    max(Path, NewList).
