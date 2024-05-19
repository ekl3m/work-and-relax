package com.workrelax.workrelaxapp.calendar;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class CalendarDateService {
    public List<CalendarDate> getCalendars() {
        return List.of(
            new CalendarDate(
                LocalDate.now(),
                LocalDateTime.now()
            )
        );
    }
}
