/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ValidaRut;

import java.util.Scanner;
import java.util.StringTokenizer;

public class Valida {
     public String Valida(String rut){
        int M=0,S=1,T=
        Integer.parseInt(rut);
        for(;T!=0;T/=10)S=(S+T%10*(9-M++%6))%11;
        System.out.println((char)(S!=0?S+47:75));
        char xp = (char)(S!=0?S+47:75);
        String cadena= (new StringBuffer().append(xp)).toString();
        return cadena;
     }
}

