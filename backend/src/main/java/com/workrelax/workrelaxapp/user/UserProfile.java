package com.workrelax.workrelaxapp.user;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table
public class UserProfile {
    @Id
    @SequenceGenerator(name = "userprofile_sequence", sequenceName = "userprofile_sequence", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "userprofile_sequence")
    private Long ID;
    private String Name;
    private String Surname;
    private String Email;
    private String Password;
    private List<Long> FriendlistIDs;
    private Long UserplanID;

    // Null constructor:

    public UserProfile() {
    }

    // Everything constructor:

    public UserProfile(Long ID, String Name, String Surname, String Email, String Password, List<Long> FriendlistIDs,
            Long UserplanID) {
        this.ID = ID;
        this.Name = Name;
        this.Surname = Surname;
        this.Email = Email;
        this.Password = Password;
        this.FriendlistIDs = FriendlistIDs;
        this.UserplanID = UserplanID;
    }

    // No ID constructor, database can generate IDs:

    public UserProfile(String Name, String Surname, String Email, String Password, List<Long> FriendlistIDs,
            Long UserplanID) {
        this.Name = Name;
        this.Surname = Surname;
        this.Email = Email;
        this.Password = Password;
        this.FriendlistIDs = FriendlistIDs;
        this.UserplanID = UserplanID;
    }

    // Getters:

    public Long getID() {
        return ID;
    }

    public String getName() {
        return Name;
    }

    public String getSurname() {
        return Surname;
    }

    public String getEmail() {
        return Email;
    }

    public String getPassword() {
        return Password;
    }

    public List<Long> getFriendlist() {
        return FriendlistIDs;
    }

    public Long getUserplan() {
        return UserplanID;
    }

    // Setters:

    public void setID(Long ID) {
        this.ID = ID;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public void setSurname(String Surname) {
        this.Surname = Surname;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public void setFriendlist(List<Long> FriendlistIDs) {
        this.FriendlistIDs = FriendlistIDs;
    }

    public void setUserplan(Long UserplanID) {
        this.UserplanID = UserplanID;
    }

    // toString:

    @Override
    public String toString() {
        return "User [ID=" + ID + ", Name=" + Name + ", Surname=" + Surname + ", Email=" + Email + ", Password="
                + Password + ", FriendlistIDs=" + FriendlistIDs + ", UserplanID=" + UserplanID + "]";
    }
}
