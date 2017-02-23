palindrome?(L):-
	(reverse(L,R), check(L,R)).

check([H|T], [H1|T1]):-
	(last([H|T], H) -> (H = H1 -> (printword([H|T]), writeln(" is a palindrome.")) ; false) ;
	(H = H1 -> check(T,T1) ; false)).

printword([H|T]):-
	(T = [] -> write(H) ; (write(H), printword(T))).