package com.hospital.servlet;

import com.hospital.util.FileUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/addDoctor")
public class AddDoctorServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        try {
            String record =
                "DOCTOR | id=D" + System.currentTimeMillis() +
                " | name=" + req.getParameter("name") +
                " | dept=" + req.getParameter("dept");

            String path = getServletContext()
                    .getRealPath("/WEB-INF/data/doctors.txt");

            FileUtil.append(path, record);

            // SAME redirect pattern as patient
            String ctx = req.getContextPath();

            res.sendRedirect(ctx + "/viewDoctors");
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Doctor insert failed");
        }
    }
}
