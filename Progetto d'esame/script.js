var pagina = 0;
var arrayPagine;
var numeroPagina;
var spanFenomeno;
var bottonePremuto;

function gestoreLoad(){
	try {
		pagina= 0;
		arrayPagine = document.getElementsByClassName("pp");
		numeroPagina = document.getElementById("numeroPagina");

		if(window.innerWidth > 1100){
			arrayPagine[0].style.display = "flex";
			arrayPagine[1].style.display="none";
			arrayPagine[2].style.display="none";
		}
		else{
			arrayPagine[0].style.display = "block";
			arrayPagine[1].style.display="none";
			arrayPagine[2].style.display="none";
		}

		numeroPagina.innerHTML = "Pagina " + (pagina + 61); 

	} catch ( e ) {
        alert ("gestoreLoad" + e);
    }
}

window.onload = gestoreLoad()

function cambioPagina(x){
	arrayPagine[pagina].style.display = "none";
	pagina += x;

	if(pagina == 3){
		pagina = 0;
	}
	else if (pagina == -1){
		pagina = 2;
	}

	if(window.innerWidth > 1100)
	arrayPagine[pagina].style.display = "flex";
	else
	arrayPagine[pagina].style.display = "block";

	numeroPagina.innerHTML = "Pagina " + (pagina + 61); 
}

function segnalaRiga(riga, azione){

	var idRigaSelezionata = "#" + riga.id;

	if(azione ==  "on"){
		document.getElementById(idRigaSelezionata).classList.add("segnala");
	}
	else{
		document.getElementById(idRigaSelezionata).classList.remove("segnala");
	}
}

function mostra(fenomeno, colore, bottone){
	
	spanFenomeno = document.getElementsByClassName(fenomeno);
	bottonePremuto = document.getElementById(bottone);

	bottonePremuto.style.backgroundColor = colore;
	bottonePremuto.style.color = "black";

	for (var i = 0; i < spanFenomeno.length; i++){
		spanFenomeno[i].style.display = "inline";
		spanFenomeno[i].style.backgroundColor = colore;
		if (fenomeno == "del"){
			spanFenomeno[i].style.textDecoration = "line-through";
		}
	}
}

function mostraInformazioni(divSelezionato, altroDiv1, altroDiv2){
	divContenitoreSelezionato = document.getElementById(divSelezionato);
	div1 = document.getElementById(altroDiv1);
	div2 = document.getElementById(altroDiv2);

	divContenitoreSelezionato.style.display = "block";
	div1.style.display = "none";
	div2.style.display = "none";
}
