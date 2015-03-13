/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.comun.alltest;

import java.util.*;

class Separate {

    public static void main(String[] args) {
        String text = "<head>first program </head> <body>hello world</body>";
        Set<String> words = new TreeSet<>();
        try (Scanner tokenizingScanner = new Scanner(text)) {
            tokenizingScanner.useDelimiter("\\W");
            while (tokenizingScanner.hasNext()) {
                String word = tokenizingScanner.next();
                if (!word.trim().equals("")) {
                    words.add(word);
                }
            }
        }
        for (String word : words) {
            System.out.print(word + " ");
        }
    }
}
