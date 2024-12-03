<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="java.util.Arrays"%>
<%@page import="movie.Movie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Movie Database</title>
	<style>
		body {
			font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
			background: #f0f2f5;
			margin: 20px;
		}
		
		h1 {
			color: #1a237e;
			text-align: center;
			margin-bottom: 30px;
		}
		
		.movie-table {
			width: 100%;
			border-collapse: collapse;
			background: white;
			box-shadow: 0 1px 3px rgba(0,0,0,0.2);
			border-radius: 8px;
			overflow: hidden;
		}
		
		.movie-table th {
			background: #1a237e;
			color: white;
			padding: 15px;
			text-align: left;
		}
		
		.movie-table td {
			padding: 12px 15px;
			border-bottom: 1px solid #ddd;
		}
		
		.movie-table tr:hover {
			background: #f5f5f5;
		}
		
		.movie-poster {
			border-radius: 8px;
			object-fit: cover;
		}
		
		.btn {
			padding: 8px 16px;
			border: none;
			border-radius: 4px;
			cursor: pointer;
			font-weight: bold;
			transition: all 0.3s ease;
		}
		
		.edit-btn {
			background: #4CAF50;
			color: white;
		}
		
		.delete-btn {
			background: #f44336;
			color: white;
		}
		
		.btn:hover {
			opacity: 0.8;
			transform: translateY(-2px);
		}
		
		.genre-tag {
			background: #e3f2fd;
			padding: 4px 8px;
			border-radius: 4px;
			color: #1565c0;
		}
		
		.rating {
			font-weight: bold;
			color: #ff9800;
		}
	</style>
</head>
<body>
	<h1>Movie Database</h1>
	<%
	List<Movie> list = (List<Movie>) request.getAttribute("movie");
	%>

	<table class="movie-table">
		<tr>
			<th>Name</th>
			<th>Language</th>
			<th>Description</th>
			<th>Poster</th>
			<th>Genre</th>
			<th>Rating</th>
			<th>Actions</th>
		</tr>
		<% for (Movie movie : list) { %>
		<tr>
			<td><%= movie.getName() %></td>
			<td><%= movie.getLang() %></td>
			<td><%= movie.getDesp() %></td>
			<td>
				<img class="movie-poster" height="150px" width="100px" 
					 src="data:image/jpg;base64,<%= Base64.encodeBase64String(movie.getPoster())%>">
			</td>
			<td><span class="genre-tag"><%= Arrays.toString(movie.getGenre()) %></span></td>
			<td><span class="rating">★ <%= movie.getRating() %></span></td>
			<td>
				<a href="edit?id=<%= movie.getMid()%>">
					<button class="btn edit-btn">Edit</button>
				</a>
				<a href="delete?id=<%= movie.getMid()%>">
					<button class="btn delete-btn">Delete</button>
				</a>
			</td>
		</tr>
		<% } %>
	</table>
</body>
</html>