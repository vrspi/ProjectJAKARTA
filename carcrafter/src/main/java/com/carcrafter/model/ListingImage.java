package com.carcrafter.model;

import jakarta.persistence.*;

@Entity
public class ListingImage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int listingImageID;

    @ManyToOne
    @JoinColumn(name = "listingID")
    private Listing listing;

    @ManyToOne
    @JoinColumn(name = "imageID")
    private Image image;

}
