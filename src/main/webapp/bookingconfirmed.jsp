<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Booking Confirmation 🚗✨</title>
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji', Arial, sans-serif;
      background: linear-gradient(135deg, #ff9a9e, #fad0c4, #fbc2eb, #a18cd1);
      background-size: 400% 400%;
      animation: gradientBG 12s ease infinite;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      color: #fff;
    }

    @keyframes gradientBG {
      0% {background-position: 0% 50%;}
      50% {background-position: 100% 50%;}
      100% {background-position: 0% 50%;}
    }

    .card {
      background: rgba(255, 255, 255, 0.15);
      backdrop-filter: blur(10px);
      padding: 50px;
      border-radius: 25px;
      text-align: center;
      box-shadow: 0 8px 25px rgba(0,0,0,0.3);
      animation: fadeSlideIn 1s ease;
    }

    @keyframes fadeSlideIn {
      from { opacity: 0; transform: translateY(30px) scale(0.9); }
      to   { opacity: 1; transform: translateY(0) scale(1); }
    }

    h1 {
      font-size: 3rem;
      margin-bottom: 20px;
      text-shadow: 2px 2px 10px rgba(0,0,0,0.3);
      animation: glow 1.5s infinite alternate;
    }

    @keyframes glow {
      from { text-shadow: 0 0 10px #ffe66d, 0 0 20px #ff6b6b; }
      to   { text-shadow: 0 0 20px #fff176, 0 0 40px #ffcc80; }
    }

    p {
      font-size: 1.3rem;
      margin-bottom: 25px;
    }

    .btn {
      padding: 12px 30px;
      font-size: 1.1rem;
      font-weight: bold;
      border: none;
      border-radius: 50px;
      background: #fff;
      color: #444;
      cursor: pointer;
      transition: all 0.3s ease;
      text-decoration: none;
      display: inline-block;
      box-shadow: 0 4px 15px rgba(0,0,0,0.2);
    }

    .btn:hover {
      transform: scale(1.1);
      background: #ffe066;
      color: #000;
    }
  </style>
</head>
<body>
  <div class="card">
    <h1>✅ Booking Confirmed!</h1>
    <p>🚗 Your car has been successfully booked.<br/> Thank you for choosing <strong>Car Rentals</strong>! ✨</p>

    <form action="index.jsp">
      <button type="submit" class="btn">🏠 Go Back to Homepage</button>
    </form>
  </div>
</body>
</html>