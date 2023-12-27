package com.carcrafter.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class ConditionT {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int conditionTID;

    private String conditionTType;

    public String getConditionTType() {
        return conditionTType;
    }

    public void setConditionTType(String conditionTType) {
        this.conditionTType = conditionTType;
    }

   
}