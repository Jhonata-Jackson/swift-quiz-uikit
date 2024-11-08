//
//  ViewController.swift
//  SwiftQuiz
//
//  Created by Jhonata Jackson on 08/11/24.
//

import UIKit

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    
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
    
    var currentQuestion = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonOne.layer.cornerRadius = 10
        buttonTwo.layer.cornerRadius = 10
        buttonThree.layer.cornerRadius = 10
        progressView.progress = 0
        progressView.transform = CGAffineTransform(scaleX: 1.0, y: 2.0) 
        
        self.updateUI()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if(self.currentQuestion + 1 < self.questionList.count) {
                self.currentQuestion += 1
            } else {
                self.currentQuestion = 0
            }
            sender.alpha = 1.0
            self.updateUI()
        }
    }
    
    func updateUI() {
        self.questionLabel.text = self.questionList[self.currentQuestion].text
        self.buttonOne.setTitle(self.questionList[self.currentQuestion].answers[0], for: .normal)
        self.buttonTwo.setTitle(self.questionList[self.currentQuestion].answers[1], for: .normal)
        self.buttonThree.setTitle(self.questionList[self.currentQuestion].answers[2], for: .normal)
        
        progressView.progress = 0.1 + Float(self.currentQuestion) / Float(self.questionList.count)
    }
    

}

