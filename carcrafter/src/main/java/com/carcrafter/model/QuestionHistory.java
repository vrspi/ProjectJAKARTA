package com.carcrafter.model;

import jakarta.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "QuestionHistory")
public class QuestionHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "question", nullable = false, columnDefinition = "TEXT")
    private String question;

    @Column(name = "asked_at", nullable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private Timestamp askedAt;

    // Constructors, Getters, and Setters
    public QuestionHistory() {
    }

    public QuestionHistory(String question, Timestamp askedAt) {
        this.question = question;
        this.askedAt = askedAt;
    }

    public Integer getId() {
        return id;
    }

    public String getQuestion() {
        return question;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setQuestion(String question) {
        this.question = question;
    }
}