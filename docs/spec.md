# Intepreter języka imperatywnego Chococino
##### Cezary Bednarz (406099)

### A) Gramatyka języka
Gramatyka języka bez definicji struktury programu i operatorów, bo są one standardowe. Jest to rozszerzona gramatyka [Latte](https://www.mimuw.edu.pl/~ben/Zajecia/Mrj2020/Latte/).
```hs
-- statements ----------------------------------------------
Block.     Block ::= "{" [Stmt] "}" ;
separator  Stmt "" ;
Empty.     Stmt ::= ";" ;
BStmt.     Stmt ::= Block ;
Decl.      Stmt ::= Type [Item] ";" ;
ArrDecl.   Stmt ::= Type Ident "[" Expr "]" ;
NoInit.    Item ::= Ident ; 
Init.      Item ::= Ident "=" Expr ;
separator nonempty Item "," ;
Ass.       Stmt ::= Ident "=" Expr  ";" ;
ArrAss.    Stmt ::= Ident "[" Expr "]" "=" Expr ;
TupleAss.  Stmt ::= TupL "=" TupR ;
Incr.      Stmt ::= Ident "++"  ";" ;
Decr.      Stmt ::= Ident "--"  ";" ;
Ret.       Stmt ::= "return" Expr ";" ;
VRet.      Stmt ::= "return" ";" ;
Cond.      Stmt ::= "if" "(" Expr ")" Stmt  ;
CondElse.  Stmt ::= "if" "(" Expr ")" Stmt "else" Stmt  ;
While.     Stmt ::= "while" "(" Expr ")" Stmt ;
SExp.      Stmt ::= Expr  ";" ;
Break.     Stmt ::= "break" ;
Continue.  Stmt ::= "continue" ;
FnNestDef. Stmt ::= TopDef ";" ;
-- Types ---------------------------------------------------
Int.       Type ::= "int" ;
Str.       Type ::= "string" ;
Bool.      Type ::= "boolean" ;
Void.      Type ::= "void" ;
Tuple.     Type ::= "tuple" ;
Function.  Type ::= "function" "<" Type "(" [Type] ")" ">"
internal   Fun. Type ::= Type "(" [Type] ")" ;
separator  Type "," ;
-- Expressions ---------------------------------------------
EVar.      Expr6 ::= Ident ;
ELitInt.   Expr6 ::= Integer ;
ELitTuple. Expr6 ::= TupR ;
ELitLambd. Expr6 ::= Lambda ;
ELitTrue.  Expr6 ::= "true" ;
ELitFalse. Expr6 ::= "false" ;
EApp.      Expr6 ::= Ident "(" [Expr] ")" ;
EString.   Expr6 ::= String ;
EArr.      Expr6 ::= Ident "[" Expr "]" ;
Neg.       Expr5 ::= "-" Expr6 ;
Not.       Expr5 ::= "!" Expr6 ;
EMul.      Expr4 ::= Expr4 MulOp Expr5 ;
EAdd.      Expr3 ::= Expr3 AddOp Expr4 ;
ERel.      Expr2 ::= Expr2 RelOp Expr3 ;
EAnd.      Expr1 ::= Expr2 "&&" Expr1 ;
EOr.       Expr ::= Expr1 "||" Expr ;
coercions  Expr 6 ;
separator  Expr "," ;
-- Tuples --------------------------------------------------
TupLId.    TupL ::= Ident ;
TupLPar.   TupL ::= "(" [TupL] ")" ;
coercions  TupL 1;
separator  TupL "," ;
TupRExpr.  TupR ::= Expr ;
TupRPar.   TupR ::= "(" [TupR] ")" ;
coercions  TupR 1 ;
separator  TupR "," ;
-- Lambdas -------------------------------------------------
LambdaId.  Lambda ::= Ident ;
LambdaDef. Lambda ::= "(" [Ident] ")" "->" Block ;
coercions  Lambda 1 ;
separator  Lambda "," ;
```

### B) Przykłady 
#### Hello World 
```C
int main() {
    printString("Hello World\n");
    return 0;
}
```
#### Funkcje i konkatenacja stringów 
```C
string f(string s) {
    return s + s;
}

int main() {
    string s = f("Hello ");
    printString(s);
    return 0;
}
```
#### Krotki 
```C
tuple make_tuple(int x, int y) {
    return (x, y);
}

int main() {
    int a, b;
    (a, b) = make_tuple(x);
    printTuple((b, a));
    return 0;
}
```
#### Tablice 
```C
int main() {
    int t[3];
    t[1] = 1;
    t[2] = 2;
    printInt(t[2]);
    return 0;
}
```
#### Funkcje zagnieżdżone 
```C
int main() {
    int printHelloWorld() {
        printString("Hello World");
    };
    printHelloWorld();
    return 0;
}
```
#### Funkcje wyższego rzędu, lambdy, referencja 
``` C
void applyToString(string &s, function<string(string)> f) {
    s = f(s);
}

int main() {
    string s = "hello ";
    applyToString(s, (str) -> { 
        return str+str+str;
    });
    printString(s);
    return 0;
}
```
#### Funkcje wyższego rzędu, inny przykład
``` C
int apply(int x, function<int(int)> f) {
    return f(x);
}

int main() {

    int f(int x) {
        return (x - 50) * (x - 50) + 7 * x;
    };

    int maks = 0;

    int i = 0;
    while (i <= 100) {
        if (maks > apply(i, f)) {
            maks = apply(i, f);
        }
        i++;
    }

    printInt(maks);
}
```

### C) Opis języka
Język gramatycznie jest oparty na podanej gramatyce języka [Latte](https://www.mimuw.edu.pl/~ben/Zajecia/Mrj2020/Latte/)
Są dostępne predefiniowane funkcje:
 - `void printInt(int)`
 - `void printString(string`
 - `void error(string)`

Funkcja error wypisuje runtime error oraz podany string i kończy wykonywanie programu.


### D) Tabelka funkcjonalności

| Deklaracja | Funkcjonalność |
| ----------- | -------------- |
|+ |01 (trzy typy)
| + |02 (literały, arytmetyka, porównania)
|  + |03 (zmienne, przypisanie)
|  + |04 (print)
|  + |05 (while, if)
|  + |06 (funkcje lub procedury, rekurencja)
|  + |07 (przez zmienną / przez wartość / in/out)
|  |08 (zmienne read-only i pętla for)
|  + |09 (przesłanianie i statyczne wiązanie)
|  + |10 (obsługa błędów wykonania)
|  + |11 (funkcje zwracające wartość)
|  |12 (4) (statyczne typowanie)
|  + |13 (2) (funkcje zagnieżdżone ze statycznym wiązaniem)
|  + |14 (1) (rekordy/tablice/listy)
|  + |15 (2) (krotki z przypisaniem)
|  + |16 (1) (break, continue)
|  + |17 (4) (funkcje wyższego rzędu, anonimowe, domknięcia)
|  |18 (3) (generatory)
**Razem: 30 pkt**












