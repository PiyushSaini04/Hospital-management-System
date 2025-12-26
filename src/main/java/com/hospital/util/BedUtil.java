package com.hospital.util;

import com.hospital.model.Bed;
import java.util.*;
import java.util.stream.Collectors;

public class BedUtil {

    public static List<Bed> getAllBeds(String path) throws Exception {
        List<String> lines = FileUtil.readFile(path);
        List<Bed> beds = new ArrayList<>();
        for (String line : lines) {
            if (line.trim().isEmpty())
                continue;
            Bed b = Bed.parse(line);
            if (b != null)
                beds.add(b);
        }
        return beds;
    }

    public static void saveBeds(String path, List<Bed> beds) throws Exception {
        List<String> lines = new ArrayList<>();
        for (Bed b : beds) {
            lines.add(b.toRecord());
        }
        FileUtil.overwrite(path, lines);
    }

    public static void updateBedStatus(String path, String bedId, String newStatus) throws Exception {
        List<Bed> beds = getAllBeds(path);
        boolean updated = false;
        for (Bed b : beds) {
            if (b.getId().equals(bedId)) {
                b.setStatus(newStatus);
                updated = true;
                break;
            }
        }
        if (updated) {
            saveBeds(path, beds);
        }
    }
}
