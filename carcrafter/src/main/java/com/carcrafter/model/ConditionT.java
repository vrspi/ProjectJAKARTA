package com.carcrafter.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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