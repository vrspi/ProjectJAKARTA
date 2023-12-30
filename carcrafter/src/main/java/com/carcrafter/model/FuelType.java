package com.carcrafter.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class FuelType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int fuelTypeID;

    private String fuelType;

    public int getFuelTypeID() {
        return fuelTypeID;
    }

    public void setFuelTypeID(int fuelTypeID) {
        this.fuelTypeID = fuelTypeID;
    }

    public String getFuelType() {
        return fuelType;
    }

    public void setFuelType(String fuelType) {
        this.fuelType = fuelType;
    }

}