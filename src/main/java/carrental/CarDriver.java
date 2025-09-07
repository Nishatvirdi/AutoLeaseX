package carrental;


import java.io.IOException;
import java.io.PrintWriter;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/RegisterCarServlet")
public class CarDriver extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Car c =  new Car();
		int id=Integer.parseInt(req.getParameter("carId"));
		String carname= req.getParameter("carName");
		String model= req.getParameter("carModel");
		int number=Integer.parseInt(req.getParameter("carNumber"));
		String owner= req.getParameter("ownerName");
		c.setId(id);
		c.setName(carname);
		c.setModel(model);
		c.setNumber(number);
		c.setOwner(owner);
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("rentalapp");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		et.begin();
		em.persist(c);
		et.commit();
		
		req.setAttribute("carId", id);
        req.setAttribute("carName", carname);
        req.setAttribute("carModel", model);
        req.setAttribute("carNumber", number);
        req.setAttribute("ownerName", owner);
        req.setAttribute("status", c.getStatus());

        // ✅ Forward to JSP
        req.getRequestDispatcher("registered.jsp").forward(req, resp);
	
		


		
	}
	

}




