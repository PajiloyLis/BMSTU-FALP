domains
name, sex = symbol

predicates
nondeterm person(name, sex, name)
nondeterm grandparent(name, sex, sex, name).


nondeterm man(name).
nondeterm woman(name).

nondeterm parent(name, name).
nondeterm mother(name, name).
nondeterm father(name, name).

nondeterm grandparent(name, name).
nondeterm grandmother(name, name).
nondeterm grandfather(name, name).

nondeterm mother_grandparent(name, name).
nondeterm father_grandparent(name, name).

nondeterm mother_grandmother(name, name).
nondeterm mother_grandfather(name, name).

nondeterm father_grandmother(name, name).
nondeterm father_grandfather(name, name).

clauses
person(abraham, male, terah).
person(nahor, male, terah).
person(haran, male, terah).
person(sarah, male, terah).

person(abraham, female, amathlai).
person(nahor, female, amathlai).
person(aran, female, amathlai).
person(sarah, female, amathlai).

person(isaac, male, abraham).
person(isaac, female, sara).

person(ishmael, male, abraham).
person(ishmael, female, hagar).

person(lot, male, haran).
person(milcah, male, haran).
person(iscah, male, haran).

person(bethuel, male, nahor).
person(bethuel, female, milcah).

person(rebekah, male, bethuel).

person(esau, male, isaac).
person(esau, female, rebekah).

person(jacob, male, isaac).
person(jacob, female, rebekah).

person(laban, male, bethuel).

person(rachel, male, laban).
person(leah, male, laban).

person(reuben, male, jacob).
person(simeon, male, jacob).
person(levi, male, jacob).
person(judah, male, jacob).
person(issachar, male, jacob).
person(zebulun, male, jacob).
person(dinah, male, jacob).
person(joseph, male, jacob).
person(benjamin, male, jacob).

person(reuben, female, leah).
person(simeon, female, leah).
person(levi, female, leah).
person(judah, female, leah).
person(issachar, female, leah).
person(zebulun, female, leah).
person(dinah, female, leah).
person(joseph, female, rachel).
person(benjamin, female, rachel).

grandparent(Name, ParentSex, GrandparentSex, GrandparentName) :-
	person(Name, ParentSex, Parent),
	person(Parent, GrandparentSex, GrandparentName).


man(terah).
man(abraham).
man(ishmael).
man(isaac).
man(jacob).
man(reuben).
man(simeon).
man(levi).
man(judah).
man(issachar).
man(zebulun).
man(joseph).
man(benjamin).
man(nahor).
man(bethuel).
man(laban).
man(haran).
man(lot).
man(iscah).
man(esau).

woman(sarah).
woman(hagar).
woman(milcah).
woman(rebekah).
woman(rachel).
woman(leah).
woman(dinah).

parent(terah, sarah).
parent(terah, abraham).
parent(terah, nahor).
parent(terah, haran).

parent(amathlai, sarah).
parent(amathlai, abraham).
parent(amathlai, nahor).
parent(amathlai, haran).

parent(sarah, isaac).
parent(abraham, isaac).

parent(abraham, ishmael).
parent(hagar, ishmael).

parent(haran, milcah).
parent(haran, lot).
parent(haran, iscah).

parent(nahor, bethuel).
parent(milcah, bethuel).

parent(bethuel, laban).
parent(bethuel, rebekah).

parent(isaac, esau).
parent(rebekah, esau).

parent(isaac, jacob).
parent(rebekah, jacob).

parent(laban, rachel).
parent(laban, leah).

parent(jacob, reuben).
parent(jacob, simeon).
parent(jacob, levi).
parent(jacob, judah).
parent(jacob, issachar).
parent(jacob, zebulun).
parent(jacob, dinah).

parent(leah, reuben).
parent(leah, simeon).
parent(leah, levi).
parent(leah, judah).
parent(leah, issachar).
parent(leah, zebulun).
parent(leah, dinah).

parent(jacob, joseph).
parent(jacob, benjamin).

parent(jacob, rachel).
parent(jacob, benjamin).

mother(Parent, Child) :- parent(Parent, Child), woman(Parent).
father(Parent, Child) :- parent(Parent, Child), man(Parent).

grandparent(Grandparent, Grandchild) :- parent(Grandparent, Parent), parent(Parent, Grandchild).
grandmother(Grandparent, Grandchild) :- grandparent(Grandparent, Grandchild), woman(Grandparent).
grandfather(Grandparent, Grandchild) :- grandparent(Grandparent, Grandchild), man(Grandparent).

mother_grandparent(Grandparent, Grandchild) :- parent(Grandparent, Parent), parent(Parent, Grandchild), woman(Parent).
father_grandparent(Grandparent, Grandchild) :- parent(Grandparent, Parent), parent(Parent, Grandchild), man(Parent).

mother_grandmother(Grandparent, Grandchild) :- mother_grandparent(Grandparent, Grandchild), woman(Grandparent).
mother_grandfather(Grandparent, Grandchild) :- mother_grandparent(Grandparent, Grandchild), man(Grandparent).

father_grandmother(Grandparent, Grandchild) :- father_grandparent(Grandparent, Grandchild), woman(Grandparent).
father_grandfather(Grandparent, Grandchild) :- father_grandparent(Grandparent, Grandchild), man(Grandparent).

goal
%	grandparent(isaac, _, male, X).
%	grandparent(isaac, _, _, X).
%	grandparent(isaac, female, _, X).
%	grandparent(isaac, male, male, X).
%	grandparent(isaac, _, female, X).
%	grandparent(X, bethuel).