<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>AutoLeaseX 🚗✨</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      color: #fff;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      height: 100vh;
      overflow: hidden;
      text-align: center;
      background: linear-gradient(135deg, #36D1DC, #5B86E5, #6a11cb, #ff6b6b);
      background-size: 400% 400%;
      animation: gradientMove 15s ease infinite;
    }

    @keyframes gradientMove {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    body::before {
      content: "";
      position: absolute;
      top:0; left:0; right:0; bottom:0;
      background: url('https://images.unsplash.com/photo-1502877338535-766e1452684a?auto=format&fit=crop&w=1920&q=80') no-repeat center center/cover;
      filter: brightness(0.4) blur(2px);
      z-index: -1;
    }

    .brand {
      font-size: 3rem;
      font-weight: 700;
      color: #ffe66d;
      text-shadow: 0 0 15px #ffe66d, 0 0 30px #ff9d76;
      margin-bottom: 15px;
      animation: glow 1.5s infinite alternate;
    }

    @keyframes glow {
      from { text-shadow: 0 0 10px #ff9d76, 0 0 20px #ff6b6b; }
      to { text-shadow: 0 0 20px #ffe66d, 0 0 40px #ffcc80; }
    }

    h1 {
      font-size: 2.2rem;
      margin-bottom: 10px;
      font-weight: 600;
      text-shadow: 2px 2px 15px rgba(0,0,0,0.5);
      animation: fadeInDown 1s ease forwards;
    }

    p {
      font-size: 1.2rem;
      margin-bottom: 40px;
      animation: fadeInUp 1s ease forwards;
    }

    @keyframes fadeInDown {
      from { opacity: 0; transform: translateY(-20px);}
      to { opacity: 1; transform: translateY(0);}
    }

    @keyframes fadeInUp {
      from { opacity: 0; transform: translateY(20px);}
      to { opacity: 1; transform: translateY(0);}
    }

    .btn {
      display: inline-block;
      padding: 15px 35px;
      margin: 10px;
      border-radius: 50px;
      font-size: 1.1rem;
      font-weight: 600;
      text-decoration: none;
      color: #fff;
      background: rgba(255,255,255,0.15);
      backdrop-filter: blur(10px);
      border: 2px solid rgba(255,255,255,0.2);
      box-shadow: 0 6px 20px rgba(0,0,0,0.3);
      transition: all 0.3s ease;
    }

    .btn:hover {
      transform: translateY(-4px) scale(1.05);
      background: #ffe066;
      color: #222;
      border-color: #ffe066;
    }

    .btn-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 15px;
    }
  </style>
</head>
<body>
  <div class="brand">AutoLeaseX</div>
  <h1>🚗 Welcome to AutoLeaseX ✨</h1>
  <p>Find your ride or share your car with the world! 🌍💨</p>

  <div class="btn-container">
    <a href="register.jsp" class="btn">📝 Register a Car</a>
    <a href="showcars" class="btn">📅 Book a Car</a>
    <a href="showbookedcars" class="btn">🚗 Booked Cars</a>
    <a href="allcars" class="btn">📋 All Cars</a>
  </div>
</body>
</html>