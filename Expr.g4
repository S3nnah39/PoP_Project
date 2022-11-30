grammar Expr;


// *** PARSER *** //

prog: (statement)+ EOF;

statement: expr
         | VAR num_assign num_expr
         | VAR ASSIGN expr
         ;

expr: '(' expr ')'
    | STRING
    | num_expr
    ;

// PEMDAS
num_expr: '(' num_expr ')'
        | num_expr (MUL|DIV|MOD) num_expr
        | num_expr (ADD|SUB) num_expr
        | num
        ;
num_assign: SUB_ASSIGN
          | MUL_ASSIGN
          | DIV_ASSIGN
          | MOD_ASSIGN
          ;
ifs: 'if' statement ':' ('elif' statement ':' num_expr)* ('else:' num_expr)
    
num: (INT|FLOAT);



// *** LEXER *** //

// Arithmetic Operators
MUL : '*' ;
DIV : '/' ;
MOD : '%' ;
ADD : '+' ;
SUB : '-' ;

// Assignment Operators
ASSIGN     : '='  ;
MUL_ASSIGN : '*=' ;
DIV_ASSIGN : '/=' ;
MOD_ASSIGN : '%=' ;
ADD_ASSIGN : '+=' ;
SUB_ASSIGN : '-=' ;

// Variable definitions
VAR : [_a-zA-Z][_a-zA-Z0-9]* ;


// Miscellaneous
WS : [\r\n\t ]+ -> skip;
NEWLINE : '\r'? '\n' ;

INT : [0-9]+ ;
FLOAT : '-'? INT '.' INT ;

STRING: '"' ~["\r\n]* '"';

PAREN_OPEN: '(';
PAREN_CLOSE: ')';
