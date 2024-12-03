public class Token {

    public Object value;
    public TK tk;
    public int line;
    public int column;

    public Token(int line, int column, TK t) {
        this.line = line;
        this.column = column;
        value = null;
        tk = t;
    }

    public Token(int line, int column, TK t, Object v) {
        this(line, column, t);
        value = v;
    }

    public String toString() {
        if (value != null) {
            return tk + ":" + value.toString();
        }
        switch (tk) {
            case ABREPARENTESES:
                return "(";
            case FECHAPARENTESES:
                return ")";
            case ABRECOLCHETE:
                return "{";
            case FECHACOLCHETE:
                return "}";
            case PV:
                return ";";
            case EQ:
                return "=";
            case ASPAS:
                return "'";
            case BARRAINVERTIDA:
                return "\\";
            case MAIOR:
                return ">";
            case MENOR:
                return "<";
            case ASTERISCO:
                return "*";
            case DOT:
                return "DOT: .";
            case MAIS:
                return "+";
            case MENOS:
                return "-";
            case DOISDOISPONTOS:
                return "::";
            case VIRGULA:
                return ",";
            case ABRECHAVE:
                return "[";
            case FECHACHAVE:
                return "]";
            case BARRA:
                return "/";
            case DIFERENTE:
                return "!=";
            case DOISPONTOS:
                return ":";
            case NEW:
                return "new";
            case IGUALIGUAL:
                return "==";
            default:
                return tk.toString();
        }
    }

}
