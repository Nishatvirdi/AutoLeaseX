package carrental;

import java.util.List;
import java.beans.PersistenceDelegate;
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

@WebServlet("/showcars")
public class ShowCars extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("rentalapp");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		String query = "select c from Car c where c.status=:status";
		List<Car> carlist = em.createQuery(query).setParameter("status", "available").getResultList();
		req.setAttribute("carlist", carlist);
		req.getRequestDispatcher("showcars.jsp").forward(req, resp);
		et.commit();
		
	}

}
