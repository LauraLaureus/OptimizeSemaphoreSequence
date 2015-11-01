package Control;

import Model.Simulator;
//import View.TestFrame;

/**
 *
 * @author Laura
 */
public class SemaphoreSimulator {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        System.out.println("Hola, desde Java.Vamos a probar como vienen los parámetros.");
        for (String arg : args) {
            System.out.println(arg);
        }

    }

    public static double maine(double[][] d) {
        System.out.println("Hola, desde Java.Vamos a probar como vienen los parámetros.");

        boolean[][] result = new boolean[d.length][d[0].length];
        for (int i = 0; i < result.length; i++) {
            for (int j = 0; j < result[0].length; j++) {
                if( d[i][j]==1)
                    result[i][j] = true;
                else
                    result[i][j] = false;
                //System.out.println(result[i][j] +" ");
            }
        }
        
        
        return new Simulator().simulate(result) ;
    }

}
