package com.hospital.servlet;

import com.hospital.util.BedUtil;
import com.hospital.model.Bed;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewBeds")
public class ViewBedServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String bedPath = getServletContext().getRealPath("/WEB-INF/data/beds.txt");
            List<Bed> allBeds = BedUtil.getAllBeds(bedPath);

            req.setAttribute("beds", allBeds);
            req.getRequestDispatcher("/jsp/viewBeds.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error loading beds.");
        }
    }
}
