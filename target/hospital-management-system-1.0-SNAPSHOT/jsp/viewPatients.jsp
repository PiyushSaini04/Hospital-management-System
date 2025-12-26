<%@ page import="java.util.*" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Medcare | Patient Records</title>
            <link rel="stylesheet" href="<%=request.getContextPath()%>/style/main.css">
        </head>

        <body>

            <nav>
                <a href="<%=request.getContextPath()%>/index.jsp" class="logo">✚ MEDCARE</a>
                <ul class="nav-links">
                    <li><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
                    <li><a href="<%=request.getContextPath()%>/viewPatients" class="active">Patients</a></li>
                    <li><a href="<%=request.getContextPath()%>/viewDoctors">Doctors</a></li>
                    <li><a href="<%=request.getContextPath()%>/viewBeds">Bed Availability</a></li>
                </ul>
            </nav>

            <div class="container">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
                    <h2>Patient Records</h2>
                    <a href="<%=request.getContextPath()%>/addPatient" class="btn btn-primary">+ Admit Patient</a>
                </div>

                <table>
                    <thead>
                        <tr>
                            <th>Patient Details</th>
                            <th style="width: 150px; text-align: center;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% List<String> patients = (List<String>) request.getAttribute("patients");
                                if (patients != null && !patients.isEmpty()) {
                                for (String p : patients) {
                                // Extract ID
                                String id = "";
                                try {
                                String[] parts = p.split("\\|");
                                for(String part : parts) {
                                if(part.trim().startsWith("id=")) {
                                id = part.split("=")[1].trim();
                                }
                                }
                                } catch(Exception e) {}
                                %>
                                <tr>
                                    <td>
                                        <%= p %>
                                    </td>
                                    <td style="text-align: center;">
                                        <a href="<%=request.getContextPath()%>/deletePatient?id=<%=id%>"
                                            onclick="return confirm('Are you sure you want to discharge ID <%=id%>?');"
                                            class="btn btn-danger"
                                            style="padding: 0.5rem 1rem; font-size: 0.8rem;">Discharge</a>
                                    </td>
                                </tr>
                                <% } } else { %>
                                    <tr>
                                        <td colspan="2"
                                            style="text-align: center; color: var(--text-dim); padding: 2rem;">No active
                                            patients found.</td>
                                    </tr>
                                    <% } %>
                    </tbody>
                </table>

                <div style="margin-top: 2rem;">
                    <a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-outline">← Back to Dashboard</a>
                </div>
            </div>

        </body>

        </html>