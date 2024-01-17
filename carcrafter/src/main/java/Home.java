import java.io.IOException;
import java.util.List;

import com.carcrafter.model.BodyType;
import com.carcrafter.model.JPAUtil;
import com.carcrafter.model.Listing;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Home")
public class Home extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EntityManager em = JPAUtil.getEntityManager();
		try {
			em.getTransaction().begin();

			TypedQuery<Listing> query = em.createQuery("SELECT L FROM Listing L", Listing.class);
			query.setMaxResults(4);
			List<Listing> listings = query.getResultList();

			TypedQuery<BodyType> bodyTypes_query = em.createQuery("SELECT T FROM BodyType T", BodyType.class);
			List<BodyType> bodyTypes = bodyTypes_query.getResultList();

			TypedQuery<Long> count_query = em.createQuery("SELECT COUNT(L) FROM Listing L", Long.class);
			List<Long> cars_count = count_query.getResultList();

			TypedQuery<Long> count_users_query = em.createQuery("SELECT COUNT(U) FROM UserProfile U where role='user'", Long.class);
			List<Long> users_count = count_users_query.getResultList();

			request.setAttribute("Cars", listings);
			request.setAttribute("BodyTypes", bodyTypes);
			request.setAttribute("Cars_count", cars_count);
			request.setAttribute("Users_count", users_count);
		} finally {
			if (em.isOpen()) {
				em.close();
			}
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}