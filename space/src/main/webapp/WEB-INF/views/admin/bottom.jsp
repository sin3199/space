<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

</section>










<script src="resources/js/jquery.js" ></script>
<script type="text/javascript" src="resources/bootstrap/js/bootstrap.bundle.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/admin.js"></script>
<script>
	const body = document.querySelector("body");
	modeToggle = body.querySelector(".mode-toggle");
	sidebar = body.querySelector("nav");
	sidebarToggle = body.querySelector(".sidebar-toggle");
	
	let getMode = localStorage.getItem("mode");
		if(getMode && getMode ==="dark"){
			body.classList.toggle("dark");
		}
	
	let getStatus = localStorage.getItem("status");
		if(getStatus && getStatus ==="close"){
			sidebar.classList.toggle("close");
		}
	
	modeToggle.addEventListener("click", () =>{
		body.classList.toggle("dark");
		if(body.classList.contains("dark")){
			localStorage.setItem("mode", "dark");
		}else{
			localStorage.setItem("mode", "light");
		}
	});
	
	sidebarToggle.addEventListener("click", () => {
		sidebar.classList.toggle("close");
		if(sidebar.classList.contains("close")){
			localStorage.setItem("status", "close");
		}else{
			localStorage.setItem("status", "open");
		}
	})
	
	


	
	
	

	

</script>


</body>
</html>