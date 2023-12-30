package com.carcrafter.model;

import jakarta.persistence.*;

import java.util.List;

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

    public int getConditionTID() {
        return conditionTID;
    }

    public void setConditionTID(int conditionTID) {
        this.conditionTID = conditionTID;
    }

    public List<ConditionT> GetAll(EntityManager em)
    {
        TypedQuery<ConditionT> queryConditionT = em.createQuery("SELECT b FROM ConditionT b", ConditionT.class);
        return queryConditionT.getResultList();
    }
   
}