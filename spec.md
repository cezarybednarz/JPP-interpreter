# Intepreter języka imperatywnego Chococino
##### Cezary Bednarz (406099)

### Zmiany co do poprzedniej wersji
 - Usunąłem krotki, ponieważ żadne moje rozwiązanie nie działało bez konfliktów w BNFC
 - W katalogu /Choc znajduje się cały front-end języka
 - Main.hs wczytuje plik, wywołuje interpreter i zwraca odpowiedni kod wyjścia
 - Interpreter.hs zawiera cały kod interpretera
 - Kompilacja interpretera: `make`
 - Uruchamianie interpretera `./interpret program`
 - Funkcje do obsługi pamięci w interpreterze wzorowałem na materiałach dr Marcina Benke: https://github.com/mbenke/toy-interpreters
 - Dopisałem obsługę wielowymiarowych tablic

### Planowane zmiany na 07.06.2021
 - Trochę mam popsutą obsługe środowisk zmiennych: wywołująć funkcję z poza maina dostaje ona całe środowisko zmiennych które było w mainie, muszę to naprawić. Z tego powodu nie udało mi się jeszcze zaimplementować przekazywania zmiennych przez referencję (ale w gramatyce już rozpatruję ten przypadek)
 - Obsługa błędów jest trochę okrojona. Nie dodałem jescze numerów linii do komunikatów błędów oraz nie obsluguję jeszcze wszystkich błędów
 - Mam w planach implementowanie punktów `(funkcje zagnieżdżone ze statycznym wiązaniem)` i `(funkcje wyższego rzędu, anonimowe, domknięcia)`, póki co definiowanie takich rzeczy kończy się błędem wykonania

### Opis języka
 - Język gramatycznie jest oparty na podanej gramatyce języka [Latte](https://www.mimuw.edu.pl/~ben/Zajecia/Mrj2020/Latte/), więc jest podobny do Javy
 - Są dostępne predefiniowane funkcje:
     - `void print(expr)` - wypisuje wartosc (int, string, bool, funkcja, null)
 - Funkcje można definiować w środku innych funkcji tak samo jak definiuje się je normalnie, trzeba tylko dodać średnik na końcu definicji
 - Dostępne są lambdy, np: `labda <int (int a, int b)> { return a + b; }`
 - Żeby przekazać funkcję jako parametr musimy użyć składni jak `std::function` w C++: na przykład: `function<int(string, string)> f`, co znaczy że funkcja f zwraca `int` i przyjmuje dwa argumenty `string`
 - Dostępne są również tablice, takie jak w C, tylko przypisanie może odbywać się tylko element po elemencie: np. `t[3] = 2`


### Tabelka funkcjonalności

| 19.05.2021 | 07.06.2021 | Funkcjonalność |
| ---------- | ---------- | --------------
|  +         |  +         | 01 (trzy typy)
|  +         |  +         | 02 (literały, arytmetyka, porównania)
|  +         |  +         | 03 (zmienne, przypisanie)
|  +         |  +         | 04 (print)
|  +         |  +         | 05 (while, if)
|  +         |  +         | 06 (funkcje lub procedury, rekurencja)
|  ~         |  +         | 07 (przez zmienną / przez wartość / in/out)
|            |            | 08 (zmienne read-only i pętla for)
|  +         |  +         | 09 (przesłanianie i statyczne wiązanie)
|  ~         |  +         | 10 (obsługa błędów wykonania)
|  +         |  +         | 11 (funkcje zwracające wartość)
|            |            | 12 (4) (statyczne typowanie)
|            |  +         | 13 (2) (funkcje zagnieżdżone ze statycznym wiązaniem)
|  +         |  +         | 14 (1) (rekordy/tablice/listy)
|            |            | 15 (2) (krotki z przypisaniem)
|  +         |  +         | 16 (1) (break, continue)
|            |  +         | 17 (4) (funkcje wyższego rzędu, anonimowe, domknięcia)
|            |            | 18 (3) (generatory)
| 18 pkt (?) |  28 pkt    |













