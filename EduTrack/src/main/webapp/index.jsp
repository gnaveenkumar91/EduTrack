<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>Add Student</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<script>
function validateForm() {
    let email = document.forms["f"]["email"].value;
    let pattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

    if (!email.match(pattern)) {
        alert("Invalid Email");
        return false;
    }
    return true;
}
</script>

</head>

<body class="bg-light">

<jsp:include page="navbar.jsp" />

<div class="container mt-5">
    <div class="card p-4">

        <h3>Add Student</h3>

        <%
            String error = request.getParameter("error");
            if("duplicate".equals(error)){
        %>
            <div class="alert alert-danger">Email already exists!</div>
        <%
            }
        %>

        <form name="f" action="StudentServlet" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="action" value="add"/>

            <input class="form-control mb-2" name="name" placeholder="Name" required/>
            <input class="form-control mb-2" name="email" placeholder="Email" required/>
            <input class="form-control mb-2" name="course" placeholder="Course" required/>

            <button class="btn btn-success">Add</button>
        </form>

    </div>
</div>

</body>
</html>