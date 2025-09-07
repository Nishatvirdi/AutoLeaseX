package carrental;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/removecar")
public class RemoveCar extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int carId = Integer.parseInt(req.getParameter("carId"));
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("rentalapp");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		Query q1 = em.createQuery("DELETE FROM Car c WHERE c.id = :carID");
		q1.setParameter("carID", carId);   // ✅ match the name in query
		q1.executeUpdate();
		Booking bcar = em.find(Booking.class, carId);
		if(bcar!=null) {
			Query q2 = em.createQuery("DELETE FROM Booking b WHERE b.carId = :carID");
			q2.setParameter("carID", carId);  
			q2.executeUpdate();
		}
		et.commit();
		req.setAttribute("carId", carId);
		req.getRequestDispatcher("carremoved.jsp").forward(req, resp);
	}

}
