/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.comun.alltest;

/**
 *
 * @author rberrezueta
 */
class Point2D {

    private int x, y;

    public Point2D(int x, int y) {
        x = x;
    }

    public String toString() {
        return "[" + x + ", " + y + "]";
    }

    public static void main(String[] args) {
        Point2D point = new Point2D(10, 20);
        System.out.println(point);
    }
}