package carrental;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/showbookedcars")
public class ShowBookedCars  extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("rentalapp");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		String query = "select c from Car c where c.status=:status";
		List<Car> bookedcarslist = em.createQuery(query).setParameter("status", "Booked").getResultList();
		req.setAttribute("bookedcarslist", bookedcarslist);
		req.getRequestDispatcher("showbookedcars.jsp").forward(req, resp);
		et.commit();
		
	}

}
