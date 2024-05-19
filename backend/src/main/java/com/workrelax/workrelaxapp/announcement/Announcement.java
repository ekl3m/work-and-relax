package com.workrelax.workrelaxapp.announcement;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table
public class Announcement {
    @Id
    @SequenceGenerator(
        name = "announcement_sequence",
        sequenceName = "announcement_sequence",
        allocationSize = 1
    )
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "announcement_sequence"
    )
    private Long ID;
    private String Title;
    private String Description;
    private String Photo;

    // Null constructor:

    public Announcement() {
    }

    // Everything constructor:

    public Announcement(Long ID, String Title, String Description, String Photo) {
        this.ID = ID;
        this.Title = Title;
        this.Description = Description;
        this.Photo = Photo;
    }

    // No ID constructor, database can generate IDs:

    public Announcement(String Title, String Description, String Photo) {
        this.Title = Title;
        this.Description = Description;
        this.Photo = Photo;
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

    // toString:

    @Override
    public String toString() {
        return "Announcement [ID=" + ID + ", Title=" + Title + ", Description=" + Description + ", Photo=" + Photo + "]";
    }
}
