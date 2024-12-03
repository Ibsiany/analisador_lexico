all: lex compile run

lex: analisadorLexico.flex
	java -jar jflex.jar -nobak analisadorLexico.flex

compile:
	javac *.java

clean:
	find -name "*.class" -delete
	rm AnalisadorLexico.java