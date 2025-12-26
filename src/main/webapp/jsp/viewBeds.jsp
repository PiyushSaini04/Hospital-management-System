<%@ page import="java.util.*" %>
    <%@ page import="com.hospital.model.Bed" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Medcare | Bed Availability</title>
                <link rel="stylesheet" href="<%=request.getContextPath()%>/style/main.css">
            </head>

            <body>

                <nav>
                    <a href="<%=request.getContextPath()%>/index.jsp" class="logo">✚ MEDCARE</a>
                    <ul class="nav-links">
                        <li><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
                        <li><a href="<%=request.getContextPath()%>/viewPatients">Patients</a></li>
                        <li><a href="<%=request.getContextPath()%>/viewDoctors">Doctors</a></li>
                        <li><a href="<%=request.getContextPath()%>/viewBeds" class="active">Bed Availability</a></li>
                    </ul>
                </nav>

                <div class="container">
                    <div style="text-align: center; margin-bottom: 3rem;">
                        <h2>Hospital Bed Status</h2>
                        <p style="color: var(--text-dim);">Real-time monitoring of bed occupancy across all wards.</p>
                    </div>

                    <div class="bed-grid">
                        <% List<Bed> beds = (List<Bed>) request.getAttribute("beds");
                                if (beds != null && !beds.isEmpty()) {
                                for (Bed b : beds) {
                                boolean isAvailable = "AVAILABLE".equalsIgnoreCase(b.getStatus());
                                %>
                                <div class="bed-card" style="border-top: 4px solid <%= isAvailable ? " var(--success)"
                                    : "var(--danger)" %>;">
                                    <span class="bed-icon">🛏️</span>
                                    <h3>Bed #<%= b.getId() %>
                                    </h3>
                                    <p style="color: var(--text-dim); margin-bottom: 1rem;">
                                        <%= b.getType() %>
                                    </p>
                                    <span class="status-badge <%= isAvailable ? " status-available" : "status-occupied"
                                        %>">
                                        <%= b.getStatus().toUpperCase() %>
                                    </span>
                                </div>
                                <% } } else { %>
                                    <p>No bed data available.</p>
                                    <% } %>
                    </div>

                    <div style="margin-top: 3rem; text-align: center;">
                        <a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-outline">← Back to
                            Dashboard</a>
                    </div>
                </div>

            </body>

            </html>