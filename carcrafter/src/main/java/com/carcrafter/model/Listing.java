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

 

    public int getListingID() {
        return listingID;
    }

    public void setListingID(int listingID) {
        this.listingID = listingID;
    }

    public ConditionT getCondition() {
        return condition;
    }

    public void setCondition(ConditionT condition) {
        this.condition = condition;
    }

    public BodyType getBodyType() {
        return bodyType;
    }

    public void setBodyType(BodyType bodyType) {
        this.bodyType = bodyType;
    }

    public MakeBrand getMakeBrand() {
        return makeBrand;
    }

    public void setMakeBrand(MakeBrand makeBrand) {
        this.makeBrand = makeBrand;
    }

    public Model getModel() {
        return model;
    }

    public void setModel(Model model) {
        this.model = model;
    }

    public Year getYear() {
        return year;
    }

    public void setYear(Year year) {
        this.year = year;
    }

    public DriveType getDriveType() {
        return driveType;
    }

    public void setDriveType(DriveType driveType) {
        this.driveType = driveType;
    }

    public Transmission getTransmission() {
        return transmission;
    }

    public void setTransmission(Transmission transmission) {
        this.transmission = transmission;
    }

    public FuelType getFuelType() {
        return fuelType;
    }

    public void setFuelType(FuelType fuelType) {
        this.fuelType = fuelType;
    }

    public Cylinders getCylinders() {
        return cylinders;
    }

    public void setCylinders(Cylinders cylinders) {
        this.cylinders = cylinders;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public Doors getDoors() {
        return doors;
    }

    public void setDoors(Doors doors) {
        this.doors = doors;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public List<ListingFeature> getListingFeatures() {
        return listingFeatures;
    }

    public void setListingFeatures(List<ListingFeature> listingFeatures) {
        this.listingFeatures = listingFeatures;
    }

    @OneToMany(mappedBy = "listing")
    private List<Image> images;


    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }
   

}
