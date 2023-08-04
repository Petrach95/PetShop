<%@page import="java.util.List"%>
<%@page import="it.betacom.model.Utente"%>
<%@ page import="it.betacom.model.Cliente"%>
<%@ page import="it.betacom.model.Animale"%>
<%@ page import="it.betacom.dao.ClienteDao"%>
<%@ page import="it.betacom.dao.UtenteDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Utenti</title>
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

.hero-image {
	background-image: url('');
	/* Inserire URL dell'immagine del negozio */
	height: 50px;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

/* Stile specifico per il negozio di animali */

</style>
<style>
h1 {
	font-size: 30px;
	color: black;
	text-transform: uppercase;
	font-weight: 300;
	text-align: center;
	margin-bottom: 15px;
}

table {
	width: 100%;
	table-layout: fixed;
}

.tbl-header {
	
	background: -webkit-linear-gradient(left, #25c481, #25b7c4);
	background: linear-gradient(to right, #25c481, #25b7c4);
}

.tbl-content {
	height: 300px;
	overflow-x: auto;
	margin-top: 0px;
	border: 1px solid #25c481;
}

th {
	padding: 20px 15px;
	text-align: center;
	font-weight: 500;
	font-size: 12px;
	color: black;
/* 	color: #fff; */
	text-transform: uppercase;
}

td {
	padding: 15px;
	text-align: center;
	vertical-align: middle;
	font-weight: 300;
	font-size: 12px;
	/* color: #fff; */
	color: black;
	border-bottom: solid 1px #25c481;
}

/* demo styles */
@import
	url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);

/* for custom scrollbar for webkit browser*/
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
<style>
.btm {
	background: -webkit-linear-gradient(right, #25c481, #25b7c4);
	background: linear-gradient(to left, #25c481, #25b7c4);
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

.btm_td {
	width: 100px;
}

.utn, .acq, .log {
	width: 33%;
	float: left;
	text-align: center;
	margin-bottom: 20px;
}

.utn>.btm {
	background: #25b7c4;
}

.acq>.btm {
	background: #25c481;
}

.logout>.btm {
	background: red;
}

.btm_del>.btm_delete {
	background: red;
	padding: 2px 10px;
	width: 200px;
}
.btm_del>.btm_edit {
	background: #25b7c4;
	padding: 2px 18px;
	width: 200px;
}
.small {
	padding: 20px 5px;
	width: 1%;
}
.middle {
	padding: 20px 5px;
	width: 5%;
}
.big {
	padding: 20px 5px;
	width: 12%;
}
.bigger {
	padding: 20px 5px;
	width: 19%;
}
</style>
</head>
<body>
	<header>
		<h1>Animal Kingdom</h1>
		<p>Il regno degli animali domestici</p>
		<div  class="logout">
			<%
			HttpSession s = request.getSession();
			Utente utenteSessione = (Utente)s.getAttribute("user");
			%>
			<a class="btm" href="Logout"
				onclick="return confirm('Stai eseguendo il logout. Vuoi Proseguire?')"><%=utenteSessione.getUsername()%></a>
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
		<h1 id="titolo">LISTA UTENTI REGISTRATI</h1>
		
		<h1 id="search">
			<input type="text" id="search-input" placeholder="Cerca per nome...">
		</h1>

		<div>
			<div class="tbl-header">
				<table cellpadding="0" cellspacing="0" border="0">
					<thead>
						<tr>
							<th class="small">ID</th>
							<th class="big">Nome</th>
							<th class="big">Username</th>
							<th class="bigger">Email</th>
							<th class="big">Telefono</th>
							<th class="big">Data di Nascita</th>
							<th class="middle">Ruolo</th>
							<th class="middle">Stato</th>
							<%
							if (utenteSessione.getRuolo().equals("M")) {
/* 							String manager = (String) request.getAttribute("manager");
							if (manager.equals("M")) { */
							%>
							<th class="big"></th>
							<%
							}
							%>
						</tr>
					</thead>
				</table>
			</div>
			<div class="tbl-content">
				<table cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<%
							UtenteDao utenteDao = new UtenteDao();
							List<Utente> utenti = utenteDao.findAll();
							for (Utente u : utenti) {
							%>
							<td class="small"><%=u.getId()%></td>
							<td class="big"><%=u.getNome() + " " + u.getCognome()%></td>
							<td class="big"><%=u.getUsername()%></td>
							<td class="bigger"><%=u.getEmail()%></td>
							<td class="big"><%=u.getTelefono()%></td>
							<td class="big"><%=u.getDataNascita()%></td>
							<td class="middle"><%=u.getRuolo()%></td>
							<td class="middle"><%=u.getStato()%></td>
							<%
							if (utenteSessione.getRuolo().equals("M")) {
							%>
							<td class="btm_del"  class="big">
								<%
								if (u.getId()!=1) {
								%>
									<a class="btm btm_edit" href="EditServlet?idEdit=<%=u.getId()%>" 
									style="text-align: center; margin-left: 0;">Edit</a><br/>
									<a class="btm btm_delete" href="EditServlet?idDelete=<%=u.getId()%>"
									onclick="return confirm('Sei sicuro di voler eliminare l\'utente?')"
									style="text-align: center; margin-left: 0;">Delete</a>
								<%
								}
								%>
							</td>
							<%
							}
							%>

						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
		
	</section>

<!-- 	<footer>
		<p>&copy; 2023 Animal Kingdom. Tutti i diritti riservati.</p>
	</footer> -->
	
	<script>

function toggleAnimali(clienteId) {
    var animaliRows = document.querySelectorAll(`tr[id^=${"animali-"+clienteId}]`);
    animaliRows.forEach(function (row) {
	   row.style.display = row.style.display === "none" ? "table-row" : "none";
	});
}

document.getElementById("search-input").addEventListener("input", function () {
    var inputText = this.value.toLowerCase();
    var rows = document.querySelectorAll(".tbl-content tr");

    rows.forEach(function (row) {
        var clienteInfo = row.innerText.toLowerCase();
        if (clienteInfo.indexOf(inputText) > -1) {
            row.style.display = "table-row";
        } else {
            row.style.display = "none";
        }
    });
});
//'.tbl-content' consumed little space for vertical scrollbar, scrollbar width depend on browser/os/platfrom. Here calculate the scollbar width .
$(window).on("load resize ", function() {
  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
  $('.tbl-header').css({'padding-right':scrollWidth});
}).resize();
</script>
</body>
</html>