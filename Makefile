all: lex compile run

lex: analisadorLexico.flex
	java -cp "jflex.jar:java-cup-11b.jar" jflex.Main analisadorLexico.flex

compile:
	javac *.java

run:
	java Main $(file)

clean:
	find -name "*.class" -delete
	rm AnalisadorLexico.java