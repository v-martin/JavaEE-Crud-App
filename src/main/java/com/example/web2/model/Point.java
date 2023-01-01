package com.example.web2.model;

public class Point {
    private final int x;
    private final float y;
    private final int r;
    private final boolean hit;
    private final String date;
    private final float time;

    public Point(int x, float y, int r,  boolean hit, String date, float time) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.hit = hit;
        this.date = date;
        this.time = time;
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

    public boolean isHit() {
        return hit;
    }

    public String getDate() {
        return date;
    }

    public float getTime() {
        return time;
    }

    @Override
    public String toString() {
        return "Point{" +
                "x=" + x +
                ", y=" + y +
                ", r=" + r +
                '}';
    }
}
