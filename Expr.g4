grammar Expr;

prog:   ((expr | ass | ite)('\n')*('\t')*)*;
ass:    var op expr;
expr:   expr ('/'|'%') expr
    |    expr ('+'|'-') expr
    |    INT
    |   STRING
    |   LITERAL
    |    '(' expr ')'
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

ite:    ifstate elifstate* | ifstate elifstate* elsestate;

relation:   '=='|
            '>='|
            '<='|
            '<'|
            '>';

atomiccond: (expr | expr relation expr) |
            ('not' expr | 'not(' expr relation expr ')' );

cond:  atomiccond (('and' | 'or') atomiccond)*;

ifstate:    'if ' cond ':\n\t' ((expr | ass | ite)('\n')('\t'))*;

elifstate:  'elif' cond ':\n\t' ((expr | ass | ite)('\n')('\t'))*;

elsestate: 'else' cond ':\n\t' ((expr | ass | ite)('\n')('\t'))*;
