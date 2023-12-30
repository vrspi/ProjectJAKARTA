package com.carcrafter.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class DriveType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int driveTypeID;

    public int getDriveTypeID() {
        return driveTypeID;
    }

    public void setDriveTypeID(int driveTypeID) {
        this.driveTypeID = driveTypeID;
    }

    private String driveType;

    public String getDriveType() {
        return driveType;
    }

    public void setDriveType(String driveType) {
        this.driveType = driveType;
    }

}