//
//  ScoreResultVC.swift
//  SwiftQuiz
//
//  Created by Jhonata Jackson on 09/11/24.
//

import UIKit

class ScoreResultVC: UIViewController {
    
    @IBOutlet weak var resultImage: UILabel!
    @IBOutlet weak var resultTitle: UILabel!
    @IBOutlet weak var resultScore: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    var score: Int = 0
    private let resultLabels = ["🎉", "😔"]
    private let resultTitles = ["Congratulations!", "You failed!"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        self.calculateResult()
    }

    @IBAction func resetButtonPressed(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupView() {
        resetButton.layer.cornerRadius = 10
        resetButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
    private func calculateResult() {
        if(self.score >= 5) {
            self.resultImage.text = self.resultLabels[0]
            self.resultTitle.text = self.resultTitles[0]
        } else {
            self.resultImage.text = self.resultLabels[1]
            self.resultTitle.text = self.resultTitles[1]
        }
        
        self.resultScore.text = "score: \(self.score)"
    }
}
