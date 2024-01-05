package com.carcrafter.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Doors {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int doorsID;

    private int numberOfDoors;

    public int getDoorsID() {
        return doorsID;
    }

    public void setDoorsID(int doorsID) {
        this.doorsID = doorsID;
    }

    public int getNumberOfDoors() {
        return numberOfDoors;
    }

    public void setNumberOfDoors(int numberOfDoors) {
        this.numberOfDoors = numberOfDoors;
    }

}