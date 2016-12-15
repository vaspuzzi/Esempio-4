<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Esempio 4</title>

<script>

var httpRequest = 0;
function carica_studenti() {
//	var elenco {
		//coppie chiave-valore
//		0: {"matricola":1, "cognome":"Rossi","nome":"Mario"},
//		1: {"matricola":2, "cognome":"Verdi","nome":"Luca"}
//	};
//	alert(elenco[0].cognome);
//			|
//			v
	var dati='0: {"matricola":1, "cognome":"Rossi","nome":"Mario"},1: {"matricola":2, "cognome":"Verdi","nome":"Luca"}';
	eval("var elenco =" + dati);
//	uso file json per var dati
//			|
//			v

	
	//alert("caricata");
	httpRequest = new XMLHttpRequest();
	
	// metodo get, fatta su elenco_studenti, sincrona/asinsrona(false/true)
	//se al posto di json metto url informo il browser 
	//se metto servlet, in questo caso l'importante è che ritorni file json
	httpRequest.open("GET", "elenco_studenti.json",true);
	//ogni volta che onreadyst.... cambia viene invocata la funzione dati_caricati
	httpRequest.onreadystatechange = dati_caricati;
	httpRequest.send();
}
function dati_caricati() {
	var r = eval("3+5");
	
	
	var readyState=httpRequest.readyState;
	//4=richiesta http è stata evasa
	if(readyState!=4)
		return;
	
	var status = httpRequest.status;
	// 200=è andato tutto bene
	//posso impostare lo statuscode nella response della servlet
	if(status!=200) {
		alert("comunicazione col server non riuscita");
		// si può fare un setInterval(ms,funz); dopo tot ms viene chiamata funz
		return;
	}
		
	
}
	
	var s = httpRequest.responseXML;
	
	alert(s);
	
	var studenti = getElementsByTagName("studente");
	alert(studenti);
	alert("adfsdge");
	
	for(var i=0;i<studenti.length;i++){
		var tagStudente = studenti[i];
		alert(tagStudente);
		var tagCognome = tagStudente.childNodes[1];
		alert(tagCognome);
		var textcognome = tagCognome.childNodes[0];
		alert(textCognome);
		var cognome = textCognome.nodeValue;
		alert(cognome);
	}
	
//	var tabella = document.getElementById("tabella");
//	tabella.innerHTML = corpo
}
</script>

</head>
<body onload="carica_studenti()">
<h1>Sistema Gestione dell'Ateneo</h1>
<table>
<thead>
<tr>
<td>Matricola</td><td>Cognome</td><td>Nome</td>
</tr>
</thead>
<tbody id="tabella">
</tbody>
</table>
</body>
</html>