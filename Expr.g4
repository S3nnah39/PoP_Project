grammar Expr;

prog:   ass EOF;
ass:    var op expr;
expr:   expr ('/'|'%') expr
    |    expr ('+'|'-') expr
    |    INT
    |   STRING
    |    '(' expr ')'
    |   var;
op: '='
    |   '+='
    |   '-='
    |   '='
    |   '/=';
TAG : [a-zA-Z]+;
INT:    [0-9]+;
STRING: '"' (TAG | [0-9])* '"';
VARSTRING: TAG (TAG | [0-9])*;
var: TAG (INT | VARSTRING)*;
NEWLINE: '\r'? '\n' ' '* -> skip;