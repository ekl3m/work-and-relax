package com.workrelax.workrelaxapp.chat;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table
public class Chat {
    @Id
    @SequenceGenerator(
        name = "chat_sequence",
        sequenceName = "chat_sequence",
        allocationSize = 1
    )
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "chat_sequence"
    )
    private Long OwnerID;
    private Long CoownerID;
    private List<String> Messages;

    // Null constructor:

    public Chat() {
    }

    // Everything constructor:

    public Chat(Long OwnerID, Long CoownerID, List<String> Messages) {
        this.OwnerID = OwnerID;
        this.CoownerID = CoownerID;
        this.Messages = Messages;
    }

    // No messages constructor:

    public Chat(Long OwnerID, Long CoownerID) {
        this.OwnerID = OwnerID;
        this.CoownerID = CoownerID;
    }

    // Getters:

    public Long getOwnerID() {
        return OwnerID;
    }

    public Long getCoownerID() {
        return CoownerID;
    }

    public List<String> getMessages() {
        return Messages;
    }

    // Setters:

    public void setOwner(Long OwnerID) {
        this.OwnerID = OwnerID;
    }

    public void setCoowner(Long CoownerID) {
        this.CoownerID = CoownerID;
    }

    public void setMessages(List<String> Messages) {
        this.Messages = Messages;
    }

    // toString:

    @Override
    public String toString() {
        return "Chat [OwnerID=" + OwnerID + ", CoownerID=" + CoownerID + ", Messages=" + Messages + "]";
    }
}
