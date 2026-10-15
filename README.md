# EduTrack – Academic Record Management System

**EduTrack** is a Java-based web application for managing student academic records. It is developed using Java Servlets, JSP, JDBC, and MySQL. The application allows users to register student records, while administrators can log in to view, edit, and delete student information.

## Features

- **Student Registration:** Add student records with name, email, and course.
- **Admin Authentication:** Log in using a username and password.
- **View Student Records:** Display student information in a table.
- **Update Records:** Edit existing student details.
- **Delete Records:** Remove student records with confirmation.
- **Duplicate Email Prevention:** Check whether an email already exists before inserting a student.
- **Session Management:** Maintain admin login sessions and invalidate them during logout.
- **Input Validation:** Validate required fields and email format on the client side.
- **Responsive UI:** Use Bootstrap to style the web pages.

## Technologies Used

| Technology | Purpose |
|---|---|
| Java | Application programming |
| Java Servlets | Handle HTTP requests and application logic |
| JSP | Build dynamic web pages |
| JDBC | Connect Java to MySQL |
| MySQL | Store student and user information |
| HTML and CSS | Structure and style the interface |
| JavaScript | Client-side form validation |
| Bootstrap 5 | Responsive UI styling |
| Apache Tomcat | Run the web application |
| Eclipse IDE | Development environment |

## Project Architecture

The application follows a layered structure:

- **Controller Layer:** Handles HTTP requests using Servlets.
- **Service Layer:** Implements student registration and business logic.
- **DAO Layer:** Performs database operations using JDBC.
- **Model Layer:** Represents student data.
- **Utility Layer:** Manages MySQL database connectivity.
- **View Layer:** JSP pages display forms, student records, and navigation.

## Project Structure

```text
EduTrack/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/app/
│       │       ├── controller/
│       │       │   ├── LoginServlet.java
│       │       │   ├── LogoutServlet.java
│       │       │   └── StudentServlet.java
│       │       ├── dao/
│       │       │   ├── StudentDAOInterface.java
│       │       │   └── StudentDAOImpl.java
│       │       ├── model/
│       │       │   └── Student.java
│       │       ├── service/
│       │       │   └── StudentService.java
│       │       └── util/
│       │           └── DBUtil.java
│       └── webapp/
│           ├── WEB-INF/
│           │   └── web.xml
│           ├── index.jsp
│           ├── login.jsp
│           ├── list.jsp
│           ├── edit.jsp
│           ├── navbar.jsp
│           └── success.jsp
├── .classpath
├── .project
└── .gitignore
```

## Database Configuration

The application connects to a MySQL database named `studentdb`.

### 1. Create the database

```sql
CREATE DATABASE studentdb;
USE studentdb;
```

### 2. Create the students table

```sql
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    course VARCHAR(100) NOT NULL
);
```

### 3. Create the users table

The login Servlet checks the `users` table for matching credentials.

```sql
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
```

For local testing only, you can insert a test account:

```sql
INSERT INTO users (username, password)
VALUES ('admin', 'change-this-password');
```

**Security note:** The current login implementation compares plaintext passwords. This is suitable only for a learning demonstration, not a production application. Use securely hashed passwords before deploying.

### 4. Configure the database connection

Update `src/main/java/com/app/util/DBUtil.java` to match your local MySQL settings.

```java
return DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/studentdb",
    "root",
    "YOUR_MYSQL_PASSWORD"
);
```

Replace `YOUR_MYSQL_PASSWORD` with your local MySQL password. Avoid committing real database credentials to GitHub.

## How to Run the Project

1. Install JDK, MySQL, Eclipse IDE, and Apache Tomcat 10.1 or another compatible Jakarta Servlet container.
2. Clone or download this repository.
3. Open Eclipse and import the project as an existing project.
4. Create the `studentdb` database and the required tables.
5. Configure the MySQL credentials in `DBUtil.java`.
6. Ensure the MySQL JDBC driver is available on the project classpath.
7. Configure the project with a compatible Apache Tomcat server.
8. Start the server and run the project.
9. Open the application in your browser:

   `http://localhost:8080/EduTrack/`

   The context path may differ depending on your server configuration.

## Application Workflow

1. A public user opens the application and submits a student registration form.
2. The Student Servlet passes the request to the service layer.
3. The service checks whether the email already exists.
4. The DAO inserts the student record into MySQL.
5. An administrator logs in through the login page.
6. After successful login, the application creates an HTTP session.
7. The administrator can view, edit, and delete student records.
8. Logging out invalidates the session.

## Main Servlet Mappings

| Servlet | Mapping | Purpose |
|---|---|---|
| LoginServlet | `/LoginServlet` | Admin login |
| LogoutServlet | `/LogoutServlet` | End the login session |
| StudentServlet | `/StudentServlet` | Add, edit, update, and delete student records |

## Learning Outcomes

Through this project, I practised:

- Java web application development using Servlets and JSP.
- JDBC connectivity and SQL CRUD operations.
- Layered application design using Controller, Service, DAO, and Model classes.
- HTTP request handling and form submission.
- Session-based login and access control.
- Client-side form validation and Bootstrap-based UI development.
- Handling duplicate student email registrations.

## Future Enhancements

- Password hashing and stronger authentication.
- Server-side input validation.
- Improved exception handling and logging.
- Pagination and student search.
- Automated tests and deployment configuration.

## Author

**Naveen Kumar**

GitHub: [gnaveenkumar91](https://github.com/gnaveenkumar91)

Repository: [EduTrack](https://github.com/gnaveenkumar91/EduTrack)
