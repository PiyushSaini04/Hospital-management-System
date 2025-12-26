package com.hospital.servlet;

import com.hospital.util.FileUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.*;

@WebServlet("/viewDoctors")
public class ViewDoctorServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) {
        try {
            String path = getServletContext()
                    .getRealPath("/WEB-INF/data/doctors.txt");

            List<String> doctors = FileUtil.readFile(path);

            // Inject data
            req.setAttribute("doctors", doctors);

            // 🔥 Forward to Doctor Management page
            req.getRequestDispatcher("/jsp/viewDoctors.jsp")
                    .forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
