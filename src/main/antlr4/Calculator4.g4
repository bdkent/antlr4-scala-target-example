grammar Calculator4;

options
{
language=Scala;
}
 
 
// PARSER
program : ((assignment|expression) ';')+;
 
assignment : ID '=' expression;
 
expression
    : '(' expression ')'                # parenExpression
    | expression ('*'|'/') expression   # multOrDiv
    | expression ('+'|'-') expression   # addOrSubtract
    | 'print' arg (',' arg)*            # print
    | STRING                            # string
    | ID                                # identifier
    | INT                               # integer;
 
arg : ID|STRING;
 
// LEXER
 
STRING : '"' (' '..'~')* '"';
ID     : ('a'..'z'|'A'..'Z')+;
INT    : '0'..'9'+;
WS     : [ \t\n\r]+ -> skip ;