package com.carcrafter.model;

import jakarta.persistence.*;

@Entity
public class ListingFeature {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int listingFeatureID;

    public int getListingFeatureID() {
        return listingFeatureID;
    }

    public void setListingFeatureID(int listingFeatureID) {
        this.listingFeatureID = listingFeatureID;
    }

    public Listing getListing() {
        return listing;
    }

    public void setListing(Listing listing) {
        this.listing = listing;
    }

    public Features getFeature() {
        return feature;
    }

    public void setFeature(Features feature) {
        this.feature = feature;
    }

    @ManyToOne
    @JoinColumn(name = "listingID")
    private Listing listing;

    @ManyToOne
    @JoinColumn(name = "featureID")
    private Features feature;

}
