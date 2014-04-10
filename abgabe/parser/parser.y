%{
#include <stdio.h>
#include <stdlib.h>
extern int yylineno;
%}

%token struct_ 
%token end_ 
%token func_ 
%token return_ 
%token with_ 
%token do_ 
%token let_ 
%token in_ 
%token cond_ 
%token then_ 
%token not_ 
%token or_ 
%token id_ 
%token num_ 
%token uneq_
%start Program

%%

Program         : | Lines
                ;

Lines           : | Lines Def ';' 
                ;

Def             : Funcdef
                | Structdef
                ;

Structdef       : struct_ id_ ':' Ids end_
                ;

Ids             : | Ids id_
                ;

Funcdef         : func_ id_ '(' Ids ')' Stats end_
                ;

Stats           : | Stats Stat ';' 
                ;

Stat            : return_ Expr
                | cond_ Stat1 end_
                | let_ Stat2 in_ Stats end_
                | with_ Expr ':' id_ do_ Stats end_
                | Lexpr '=' Expr
                | Term
                ;

Stat1           : | Stat1 Expr then_ Stats end_ ';'
                ;

Stat2           : | Stat2 id_ '=' Expr ';'
                ;

Lexpr           : id_ 
                | Term '.' id_
                ;

Expr            : Negat Term
                | Term Plus
                | Term Mal
                | Term Oder
                | Term '>' Term
                | Term uneq_ Term
                ;

Plus            : | Plus '+' Term
                ;

Mal             : | Mal '*' Term
                ;

Negat           : | Negat not_
                | Negat '-'
                ;

Oder            : | Oder or_ Term
                ;

Term            : '(' Expr ')'
                | num_
                | Term '.' id_
                | id_
                | id_ '(' Exprs ')' 
                | id_ '(' Exprs Expr ')' 
                ;

Exprs           : | Exprs Expr ','
                ;

%%

int yyerror (char *e) {
        printf("Parser error line: '%d'...\n", yylineno);
        exit(2);
}

int main(void) {
        yyparse();
        return 0;
}