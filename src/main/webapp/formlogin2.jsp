<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="it.betacom.model.Utente"%>
	<%@page import="it.betacom.model.Cliente"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pagina Accesso</title>
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
	background: -webkit-linear-gradient(left, #25c481, #25b7c4);
	background: linear-gradient(to right, #25c481, #25b7c4);
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

.cont_forms_active_login {
	box-shadow: 1px 10px 30px -10px rgba(0, 0, 0, 0.5);
	height: 420px;
	top: -60px;
	left: 0px;
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

.cont_forms_active_login>.cont_img_back_ {
	top: -20px;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
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

.col_md_login {
	position: relative;
	float: left;
	width: 50%;
}

.col_md_login>h2 {
	font-weight: 400;
	margin-top: 70px;
	color: #757575;
}

.col_md_login>p {
	font-weight: 400;
	margin-top: 15px;
	width: 80%;
	color: #37474f;
}

.btn_login {
	background-color: #26c6da;
	border: none;
	padding: 10px;
	width: 200px;
	border-radius: 3px;
	box-shadow: 1px 5px 20px -5px rgba(0, 0, 0, 0.4);
	color: #fff;
	margin-top: 10px;
	cursor: pointer;
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
	margin-top: 60px;
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
.cont_form_login {
	position: absolute;
	opacity: 0;
	display: none;
	width: 320px;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
}

.cont_forms_active_login {
	z-index: 2;
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

/*  .cont_form_sign_up>input {
	text-align: left;
	padding: 15px 5px;
	margin-left: 10px;
	margin-top: 10px;
	width: 260px;
	border: none;
	color: #757575;
}  */

.cont_form_sign_up>h2 {
	margin-top: 10px;
	font-weight: 400;
	color: #757575;
}

/* .cont_form_login>input {
	padding: 15px 5px;
	margin-left: 10px;
	margin-top: 20px;
	width: 260px;
	border: none;
	text-align: left;
	color: #757575;
} */

.cont_form_login>h2 {
	margin-top: 110px;
	font-weight: 400;
	color: #757575;
}

.cont_form_login>a, .cont_form_sign_up>a {
	color: #757575;
	position: relative;
	float: left;
	margin: 10px;
	margin-left: 30px;
}
</style>
<style>
input{
	text-align: left;
	padding: 10px 5px;
	margin-left: 10px;
	margin-top: 7px;
	width: 260px;
	border: none;
	color: #757575;
}
#messaggio {
	back
}

#ProgressBar {
  width: 100%%;
  background-color: #ddd;
  max-width:260px;
}
#bar {
  width: 1%;
  height: 10px;
  background-color: #4CAF50;
  max-width:260px;
}

#alert {
  font-weight:bold;
  text-align:center;
}


</style>
</head>
<body>
	<% String risultato = request.getAttribute("risultato")==null? null :(String)request.getAttribute("risultato");
	if (risultato != null) {%>
		<div id="messaggio"><%= risultato %></div>
	<%}%>
	<div class="cotn_principal">
		<div class="cont_centrar">
			<div class="cont_login">
				<div class="cont_info_log_sign_up">
					<div class="col_md_login">
						<div class="cont_ba_opcitiy">
							<h2>LOGIN</h2>
<!-- 						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p> -->
							<p>Hai già un account? Effettua il login per accedere all'area riservata.</p>
							<button class="btn_login" onclick="change_to_login()">LOGIN</button>
						</div>
					</div>
					<div class="col_md_sign_up">
						<div class="cont_ba_opcitiy">
							<h2>SIGN UP</h2>
							<p>Non hai ancora un account? Registrati ora.</p>
							<button class="btn_sign_up" onclick="change_to_sign_up()">SIGNUP</button>
						</div>
					</div>
				</div>
				<div class="cont_back_info">
					<div class="cont_img_back_grey">
						<img alt=""
							src="img/Logo.png" />
<!-- 							src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d" /> -->
					</div>
				</div>
					<%
					Boolean next = request.getAttribute("next")==null? null :(Boolean)request.getAttribute("next"); 
					Utente utente = request.getAttribute("utente")==null? null :(Utente)request.getAttribute("utente"); 
					%>
				<div class="cont_forms <%if (next !=null) out.print("cont_forms_active_sign_up");%>">
					<div class="cont_img_back_">
						<img alt=""
							src="img/Logo.png" />
<!-- 							src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d" /> -->
					</div>
					<div class="cont_form_login">
						<a href="#" onclick="hidden_login_and_sign_up()"><i
							class="material-icons">&#xE5C4;</i></a>
						<h2>LOGIN</h2>
						<form action="LoginRegister?login=True" method="post">
							<input type="text" name="emus" placeholder="Email / Username" /> 
							<input type="password" name="pw" placeholder="Password" /> 
							<input type="submit" class="btn_login" 
								style="color: white; text-align: center;"
								onclick="change_to_login()" value="LOGIN" />
						</form>
					</div>
					<%-- <% if (next == true) out.println("style='display: block'"); %> --%>
					<div class="cont_form_sign_up" <% if (next != null) out.println("style='display: block; opacity: 1;'"); %> >
						<a href="#" onclick="hidden_login_and_sign_up()" > <i
							class="material-icons">&#xE5C4;</i></a>
						<% 
						if (next==null || next == false){
						%>
						
						
						<h2>SIGN UP</h2>
						<form action="LoginRegister" method="get">
							<input type="text" name="nome" placeholder="Nome" required <% if (utente != null) out.println("value='"+utente.getNome()+"'"); %>/> 
							<input type="text" name="cognome" placeholder="Cognome" required <% if (utente != null) out.println("value='"+utente.getCognome()+"'"); %>/> 
							<input type="email" name="email" placeholder="Email" required <% if (utente != null) out.println("value='"+utente.getEmail()+"'"); %>/> 
							<input type="text" name="tel" placeholder="Telefono" required <% if (utente != null) out.println("value='"+utente.getTelefono()+"'"); %> /> 
							<input type="date" name="data" placeholder="Data di Nascita" required <% if (utente != null) out.println("value='"+utente.getDataNascita()+"'"); %> /> 
							<input type="text" name="citta" placeholder="Città" required <% if (utente != null) out.println("value='"+utente.getCliente().getCitta()+"'"); %> /> 
							<input type="text" name="indirizzo" placeholder="Indirizzo" required <% if (utente != null) out.println("value='"+utente.getCliente().getIndirizzo()+"'"); %> /> <br>
							<p >
								Hai già effettuato acquisti?
								<input type="checkbox" name="old" value="True" style="width: 10px;"/>
							</p>
							<input type="submit" class="btn_sign_up" 
								style="color: white; text-align: center;"
								onclick="change_to_sign_up()" value="CONTINUE" />
						</form>
						<%} else {%>
						<h2>CONTINUE</h2>
						<form action="LoginRegister?login=False" method="post" >
							<input type="text" name="nome" <% out.println("value='"+utente.getNome()+"'"); %> hidden=""/> 
							<input type="text" name="cognome"  <%  out.println("value='"+utente.getCognome()+"'"); %> hidden=""/> 
							<input type="email" name="email"  <%  out.println("value='"+utente.getEmail()+"'"); %> hidden=""/> 
							<input type="text" name="tel" <%  out.println("value='"+utente.getTelefono()+"'"); %> hidden=""/> 
							<input type="date" name="data" <% out.println("value='"+utente.getDataNascita()+"'"); %> hidden=""/> 
							<% if (utente.getCliente().getId()>0) out.println("<input type='text' name='idcliente' value='"+utente.getCliente().getId()+"' hidden/>"); %>
							<input type="text" name="citta" placeholder="Città" <% out.println("value='"+utente.getCliente().getCitta()+"'"); %> hidden=""/> 
							<input type="text" name="indirizzo" placeholder="Indirizzo" <% out.println("value='"+utente.getCliente().getIndirizzo()+"'"); %> hidden=""/> 
							<input type="text" name="username" placeholder="Username" <% out.println("value='"+utente.getUsername()+"'"); %> readonly/> 
							<input type="password" id="txt" onkeyup="validator()" name="pw" placeholder="Password" pattern="[\S\s]" autocomplete="off" value="" required />
							<div id="ProgressBar">
								<div id="bar"></div>
								<p id="alert"></p>
							</div>
							<input type="password" placeholder="Conferma Password" onChange="checkResPwd(this)" required /> 
							<input type="submit" class="btn_sign_up" 
								style="color: white; text-align: center;"
								onclick="change_to_sign_up()" value="SIGN UP" />
						</form>
						<%}%>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		/* ------------------------------------ Click on login and Sign Up to  changue and view the effect
		---------------------------------------
		 */

		const time_to_show_login = 400;
		const time_to_hidden_login = 200;

		function change_to_login() {
			document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_login";
			document.querySelector('.cont_form_login').style.display = "block";
			document.querySelector('.cont_form_sign_up').style.opacity = "0";

			setTimeout(function() {
				document.querySelector('.cont_form_login').style.opacity = "1";
			}, time_to_show_login);

			setTimeout(
					function() {
						document.querySelector('.cont_form_sign_up').style.display = "none";
					}, time_to_hidden_login);
		}

		const time_to_show_sign_up = 100;
		const time_to_hidden_sign_up = 400;

		function change_to_sign_up(at) {
			document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_sign_up";
			document.querySelector('.cont_form_sign_up').style.display = "block";
			document.querySelector('.cont_form_login').style.opacity = "0";

			setTimeout(
					function() {
						document.querySelector('.cont_form_sign_up').style.opacity = "1";
					}, time_to_show_sign_up);

			setTimeout(
					function() {
						document.querySelector('.cont_form_login').style.display = "none";
					}, time_to_hidden_sign_up);

		}

		const time_to_hidden_all = 500;

		function hidden_login_and_sign_up() {

			document.querySelector('.cont_forms').className = "cont_forms";
			document.querySelector('.cont_form_sign_up').style.opacity = "0";
			document.querySelector('.cont_form_login').style.opacity = "0";

			setTimeout(
					function() {
						document.querySelector('.cont_form_sign_up').style.display = "none";
						document.querySelector('.cont_form_login').style.display = "none";
					}, time_to_hidden_all);

		}

		function validator() {
			  var x = 0;
			  var password = document.getElementById('txt').value;
			  var bar = document.getElementById("bar");
			  var al = document.getElementById("alert");

			  //controllo numeri
			  var check=/[0-9]/;
			  if(check.test(password)){
			    x = x + 20;
			  }
			  //controllo minuscole
			  var check2=/[a-z]/;
			  if(check2.test(password)){
			    x = x + 20;
			  }
			  //controllo maiuscole
			  var check3=/[A-Z]/;
			  if(check3.test(password)){
			    x = x + 20;
			  }
			  //controllo simboli
			  var check4=/[$-/:-?{-~!"^_`\[\]]/;
			  if(check4.test(password)){
			    x = x + 20;
			  }
			  // controllo lunghezza (minore o uguale a 10 caratteri)
			  if(password.length >=10){
			    x = x + 20;
			  }

			  // risultato
			  bar.style.width = x + "%";
			  // voto massimo 100
			  if (x == 100) {
			    bar.style.backgroundColor = "green";
			  //  al.innerHTML = "Very strong";
			  }
			  if (x >60) {
			    bar.style.backgroundColor = "green";
			   // al.innerHTML = "Strong";
			  }
			  if (x <=40) {
			    bar.style.backgroundColor = "yellow";
			   // al.innerHTML = "Good";
			  }
			  //voto minimo 20
			  if (x <=20) {
			    bar.style.backgroundColor = "red";
			   // al.innerHTML = "Weak";
			  }

			  if(password.length == 0){
			    x == 0;
			    al.innerHTML = "";
			  }

			  //controllo spazi bianchi
			  var check5=/\s\S/;
			  if(check5.test(password)){
			    al.innerHTML = "Password must not contain white spaces";
			    bar.style.backgroundColor = "red";
			  }
		}

		function checkResPwd(elem){
		            var pwd=document.getElementById("txt")
		            if(pwd.value != elem.value){
		                    alert("different passwords !")
		               
		return false
		            }
		 }
			
	</script>
</body>
</html>