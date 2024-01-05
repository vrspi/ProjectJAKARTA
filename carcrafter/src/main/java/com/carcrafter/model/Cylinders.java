package com.carcrafter.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Cylinders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cylindersID;

    public int getCylindersID() {
        return cylindersID;
    }

    public void setCylindersID(int cylindersID) {
        this.cylindersID = cylindersID;
    }

    private int numberOfCylinders;

    public int getNumberOfCylinders() {
        return numberOfCylinders;
    }

    public void setNumberOfCylinders(int numberOfCylinders) {
        this.numberOfCylinders = numberOfCylinders;
    }

}