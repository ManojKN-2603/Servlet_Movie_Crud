package movie;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/update")
@MultipartConfig
public class Update extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String desp = req.getParameter("desp");
		String lang = req.getParameter("lang");
		double rating = Double.parseDouble((req.getParameter("rate")));
		Part file = req.getPart("post");
		String[] genre = req.getParameterValues("genre");
		int id = Integer.parseInt(req.getParameter("id"));
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("M12");
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		Movie m = manager.find(Movie.class, id);
		byte[] arr = new byte[file.getInputStream().available()];
		file.getInputStream().read(arr);
		if (arr.length > 0) {
			m.setPoster(arr);
		}
		m.setName(name);
		m.setDesp(desp);
		m.setLang(lang);
		m.setRating(rating);
		m.setGenre(genre);

		transaction.begin();
		manager.merge(m);
		transaction.commit();

		resp.getWriter().print("<h1>updated successfully</h1>");
		req.getRequestDispatcher("fetch-all").include(req, resp);

	}
}
