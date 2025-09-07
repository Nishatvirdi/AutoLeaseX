<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="carrental.Car" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AutoLeaseX 🚗 | Booked Cars</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #36D1DC, #5B86E5, #6a11cb);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            color: #fff;
        }

        @keyframes gradientBG {
            0% {background-position: 0% 50%;}
            50% {background-position: 100% 50%;}
            100% {background-position: 0% 50%;}
        }

        .container {
            width: 85%;
            margin: 50px auto;
            background: rgba(255, 255, 255, 0.1);
            padding: 35px 25px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            backdrop-filter: blur(8px);
        }

        h1 {
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

        table {
            width: 100%;
            border-collapse: collapse;
            background: rgba(255,255,255,0.15);
            border-radius: 15px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid rgba(255,255,255,0.3);
        }

        th {
            background: rgba(255,255,255,0.2);
            color: #fff;
            text-transform: uppercase;
            font-size: 14px;
        }

        tr:hover {
            background: rgba(255,255,255,0.1);
        }

        .btn {
            padding: 10px 20px;
            font-size: 14px;
            font-weight: bold;
            color: #36D1DC;
            background: #fff;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background: #ff6b6b;
            color: #fff;
            transform: scale(1.05);
        }

        p.no-bookings {
            text-align: center;
            font-size: 20px;
            margin-top: 30px;
            color: #ffe66d;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>🚗 AutoLeaseX: Booked Cars</h1>

    <%
        List<Car> bookedCars = (List<Car>) request.getAttribute("bookedcarslist");
        if (bookedCars != null && !bookedCars.isEmpty()) {
    %>
        <table>
            <tr>
                <th>Car ID</th>
                <th>Car Name</th>
                <th>Model</th>
                <th>Number</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <%
                for (Car car : bookedCars) {
            %>
            <tr>
                <td><%= car.getId() %></td>
                <td><%= car.getName() %></td>
                <td><%= car.getModel() %></td>
                <td><%= car.getNumber()%></td>
                <td style="color: #ffe66d; font-weight: bold;">Booked</td>
                <td>
                    <form action="removeBooking">
                        <input type="hidden" name="carId" value="<%= car.getId() %>">
                        <button type="submit" class="btn">Remove Booking</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    <%
        } else {
    %>
        <p class="no-bookings">No cars booked yet.</p>
    <%
        }
    %>
</div>
</body>
</html>