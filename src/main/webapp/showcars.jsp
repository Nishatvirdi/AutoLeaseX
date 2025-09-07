<%@page import="carrental.Car"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>AutoLeaseX 🚗 | Available Cars</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(135deg, #36D1DC, #5B86E5, #6a11cb);
        background-size: 400% 400%;
        animation: gradientBG 15s ease infinite;
        margin: 0;
        padding: 20px;
        color: #fff;
    }

    @keyframes gradientBG {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    h2 {
        text-align: center;
        font-size: 2.5rem;
        margin-bottom: 30px;
        text-shadow: 0 0 15px #ffe66d, 0 0 30px #ff9d76;
        animation: glow 1.5s infinite alternate;
    }

    @keyframes glow {
        from { text-shadow: 0 0 10px #ff9d76, 0 0 20px #ff6b6b; }
        to   { text-shadow: 0 0 20px #ffe66d, 0 0 40px #ffcc80; }
    }

    .car-container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 25px;
    }

    .car-card {
        background: rgba(255,255,255,0.1);
        padding: 20px;
        border-radius: 15px;
        backdrop-filter: blur(8px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .car-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 10px 30px rgba(0,0,0,0.4);
    }

    .car-card h5 {
        color: #ffe66d;
        font-size: 1.4rem;
        margin-bottom: 12px;
    }

    .car-details {
        margin-bottom: 15px;
        line-height: 1.6;
        color: #fff;
    }

    .book-btn {
        width: 100%;
        padding: 12px;
        background: #36D1DC;
        color: #fff;
        font-weight: bold;
        border: none;
        border-radius: 12px;
        font-size: 1rem;
        cursor: pointer;
        transition: transform 0.2s ease, background 0.3s ease;
    }

    .book-btn:hover {
        transform: scale(1.05);
        background: #5B86E5;
    }

    /* Floating modal */
    .modal {
        display: none;
        position: fixed;
        top: 0; left: 0;
        width: 100%; height: 100%;
        background: rgba(0,0,0,0.6);
        justify-content: center;
        align-items: center;
        z-index: 1000;
    }

    .modal-content {
        background: rgba(255,255,255,0.1);
        padding: 25px;
        border-radius: 15px;
        width: 400px;
        max-width: 90%;
        backdrop-filter: blur(10px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.4);
        animation: slideDown 0.4s ease;
        color: #fff;
    }

    @keyframes slideDown {
        from { transform: translateY(-50px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }

    .close-btn {
        float: right;
        font-size: 20px;
        font-weight: bold;
        cursor: pointer;
    }

    .form-field {
        margin-bottom: 12px;
    }

    .form-field label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    .form-field input {
        width: 100%;
        padding: 8px;
        border: 2px solid #36D1DC;
        border-radius: 8px;
        outline: none;
        transition: 0.3s;
        color: #000;
    }

    .form-field input:focus {
        border-color: #5B86E5;
        box-shadow: 0px 0px 6px rgba(91,134,229,0.5);
    }
</style>
</head>
<body>
<h2>🚗 AutoLeaseX: Available Cars</h2>
<div class="car-container">
<%
    List<Car> carlist = (List<Car>) request.getAttribute("carlist");
    if (carlist != null) {
        for (Car c : carlist) {
%>
    <div class="car-card">
        <h5><%= c.getName() %></h5>
        <div class="car-details">
            <strong>Model:</strong> <%= c.getModel() %><br>
            <strong>Number:</strong> <%= c.getNumber() %><br>
            <strong>Owner:</strong> <%= c.getOwner() %><br>
            <strong>Status:</strong> <%= c.getStatus() %>
        </div>
        <button class="book-btn" onclick="openForm('<%= c.getId() %>')">Book</button>
    </div>
<%
        }
    }
%>
</div>

<!-- Booking Modal -->
<div class="modal" id="bookingModal">
    <div class="modal-content">
        <span class="close-btn" onclick="closeForm()">&times;</span>
        <h3 style="color:#ffe66d; margin-top:0;">Book Car</h3>
        <form action="bookCar" method="get">
            <div class="form-field">
                <label>Car ID</label>
                <input type="text" name="carId" id="carId" readonly>
            </div>
            <div class="form-field">
                <label>Username</label>
                <input type="text" name="userName" placeholder="Enter your name" required>
            </div>
            <div class="form-field">
                <label>Start Date</label>
                <input type="date" name="startDate" required>
            </div>
            <div class="form-field">
                <label>End Date</label>
                <input type="date" name="endDate" required>
            </div>
            <button type="submit" class="book-btn">Confirm Booking</button>
        </form>
    </div>
</div>

<script>
    function openForm(carId) {
        document.getElementById("carId").value = carId;
        document.getElementById("bookingModal").style.display = "flex";
    }
    function closeForm() {
        document.getElementById("bookingModal").style.display = "none";
    }
</script>
</body>
</html>