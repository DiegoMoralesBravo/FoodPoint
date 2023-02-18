var statusnavbar = true;

const openNav = (statusnavbar) => {
  statusnavbar = false;
  document.getElementById("mySidenav").style.width = "10rem";
  document.getElementById("main").style.marginLeft = "10rem";
  document.getElementById("logo").style.display = "none";
}

const closeNav = (statusnavbar) => {
  statusnavbar = true;
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
  document.getElementById("logo").style.display = "block";
}
