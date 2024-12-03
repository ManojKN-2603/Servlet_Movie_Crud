<!DOCTYPE html>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="movie.Movie"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit Movie</title>
	<style>
		body {
			font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
			background-color: #f5f5f5;
			margin: 0;
			padding: 20px;
		}
		
		.edit-container {
			max-width: 800px;
			margin: 0 auto;
			background: white;
			padding: 30px;
			border-radius: 10px;
			box-shadow: 0 0 20px rgba(0,0,0,0.1);
		}
		
		h1 {
			color: #2c3e50;
			text-align: center;
			margin-bottom: 30px;
		}
		
		.form-group {
			margin-bottom: 20px;
		}
		
		label {
			display: block;
			margin-bottom: 8px;
			color: #34495e;
			font-weight: bold;
		}
		
		input[type="text"],
		input[type="number"],
		textarea,
		select {
			width: 100%;
			padding: 10px;
			border: 1px solid #ddd;
			border-radius: 5px;
			font-size: 16px;
		}
		
		textarea {
			height: 100px;
			resize: vertical;
		}
		
		.poster-preview {
			margin: 10px 0;
		}
		
		.poster-preview img {
			border-radius: 5px;
			box-shadow: 0 0 10px rgba(0,0,0,0.1);
		}
		
		.genre-group {
			display: flex;
			gap: 20px;
			flex-wrap: wrap;
			margin: 10px 0;
		}
		
		.genre-item {
			display: flex;
			align-items: center;
			gap: 5px;
		}
		
		button {
			background-color: #3498db;
			color: white;
			padding: 12px 30px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			font-size: 16px;
			width: 100%;
			transition: background-color 0.3s;
		}
		
		button:hover {
			background-color: #2980b9;
		}
	</style>
</head>
<body>
	<%
	Movie movie = (Movie) request.getAttribute("movie");
	%>
	<div class="edit-container">
		<h1>Edit Movie Details</h1>
		<form action="update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="<%=movie.getMid()%>">
			
			<div class="form-group">
				<label for="name">Movie Name</label>
				<input type="text" id="name" name="name" value="<%=movie.getName()%>">
			</div>
			
			<div class="form-group">
				<label for="desp">Description</label>
				<textarea id="desp" name="desp"><%=movie.getDesp()%></textarea>
			</div>
			
			<div class="form-group">
				<label for="post">Movie Poster</label>
				<input type="file" id="post" name="post">
				<div class="poster-preview">
					<img height="150px" width="120px" 
						 src="data:image/jpg;base64,<%=Base64.encodeBase64String(movie.getPoster())%>">
				</div>
			</div>
			
			<div class="form-group">
				<label for="lang">Language</label>
				<select id="lang" name="lang">
					<option value="kannada">Kannada</option>
					<option value="english">English</option>
					<option value="telugu">Telugu</option>
					<option value="hindi">Hindi</option>
					<option value="tamil">Tamil</option>
				</select>
			</div>
			
			<div class="form-group">
				<label>Genre</label>
				<div class="genre-group">
					<div class="genre-item">
						<input type="checkbox" id="action" name="genre" value="action">
						<label for="action">Action</label>
					</div>
					<div class="genre-item">
						<input type="checkbox" id="scifi" name="genre" value="scifi">
						<label for="scifi">Sci-Fi</label>
					</div>
					<div class="genre-item">
						<input type="checkbox" id="comedy" name="genre" value="comedy">
						<label for="comedy">Comedy</label>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label for="rate">Rating</label>
				<input type="number" id="rate" name="rate" value="<%=movie.getRating()%>" step="0.1" min="0" max="10">
			</div>
			
			<button type="submit">Update Movie</button>
		</form>
	</div>
</body>
</html>