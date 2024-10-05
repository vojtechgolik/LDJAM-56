package src.sudoku;

public class Sudoku {
    public static final int GRID_SIZE = 3;
    private Grid[][] grid;
    public Sudoku() {
        System.out.println("generator test");
        this.grid = new Grid[GRID_SIZE][GRID_SIZE];
        this.fillGrid();
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
    }
    private void fillGrid(){
        for (int i = 0; i < grid.length; i++) {
            for (int j = 0; j < grid[i].length; j++) {
                grid[i][j] = new Grid();
            }
        }
    }
}
