package com.carcrafter.model;

import jakarta.persistence.*;

@Entity
public class ListingFeature {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int listingFeatureID;

    @ManyToOne
    @JoinColumn(name = "listingID")
    private Listing listing;

    @ManyToOne
    @JoinColumn(name = "featureID")
    private Features feature;

}
