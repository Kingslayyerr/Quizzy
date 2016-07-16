//
//  ViewController.swift
//  Quiz
//
//  Created by christian espinoza on 6/22/16.
//  Copyright © 2016 Christian Espinoza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Update outlets to have two labels instead of one.
    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = ["What is Christian's favortie movie?",
                               "What is Christian's favorite book?",
                               "What is Christian's favorite hobby?",
                               "How old is Christian?",
                               "When is Christian's Birthday?",
                               "What is his favorite restaurant?"]
    
    let answers: [String] = ["Zoolander",
                             "Think & Grow Rich",
                             "Playing Soccer",
                             "26",
                             "January 11, 1990",
                             "Boiling Crab"]
    
    var currentQuestionIndex: Int = 0
    
    @IBAction func showNextQuestion (sender: AnyObject) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        //HERE WE CALL THE CLOSURE WE DEFINED FOR ANIMATION WHEN THE USER CLICKS ON THE NEXT BUTTON
        
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer (sender: AnyObject) {
        
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
        
        
        // Call of the defined function 
        
        updateOffScreenLabel()
    }
    
    //OVERRIDE viewWillAppear to set the alpha to 0, this will make the animation visible.
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set labels initial alpha
        
        nextQuestionLabel.alpha = 0
        
        }
    
    
    //ANIMATIONS FOR QUIZ LABELS.
    
    func animateLabelTransitions() {
        
        // Force any outstanding layout changes to occur
        
        view.layoutIfNeeded()
        
        // ANIMATE THE alpha
        // AND THE CENTER X CONSTRAINTS
        
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        UIView.animateWithDuration(0.5,
            delay: 0,
            options:[.CurveLinear],
            animations: {
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
            
            self.view.layoutIfNeeded()
            }, completion: { _ in
                swap(&self.currentQuestionLabel,
                &self.nextQuestionLabel)
                swap(&self.currentQuestionLabelCenterXConstraint,
                    &self.nextQuestionLabelCenterXConstraint)
                
                self.updateOffScreenLabel()
                
        })
        
    }
    
    // DEFINE A FUNCTION THAT UPDATES THE OFF SCREEN LABEL
    
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }

}

