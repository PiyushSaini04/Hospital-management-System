<%@ page import="java.util.*" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Medcare | Doctor Records</title>
            <link rel="stylesheet" href="<%=request.getContextPath()%>/style/main.css">
        </head>

        <body>
            <nav>
                <a href="<%=request.getContextPath()%>/index.jsp" class="logo">✚ MEDCARE</a>
                <ul class="nav-links">
                    <li><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
                    <li><a href="<%=request.getContextPath()%>/viewPatients">Patients</a></li>
                    <li><a href="<%=request.getContextPath()%>/viewDoctors" class="active">Doctors</a></li>
                    <li><a href="<%=request.getContextPath()%>/viewBeds">Bed Availability</a></li>
                </ul>
            </nav>

            <div class="container">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
                    <h2>Doctor Records</h2>
                    <a href="<%=request.getContextPath()%>/jsp/addDoctor.jsp" class="btn btn-primary">+ Add Doctor</a>
                </div>

                <% List<String> doctors = (List<String>) request.getAttribute("doctors"); %>
                        <p class="stats" style="color: var(--text-dim); margin-bottom: 1rem;">Total Medical Staff: <%=
                                (doctors==null ? 0 : doctors.size()) %>
                        </p>

                        <table>
                            <thead>
                                <tr>
                                    <th>Doctor Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (doctors !=null && !doctors.isEmpty()) { for (String d : doctors) { %>
                                    <tr>
                                        <td>
                                            <%= d %>
                                        </td>
                                    </tr>
                                    <% } } else { %>
                                        <tr>
                                            <td>No doctors found in the system.</td>
                                        </tr>
                                        <% } %>
                            </tbody>
                        </table>

                        <div style="margin-top: 2rem;">
                            <a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-outline">← Back to
                                Dashboard</a>
                        </div>
            </div>
        </body>

        </html>