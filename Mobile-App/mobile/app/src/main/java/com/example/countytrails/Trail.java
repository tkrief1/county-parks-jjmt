package com.example.countytrails;

public class Trail {
    private String name;
    private String description;
    private String location;

    public Trail(String name, String description, String location) {
        this.name = name;
        this.description = description;
        this.location = location;
    }

    public String getName() { return name; }
    public String getDescription() { return description; }
    public String getLocation() { return location; }
}
