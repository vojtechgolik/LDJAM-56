package src.sudoku;

import src.sudoku.util.UtilMath;

public class Sudoku {
    public static final int GRID_SIZE = 3;
    private Grid[][] grid;
    public Sudoku() {
        System.out.println("generator test");
        this.grid = new Grid[GRID_SIZE][GRID_SIZE];
        this.fillGrid();
        this.generateLight();
        this.print();
    }

    public void print(){
        for (int i = 0; i < grid.length; i++) {
            for (int j = 0; j < GRID_SIZE; j ++){
                for (Grid gridObject : grid[i]) {
                    gridObject.printLine(j);
                }
                System.out.print("\n");
            }
            System.out.print("\n");
        }

        System.out.println("Light positions:");
        for (int i = 0; i < grid.length; i++) {
            for (int j = 0; j < grid[i].length; j++) {
                Grid g = grid[i][j];
                System.out.printf("(Grid[%d, %d]: [%s %s])\t", i, j, g.isLightBottom()? "Bottom" : "Top", g.isLightLeft()? "Left" : "Right");
            }
            System.out.print("\n");
        }
    }
    private void fillGrid(){
        for (int i = 0; i < grid.length; i++) {
            for (int j = 0; j < grid[i].length; j++) {
                int index = i * 3 + j;
                grid[i][j] = new Grid(index);
            }
        }
    }
    private void generateLight(){
        for (int i = 0; i < grid.length; i++) {
            for (int j = 0; j < grid[i].length; j++) {
                int randX = (int) ( Math.random() * 2 + 1);;
                int randY = (int) ( Math.random() * 2 + 1);;
                grid[i][j].setLightCords(randX, randY);
            }
        }
        checkLights();
    }
    private void checkLights(){

    }
    private void checkRows(){
        for (int i = 0; i < grid.length; i++) {
            int rowBottom = 0;
            int rowTop = 0;
            for (int j = 0; j < grid[i].length; j++) {
                Grid g = grid[i][j];
                if(g.isLightBottom()){
                    rowBottom ++;
                }else{
                    rowTop ++;
                }
            }
            if(rowBottom == 0 || rowTop == 0){
                correctRow(i);
            }
        }
    }
    private void correctRow(int index){
        int randomCorrect = UtilMath.getRandomInt(0, 2);
        Grid g  = grid[index][randomCorrect];
        g.setLightCords(g.getLightX()==1 ? 2 : 1, g.getLightY());
    }
    private void checkCols(){

    }
}
