<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Medcare | Add Doctor</title>
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

        <div class="container" style="display: flex; justify-content: center; padding-top: 3rem;">
            <div class="form-card" style="width: 100%;">
                <h2>Register New Doctor</h2>
                <form action="<%=request.getContextPath()%>/addDoctor" method="post">
                    <div class="form-group">
                        <label>Doctor Name</label>
                        <input name="name" placeholder="Dr. Jane Smith" required>
                    </div>
                    <div class="form-group">
                        <label>Specialization / Department</label>
                        <input name="dept" placeholder="Cardiology" required>
                    </div>
                    <button type="submit" class="btn btn-primary" style="width: 100%;">Register Doctor</button>
                </form>

                <div style="margin-top: 1.5rem; text-align: center;">
                    <a href="<%=request.getContextPath()%>/viewDoctors"
                        style="color: var(--text-dim); text-decoration: none; font-size: 0.9rem;">Cancel and Return to
                        List</a>
                </div>
            </div>
        </div>

    </body>

    </html>