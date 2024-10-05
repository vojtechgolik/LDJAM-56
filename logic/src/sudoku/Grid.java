package src.sudoku;

public class Grid {
    private Animal[][] animalGrid;
    public Grid() {
        this.animalGrid = new Animal[Sudoku.GRID_SIZE][Sudoku.GRID_SIZE];
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
                animalGrid[i][j] = new Animal(Animals.FLY);//TODO: generate animals this is only for test pourposes
            }
        }
    }
}
