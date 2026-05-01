<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>Login</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script>
function validateLogin() {
    let u = document.forms["loginForm"]["username"].value;
    let p = document.forms["loginForm"]["password"].value;

    if (u === "" || p === "") {
        alert("All fields required!");
        return false;
    }
    return true;
}
</script>

</head>

<body class="bg-light">

	<nav class="navbar navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">EduTrack</a>
		</div>
	</nav>

	<div class="container mt-5">
		<div class="card p-4 col-md-4 mx-auto">

			<h3 class="text-center">Admin Login</h3>

			<form name="loginForm" action="LoginServlet" method="post"
				onsubmit="return validateLogin()">
				<input type="text" name="username" class="form-control mb-2"
					placeholder="Username" /> <input type="password" name="password"
					class="form-control mb-2" placeholder="Password" />

				<button class="btn btn-primary w-100">Login</button>
			</form>

		</div>
	</div>

</body>
</html>