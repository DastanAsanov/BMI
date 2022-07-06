//
//  ResultViewController.swift
//  BMI calculator BMI calculator BMI
//
//  Created by das on 3/7/22.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var weigthResult: UILabel!
    @IBOutlet weak var heightResultLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var userResultView: UIView!
    @IBOutlet weak var answerView: UIView!
    @IBOutlet weak var resetButtonView: UIButton!
    var userWeigth = ""
    var userHeight = ""
    var userAnswer = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weigthResult.text = userWeigth
        heightResultLabel.text = userHeight
        answerLabel.text = userAnswer
        viewCorners()
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    
    }
    fileprivate func viewCorners() {
        userResultView.layer.cornerRadius = 22
        userResultView.layer.masksToBounds = true
        answerView.layer.cornerRadius = 22
        answerView.layer.masksToBounds = true
        resetButtonView.layer.cornerRadius = 15
        resetButtonView.layer.masksToBounds = true
    }
    
}

