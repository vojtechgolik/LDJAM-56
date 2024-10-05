package src.sudoku;

public class Animal {

    public Animals animal;
    public Animal(Animals animal) {
        this.animal = animal;
    }

    @Override
    public String toString() {
        return animal.getMark();
    }
}
