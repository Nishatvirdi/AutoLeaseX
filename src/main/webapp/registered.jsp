<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AutoLeaseX 🚗 | Car Registered</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
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

        .card {
            text-align: center;
            background: rgba(255,255,255,0.1);
            padding: 50px 40px;
            border-radius: 25px;
            backdrop-filter: blur(10px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.3);
            animation: popIn 1s ease forwards;
        }

        @keyframes popIn {
            0% { transform: scale(0.8); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }

        h1 {
            font-size: 36px;
            margin-bottom: 20px;
            animation: glow 1.5s infinite alternate;
        }

        @keyframes glow {
            from { text-shadow: 0 0 10px #ff9d76, 0 0 20px #ff6b6b; }
            to   { text-shadow: 0 0 20px #ffe66d, 0 0 40px #ffcc80; }
        }

        p {
            font-size: 18px;
            margin: 8px 0;
        }

        .btn {
            margin-top: 30px;
            padding: 14px 30px;
            font-size: 16px;
            font-weight: bold;
            color: #36D1DC;
            background: #fff;
            border: none;
            border-radius: 35px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
        }

        .btn:hover {
            background: #ff6b6b;
            color: #fff;
            transform: scale(1.1);
        }

        .details {
            margin-top: 20px;
            line-height: 1.6;
        }

        .details strong {
            color: #ffe066;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>🚗 AutoLeaseX: Car Registered!</h1>
        <div class="details">
            <p><strong>Car ID:</strong> ${carId}</p>
            <p><strong>Name:</strong> ${carName}</p>
            <p><strong>Model:</strong> ${carModel}</p>
            <p><strong>Owner Name:</strong> ${ownerName}</p>
            <p><strong>Availability:</strong> ${status}</p>
        </div>
        <form action="index.jsp">
            <button type="submit" class="btn">🏠 Go Back to Homepage</button>
        </form>
    </div>
</body>
</html>