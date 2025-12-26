package com.hospital.servlet;

import com.hospital.util.FileUtil;
import com.hospital.util.BedUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet("/deletePatient")
public class DeletePatientServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) {

        try {
            String id = req.getParameter("id");

            String path = getServletContext().getRealPath("/WEB-INF/data/patients.txt");
            String bedPath = getServletContext().getRealPath("/WEB-INF/data/beds.txt");

            List<String> patients = FileUtil.readFile(path);

            String targetLine = null;
            // Find the patient record
            for (String p : patients) {
                if (p.contains("id=" + id)) {
                    targetLine = p;
                    break;
                }
            }

            if (targetLine != null) {
                // discharge logic: free up the bed
                try {
                    String[] parts = targetLine.split("\\|");
                    for (String part : parts) {
                        if (part.trim().startsWith("bed=")) {
                            String bedId = part.split("=")[1].trim();
                            BedUtil.updateBedStatus(bedPath, bedId, "AVAILABLE");
                        }
                    }
                } catch (Exception e) {
                    System.out.println("Error freeing bed: " + e.getMessage());
                }

                patients.remove(targetLine);
                FileUtil.overwrite(path, patients);
            }

            // redirect back to patient view
            String ctx = req.getContextPath();
            res.sendRedirect(ctx + "/viewPatients");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
