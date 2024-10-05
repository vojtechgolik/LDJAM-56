package src.sudoku;

public class Grid {
    private Animal[][] animalGrid;

    private final int index;
    private int lightX = 0,  lightY = 0;
    public Grid(int index) {
        this.animalGrid = new Animal[Sudoku.GRID_SIZE][Sudoku.GRID_SIZE];
        this.index = index;
        this.fillGrid();
    }
    public void printLine(int line){
        for (Animal animal : animalGrid[line]) {
            System.out.printf("[%s] ", animal);
        }
        System.out.print("  ");
    }
    private void fillGrid(){
        for (int i = 0; i < animalGrid.length; i++) {
            for (int j = 0; j < animalGrid[i].length; j++) {
                animalGrid[i][j] = new Animal(Animals.values()[index]);
            }
        }
    }

    public void setLightCords(int x, int y){
        this.lightY = y;
        this.lightX = x;

    }
    public int getLightX() {
        return lightX;
    }

    public int getLightY() {
        return lightY;
    }

    public boolean isLightTop(){
        return this.lightX == 1;
    }
    public boolean isLightBottom(){
        return this.lightX == 2;
    }
    public boolean isLightLeft(){
        return this.lightY == 1;
    }
    public boolean isLightRight(){
        return this.lightY == 2;
    }
}
