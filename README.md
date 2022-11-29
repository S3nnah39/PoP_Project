## Project Explanation. 
Implementation of a parser for Python language, using Context-free Grammar (CFG) or BNF with ANTLR (or something equivalent to ANTLR, for example, bison, yacc, lex, etc.). [DOC LINK](https://umsystem.instructure.com/courses/113343/files/14720691?module_item_id=5446317)

## Team members. 
* Malek Necibi
* Romelo Seals
* Akhil Mulakala
* Andy Solovyov
* Tasha Ogoti
* Ur mom


## Requirements for your parser
* Requirements for the setup
1. Apache Maven 3.8.4
2. JavaSE 17

## How to use/run the parser. 
Follow intructions for antlr4 install here
1. This includes the following aliases: alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.9.2-complete.jar:/usr/local/lib/antlr-denter-1.2.jar:$CLASSPATH" org.antlr.v4.Tool' and alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.9.2-complete.jar:/usr/local/lib/antlr-denter-1.2.jar:$CLASSPATH" org.antlr.v4.gui.TestRig
2. Add antlr-denter-1.2.jar to your CLASSPATH.
3. Move antlr-denter-1.2.jar to your /usr/local/lib/ folder
4. Add it to your classpath that you made in the previous step. For example, in my .zshrc file: export CLASSPATH=".:/usr/local/lib/antlr-4.9.2-complete.jar:/usr/local/lib/antlr-denter-1.2.jar:$CLASSPATH"
5. Run antlr4 SimplePython.g4 in this directory
6. Run javac *.java to compile into java class files
7. To parse and print tree on stdout, run: grun SimplePython startRule -tree <file>
       - To visualize in a gui, run: grun SimplePython startRule -gui <file>
       - Replace <file> with the test_file.py or alternative to parse a file
 8. Omit <file> to input on stdin, and enter control + D to end the input

## Optional: Demo video 
https://www.youtube.com/watch?v=vfc42Pb5RA8


## Expected Features
### Deliverable #1
* Arithmetic operators (+, -, *, /, %,) 
* Assignment operators (=, +=, -=, *=, /=) 
* Variable definitions 
 
### Deliverable #2 
* if/else blocks 
* Conditional statements (<, <=, >, >=, ==, !=, 
and, or, not) 

### Deliverable #3 
* while and for Loops 
* Support for comments 

### Deliverable #4 
* Support for function implementations 
* Function calls 

### BONUS
* Visualization of your parse tree, and 
outputting in image format (.png, .jpeg, .jpg, 
.pdf). 
