grammar Expr;

prog:   (body('\n')*( INDENT )*)*;
body: ( ass (comment)* | expr (comment)* | ite | comment | forstate | whilestate | funcstate);
ass:    var op expr | var op var;
expr:   expr ('*'|'/'|'%') expr
    |   expr ('+'|'-') expr
    |   INT
    |   FLOAT
    |   STRING
    |   LITERAL
    |   '(' expr ')'
    |   var
    |   boolean
    |   var (',' var)*
    |   'return' expr;

op:     '='
    |   '+='
    |   '-='
    |   '*='
    |   '/=';

SPECIAL: (' ' | '!' | '$' | '%' | '&' | '’' | '(' | ')' | '*' | '+' | ',' | '-' | '.' | '/' | ':' | ';' | '<' | '=' | '>' | '?' | '@' | '^' | '_' | '`' | '{' | '}' );
CHAR: [a-z] | [A-Z];
INT:    [0-9]+;
FLOAT: INT'.'INT;
LITERAL: ('"' STRING '"') | ('"' '"');
STRING: (CHAR | INT | SPECIAL) (CHAR | INT | SPECIAL)*;
INDENT: ('\t' | '    ');
var: STRING | CHAR;
range: 'range(' (INT | INT ',' INT) '):';

comment: single_line_comment | multi_line_comment;

single_line_comment: '#'('#' | STRING)*;
multi_line_comment: ('\'\'\''(STRING | '\n' | INDENT)*'\'\'\'') | ('"""'(STRING | '\n' | INDENT | SPECIAL)*'"""');

ite:    ifstate elifstate* | ifstate elifstate* elsestate;

relation:   '=='|
            '>='|
            '<='|
            '<'|
            '>';

boolean: 'True' | 'False';

atomiccond: (expr | expr relation expr) |
            ('not' expr | 'not(' expr relation expr ')' ) | ;

cond:  atomiccond ((' and ' | ' or ') atomiccond)*;

ifstate:    'if ' cond ':'(comment)*'\n' INDENT (body('\n')( INDENT ))*;

elifstate:  'elif ' cond ':'(comment)*'\n' INDENT (body('\n')( INDENT ))*;

elsestate: 'else ' cond ':'(comment)*'\n' INDENT (body('\n')( INDENT ))*;

forstate: 'for ' var ' in ' (var ':' | range) (comment)*'\n' INDENT (body('\n')( INDENT ))*;

whilestate: 'while ' cond ':'(comment)*'\n' INDENT (body('\n')( INDENT ))*;

funcstate: 'def ' funcname '(' parameter '):'(comment)*'\n' INDENT funcbody;

funcname: var;

parameter: (var (',' var)*)* ;

funcbody: (body('\n')( INDENT ))* ;// | body('\n');

WS : [\r ]+ -> skip;
