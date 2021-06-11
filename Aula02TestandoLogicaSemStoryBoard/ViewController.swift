//
//  ViewController.swift
//  Aula02TestandoLogicaSemStoryBoard
//
//  Created by Thonatas Borges on 10/06/21.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        self.view = view
    }
    
    lazy var slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(self.sliderValueChanged(_:)), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Valor: 0"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.text = "0"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.wraps = false
        stepper.autorepeat = true
        stepper.maximumValue = 150
        stepper.addTarget(self, action: #selector(self.stepperValueChanged(_:)), for: .valueChanged)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
    lazy var vamosLaButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system) as UIButton
        
        let xPostion:CGFloat = 100
        let yPostion:CGFloat = 400
        let buttonWidth:CGFloat = 150
        let buttonHeight:CGFloat = 45
        
        button.frame = CGRect(x:xPostion, y:yPostion, width:buttonWidth, height:buttonHeight)
        
        button.backgroundColor = .white
        button.setTitle("Vamos lá", for: UIControl.State.normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func buttonAction(_ sender: UIButton!) {
        print("OK")
    }
    
    var sliderValue = 0
    var stepperValue = 0
    var sumValues = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(slider)
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(stepper)
        view.addSubview(vamosLaButton)
        
        sliderConstraints()
        labelConstraints()
        textFieldConstraints()
        stepperConstraints()
        buttonConstraints()
    }
    
    func sliderConstraints() {
        slider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        slider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        slider.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -30).isActive = true
    }
    
    func labelConstraints() {
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -30).isActive = true
    }
    
    func textFieldConstraints() {
        textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        textField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        textField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
    }
    
    func stepperConstraints() {
        stepper.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30).isActive = true
        stepper.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
    }
    
    func buttonConstraints() {
        vamosLaButton.topAnchor.constraint(equalTo: stepper.bottomAnchor, constant: 40).isActive = true
        vamosLaButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        vamosLaButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        vamosLaButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
    }
    
    @objc func stepperValueChanged(_ sender:UIStepper!) {
        stepperValue = Int(sender.value)
        sumSliderPlusStepper()
    }
    
    @objc func sliderValueChanged(_ sender:UISlider!) {
        sliderValue = Int(sender.value)
        label.text = String(sliderValue)
        sumSliderPlusStepper()
    }
    
    func sumSliderPlusStepper() {
        sumValues = sliderValue + stepperValue
        textField.text = String(sumValues)
    }

}

