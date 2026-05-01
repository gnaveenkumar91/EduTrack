<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.app.model.Student"%>

<%
if (session.getAttribute("user") == null) {
	response.sendRedirect("login.jsp");
}
%>

<html>
<head>
<title>Edit Student</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script>
	function validateUpdate() {
		let email = document.forms["editForm"]["email"].value;

		let pattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
		if (!email.match(pattern)) {
			alert("Invalid Email");
			return false;
		}
		return true;
	}
</script>

</head>

<body>

	<jsp:include page="navbar.jsp" />

	<div class="container mt-4">

		<h3>Edit Student</h3>

		<%
		Student s = (Student) request.getAttribute("student");
		%>

		<form name="editForm" action="StudentServlet" method="post"
			onsubmit="return validateUpdate()">

			<input type="hidden" name="action" value="update" /> <input
				type="hidden" name="id" value="<%=s.getId()%>" /> <input
				class="form-control mb-2" name="name" value="<%=s.getName()%>"
				required /> <input class="form-control mb-2" name="email"
				value="<%=s.getEmail()%>" required /> <input
				class="form-control mb-2" name="course" value="<%=s.getCourse()%>"
				required />

			<button class="btn btn-primary">Update</button>

		</form>

	</div>

</body>
</html>