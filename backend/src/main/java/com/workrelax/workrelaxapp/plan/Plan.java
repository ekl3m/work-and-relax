package com.workrelax.workrelaxapp.plan;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table
public class Plan {
    @Id
    @SequenceGenerator(
        name = "plan_sequence",
        sequenceName = "plan_sequence",
        allocationSize = 1
    )
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "plan_sequence"
    )
    private Long ID;
    private boolean isNull;
    private Long OwnerID;
    private List<Long> ListOfActivitiesIDs;

    // Null constructor:

    public Plan() {
    }

    // Everything constructor:

    public Plan(Long ID, boolean isNull, Long OwnerID, List<Long> ListOfActivitiesIDs) {
        this.ID = ID;
        this.isNull = isNull;
        this.OwnerID = OwnerID;
        this.ListOfActivitiesIDs = ListOfActivitiesIDs;
    }

    // No ID constructor, database can generate IDs:

    public Plan(boolean isNull, Long OwnerID, List<Long> ListOfActivitiesIDs) {
        this.isNull = isNull;
        this.OwnerID = OwnerID;
        this.ListOfActivitiesIDs = ListOfActivitiesIDs;
    }

    // Getters:

    public Long getID() {
        return ID;
    }

    public boolean isNull() {
        return isNull;
    }

    public Long getOwnerID() {
        return OwnerID;
    }

    public List<Long> getListOfActivitiesIDs() {
        return ListOfActivitiesIDs;
    }

    // Setters:

    public void setID(Long ID) {
        this.ID = ID;
    }

    public void setNull(boolean isNull) {
        this.isNull = isNull;
    }

    public void setOwnerID(Long OwnerID) {
        this.OwnerID = OwnerID;
    }

    public void setListOfActivities(List<Long> ListOfActivitiesIDs) {
        this.ListOfActivitiesIDs = ListOfActivitiesIDs;
    }

    // toString:

    @Override
    public String toString() {
        return "Plan [ID=" + ID + ", isNull=" + isNull + ", OwnerID=" + OwnerID + ", ListOfActivitiesIDs=" + ListOfActivitiesIDs + "]";
    }
}
