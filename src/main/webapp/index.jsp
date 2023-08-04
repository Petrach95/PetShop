<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="it.betacom.model.Utente"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<style>
body {
	font-family: 'Roboto', sans-serif;
	line-height: 1.6;
	margin: 0;
	padding: 0;
	background-color: #f8f8f8;
}

header {
	background: -webkit-linear-gradient(left, #25c481, #25b7c4);
	background: linear-gradient(to right, #25c481, #25b7c4);
	color: #fff;
	padding: 1rem;
	text-align: center;
}

nav {
	background-color: #333;
	color: #fff;
	padding: 0.5rem;
	text-align: center;
}

nav a {
	color: #fff;
	text-decoration: none;
	margin: 0 0.5rem;
}

section {
	max-width: 800px;
	margin: 0 auto;
	padding: 2rem;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

section h2 {
	color: #4CAF50;
}

section p {
	color: #444;
}

footer {
	background-color: #333;
	color: #fff;
	padding: 1rem;
	text-align: center;
}

/* Stile specifico per il negozio di animali */
.hero-image {
	background-image: url('');
	/* Inserire URL dell'immagine del negozio */
	height: 50px;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.pet-categories {
	display: flex;
	justify-content: space-between;
	margin-top: 2rem;
}

.pet-categories img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
	cursor: pointer;
	transition: transform 0.3s ease-in-out;
}

.pet-categories img:hover {
	transform: scale(1.1);
}

.feature {
	display: flex;
	align-items: center;
	margin-top: 2rem;
}

.feature img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
	margin-right: 1rem;
}

.feature h3 {
	color: #4CAF50;
}

.feature p {
	color: #444;
}

.btm {
	background: red;
	/* background-color: #26c6da; */
	border: none;
	padding: 10px;
	width: 200px;
	border-radius: 3px;
	box-shadow: 1px 5px 20px -5px rgba(0, 0, 0, 0.4);
	color: #fff;
	margin-top: 10px;
	cursor: pointer;
	text-decoration: none;
}

h1 {
	font-size: 30px;
	color: black;
	text-transform: uppercase;
	font-weight: 300;
	text-align: center;
	margin-bottom: 15px;
}

@import
	url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);

::-webkit-scrollbar {
	width: 6px;
}

::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
}

::-webkit-scrollbar-thumb {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<header>
		<h1>Animal Kingdom</h1>
		<p>Il regno degli animali domestici</p>
		<div>
			<%
			HttpSession s = request.getSession();
			Utente utenteSessione = (Utente) s.getAttribute("user");
			if (utenteSessione != null) {
			%>
			<a class="btm" href="Logout"
				onclick="return confirm('Stai eseguendo il logout. Vuoi Proseguire?')"><%=utenteSessione.getUsername()%></a>
			<%
			} else {
			%>
			<a class="btm" href="HomePage?p=L">LOGIN</a>
			<%
			}
			%>
		</div>
	</header>

	<nav>
		<a href="HomePage?p=I">Home</a> <a href="HomePage?p=C">Catalogo</a> 
		<%
		if (utenteSessione == null || utenteSessione.getRuolo().equals("C")) {
		%>
		<a href="HomePage?p=A">Acquisti</a>
		<%
		}
		if (utenteSessione != null && !utenteSessione.getRuolo().equals("C")) {
		%>
		<a href="HomePage?p=U">Utenti Registrati</a> <a href="HomePage?p=V">Vendite</a>
		<%
		}
		%>
		<a href="">Contatti</a>
	</nav>

	<div class="hero-image"></div>

	<section>
		<h2>Esplora le nostre categorie</h2>
		<div class="pet-categories">
			<a href="HomePage?p=C&tipo=Cane"><img  src="img/Cane.png" alt="Cani"></a> 
			<a href="HomePage?p=C&tipo=Gatto"><img src="img/Gatto.png" alt="Gatti"></a> 
			<a href="HomePage?p=C&tipo=Pesce"><img src="img/Pesce.png" alt="Pesci"></a> 
			<a href="HomePage?p=C&tipo=Criceto"><img src="img/Criceto.png" alt="Criceti"></a> 
			
			
		</div>
	</section>

	<section>
		<div class="feature">
			<img src="https://example.com/feature-image-1.jpg" alt="Feature 1">
			<div>
				<h3>Amore e cura per gli animali</h3>
				<p>Noi di Animal Kingdom amiamo gli animali e ci prendiamo cura
					di ogni cliente a quattro zampe con affetto e dedizione.</p>
			</div>
		</div>
		<div class="feature">
			<img src="https://example.com/feature-image-2.jpg" alt="Feature 2">
			<div>
				<h3>Prodotti di alta qualità</h3>
				<p>Offriamo solo prodotti di alta qualità per i tuoi animali
					domestici. Dai cibi alle accessori, troverai tutto ciò di cui hanno
					bisogno.</p>
			</div>
		</div>
	</section>

	<footer>
		<p>&copy; 2023 Animal Kingdom. Tutti i diritti riservati.</p>
	</footer>
</body>
</html>
