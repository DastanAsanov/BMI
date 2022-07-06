//
//  ViewController.swift
//  BMI calculator BMI calculator BMI
//
//  Created by das on 30/6/22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weigthView: UIView!
    @IBOutlet weak var heigthView: UIView!
    @IBOutlet weak var findResultButton: UIButton!
    @IBOutlet weak var viewSliderWeight: UISlider!
    @IBOutlet weak var viewSliderHeight: UISlider!
    var findWeigth: Float = 0
    var findHeight:Float = 0
    var intFindWeigth: Int = 0
    var bmi:Int = 0
    var bmiResult = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightLabel.text = "0"
        heightLabel.text = "0"
        cornerView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        weightLabel.text = "0"
        heightLabel.text = "0"
        cornerView()
        reset()
    }
    
    @IBAction func weithSlider(_ sender: UISlider) {
        weightLabel.text = "\(Int(sender.value)) кг"
        findWeigth = (Float(sender.value))
    }
    
    @IBAction func heightSlider(_ sender: UISlider) {
        heightLabel.text = "\(Int(sender.value)) см"
        findHeight = (Float(sender.value))
    }
    
    @IBAction func findResult(_ sender: UIButton) {
        let intResultWeigth = Int(round(findWeigth))
        let intResultHeight = Int(round(findHeight))
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        
      bmi = Int(round(findWeigth / ((findHeight / 100) * (findHeight / 100)) ))
        
        if bmi < 19 {
            bmiResult = "Вам следует сделать акцент на продуктах, которые богаты питательными веществами!"
        } else  if bmi > 19 && bmi < 25 {
            bmiResult = "Аполон! Вы отлично слажены. Соотношение роста и веса идеальны!"
            
        }else {
            bmiResult = "Меньше еш, больше двигайся! "
        }
        
        if let vc2 = storyboard.instantiateViewController(withIdentifier: "VC2") as? ResultViewController {
            vc2.userWeigth = "\(intResultWeigth) кг"
            vc2.userHeight = "\(intResultHeight) см"
            vc2.userAnswer = "\(bmiResult)"
            show(vc2, sender: nil)
        }
    }
    
    func reset() {
        weightLabel.text = "0"
        heightLabel.text = "0"
        findWeigth = 0
        findHeight = 0
        intFindWeigth = 0
        bmi = 0
        bmiResult = ""
        viewSliderWeight.value = 0
        viewSliderHeight.value = 0
    }
    
    func cornerView() {
        makeCornerView(view: heigthView, cornerRadius: 22)
        makeCornerView(view: weigthView, cornerRadius: 22)
        makeCornerView(view: findResultButton, cornerRadius: 15)
    }
    func makeCornerView (view: UIView, cornerRadius: CGFloat) {
        view.layer.cornerRadius = cornerRadius
        view.layer.masksToBounds = true
    }
}

