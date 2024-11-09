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

class MainVC: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    
    var quizModel: QuizModel = QuizModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
        self.updateUI()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
            self.quizModel.nextQuestion()
            self.updateUI()
        }
    }
    
    func setupView() {
        buttonOne.layer.cornerRadius = 10
        buttonTwo.layer.cornerRadius = 10
        buttonThree.layer.cornerRadius = 10
        buttonOne.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        buttonTwo.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        buttonThree.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        progressView.progress = 0
        progressView.transform = CGAffineTransform(scaleX: 1.0, y: 2.0)
    }
    
    func updateUI() {
        let currentQuestion = self.quizModel.getCurrentQuestion()
        self.questionLabel.text = currentQuestion.text
        self.buttonOne.setTitle(currentQuestion.answers[0], for: .normal)
        self.buttonTwo.setTitle(currentQuestion.answers[1], for: .normal)
        self.buttonThree.setTitle(currentQuestion.answers[2], for: .normal)
        
        let currentProgress = self.quizModel.getProgess()
        
        print(currentProgress)
        
        if(currentProgress == 0.0) {
            progressView.progress = 0
        } else {
            progressView.progress = 0.1 + currentProgress
        }
    }
}

