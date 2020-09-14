function myFunction(x) {
	    x.classList.toggle("change");
	    if (document.getElementById("mySidenav").style.width == '250px') {
	        document.getElementById("mySidenav").style.width = "0";
	        return;
	    }
	    document.getElementById("mySidenav").style.width = "250px";
}