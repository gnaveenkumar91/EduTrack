<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String user = (String) session.getAttribute("user");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">

        <a class="navbar-brand" href="index.jsp">EduTrack</a>

        <div class="collapse navbar-collapse">

            <ul class="navbar-nav me-auto">

                <!-- PUBLIC -->
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Add Student</a>
                </li>

                <!-- ADMIN -->
                <%
                    if(user != null){
                %>
                <li class="nav-item">
                    <a class="nav-link" href="list.jsp">View Students</a>
                </li>
                <%
                    }
                %>
            </ul>

            <ul class="navbar-nav">

                <%
                    if(user != null){
                %>
                    <li class="nav-item">
                        <span class="navbar-text text-white me-3">
                            Welcome Admin, <%= user %>
                        </span>
                    </li>

                    <li class="nav-item">
                        <a class="btn btn-danger" href="LogoutServlet">Logout</a>
                    </li>
                <%
                    } else {
                %>
                    <li class="nav-item">
                        <span class="navbar-text text-white me-3">
                            Welcome User
                        </span>
                    </li>

                    <li class="nav-item">
                        <a class="btn btn-success" href="login.jsp">Admin Login</a>
                    </li>
                <%
                    }
                %>

            </ul>
        </div>
    </div>
</nav>