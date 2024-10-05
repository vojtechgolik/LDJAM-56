package src.sudoku;

public enum Animals {
    MURA("M"),
    KRTEK("K"),
    HAMSTER("H"),
    SNAIL("S"),
    BAT("B"),
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
