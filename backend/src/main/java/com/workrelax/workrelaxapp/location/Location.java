package com.workrelax.workrelaxapp.location;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table
public class Location {
    @Id
    @SequenceGenerator(name = "location_sequence", sequenceName = "location_sequence", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "location_sequence")
    private Long ID;
    private String Name;
    @Lob
    private String Photo;
    private Double Location_X;
    private Double Location_Y;
    private Boolean isRestaurant;

    // Null constructor:

    public Location() {
    }

    // Everything constructor:
    
    public Location(Long ID, String Name, String Photo, Double Location_X, Double Location_Y, Boolean isRestaurant) {
        this.ID = ID;
        this.Name = Name;
        this.Photo = Photo;
        this.Location_X = Location_X;
        this.Location_Y = Location_Y;
        this.isRestaurant = isRestaurant;
    }

    // No ID constructor, database can generate IDs:

    public Location(String Name, String Photo, Double Location_X, Double Location_Y, Boolean isRestaurant) {
        this.Name = Name;
        this.Photo = Photo;
        this.Location_X = Location_X;
        this.Location_Y = Location_Y;
        this.isRestaurant = isRestaurant;
    }

    // Getters:

    public Long getID() {
        return ID;
    }

    public String getName() {
        return Name;
    }
    
    public String getPhoto() {
        return Photo;
    }

    public Double getLocation_X() {
        return Location_X;
    }

    public Double getLocation_Y() {
        return Location_Y;
    }

    public Boolean isRestaurant() {
        return isRestaurant;
    }

    // Setters:

    public void setID(Long ID) {
        this.ID = ID;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public void setPhoto(String Photo) {
        this.Photo = Photo;
    }

    public void setLocation_X(Double Location_X) {
        this.Location_X = Location_X;
    }

    public void setLocation_Y(Double Location_Y) {
        this.Location_Y = Location_Y;
    }

    public void setRestaurant(Boolean isRestaurant) {
        this.isRestaurant = isRestaurant;
    }

    // toString:

    @Override
    public String toString() {
        return "Location [ID=" + ID + ", Name=" + Name + ", Photo=" + Photo + ", Location_X=" + Location_X + ", Location_Y=" + Location_Y + 
        ", isRestaurant=" + isRestaurant + "]";
    }
}
