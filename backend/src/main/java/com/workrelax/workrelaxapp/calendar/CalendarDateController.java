package com.workrelax.workrelaxapp.calendar;

import java.util.List;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
@RequestMapping(path = "api/v1/calendar")
public class CalendarDateController {
    private final CalendarDateService calendarService;

    @Autowired
    public CalendarDateController(CalendarDateService calendarService) {
        this.calendarService = calendarService;
    }

    @GetMapping
    public List<CalendarDate> getCalendars() {
        return calendarService.getCalendars();
    }
}
