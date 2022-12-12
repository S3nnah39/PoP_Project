grammar Expr;

prog:   ((expr | ass | ite)('\n')*('\t')*)*;
ass:    var op expr;
expr:   expr ('*'|'/'|'%') expr
    |   expr ('+'|'-') expr
    |   INT
    |   STRING
    |   LITERAL
    |   '(' expr ')'
    |   var;

op:     '='
    |   '+='
    |   '-='
    |   '*='
    |   '/=';

CHAR: [a-z] | [A-Z];
INT:    [0-9]+;
LITERAL: '"' STRING '"';
STRING: (CHAR|INT) (CHAR | INT)*;
var: STRING;
INDENT: ('\t'|'    ');
WS : [\r\n\t ]+ -> skip;

ite:    ifstate elifstate* | ifstate elifstate* elsestate;

relation:   '=='|
            '>='|
            '<='|
            '<'|
            '>';

atomiccond: (expr | expr relation expr) |
            ('not' expr | 'not(' expr relation expr ')' );

cond:  atomiccond (('and' | 'or') atomiccond)*;

ifstate:    'if ' cond ':\n' INDENT ((expr | ass | ite)('\n')(INDENT))*;

elifstate:  'elif ' cond ':\n' INDENT ((expr | ass | ite)('\n')(INDENT))*;

elsestate: 'else' cond ':\n' INDENT ((expr | ass | ite)('\n')(INDENT))*;
