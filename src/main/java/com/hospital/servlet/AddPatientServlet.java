package com.hospital.servlet;

import com.hospital.util.FileUtil;
import com.hospital.util.BedUtil;
import com.hospital.model.Bed;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/addPatient")
public class AddPatientServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String bedPath = getServletContext().getRealPath("/WEB-INF/data/beds.txt");
            List<Bed> allBeds = BedUtil.getAllBeds(bedPath);

            // Filter only available beds
            List<Bed> availableBeds = allBeds.stream()
                    .filter(b -> "AVAILABLE".equalsIgnoreCase(b.getStatus()))
                    .collect(Collectors.toList());

            req.setAttribute("beds", availableBeds);

            // Log for debugging
            System.out.println("Available beds loaded: " + availableBeds.size());

            req.getRequestDispatcher("/jsp/addPatient.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Failed to load beds.");
            req.getRequestDispatcher("/jsp/addPatient.jsp").forward(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try {
            String bedId = req.getParameter("bed");

            String record = "PATIENT | id=P" + System.currentTimeMillis() +
                    " | name=" + req.getParameter("name") +
                    " | age=" + req.getParameter("age") +
                    " | gender=" + req.getParameter("gender") +
                    " | bed=" + bedId;

            String patientPath = getServletContext().getRealPath("/WEB-INF/data/patients.txt");
            FileUtil.append(patientPath, record);

            // Update Bed Status
            String bedPath = getServletContext().getRealPath("/WEB-INF/data/beds.txt");
            BedUtil.updateBedStatus(bedPath, bedId, "OCCUPIED");

            String ctx = req.getContextPath();
            res.sendRedirect(ctx + "/viewPatients");

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error saving patient or updating bed.");
        }
    }
}
