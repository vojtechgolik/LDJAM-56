package src.sudoku.util;

import java.util.Random;

public class UtilMath {
    public static int getRandomInt(int min, int max){
        return new Random().nextInt(max - min + 1) + min;
    }
}
