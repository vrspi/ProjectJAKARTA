package com.carcrafter.model;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.EntityManager;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.TypedQuery;

@Entity
public class BodyType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int bodyTypeID;

    public int getBodyTypeID() {
        return bodyTypeID;
    }

    public void setBodyTypeID(int bodyTypeID) {
        this.bodyTypeID = bodyTypeID;
    }

    private String bodyType;

    public String getBodyType() {
        return bodyType;
    }

    public void setBodyType(String bodyType) {
        this.bodyType = bodyType;
    }


    public List<BodyType>GetAll(EntityManager em)
    {
        TypedQuery<BodyType> queryBodyType = em.createQuery("SELECT b FROM BodyType b", BodyType.class);
        return queryBodyType.getResultList();
    }
}
