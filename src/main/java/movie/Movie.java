package movie;

import java.io.IOException;

import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import lombok.Data;

@Entity
@Data
@WebServlet("/movie")
@MultipartConfig
public class Movie extends HttpServlet {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int mid;
	private String name;
	private String desp;
	@Lob
	private byte[] poster;
	private String[] genre;
	private String lang;
	private double rating;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//Adding movie details
		String name = req.getParameter("name");
		String desp = req.getParameter("desp");
		String lang = req.getParameter("lang");
		double rating = Double.parseDouble((req.getParameter("rate")));
		Part file = req.getPart("post");
		String[] genre = req.getParameterValues("genre");
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("M12");
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		Movie m = new Movie();
		m.setName(name);
		m.setDesp(desp);
		m.setLang(lang);
		m.setRating(rating);
		m.setGenre(genre);
		byte[] arr = new byte[file.getInputStream().available()];
		file.getInputStream().read(arr);
		m.setPoster(arr);
		transaction.begin();
		manager.persist(m);
		transaction.commit();

		resp.getWriter().print("<h1>Movie is added</h1>");

	}

}
