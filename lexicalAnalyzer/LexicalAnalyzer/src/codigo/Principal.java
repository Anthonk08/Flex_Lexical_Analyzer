/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;

import java.io.File;

/**
 *
 * @author antho
 */
public class Principal {
    public static void main(String[] args) {
        String ruta = "C:/Users/antho/OneDrive/Escritorio/Flex_Lexical_Analyzer/lexicalAnalyzer/LexicalAnalyzer/src/codigo/Lexer.flex";
        generarLexer(ruta);
    }
    
    public static void generarLexer(String ruta){
        File archivo = new File(ruta);
        JFlex.Main.generate(archivo);
    }
}
