package com.hospital.util;

import java.io.*;
import java.util.*;

public class FileUtil {

    public static List<String> readFile(String path) throws Exception {
        List<String> list = new ArrayList<>();
        File file = new File(path);

        if (!file.exists()) {
            file.createNewFile();
        }

        BufferedReader br = new BufferedReader(new FileReader(file));
        String line;
        while ((line = br.readLine()) != null) {
            list.add(line);
        }
        br.close();
        return list;
    }

    public static void append(String path, String data) throws Exception {
        File file = new File(path);

        if (!file.exists()) {
            file.createNewFile();
        }

        BufferedWriter bw = new BufferedWriter(new FileWriter(file, true));
        bw.write(data);
        bw.newLine();
        bw.close();
    }

    public static void overwrite(String path, List<String> data) throws Exception {
    BufferedWriter bw = new BufferedWriter(new FileWriter(path));
    for (String s : data) {
        bw.write(s);
        bw.newLine();
    }
    bw.close();
}

}
