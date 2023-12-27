package com.carcrafter.model;

import jakarta.persistence.*;

@Entity
public class Favorites {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int favoriteID;

    private int userID; 
    private int listingID;
    public int getUserID() {
        return userID;
    }
    public void setUserID(int userID) {
        this.userID = userID;
    }
    public int getListingID() {
        return listingID;
    }
    public void setListingID(int listingID) {
        this.listingID = listingID;
    } 

}
