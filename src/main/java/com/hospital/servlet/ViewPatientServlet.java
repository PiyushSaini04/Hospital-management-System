package com.hospital.servlet;

import com.hospital.util.FileUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.*;

@WebServlet("/viewPatients")
public class ViewPatientServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) {
        try {
            String path = getServletContext()
                    .getRealPath("/WEB-INF/data/patients.txt");

            List<String> patients = FileUtil.readFile(path);

            req.setAttribute("patients", patients);

            req.getRequestDispatcher("/jsp/viewPatients.jsp")
                    .forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
