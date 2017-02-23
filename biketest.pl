basicpart(axle).
basicpart(frame).
basicpart(rim).
basicpart(gear).
basicpart(spokes).
basicpart(tire).


assembly(bike, [wheel, wheel, frame]).
assembly(wheel, [hub, rim, axle, tire]).
assembly(hub, [gear, spokes]).


test(Part,PartsList):-
	(basicpart(Part) -> append([], [Part], PartsList) ;
		(assembly(Part, B) -> (append([], B, L), makeBasic(L)) ; !)).

makeBasic([H|T]):-
	((assembly(H,_); assembly(B,_), member(B, T)) ->  
		(basicpart(H) -> (append(T, [H], L), makeBasic(L)) ;
			(assembly(H,A) -> (append(T, A, L), makeBasic(L)) ; !)) ; 
	(write('PartsList = '), writeln([H|T]))).
