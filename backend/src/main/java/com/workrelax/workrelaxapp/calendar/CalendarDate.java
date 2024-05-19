package com.workrelax.workrelaxapp.calendar;

import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table
public class CalendarDate {
    @Id
    @SequenceGenerator(
        name = "calendardate_sequence",
        sequenceName = "calendardate_sequence",
        allocationSize = 1
    )
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "calendardate_sequence"
    )
    private LocalDate date;
    private LocalDateTime time;

    // Null constructor:

    public CalendarDate() {
    }

    // Everything constructor:

    public CalendarDate(LocalDate date, LocalDateTime time) {
        this.date = date;
        this.time = time;
    }

    // No time constructor:

    public CalendarDate(LocalDate date) {
        this.date = date;
    }

    // Getters:

    public LocalDate getDate() {
        return date;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public int getDay() {
        return date.getDayOfMonth();
    }

    public int getMonth() {
        return date.getMonthValue();
    }

    public int getYear() {
        return date.getYear();
    }

    public int getHour() {
        return time.getHour();
    }

    public int getMinute() {
        return time.getMinute();
    }

    public int getSecond() {
        return time.getSecond();
    }

    // Setters:

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }

    // toString:

    @Override
	public String toString() {
		return "CalendarDate [date=" + date + ", time=" + time + "]";
	}
}
