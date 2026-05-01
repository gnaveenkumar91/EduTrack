package com.app.dao;

import com.app.model.Student;
import java.util.List;

public interface StudentDAOInterface {

    boolean addStudent(Student s);

    List<Student> getAllStudents();

    Student getStudentById(int id);

    boolean updateStudent(Student s);

    boolean deleteStudent(int id);
    boolean emailExists(String email);
}
