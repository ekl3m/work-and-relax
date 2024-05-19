package com.workrelax.workrelaxapp.activity;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table
public class Activity {
    @Id
    @SequenceGenerator(
        name = "activity_sequence",
        sequenceName = "activity_sequence",
        allocationSize = 1
    )
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "activity_sequence"
    )
    private Long ID;
    private String Title;
    private String Description;
    private String Photo;
    private LocalDateTime ActivityDate;

    // Null constructor:

    public Activity() {
    }

    // Everything constructor:

    public Activity(Long ID, String Title, String Description, String Photo, LocalDateTime ActivityDate) {
        this.ID = ID;
        this.Title = Title;
        this.Description = Description;
        this.Photo = Photo;
        this.ActivityDate = ActivityDate;
    }

    // No ID constructor, database can generate IDs:

    public Activity(String Title, String Description, String Photo, LocalDateTime ActivityDate) {
        this.Title = Title;
        this.Description = Description;
        this.Photo = Photo;
        this.ActivityDate = ActivityDate;
    }

    // Getters:

    public Long getID() {
        return ID;
    }

    public String getTitle() {
        return Title;
    }

    public String getDescription() {
        return Description;
    }

    public String getPhoto() {
        return Photo;
    }

    public LocalDateTime getActivityDate() {
        return ActivityDate;
    }

    // Setters:

    public void setID(Long ID) {
        this.ID = ID;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public void setPhoto(String Photo) {
        this.Photo = Photo;
    }

    public void setActivityDate(LocalDateTime ActivityDate) {
        this.ActivityDate = ActivityDate;
    }

    // toString:

    @Override
    public String toString() {
        return "Activity [ID=" + ID + ", Title=" + Title + ", Description=" + Description + ", Photo=" + Photo + ", ActivityDate=" + ActivityDate + "]";
    }
}
