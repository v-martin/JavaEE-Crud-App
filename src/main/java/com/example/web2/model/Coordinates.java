package com.example.web2.model;

public class Coordinates {
    private final int x;
    private final float y;
    private final int r;

    public Coordinates(int x, float y, int r) {
        this.x = x;
        this.y = y;
        this.r = r;
    }

    public int getX() {
        return x;
    }

    public float getY() {
        return y;
    }

    public int getR() {
        return r;
    }

    @Override
    public String toString() {
        return "Coordinates{" +
                "x=" + x +
                ", y=" + y +
                ", r=" + r +
                '}';
    }
}