package com.carcrafter.Interface;

import com.carcrafter.model.BodyType;
import com.carcrafter.model.Listing;
import jakarta.persistence.EntityManager;
import java.util.List;

public interface IHomeService {
    List<Listing> getListings(EntityManager em);
    List<BodyType> getBodyTypes(EntityManager em);
    List<Long> getListingsCount(EntityManager em);
    List<Long> getUsersCount(EntityManager em);
}
