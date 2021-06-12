//
//  ViewController.swift
//  Aula02TestandoLogicaSemStoryBoard
//
//  Created by Thonatas Borges on 10/06/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let slider: UISlider = UISlider()
    private let label: UILabel = UILabel()
    private let textField: UITextField = UITextField()
    private let stepper: UIStepper = UIStepper()
    private let vamosLaButton: UIButton = UIButton()

    var sliderValue = 0
    var stepperValue = 0
    var sumValues = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addTextField()
        addLabel()
        addSlider()
        addStepper()
        addVamosLaButton()

    }
    
    private func addSlider() {
        view.addSubview(slider)
        
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(self.sliderValueChanged(_:)), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        slider.snp.makeConstraints { (make) in
            make.leading.equalTo(view.snp.leading).offset(30)
            make.trailing.equalTo(view.snp.trailing).offset(-30)
            make.bottom.equalTo(label.snp.top).offset(-30)
        }
    }
    
    private func addLabel() {
        view.addSubview(label)
        
        label.text = "Valor: 0"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(textField.snp.top).offset(-30)
        }
    }
    
    private func addTextField() {
        view.addSubview(textField)
        
        textField.text = "0"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.snp.makeConstraints { (make) in
            make.center.equalTo(view)
            make.leading.equalTo(view.snp.leading).offset(30)
            make.trailing.equalTo(view.snp.trailing).offset(-30)
        }
    }
    
    private func addStepper() {
        view.addSubview(stepper)
        
        stepper.wraps = false
        stepper.autorepeat = true
        stepper.maximumValue = 150
        stepper.addTarget(self, action: #selector(self.stepperValueChanged(_:)), for: .valueChanged)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        stepper.snp.makeConstraints { (make) in
            make.top.equalTo(textField.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    private func addVamosLaButton() {
        view.addSubview(vamosLaButton)
        
        let xPostion:CGFloat = 100
        let yPostion:CGFloat = 400
        let buttonWidth:CGFloat = 150
        let buttonHeight:CGFloat = 45
        
        vamosLaButton.frame = CGRect(x:xPostion, y:yPostion, width:buttonWidth, height:buttonHeight)
        vamosLaButton.backgroundColor = .white
        vamosLaButton.setTitle("Vamos lá", for: .normal)
        vamosLaButton.setTitleColor(.systemBlue, for: .normal)
        vamosLaButton.tintColor = .systemBlue
        vamosLaButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        vamosLaButton.translatesAutoresizingMaskIntoConstraints = false
        
        vamosLaButton.snp.makeConstraints { (make) in
            make.top.equalTo(stepper.snp.bottom).offset(40)
            make.centerX.equalTo(view.snp.centerX)
            make.leading.equalTo(view.snp.leading).offset(30)
            make.trailing.equalTo(view.snp.trailing).offset(-30)
        }
    }
    
    @objc func buttonAction(_ sender: UIButton!) {
        let viewController = SecondViewController()
        viewController.view.backgroundColor = .blue

        navigationController?.present(viewController, animated: true, completion: nil)
        print(#function)
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

