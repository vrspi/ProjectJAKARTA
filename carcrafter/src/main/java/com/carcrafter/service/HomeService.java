package com.carcrafter.service;

import com.carcrafter.model.BodyType;
import com.carcrafter.model.Listing;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class HomeService {
    public List<Listing> getListings(EntityManager em) {
        TypedQuery<Listing> listings_query = em.createQuery("SELECT L FROM Listing L", Listing.class);
        listings_query.setMaxResults(4);
        return listings_query.getResultList();
    }

    public List<BodyType> getBodyTypes(EntityManager em) {
        TypedQuery<BodyType> bodyTypes_query = em.createQuery("SELECT T FROM BodyType T", BodyType.class);
        return bodyTypes_query.getResultList();
    }

    public List<Long> getListingsCount(EntityManager em) {
        TypedQuery<Long> listing_count_query = em.createQuery("SELECT COUNT(L) FROM Listing L", Long.class);
        return listing_count_query.getResultList();
    }

    public List<Long> getUsersCount(EntityManager em) {
        TypedQuery<Long> users_count_query = em.createQuery("SELECT COUNT(U) FROM UserProfile U where role='user'", Long.class);
        return users_count_query.getResultList();
    }
}
