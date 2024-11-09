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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.quizModel.resetQuiz()
        self.setupView()
        self.updateUI()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let answer = sender.titleLabel?.text ?? ""
        let isCorrectAnswer = self.quizModel.checkQuestion(answer)
        let currentQuestionIndex = self.quizModel.currentQuestionIndex
        let totalQuestions = self.quizModel.questionList.count
        
        if isCorrectAnswer {
            sender.backgroundColor = .green
        } else {
            sender.alpha = 0.3
            sender.backgroundColor = .red
        }
        
        if(currentQuestionIndex == totalQuestions - 1) {
            if let scoreVC = self.storyboard?.instantiateViewController(withIdentifier: "ScoreResultVC") as? ScoreResultVC {
                self.navigationController?.setNavigationBarHidden(true, animated: false)
                scoreVC.score = self.quizModel.score
                sender.alpha = 1.0
                self.navigationController?.pushViewController(scoreVC, animated: true)
            }
            
            return
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                sender.alpha = 1.0
                self.quizModel.nextQuestion()
                self.updateUI()
            }
        }
    }
    
    func setupView() {
        buttonOne.layer.cornerRadius = 10
        buttonTwo.layer.cornerRadius = 10
        buttonThree.layer.cornerRadius = 10
        buttonOne.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        buttonTwo.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        buttonThree.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        progressView.progress = 0
        progressView.transform = CGAffineTransform(scaleX: 1.0, y: 2.0)
    }
    
    func updateUI() {
        let currentQuestion = self.quizModel.getCurrentQuestion()
        self.questionLabel.text = currentQuestion.text
        self.buttonOne.setTitle(currentQuestion.answers[0], for: .normal)
        self.buttonTwo.setTitle(currentQuestion.answers[1], for: .normal)
        self.buttonThree.setTitle(currentQuestion.answers[2], for: .normal)
        
        self.buttonOne.backgroundColor = .white
        self.buttonTwo.backgroundColor = .white
        self.buttonThree.backgroundColor = .white
        
        let currentProgress = quizModel.getProgess()
        
        if(currentProgress == 0.0) {
            progressView.progress = 0
        } else {
            progressView.progress = 0.1 + currentProgress
        }
    }
}

