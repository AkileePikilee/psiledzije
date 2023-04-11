//Autor: Ljubica Muravljov


// $('#myModal').on('shown.bs.modal', function () {
//     $('#myInput').trigger('focus')
//   })
//   $(function () { $('#myModal').modal({
//     keyboard: true
//  })});

// tip:
// 0-GOST 
// 1-KORISNIK 
// 2-AUTOR 
// 3-IZD KUCA 
// 4-ADMIN




function logKorisnik(){
    debugger;
    
    document.cookie="username=1";
}
function logAutor(){
    document.cookie="username=2";
}
function logIzdKuca(){
    document.cookie="username=3";
}
function logAdmin(){
    document.cookie="username=4";
}

// {/* <ul class="navbar-nav text-right">
// <li class="nav-item">
//     <a href="signup.html" class="nav-link"> Regisutruj se </a>
// </li>
// <li class="nav-item">
//     <a href="login.html" class="nav-link"> Uloguj se </a>

// </li>


// </ul> */}

function logOut(){
debugger;
    document.cookie="username=0";
}




function inicijalizujStranicu(){
   

    ulogovan=document.cookie.split("; ").find((row) => row.startsWith("username="))?.split("=")[1];;

    if(ulogovan==""){
        document.cookie="username=0";
        ulogovan=document.cookie;
    }
    let navmeni=document.getElementById("navmeni");

    let lista= document.createElement("ul");
    lista.classList.add("navbar-nav", "text-right");
    let desniDeo=document.getElementById("desno");



    if(ulogovan=="0"){
      
        let link=document.createElement("a");
        link.href="signup.html";
        link.classList.add("nav-link");
        link.innerText="Registruj se";

        let listel=document.createElement("li");
        listel.classList.add("nav-item");
        
        listel.appendChild(link);
        lista.appendChild(listel);

        link=document.createElement("a");
        link.href="login.html";
        link.classList.add("nav-link");
        link.innerText="Uloguj se";

        listel=document.createElement("li");
        listel.classList.add("nav-item");
        
        listel.appendChild(link);
        lista.appendChild(listel);
        desniDeo.style="padding:0px;"

    }
//     <form action="passReset.html">
//     <button type="button" class="btn btn-light resetPassbtn " data-toggle="modal" data-target="#exampleModalCenter">
//         Zaboravljena lozinka?
//     </button>

//     <!-- <input type="submit" value="Zaboravljena šifra?" class="resetPassbtn"> -->
// </form>    
    else if(ulogovan=="4"){
        {
        let link=document.createElement("a");
        link.href="promocije.html";
        link.classList.add("nav-link");
        link.innerText="Promocije";

        let listel=document.createElement("li");
        listel.classList.add("nav-item");
        
        listel.appendChild(link);
        lista.appendChild(listel);

        link=document.createElement("a");
        link.href="licitaicje.html";
        link.classList.add("nav-link");
        link.innerText="Licitacije";

        listel=document.createElement("li");
        listel.classList.add("nav-item");


        listel.appendChild(link);
        lista.appendChild(listel);

        link=document.createElement("a");
        link.href="account.html";
        link.classList.add("nav-link");
        link.innerText="Nalog";

        listel=document.createElement("li");
        listel.classList.add("nav-item");
        
        listel.appendChild(link);
        lista.appendChild(listel);

        
        link=document.createElement("a");
        link.href="index.html";
        link.classList.add("nav-link");
        link.innerText="Izloguj se";
        link.addEventListener("click", logOut);

        listel=document.createElement("li");
        listel.classList.add("nav-item");
        
        listel.appendChild(link);
        lista.appendChild(listel);}


        debugger;
        dugme=document.createElement("input");
        dugme.type="submit";
        dugme.classList.add("loginbtn");
        dugme.value="Resetovanje zaboravljene lozinke";


        
        forma=document.createElement("form");
        forma.action="resetLozinke.html";

        forma.appendChild(dugme);
        
        desniDeo.appendChild(document.createElement("br"));
        desniDeo.appendChild(document.createElement("br"));
        desniDeo.appendChild(forma);
        desniDeo.appendChild(document.createElement("br"));
        desniDeo.appendChild(document.createElement("br"));


        dugme=document.createElement("input");
        dugme.type="submit";
        dugme.classList.add("loginbtn");
        dugme.value="Brisanje korisničkog naloga";


        
        forma=document.createElement("form");
        forma.action="brisanjeNaloga.html";

        forma.appendChild(dugme);
        desniDeo.appendChild(forma);
        desniDeo.appendChild(document.createElement("br"));
        desniDeo.appendChild(document.createElement("br"));
    }
    else{
        if(ulogovan=="3"){
            let link=document.createElement("a");
            link.href="licitacije.html";
            link.classList.add("nav-link");
            link.innerText="Licitacije";
    
            let listel=document.createElement("li");
            listel.classList.add("nav-item");
            
            listel.appendChild(link);
            lista.appendChild(listel);
        }

        let link2=document.createElement("a");
        link2.href="account.html";
        link2.classList.add("nav-link");
        link2.innerText="Nalog";

        let listel2=document.createElement("li");
        listel2.classList.add("nav-item");
        
        listel2.appendChild(link2);
        lista.appendChild(listel2);

        link2=document.createElement("a");
        link2.href="index.html";
        link2.classList.add("nav-link");
        link2.innerText="Izloguj se";
        link2.addEventListener("click", logOut);

        listel2=document.createElement("li");
        listel2.classList.add("nav-item");
        
        listel2.appendChild(link2);
        lista.appendChild(listel2);





    }
    navmeni.appendChild(lista);

   





}