package carrental;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/removeBooking")
public class RemoveBooking extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int carId = Integer.parseInt(req.getParameter("carId"));
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("rentalapp");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		et.begin();
		Query q1 = em.createQuery("DELETE FROM Booking b WHERE b.carId = :carID");
		q1.setParameter("carID", carId);   // ✅ match the name in query
		q1.executeUpdate();
		Car car = em.find(Car.class, carId);
		if (car != null) {
		    car.setStatus("available");
		}
		et.commit();
		req.getRequestDispatcher("bookingremoved.jsp").forward(req, resp);
		
	}

}
