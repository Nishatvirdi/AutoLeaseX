package carrental;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/bookCar")
public class BookCar extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int carID = Integer.parseInt(req.getParameter("carId"));
		String userName = req.getParameter("userName");
		String startDate =req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("rentalapp");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
	
		
		
		et.begin();
		Booking b = new Booking(carID,userName,startDate,endDate);
		em.persist(b);
		Car car = em.find(Car.class, carID);
		if (car != null) {
		    car.setStatus("Booked");
		}
		et.commit();
		req.getRequestDispatcher("bookingconfirmed.jsp").forward(req, resp);
		
		
		
				
	}

}
