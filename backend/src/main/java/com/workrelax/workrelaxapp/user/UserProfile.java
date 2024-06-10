package com.workrelax.workrelaxapp.user;

import java.util.List;

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
    private Boolean isVerified;
    private Boolean isBanned;
    private Boolean isAdmin;
    private Integer verificationCode; // Bound to user object till regenerated

    // Null constructor:

    public UserProfile() {
    }

    // Everything constructor:

    public UserProfile(Long ID, String Name, String Surname, String Email, String Password, List<Long> FriendlistIDs, Long UserplanID, Boolean isAdmin, Boolean isBanned, Boolean isVerified, Integer verificationCode) {
        this.ID = ID;
        this.Name = Name;
        this.Surname = Surname;
        this.Email = Email;
        this.Password = Password;
        this.FriendlistIDs = FriendlistIDs;
        this.UserplanID = UserplanID;
        this.isAdmin = isAdmin;
        this.isBanned = isBanned;
        this.isVerified = isVerified;
        this.verificationCode = verificationCode;
    }

    // No ID constructor, database can generate IDs:

    public UserProfile(String Name, String Surname, String Email, String Password, List<Long> FriendlistIDs, Long UserplanID, Boolean isAdmin, Boolean isBanned, Boolean isVerified, Integer verificationCode) {
        this.Name = Name;
        this.Surname = Surname;
        this.Email = Email;
        this.Password = Password;
        this.FriendlistIDs = FriendlistIDs;
        this.UserplanID = UserplanID;
        this.isAdmin = isAdmin;
        this.isBanned = isBanned;
        this.isVerified = isVerified;
        this.verificationCode = verificationCode;
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

    public Boolean isVerified() {
        return isVerified;
    }

    public Boolean isBanned() {
        return isBanned;
    }

    public Boolean isAdmin() {
        return isAdmin;
    }

    public Integer getVerificationCode() {
        return verificationCode;
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

    public void setVerified(Boolean isVerified) {
        this.isVerified = isVerified;
    }

    public void setBanned(Boolean isBanned) {
        this.isBanned = isBanned;
    }

    public void setAdmin(Boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public void setVerificationCode(Integer verificationCode) {
        this.verificationCode = verificationCode;
    }

    // toString:

    @Override
    public String toString() {
        return "UserProfile [ID=" + ID + ", Name=" + Name + ", Surname=" + Surname + ", Email=" + Email + ", Password="
                + Password + ", FriendlistIDs=" + FriendlistIDs + ", UserplanID=" + UserplanID + ", isVerified="
                + isVerified + ", isBanned=" + isBanned + ", isAdmin=" + isAdmin + ", verificationCode="
                + verificationCode + "]";
    }
}
