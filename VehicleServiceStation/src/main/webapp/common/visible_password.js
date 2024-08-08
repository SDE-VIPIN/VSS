
let click = 1
function changeIcon(icon){
	//alert("font changes")
	let pass = document.getElementById("password1")
	
	if (click%2 != 0)
		{
			icon.classList.remove("fa-eye-slash")
			icon.classList.add("fa-eye")
			pass.type = "text";
			pass.classList.add("focus-light"); // Add focus light effect
		    setTimeout(function() { pass.classList.remove("focus-light"); }, 500);
			
		}
	else
	{
		icon.classList.remove("fa-eye")
		icon.classList.add("fa-eye-slash")
		pass.type = "password";
		
		
	}
	click++;
}

function showEyeIcon() {
    let icon = document.getElementById("eyeIcon");
    icon.style.display = "inline-block";
}