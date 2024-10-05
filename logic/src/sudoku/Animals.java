package src.sudoku;

public enum Animals {
    KRTEK("K"),
    MURA("M"),
    HAMSTER("H"),
    BAT("B"),
    SNAIL("S"),
    PAVOUK("P"),
    FLY("F"),
    GRASS_HOPPER("G"),
    QUEEN_BEE("B");

    private final String mark;
    Animals(String s) {
        this.mark = s;
    }

    public String getMark() {
        return mark;
    }
}
