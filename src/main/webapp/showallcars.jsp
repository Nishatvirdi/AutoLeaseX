<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, carrental.Car" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AutoLeaseX 🚗 | All Cars</title>
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
            width: 90%;
            margin: 40px auto;
            backdrop-filter: blur(5px);
        }

        h1 {
            text-align: center;
            font-size: 2.8rem;
            margin-bottom: 30px;
            text-shadow: 2px 2px 15px rgba(0,0,0,0.3);
            animation: glow 1.5s infinite alternate;
        }

        @keyframes glow {
            from { text-shadow: 0 0 10px #ff9d76, 0 0 20px #ff6b6b; }
            to   { text-shadow: 0 0 20px #ffe66d, 0 0 40px #ffcc80; }
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: rgba(255,255,255,0.1);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            backdrop-filter: blur(10px);
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }

        th {
            background: rgba(255,255,255,0.2);
            color: #fff;
            font-size: 14px;
            text-transform: uppercase;
        }

        tr:hover {
            background: rgba(255,255,255,0.1);
        }

        .btn-delete {
            background: #ff6b6b;
            color: #fff;
            padding: 8px 16px;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .btn-delete:hover {
            background: #ff4b4b;
            transform: scale(1.05);
        }

        /* Modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 999;
            left: 0; top: 0;
            width: 100%; height: 100%;
            background: rgba(0,0,0,0.6);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background: rgba(255,255,255,0.95);
            padding: 30px 25px;
            border-radius: 20px;
            text-align: center;
            width: 400px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            animation: zoomIn 0.3s ease;
            color: #333;
        }

        @keyframes zoomIn {
            from { transform: scale(0.7); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        .modal h2 {
            margin-bottom: 20px;
        }

        .btn-confirm, .btn-cancel {
            margin: 10px;
            padding: 12px 20px;
            border: none;
            border-radius: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-confirm {
            background: #ff6b6b;
            color: #fff;
        }
        .btn-confirm:hover {
            background: #ff4b4b;
        }

        .btn-cancel {
            background: #ccc;
            color: #333;
        }
        .btn-cancel:hover {
            background: #aaa;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚗 AutoLeaseX: All Cars</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Model</th>
                <th>Number</th>
                <th>Owner</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <%
                List<Car> cars = (List<Car>) request.getAttribute("bookedcarslist");
                if (cars != null) {
                    for (Car car : cars) {
            %>
            <tr>
                <td><%= car.getId() %></td>
                <td><%= car.getName() %></td>
                <td><%= car.getModel() %></td>
                <td><%= car.getNumber() %></td>
                <td><%= car.getOwner() %></td>
                <td><%= car.getStatus() %></td>
                <td>
                    <button class="btn-delete"
                            onclick="openModal('<%= car.getId() %>', '<%= car.getModel() %>')">
                        ❌ Remove
                    </button>
                </td>
            </tr>
            <%      }
                }
            %>
        </table>
    </div>

    <!-- Modal -->
    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <h2 id="modalText">Are you sure?</h2>
            <a id="confirmBtn" href="#" class="btn-confirm">Yes, Remove</a>
            <button type="button" class="btn-cancel" onclick="closeModal()">Cancel</button>
        </div>
    </div>

    <script>
        function openModal(carId, carModel) {
            document.getElementById("modalText").innerText =
                "Are you sure you want to delete car: " + carModel + "?";
            document.getElementById("confirmBtn").href = "removecar?carId=" + carId;
            document.getElementById("deleteModal").style.display = "flex";
        }
        function closeModal() {
            document.getElementById("deleteModal").style.display = "none";
        }
    </script>
</body>
</html>