<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medcare | Professional Healthcare Management</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style/main.css">
</head>
<body>

    <nav>
        <a href="<%=request.getContextPath()%>/index.jsp" class="logo">✚ MEDCARE</a>
        <ul class="nav-links">
            <li><a href="<%=request.getContextPath()%>/index.jsp" class="active">Home</a></li>
            <li><a href="<%=request.getContextPath()%>/viewPatients">Patients</a></li>
            <li><a href="<%=request.getContextPath()%>/viewDoctors">Doctors</a></li>
            <li><a href="<%=request.getContextPath()%>/viewBeds">Bed Availability</a></li>
        </ul>
    </nav>

    <div class="hero" style="height: 90vh; display: flex; align-items: center; padding: 0 5%; background: linear-gradient(90deg, #0f172a 40%, rgba(15, 23, 42, 0.4)), url('https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?auto=format&fit=crop&w=1600&q=80'); background-size: cover; background-position: right;">
        <div class="hero-content" style="max-width: 600px;">
            <h1 style="font-size: 3.5rem; margin-bottom: 1.5rem; line-height: 1.1;">Modern Healthcare Management</h1>
            <p style="color: var(--text-dim); font-size: 1.25rem; margin-bottom: 2.5rem;">
                Streamline your hospital operations with our secure, file-based management system. Track patients, manage doctors, and monitor bed capacity in real-time.
            </p>
            <div class="btn-group" style="display: flex; gap: 1rem;">
                <a href="<%=request.getContextPath()%>/addPatient" class="btn btn-primary">Admit Patient</a>
                <a href="<%=request.getContextPath()%>/viewBeds" class="btn btn-outline">Check Beds</a>
            </div>
        </div>
    </div>

</body>
</html>
