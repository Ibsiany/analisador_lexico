/* 28/11/2024 - Analisador Lexico
 * Ibsiany Dias Godinho - 20.2.8097
 * Luisa Brito Dias - 20.1.8107
 * Trabalho pratico 1 - Compiladores 1
*/

%% 

%public
%function proximoToken
%type Token
%class AnalisadorLexico

%line
%column

%eofval{
   return new Token( yyline, yycolumn, TK.EOF);
%eofval}

identifier = [a-zA-Z]+
number = [0-9]+
white = [ \n\t\r]+ 
float = [0-9]?+(\.[0-9]+)
char = "'" !([^]* "'" [^]*) ("'")
comment_block = "{-" !([^]* "-}" [^]*) ("-}")
comment_line = "--" !([^]* "\n" [^]*) ("\n")

%%
<YYINITIAL>{
    "--"  !([^]* \R [^]*) \R  {}
    "main"          { return new Token(yyline, yycolumn, TK.MAIN);}
    "return"        { return new Token(yyline, yycolumn, TK.RETURN);}
    "if"            { return new Token(yyline, yycolumn, TK.IF);}
    "else"          { return new Token(yyline, yycolumn, TK.ELSE);}
    "iterate"       { return new Token(yyline, yycolumn, TK.ITERATE);}
    "read"          { return new Token(yyline, yycolumn, TK.READ);}
    "print"         { return new Token(yyline, yycolumn, TK.PRINT);}
    "null"          { return new Token(yyline, yycolumn, TK.NULL);}
    "true"          { return new Token(yyline, yycolumn, TK.TRUE);}
    "false"         { return new Token(yyline, yycolumn, TK.FALSE);}
    "new"           { return new Token(yyline, yycolumn, TK.NEW);}
    "{"             { return new Token(yyline, yycolumn, TK.ABRECOLCHETE);}
    "}"             { return new Token(yyline, yycolumn, TK.FECHACOLCHETE);}
    "("             { return new Token(yyline, yycolumn, TK.ABREPARENTESES);}
    ")"             { return new Token(yyline, yycolumn, TK.FECHAPARENTESES);}
    ";"             { return new Token(yyline, yycolumn, TK.PV);}
    "'"             { return new Token(yyline, yycolumn, TK.ASPAS);}
    "\\"            { return new Token(yyline, yycolumn, TK.BARRAINVERTIDA);}
    ">"             { return new Token(yyline, yycolumn, TK.MAIOR);}
    "<"             { return new Token(yyline, yycolumn, TK.MENOR);}
    "*"             { return new Token(yyline, yycolumn, TK.ASTERISCO);}
    "."             { return new Token(yyline, yycolumn, TK.DOT);}
    "+"             { return new Token(yyline, yycolumn, TK.MAIS);}
    "-"             { return new Token(yyline, yycolumn, TK.MENOS);}
    "="             { return new Token(yyline, yycolumn, TK.EQ);}
    "/"             { return new Token(yyline, yycolumn, TK.BARRA);}
    "%"             { return new Token(yyline, yycolumn, TK.PORCENTAGEM);}
    "=="            { return new Token(yyline, yycolumn, TK.IGUALIGUAL);}
    "!="            { return new Token(yyline, yycolumn, TK.DIFERENTE);}
    "["             { return new Token(yyline, yycolumn, TK.ABRECHAVE);}
    "]"             { return new Token(yyline, yycolumn, TK.FECHACHAVE);}
    ","             { return new Token(yyline, yycolumn, TK.VIRGULA);}
    "::"            { return new Token(yyline, yycolumn, TK.DOISDOISPONTOS);}
    ":"             { return new Token(yyline, yycolumn, TK.DOISPONTOS);}
    {identifier}    { return new Token(yyline, yycolumn, TK.ID, yytext()); }
    {number}        { return new Token(yyline, yycolumn, TK.INT, Integer.parseInt(yytext())); }
    {float}         { return new Token(yyline, yycolumn, TK.FLOAT, Float.parseFloat(yytext())); }
    {comment_block} { /* Ignorar comentarios em bloco */}
    {comment_line}  { /* Ignorar comentarios em linha */}
    {white}         { /* Ignorar espaços em branco */ }
    [^]             { throw new Error("Caractere inválido: " + yytext() + " na linha " + yyline + ", coluna " + yycolumn); }
}