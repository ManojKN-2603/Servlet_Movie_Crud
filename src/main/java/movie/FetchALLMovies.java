package movie;

import java.io.IOException;
import java.util.Iterator;
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

@WebServlet("/fetch-all")
public class FetchALLMovies extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("M12");
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		List<Movie> movie = manager.createQuery("select x from Movie x").getResultList();
//		resp.getWriter().print(movie);
		if (movie.isEmpty()) {
			resp.getWriter().print("<h1> no movies found</h1>");
			req.getRequestDispatcher("home.html");
		} else {
			req.setAttribute("movie", movie);
			req.getRequestDispatcher("fetchallmovies.jsp").include(req, resp);

		}

	}

}
