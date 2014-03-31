dec				[0-9]+
hex				[0-9][0-9a-fA-F]*[H|h]
whitespace		[\n\t ]
lexem 			":"|"("|")"|";"|"="|"."|"-"|"+"|"*"|">"|"<>"|","
id				[a-zA-Z][a-zA-Z0-9_]*
schl			struct|end|func|return|with|do|let|in|cond|then|not|or
comment			\/\*[^(\/\*)]*\*\/

%%

{hex}			printf ("num %i\n",(int)strtol(yytext, NULL, 16));
{dec}			printf ("num %i\n",atoi(yytext));
{lexem}			printf ("%s\n",yytext);
{schl}			printf ("%s\n",yytext);
{id}			printf ("id %s\n",yytext);
{whitespace}+	;
{comment}		;
.				printf("Lexical error.\n");exit(1);
