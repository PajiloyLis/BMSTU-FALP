domains
surname, phoneNumber, city, street = symbol
house, flat = integer
address = addr(city, street, house, flat)

mark, color, number = symbol
cost = integer

predicates
nondeterm phone(surname, phoneNumber, address).
nondeterm car(surname, mark, color, cost, number).

nondeterm man_by_car(mark, color, surname, city, phoneNumber).
	
clauses
phone(ivanov, "+7(912)345-67-89", addr(moskva, lenina, 15, 24)).
phone(petrova, "+7(923)456-78-90", addr(kaliningrad, pushkina, 7, 103)).
phone(sidorov, "+7(934)567-89-01", addr(novosibirsk, gagarina, 42, 5)).
phone(kuznetsova, "+7(945)678-90-12", addr(ekaterinburg, mira, 33, 17)).
phone(smirnov, "+7(956)789-01-23", addr(kazan, baumana, 12, 8)).
phone(ivanov, "+7(915)453-90-29", addr(moskva, lenina, 15, 24)).
phone(popov, "+7(912)345-67-89", addr(moskva, lenina, 15, 24)).
phone(ivanov, "+7(903)478-98-01", addr(kazan, ermolova, 19, 157)).

car(ivanov, toyota, black, 25000, a123bc777).
car(petrova, bmw, white, 45000, b456de78).
car(sidorov, lada, red, 8000, c789fg123).
car(kuznetsova, mercedes, silver, 38000, e321ko96).
car(komarov, kia, blue, 22000, x654op777).
car(kuznetsova, lexus, yellow, 345000, a432kp96).

man_by_car(Mark, Color, Surname, City, Phone) :-
	car(Surname, Mark, Color, _, _),
	phone(Surname, Phone, addr(City, _, _, _)).


goal
%phone(ivanov, "+7(912)345-67-89", addr(moskva, lenina, 15, 24)).
%phone(ivanov, "+7(912)345-67-89", X).
%phone(ivanov, "+7(912)345-67-89", addr(moskva, lenina, 15, X)).
%phone(ivanov, X, addr(moskva, lenina, 15, 24)).
%phone(X, "+7(912)345-67-89", addr(moskva, lenina, 15, 24)).
%phone(X, Y, addr(moskva, lenina, 15, 24)).
%phone(ivanov, _, X).
%car(kuznetsova, X, _, _, _).
%car(kuznetsova, X, _, _, Y).
%man_by_car(lexus, yellow, X, Y, Z).
%man_by_car(mercedes, silver, X, Y, Z).
man_by_car(toyota, black, X, Y, Z).