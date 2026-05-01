<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page
	import="java.util.*, com.app.model.Student, com.app.service.StudentService"%>

<%
if (session.getAttribute("user") == null) {
	response.sendRedirect("login.jsp");
}
%>

<html>
<head>
<title>Student List</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script>
	function confirmDelete() {
		return confirm("Are you sure?");
	}
</script>

</head>

<body>

	<jsp:include page="navbar.jsp" />

	<div class="container mt-4">

		<h3>Student List</h3>

		<%
		StudentService service = new StudentService();
		List<Student> list = service.fetchStudents();
		%>

		<table class="table table-bordered">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Course</th>
				<th>Actions</th>
			</tr>

			<%
			for (Student s : list) {
			%>
			<tr>
				<td><%=s.getId()%></td>
				<td><%=s.getName()%></td>
				<td><%=s.getEmail()%></td>
				<td><%=s.getCourse()%></td>

				<td><a class="btn btn-warning btn-sm"
					href="StudentServlet?action=edit&id=<%=s.getId()%>">Edit</a>

					<form action="StudentServlet" method="post"
						style="display: inline;" onsubmit="return confirmDelete()">
						<input type="hidden" name="action" value="delete" /> <input
							type="hidden" name="id" value="<%=s.getId()%>" /> <input
							type="submit" value="Delete" class="btn btn-danger btn-sm" />
					</form></td>
			</tr>
			<%
			}
			%>

		</table>

	</div>

</body>
</html>