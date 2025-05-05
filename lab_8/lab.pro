domains
surname, phoneNumber, city, street = symbol.
house, flat = integer.
address = addr(city, street, house, flat).

property_name = symbol.

mark, color, number = symbol.
price = integer.

square = real.
floors = integer.

region = symbol.

property = car(price, mark, color, number);
	   building(price, square, floors, region);
	   plot(price, square, region);
	   water_vehicle(price, mark, color).

bank_name, account = symbol.
sum = integer.

predicates
nondeterm phone(surname, phoneNumber, address).
nondeterm ownership(surname, property_name, property).
nondeterm bank(surname, bank_name, account, sum).
nondeterm properties_by_surname(surname, property_name).
nondeterm properties_with_costs_by_surname(surname, property_name, price).
nondeterm total_cost_by_surname(surname, price).
nondeterm cost_by_surname(surname, property_name, price).
nondeterm cost_by_surname_and_property(surname, property_name, price).
clauses
phone(ivanov, "+7(912)345-67-89", addr(moskva, lenina, 15, 24)).
phone(petrova, "+7(923)456-78-90", addr(kaliningrad, pushkina, 7, 103)).
phone(sidorov, "+7(934)567-89-01", addr(novosibirsk, gagarina, 42, 5)).
phone(kuznetsova, "+7(945)678-90-12", addr(ekaterinburg, mira, 33, 17)).
phone(smirnov, "+7(956)789-01-23", addr(kazan, baumana, 12, 8)).
phone(ivanov, "+7(915)453-90-29", addr(moskva, lenina, 15, 24)).
phone(popov, "+7(912)345-67-89", addr(moskva, lenina, 15, 24)).
phone(ivanov, "+7(903)478-98-01", addr(kazan, ermolova, 19, 157)).

bank(ivanov, sber, "40817810123456789012", 125000000).
bank(petrova, tinkoff, "42301812345678901234", 250000000).
bank(sidorov, alpha, "30101234567890123456", 100000000).
bank(kuznetsiva, vtb, "40702810567890123456", 500000000).
bank(smirnov, alpha, "40820810345678901234", 50000000).
bank(popov, tinkoff, "42601810789012345678", 1000000000).

ownership(ivanov, car,  car(2000000, mercedes, yellow, a765ak93)).
ownership(petrova, car, car(1700000, lexus, silver, m285at50)).
ownership(kuznetsova, car, car(1000000, renault, red, o395oo120)).
ownership(popov, car, car(900000, lada, black, c364eh95)).

ownership(ivanov, house, building(15000000, 90, 3, moscow)).
ownership(petrova, villa, building(7000000, 49, 2, krym)).
ownership(smirnov, bungalo, building(5000000, 40, 1, tula)).
ownership(popov, cottage, building(12500000, 60, 2, tver)).

ownership(ivanov, dacha, plot(10000000, 600, moscow)).
ownership(kuznetsova, farm, plot(200000000, 10000, tula)).
ownership(sidorov, homestad, plot(350000000, 60000, tver)).

ownership(ivanov, motorboat, water_vehicle(1500000, yamacha, black)).
ownership(sidorov, water_scooter, water_vehicle(900000, toyota, white)).

cost_by_surname_and_property(Surname, Property, Cost) :- ownership(Surname, Property, car(Cost, _, _, _)).
cost_by_surname_and_property(Surname, Property, Cost) :- ownership(Surname, Property, building(Cost, _, _, _)).
cost_by_surname_and_property(Surname, Property, Cost) :- ownership(Surname, Property, plot(Cost, _, _)).
cost_by_surname_and_property(Surname, Property, Cost) :- ownership(Surname, Property, water_vehicle(Cost, _, _)).

properties_by_surname(Surname, Property) :- ownership(Surname, Property, _).

properties_with_costs_by_surname(Surname, Property, Cost) :- properties_by_surname(Surname, Property), cost_by_surname_and_property(Surname, Property, Cost).

cost_by_surname(Surname, car, Cost) :- ownership(Surname, _, car(Cost, _, _, _)), !.
cost_by_surname(Surname, building, Cost) :- ownership(Surname, _, building(Cost, _, _, _)), !.
cost_by_surname(Surname, plot, Cost) :- ownership(Surname, _, plot(Cost, _, _)), !.
cost_by_surname(Surname, water_vehicle, Cost) :- ownership(Surname, _, water_vehicle(Cost, _, _)), !.	
cost_by_surname(_, _, 0).						   

total_cost_by_surname(Surname, Cost) :- cost_by_surname(Surname, car, Price1),
					cost_by_surname(Surname, building, Price2),
					cost_by_surname(Surname, plot, Price3),
					cost_by_surname(Surname, water_vehicle, Price4),
					Cost = Price1 + Price2 + Price3 + Price4.
goal
%properties_by_surname(popov, X).
%properties_by_surname(ivanov, X).
properties_with_costs_by_surname(popov, X, Y).
%properties_with_costs_by_surname(ivanov, X, Y).
%total_cost_by_surname(ivanov, X).
%total_cost_by_surname(popov, X).