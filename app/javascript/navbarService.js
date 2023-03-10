const openNav = () => {
  document.getElementById("mySidenavService").style.width = "10rem";
  document.getElementById("mainService").style.marginLeft = "10rem";
  document.getElementById("logoService").style.display = "none";
}

const closeNav = () => {
  document.getElementById("mySidenavService").style.width = "0";
  document.getElementById("mainService").style.marginLeft= "0";
  document.getElementById("logoService").style.display = "block";
}
