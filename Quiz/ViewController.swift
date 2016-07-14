//
//  ViewController.swift
//  Quiz
//
//  Created by christian espinoza on 6/22/16.
//  Copyright © 2016 Christian Espinoza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = ["What is Christian's favortie movie?",
                               "What is Christian's favorite book?",
                               "What is Christian's favorite hobby?"]
    
    let answers: [String] = ["Zoolander",
                             "Think & Grow Rich",
                             "Playing Soccer"]
    
    var currentQuestionIndex: Int = 0
    
    @IBAction func showNextQuestion (sender: AnyObject) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer (sender: AnyObject) {
        
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    

}

