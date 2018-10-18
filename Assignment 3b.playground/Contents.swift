// Created on: Sept-2018
// Created by: Ethan Bellem
// Created for: ICS3U
// program will calculate the price of a pizza depending on the size and toppings
// this will be commented out when code moved to Xcode
import PlaygroundSupport


import UIKit

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    let instructionsLabel : UILabel = UILabel()
    let instructionsLabel2 : UILabel = UILabel()
    let responseLabel : UILabel = UILabel()
    let sizeTextField : UITextField = UITextField()
    let toppingsTextField : UITextField = UITextField()
    let calculateButton : UIButton = UIButton()
    let HST: Float = 0.13
    let hstLabel : UILabel = UILabel()
    let subLabel : UILabel = UILabel()
    let totalLabel : UILabel = UILabel()
    
    var size_price: Float? = nil
    var topping_price: Float? = nil
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        instructionsLabel.text = "Enter 1 for large pizza and 2 for xtra"
        view.addSubview(instructionsLabel)
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        instructionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        instructionsLabel2.text = "Enter a number between 1 and 4 for the number of toppings you would like"
        view.addSubview(instructionsLabel2)
        instructionsLabel2.translatesAutoresizingMaskIntoConstraints = false
        instructionsLabel2.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        instructionsLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        sizeTextField.borderStyle = UITextBorderStyle.roundedRect
        sizeTextField.placeholder = " Choice "
        view.addSubview(sizeTextField)
        sizeTextField.translatesAutoresizingMaskIntoConstraints = false
        sizeTextField.centerYAnchor.constraint(equalTo:instructionsLabel.centerYAnchor).isActive = true
        sizeTextField.leadingAnchor.constraint(equalTo:instructionsLabel.trailingAnchor, constant: 10).isActive = true
        
        
        toppingsTextField.borderStyle = UITextBorderStyle.roundedRect
        toppingsTextField.placeholder = " Choice "
        view.addSubview(toppingsTextField)
        toppingsTextField.translatesAutoresizingMaskIntoConstraints = false
        toppingsTextField.bottomAnchor.constraint(equalTo:instructionsLabel.bottomAnchor, constant: 80 ).isActive = true
        toppingsTextField.leadingAnchor.constraint(equalTo:instructionsLabel.trailingAnchor, constant: 10).isActive = true
        
        calculateButton.setTitle("Calcuate", for: UIControlState.normal)
        calculateButton.setTitleColor(.blue, for: .normal)
        calculateButton.addTarget(self, action: #selector(calculateResult), for: .touchUpInside)
        view.addSubview(calculateButton)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calculateButton.topAnchor.constraint(equalTo:sizeTextField.bottomAnchor, constant: 70).isActive = true
        
        view.addSubview(hstLabel)
        hstLabel.translatesAutoresizingMaskIntoConstraints = false
        hstLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        hstLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(subLabel)
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        subLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(totalLabel)
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
        totalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(responseLabel)
        responseLabel.translatesAutoresizingMaskIntoConstraints = false
        responseLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 10).isActive = true
        responseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        
        
    }
    
    
    @objc func calculateResult() {
        // calculate and show awswer
        let toppings : Float = Float(toppingsTextField.text!)!
        let size : Float = Float(sizeTextField.text!)!
        
        if size == 2 {
            size_price = 10.00
        } else if size == 1  {
            size_price = 6.00
        } 
        
        if toppings == 1  {
            topping_price = 1.00
            subLabel.text = "Subtotal is $\(topping_price! + size_price!)"
            hstLabel.text = "HST is $\((topping_price! + size_price!) * HST)"
            totalLabel.text = "Your total is $\((topping_price! + size_price!) * (HST + 1))"
        } else if toppings == 2 {
            topping_price = 1.75
            subLabel.text = "Subtotal is $\(topping_price! + size_price!)"
            hstLabel.text = "HST is $\((topping_price! + size_price!) * HST)"
            totalLabel.text = "Your total is $\((topping_price! + size_price!) * (HST + 1))"
        } else if toppings == 3 {
            topping_price = 2.5
            subLabel.text = "Subtotal is $\(topping_price! + size_price!)"
            hstLabel.text = "HST is $\((topping_price! + size_price!) * HST)"
            totalLabel.text = "Your total is $\((topping_price! + size_price!) * (HST + 1))"
        } else if toppings == 4 {
            topping_price = 3.25
            subLabel.text = "Subtotal is $\(topping_price! + size_price!)"
            hstLabel.text = "HST is $\((topping_price! + size_price!) * HST)"
            totalLabel.text = "Your total is $\((topping_price! + size_price!) * (HST + 1))"
        } else if toppings == 0 {
            topping_price = 0
            subLabel.text = "Subtotal is $\(size_price!)"
            hstLabel.text = "HST is $\((size_price!) * HST)"
            totalLabel.text = "Your total is $\((size_price!) * (HST + 1))"
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// this will be commented out when code moved to Xcode
PlaygroundPage.current.liveView = ViewController()
