grammar Expr;

prog:   (body('\n')*('\t')*)*;
body: (expr (comment)* | ass (comment)* | ite | comment | forstate | whilestate);
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
var: STRING | CHAR;
range: 'range(' (INT | INT ',' INT) ')';

comment: single_line_comment | multi_line_comment;

single_line_comment: '#'('#' | STRING)*;
multi_line_comment: '\'\'\''(STRING | '\n' | '\t')*'\'\'\'';

ite:    ifstate elifstate* | ifstate elifstate* elsestate;

relation:   '=='|
            '>='|
            '<='|
            '<'|
            '>';

atomiccond: (expr | expr relation expr) |
            ('not' expr | 'not(' expr relation expr ')' ) | 'True' | 'False';

cond:  atomiccond ((' and ' | ' or ') atomiccond)*;

ifstate:    'if ' cond ':'(comment)*'\n\t' (body('\n')('\t'))*;

elifstate:  'elif ' cond ':'(comment)*'\n\t' (body('\n')('\t'))*;

elsestate: 'else ' cond ':'(comment)*'\n\t' (body('\n')('\t'))*;

forstate: 'for ' var ' in ' (var | range) ':'(comment)*'\n\t' (body('\n')('\t'))*;

whilestate: 'while ' cond ':'(comment)*'\n\t' (body('\n')('\t'))*;