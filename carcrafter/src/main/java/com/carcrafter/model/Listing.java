package com.carcrafter.model;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.util.List;

@Entity
public class Listing {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int listingID;

    private int userID; 
    private String title;

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @ManyToOne
    @JoinColumn(name = "conditionTID")
    private ConditionT condition;

    @ManyToOne
    @JoinColumn(name = "bodyTypeID")
    private BodyType bodyType;

    @ManyToOne
    @JoinColumn(name = "makeID")
    private MakeBrand makeBrand;

    @ManyToOne
    @JoinColumn(name = "modelID")
    private Model model;

    private BigDecimal price;

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    @ManyToOne
    @JoinColumn(name = "yearID")
    private Year year;

    @ManyToOne
    @JoinColumn(name = "driveTypeID")
    private DriveType driveType;

    @ManyToOne
    @JoinColumn(name = "transmissionID")
    private Transmission transmission;

    @ManyToOne
    @JoinColumn(name = "fuelTypeID")
    private FuelType fuelType;

    private int mileage;
    private BigDecimal engineSize;

    public int getMileage() {
        return mileage;
    }

    public void setMileage(int mileage) {
        this.mileage = mileage;
    }

    public BigDecimal getEngineSize() {
        return engineSize;
    }

    public void setEngineSize(BigDecimal engineSize) {
        this.engineSize = engineSize;
    }

    @ManyToOne
    @JoinColumn(name = "cylindersID")
    private Cylinders cylinders;

    @ManyToOne
    @JoinColumn(name = "colorID")
    private Color color;

    @ManyToOne
    @JoinColumn(name = "doorsID")
    private Doors doors;

    private String vin;
    private String tags;
    private String description;

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @ManyToOne
    @JoinColumn(name = "locationID")
    private Location location;

    @OneToMany(mappedBy = "listing")
    private List<ListingFeature> listingFeatures;

    @OneToMany(mappedBy = "listing")
    private List<ListingImage> listingImages;

}
