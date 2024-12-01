import java.io.FileNotFoundException;
import java.io.FileReader;

public class Main {
    public static void main(String args[]) {
        if (args.length != 1) {
            help();
            System.exit(0);
        }
        try {
            AnalisadorLexico lex = new AnalisadorLexico(new FileReader(args[0]));
            Token t = lex.proximoToken();
            while (t.tk != TK.EOF) {
                System.out.println(t.toString());
                t = lex.proximoToken();
            }
            System.out.println(t.toString());
        } catch (FileNotFoundException e) {
            System.out.println("O arquivo " + args[0] + " nao foi encontrado");
        } catch (Exception e) {
            System.out.println("Erro ao processar " + args[0]);
            e.printStackTrace();
        }
    }

    public static void help() {
        System.out.println("Analisador Lexico");
        System.out.println("Ibsiany Dias Godinho - 20.2.8097");
        System.out.println("Luisa Brito Dias - 20.1.8107");
        System.out.println("Trabalho pratico 1 - Compiladores 1");
    }
}
