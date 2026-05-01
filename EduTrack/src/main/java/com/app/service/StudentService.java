package com.app.service;

import com.app.dao.StudentDAOInterface;
import com.app.dao.StudentDAOImpl;
import com.app.model.Student;

import java.util.List;

public class StudentService {

    private StudentDAOInterface dao = new StudentDAOImpl();

    public boolean registerStudent(Student s) {

        if (dao.emailExists(s.getEmail())) {
            return false; // duplicate
        }

        return dao.addStudent(s);
    }

    public List<Student> fetchStudents() {
        return dao.getAllStudents();
    }

    public Student getStudent(int id) {
        return dao.getStudentById(id);
    }

    public boolean updateStudent(Student s) {
        return dao.updateStudent(s);
    }

    public boolean removeStudent(int id) {
        return dao.deleteStudent(id);
    }
    
}