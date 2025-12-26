package com.hospital.model;

public class Bed {
    private String id;
    private String status;
    private String type;

    public Bed(String id, String status, String type) {
        this.id = id;
        this.status = status;
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public String getStatus() {
        return status;
    }

    public String getType() {
        return type;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String toRecord() {
        return "BED | id=" + id + " | status=" + status + " | type=" + type;
    }

    // Helper to parse from string line
    public static Bed parse(String line) {
        // format: BED | id=1 | status=AVAILABLE | type=General Ward
        try {
            String[] parts = line.split("\\|");
            String id = parts[1].split("=")[1].trim();
            String status = parts[2].split("=")[1].trim();
            String type = parts[3].split("=")[1].trim();
            return new Bed(id, status, type);
        } catch (Exception e) {
            return null;
        }
    }
}
