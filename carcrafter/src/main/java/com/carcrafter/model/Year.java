package com.carcrafter.model;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Year {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int yearID;

    private String year;

    public int getYearID() {
        return yearID;
    }

    public void setYearID(int yearID) {
        this.yearID = yearID;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

}