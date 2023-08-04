<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="it.betacom.model.Utente"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modifica</title>
<style>
/* ------------------------------------ Click on login and Sign Up to  changue and view the effect
---------------------------------------
*/
* {
	margin: 0px auto;
	padding: 0px;
	text-align: center;
	font-family: "Open Sans", sans-serif;
}

.cotn_principal {
	position: absolute;
	width: 100%;
	display: flex;
	height: 100%;
	/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#cfd8dc+0,607d8b+100,b0bec5+100 */
	background: #cfd8dc; /* Old browsers */
	background: -moz-linear-gradient(-45deg, #cfd8dc 0%, #607d8b 100%, #b0bec5 100%);
	/* FF3.6-15 */
	background: -webkit-linear-gradient(-45deg, #cfd8dc 0%, #607d8b 100%, #b0bec5 100%);
	/* Chrome10-25,Safari5.1-6 */
	background: linear-gradient(135deg, #cfd8dc 0%, #607d8b 100%, #b0bec5 100%);
	/* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cfd8dc',
		endColorstr='#b0bec5', GradientType=1);
	/* IE6-9 fallback on horizontal gradient */
}

.cont_centrar {
	display: flex;
	align-self: center;
	width: 100%;
}

.cont_login {
	position: relative;
	width: 640px;
}

.cont_back_info {
	position: relative;
	float: left;
	width: 640px;
	height: 280px;
	overflow: hidden;
	background-color: #fff;
	box-shadow: 1px 10px 30px -10px rgba(0, 0, 0, 0.5);
}

.cont_forms {
	position: absolute;
	overflow: hidden;
	top: 0px;
	left: 0px;
	width: 320px;
	height: 280px;
	background-color: #eee;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
}

.cont_forms_active_sign_up {
	box-shadow: 1px 10px 30px -10px rgba(0, 0, 0, 0.5);
	height: 420px;
	top: -60px;
	left: 320px;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
}

.cont_img_back_grey {
	position: absolute;
	width: 950px;
	top: -80px;
	left: -116px;
}

.cont_img_back_grey>img {
	width: 100%;
	-webkit-filter: grayscale(100%);
	filter: grayscale(100%);
	opacity: 0.2;
	animation-name: animar_fondo;
	animation-duration: 20s;
	animation-timing-function: linear;
	animation-iteration-count: infinite;
	animation-direction: alternate;
}

.cont_img_back_ {
	position: absolute;
	width: 950px;
	top: -80px;
	left: -116px;
}

.cont_img_back_>img {
	width: 100%;
	opacity: 0.3;
	animation-name: animar_fondo;
	animation-duration: 20s;
	animation-timing-function: linear;
	animation-iteration-count: infinite;
	animation-direction: alternate;
}

.cont_forms_active_sign_up>.cont_img_back_ {
	top: -20px;
	left: -435px;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
}

.cont_info_log_sign_up {
	position: absolute;
	width: 640px;
	height: 280px;
	top: 0px;
	z-index: 1;
}

.col_md_sign_up {
	position: relative;
	float: left;
	width: 50%;
}

.cont_ba_opcitiy>h2 {
	font-weight: 400;
	color: #fff;
}

.cont_ba_opcitiy>p {
	font-weight: 400;
	margin-top: 15px;
	color: #fff;
}
/* ----------------------------------
background text    
------------------------------------
 */
.cont_ba_opcitiy {
	position: relative;
	background-color: rgba(120, 144, 156, 0.55);
	width: 80%;
	border-radius: 3px;
	margin-top: 30px;
	padding: 15px 0px;
}

.btn_sign_up {
	background-color: #ef5350;
	border: none;
	padding: 10px;
	width: 200px;
	border-radius: 3px;
	box-shadow: 1px 5px 20px -5px rgba(0, 0, 0, 0.4);
	color: #fff;
	margin-top: 10px;
	cursor: pointer;
}

.cont_forms_active_sign_up {
	z-index: 2;
}

@
-webkit-keyframes animar_fondo {from { -webkit-transform:scale(1)translate(0px);
	-moz-transform: scale(1) translate(0px);
	-ms-transform: scale(1) translate(0px);
	-o-transform: scale(1) translate(0px);
	transform: scale(1) translate(0px);
}

to {
	-webkit-transform: scale(1.5) translate(50px);
	-moz-transform: scale(1.5) translate(50px);
	-ms-transform: scale(1.5) translate(50px);
	-o-transform: scale(1.5) translate(50px);
	transform: scale(1.5) translate(50px);
}

}
@
-o-keyframes identifier {from { -webkit-transform:scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
}

to {
	-webkit-transform: scale(1.5);
	-moz-transform: scale(1.5);
	-ms-transform: scale(1.5);
	-o-transform: scale(1.5);
	transform: scale(1.5);
}

}
@
-moz-keyframes identifier {from { -webkit-transform:scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
}

to {
	-webkit-transform: scale(1.5);
	-moz-transform: scale(1.5);
	-ms-transform: scale(1.5);
	-o-transform: scale(1.5);
	transform: scale(1.5);
}

}
@
keyframes identifier {from { -webkit-transform:scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
}

to {
	-webkit-transform: scale(1.5);
	-moz-transform: scale(1.5);
	-ms-transform: scale(1.5);
	-o-transform: scale(1.5);
	transform: scale(1.5);
}

}

.cont_form_sign_up {
	position: absolute;
	width: 320px;
	float: left;
	opacity: 0;
	display: none;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
}

.cont_form_sign_up>h2 {
	margin-top: 40px;
	font-weight: 400;
	color: #757575;
}

 .cont_form_sign_up>a {
	color: #757575;
	position: relative;
	float: left;
	margin: 10px;
	margin-left: 30px;
}

/* MODIFICHE APPORTATE */
input{
	text-align: left;
	padding: 13px 5px;
	margin-left: 5px;
	margin-top: 9px;
	width: 260px;
	border: none;
	color: #757575;
}
.rdbtm{
	width: 10px; 
	color: white;
}
.cont_ba_opcitiy > a {
	text-decoration: none;
}

</style>
</head>
<body>
	<% Utente u = (Utente) request.getAttribute("utente");%>
	<div class="cotn_principal">
		<div class="cont_centrar">
			<div class="cont_login">
				<div class="cont_info_log_sign_up">
					<div class="col_md_sign_up">
						<div class="cont_ba_opcitiy">
							<h2><%= u.getNome() + " " + u.getCognome() %></h2>
							<p>Sei sicuro di voler apportare modifiche al seguente account?</p>
							<button class="btn_sign_up" onclick="change_to_sign_up()">CONFERMO</button>
							<a href="HomePage?p=U"><button class="btn_sign_up" >INDIETRO</button></a>
						</div>
					</div>
				</div>
				<div class="cont_back_info">
					<div class="cont_img_back_grey">
						<img alt="" src="img/Logo.png" />
					</div>
				</div>
				<div class="cont_forms">
					<div class="cont_img_back_">
						<img alt="" src="img/Logo.png" />
					</div>
					<div class="cont_form_sign_up">
						<a href="#" onclick="hidden_login_and_sign_up()"> <i class="material-icons">&#xE5C4;</i></a>
						<form action="EditServlet" method="post">
         					
							<input type="text" value="<%= u.getId() %>" name="id" hidden /> 
							<input type="text" value="<%= u.getNome() %>" name="nome" placeholder="Nome" hidden/> 
							<input type="text" value="<%= u.getCognome() %>" name="cognome" placeholder="Cognome" hidden/> 
							<input type="text" value="<%= u.getUsername() %>" name="username" placeholder="Username" /> 
							<input type="email" value="<%= u.getEmail() %>" name="email" placeholder="Email" /> 
							<input type="text" value="<%= u.getTelefono() %>" name="tel" placeholder="Telefono" /> 
							<input type="date" value="<%= u.getDataNascita() %>" name="data" placeholder="Data di Nascita" hidden/> 
							<input type="password" value="<%= u.getPassword() %>" name="pw" /> <br/>
							<input type="text" value="<%= u.getTentativi() %>" name="tentativi" hidden/> 
							<% if (!u.getRuolo().equals("C")){  %>
							<br/>
							 <input class="rdbtm" type="radio" value="M" name="ruolo" <% if (u.getRuolo().equals("M")){ %> checked <% } %>/> Manager 
							/ Guest<input class="rdbtm" type="radio" value="G" name="ruolo" <% if (u.getRuolo().equals("G")){ %> checked <% } %>/><br/><br/>
							<%  } else {%>
							<input type="text" name="idcliente" value="<%= u.getCliente().getId() %>" hidden/>
							<input type="text" name="citta" placeholder="Città" value="<%= u.getCliente().getCitta() %>" /> 
							<input type="text" name="indirizzo" placeholder="Indirizzo" value="<%= u.getCliente().getIndirizzo() %>" /> <br/>
							 <input class="rdbtm" type="radio" value="C" name="ruolo" hidden <% if (u.getRuolo().equals("C")){ %> checked <% } %>/> 
							<%  } %>
							
							 <input class="rdbtm" type="radio" value="D" name="stato" <% if (u.getStato().equals("D")){ %> checked <% } %>/> Disabled 
							/ Active<input class="rdbtm" type="radio" value="A" name="stato" <% if (u.getStato().equals("A")){ %> checked <% } %>/> <br/>
							
							<input type="submit" class="btn_sign_up" 
								style="color: white; text-align: center;"
								onclick="change_to_sign_up()" value="MODIFICA" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		const time_to_show_sign_up = 100;
		const time_to_hidden_sign_up = 400;

		function change_to_sign_up(at) {
			document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_sign_up";
			document.querySelector('.cont_form_sign_up').style.display = "block";

			setTimeout(
					function() {
						document.querySelector('.cont_form_sign_up').style.opacity = "1";
					}, time_to_show_sign_up);
		}

		const time_to_hidden_all = 500;

		function hidden_login_and_sign_up() {

			document.querySelector('.cont_forms').className = "cont_forms";
			document.querySelector('.cont_form_sign_up').style.opacity = "0";

			setTimeout(
					function() {
						document.querySelector('.cont_form_sign_up').style.display = "none";
					}, time_to_hidden_all);
		}
	</script>
</body>
</html>