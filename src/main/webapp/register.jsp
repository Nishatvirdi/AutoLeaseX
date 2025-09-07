<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>AutoLeaseX 🚗 | Register Car</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
<style>
    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background: linear-gradient(135deg, #36D1DC, #5B86E5, #6a11cb, #ff6b6b);
        background-size: 400% 400%;
        animation: gradientMove 12s ease infinite;
        color: #fff;
    }

    @keyframes gradientMove {
        0% {background-position: 0% 50%;}
        50% {background-position: 100% 50%;}
        100% {background-position: 0% 50%;}
    }

    .form-container {
        background: rgba(255,255,255,0.1);
        backdrop-filter: blur(12px);
        padding: 45px 50px;
        border-radius: 25px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        width: 400px;
        text-align: center;
        animation: fadeSlideIn 1s ease forwards;
    }

    @keyframes fadeSlideIn {
        from { opacity: 0; transform: translateY(30px) scale(0.9); }
        to { opacity: 1; transform: translateY(0) scale(1); }
    }

    .brand {
        font-size: 2.5rem;
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

    h2 {
        margin-bottom: 25px;
        font-size: 2rem;
        font-weight: 600;
        text-shadow: 1px 1px 8px rgba(0,0,0,0.3);
    }

    .input-box {
        width: 100%;
        padding: 14px 12px;
        margin: 10px 0;
        border: 1.5px solid rgba(255,255,255,0.6);
        border-radius: 12px;
        font-size: 1rem;
        background: rgba(255,255,255,0.2);
        color: #fff;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    .input-box::placeholder {
        color: rgba(255,255,255,0.7);
    }

    .input-box:focus {
        border-color: #ffe066;
        box-shadow: 0 0 8px #ffe066;
        outline: none;
        background: rgba(255,255,255,0.25);
    }

    .btn {
        background: #fff;
        color: #36D1DC;
        padding: 14px;
        width: 100%;
        border: none;
        border-radius: 30px;
        font-size: 1.1rem;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.3s ease;
        margin-top: 15px;
        box-shadow: 0 6px 18px rgba(0,0,0,0.25);
    }

    .btn:hover {
        background: #36D1DC;
        color: #fff;
        transform: scale(1.05);
        box-shadow: 0 8px 25px rgba(0,0,0,0.4);
    }
</style>
</head>
<body>
  <div class="form-container">
      <div class="brand">AutoLeaseX</div>
      <h2>🚘 Register a Car</h2>
      <form action="RegisterCarServlet" method="post">
          <input type="text" name="carId" class="input-box" placeholder="Car ID 🔑" required />
          <input type="text" name="carName" class="input-box" placeholder="Car Name 🚗" required />
          <input type="text" name="carModel" class="input-box" placeholder="Car Model 🛠️" required />
          <input type="text" name="carNumber" class="input-box" placeholder="Car Number 🔢" required />
          <input type="text" name="ownerName" class="input-box" placeholder="Owner Name 👤" required />
          <button type="submit" class="btn">✅ Register</button>
      </form>
  </div>
</body>
</html>