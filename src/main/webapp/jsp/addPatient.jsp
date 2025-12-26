<%@ page import="java.util.*" %>
    <%@ page import="com.hospital.model.Bed" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Medcare | Admit Patient</title>
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

                <div class="container" style="display: flex; justify-content: center; padding-top: 3rem;">
                    <div class="form-card" style="width: 100%;">
                        <h2>Admit New Patient</h2>

                        <% if(request.getAttribute("error") !=null) { %>
                            <div
                                style="background: rgba(239, 68, 68, 0.1); color: #ef4444; padding: 10px; border-radius: 6px; margin-bottom: 20px;">
                                <%= request.getAttribute("error") %>
                            </div>
                            <% } %>

                                <form action="<%=request.getContextPath()%>/addPatient" method="post">
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <input name="name" placeholder="e.g. John Doe" required>
                                    </div>

                                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                                        <div class="form-group">
                                            <label>Age</label>
                                            <input name="age" type="number" placeholder="e.g. 32" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Gender</label>
                                            <select name="gender" required>
                                                <option value="" disabled selected>Select Gender</option>
                                                <option value="Male">Male</option>
                                                <option value="Female">Female</option>
                                                <option value="Other">Other</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Assign Bed (Only Available Beds Shown)</label>
                                        <select name="bed" required>
                                            <option value="" disabled selected>Select a Bed</option>
                                            <% List<Bed> beds = (List<Bed>) request.getAttribute("beds");
                                                    if (beds != null && !beds.isEmpty()) {
                                                    for (Bed b : beds) {
                                                    %>
                                                    <option value="<%= b.getId() %>">Bed #<%= b.getId() %> - <%=
                                                                b.getType() %>
                                                    </option>
                                                    <% } } else { %>
                                                        <option value="" disabled>No beds available!</option>
                                                        <% } %>
                                        </select>
                                    </div>

                                    <button type="submit" class="btn btn-primary" style="width: 100%;">Complete
                                        Admission</button>
                                </form>

                                <div style="margin-top: 1.5rem; text-align: center;">
                                    <a href="<%=request.getContextPath()%>/viewPatients"
                                        style="color: var(--text-dim); text-decoration: none; font-size: 0.9rem;">Cancel
                                        and Return to List</a>
                                </div>
                    </div>
                </div>

            </body>

            </html>