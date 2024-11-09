//
//  QuizModel.swift
//  SwiftQuiz
//
//  Created by Jhonata Jackson on 09/11/24.
//

import Foundation

struct QuizModel {
    let questionList = [
        Question(
            text: "Which keyword is used to declare a constant in Swift?",
            answers: ["const", "let", "var"],
            correctAnswer: "let"
        ),

        Question(
            text: "How do you declare a variable in Swift?",
            answers: ["var", "variable", "let"],
            correctAnswer: "var"
        ),

        Question(
            text: "What is the correct syntax to print 'Hello, World!' to the console?",
            answers: ["console.log(\"Hello, World!\")", "println(\"Hello, World!\")", "print(\"Hello, World!\")"],
            correctAnswer: "print(\"Hello, World!\")"
        ),

        Question(
            text: "What is the data type of a true or false value in Swift?",
            answers: ["Bool", "Boolean", "Bit"],
            correctAnswer: "Bool"
        ),

        Question(
            text: "Which syntax is used to define a function in Swift?",
            answers: ["function myFunc() {}", "func myFunc() {}", "def myFunc() {}"],
            correctAnswer: "func myFunc() {}"
        ),

        Question(
            text: "What keyword is used to define a class in Swift?",
            answers: ["class", "struct", "object"],
            correctAnswer: "class"
        ),

        Question(
            text: "How do you define a string with interpolation in Swift?",
            answers: ["print(\"Hello, \\(name)\")", "print(\"Hello, {name}\")", "print(\"Hello, ${name}\")"],
            correctAnswer: "print(\"Hello, \\(name)\")"
        ),

        Question(
            text: "Which keyword is used to handle errors in Swift?",
            answers: ["error", "try", "catch"],
            correctAnswer: "try"
        ),

        Question(
            text: "How do you create an empty array of integers in Swift?",
            answers: ["let numbers: [Int] = []", "let numbers = Int[]", "let numbers = []"],
            correctAnswer: "let numbers: [Int] = []"
        ),

        Question(
            text: "What is the correct syntax for a for-in loop in Swift?",
            answers: ["for item in items {}", "foreach item in items {}", "for (item : items) {}"],
            correctAnswer: "for item in items {}"
        )
    ]
    
    private var currentQuestion = 0
    
    mutating func nextQuestion() {
        if(self.currentQuestion + 1 < self.questionList.count) {
            self.currentQuestion += 1
        } else {
            self.currentQuestion = 0
        }
    }
    
    func getCurrentQuestion() -> Question {
        return self.questionList[self.currentQuestion]
    }
    
    func getProgess() -> Float {
        return Float(self.currentQuestion) / Float(self.questionList.count)
    }
}
