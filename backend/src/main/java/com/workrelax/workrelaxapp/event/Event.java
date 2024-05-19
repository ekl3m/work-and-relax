package com.workrelax.workrelaxapp.event;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table
public class Event {
    @Id
    @SequenceGenerator(
        name = "event_sequence",
        sequenceName = "event_sequence",
        allocationSize = 1
    )
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "event_sequence"
    )
    private Long ID;
    private String Title;
    private String Description;
    private String Photo;
    private LocalDateTime EventDate;

    // Null constructor:

    public Event() {
    }

    // Everything constructor:

    public Event(Long ID, String Title, String Description, String Photo, LocalDateTime EventDate) {
        this.ID = ID;
        this.Title = Title;
        this.Description = Description;
        this.Photo = Photo;
        this.EventDate = EventDate;
    }
    
    // No ID constructor, database can generate IDs:

    public Event(String Title, String Description, String Photo, LocalDateTime EventDate) {
        this.Title = Title;
        this.Description = Description;
        this.Photo = Photo;
        this.EventDate = EventDate;
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

    public LocalDateTime getEventDate() {
        return EventDate;
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

    public void setEventDate(LocalDateTime EventDate) {
        this.EventDate = EventDate;
    }

    // toString:

    @Override
    public String toString() {
        return "Event [ID=" + ID + ", Title=" + Title + ", Description=" + Description + ", Photo=" + Photo + ", EventDate=" + EventDate + "]";
    }
}