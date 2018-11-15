//
//  ViewController.swift
//  MakeYouOwnBadge
//
//  Created by CHEN WESLEY on 2018/11/12.
//  Copyright © 2018 CHEN WESLEY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blueLbl: UILabel!
    @IBOutlet weak var greenLbl: UILabel!
    @IBOutlet weak var redLbl: UILabel!
    @IBOutlet weak var blueUISlider: UISlider!
    @IBOutlet weak var greenUISlider: UISlider!
    @IBOutlet weak var redUISlider: UISlider!
    @IBOutlet weak var alphaLbl: UILabel!
    @IBOutlet weak var gradientLbl: UILabel!
    @IBOutlet weak var borderLbl: UILabel!
    @IBOutlet weak var skinAlphaUISlider: UISlider!
    @IBOutlet weak var borderUISlider: UISlider!
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var imageRadiusUISider: UISlider!
    @IBOutlet var giraffeImageView: UIImageView!
    @IBOutlet var gradientLayer: CAGradientLayer!
    @IBOutlet var skinImageView: UIImageView!
    @IBOutlet var myNewView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.backgroundColor = UIColor.lightGray.cgColor

        myNewView = UIView(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: self.view.frame.height / 2 + 40))
        // Change UIView background colour
        myNewView.backgroundColor = UIColor(red: 255/255, green:255/255, blue: 80/255, alpha:1)
        // Add rounded corners to UIView
        //myNewView.layer.cornerRadius = 25
        // Add border to UIView
        //myNewView.layer.borderWidth = 2
        // Change UIView Border Color to Red
       // myNewView.layer.borderColor = UIColor.red.cgColor
        
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 5, y: 25,width: self.view.frame.width - 10, height: self.view.frame.height / 2 - 10)
        gradientLayer.colors = [UIColor.orange.cgColor, UIColor.blue.cgColor]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 2, y: 2)
        myNewView.layer.addSublayer(gradientLayer)
  
        let skinImage = UIImage(named: "skin")
        
        skinImageView = UIImageView(image: skinImage)
        skinImageView.frame = CGRect(x: gradientLayer.frame.origin.x, y: gradientLayer.frame.origin.y, width: gradientLayer.frame.width, height: gradientLayer.frame.height)
        skinImageView.alpha = 0.3
        
        myNewView.addSubview(skinImageView)
        
        // Add UIView as a Subview
        let borderImage = UIImage(named: "border1")
        let borderImageView = UIImageView(image: borderImage)
        borderImageView.frame = CGRect(x: gradientLayer.frame.origin.x, y: gradientLayer.frame.origin.y, width: gradientLayer.frame.width, height: gradientLayer.frame.height)
        //imageView.backgroundColor = UIColor(red: 10/255, green: 186/255, blue: 181/255, alpha: 1)
       
        myNewView.addSubview(borderImageView)
        
        let giraffeImage = UIImage(named: "giraffe1")
        giraffeImageView = UIImageView(image: giraffeImage)
        giraffeImageView.frame = CGRect(x: myNewView.frame.width / 4, y: borderImageView.frame.height / 6 + 20, width: 200, height: 200)
        giraffeImageView.layer.borderWidth = 2
        //giraffeImageView.layer.cornerRadius = 75
        giraffeImageView.layer.borderColor = UIColor.red.cgColor
        giraffeImageView.clipsToBounds = true
        //imageView.backgroundColor = UIColor(red: 10/255, green: 186/255, blue: 181/255, alpha: 1)
        
        myNewView.addSubview(giraffeImageView)
        
        let sampleTextField =  UITextField(frame: CGRect(x: myNewView.frame.width / 4, y: 320, width: 200, height: 40))
        sampleTextField.placeholder = "Giraffe Baby Naming"
        sampleTextField.font = UIFont.systemFont(ofSize: 15)
        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.keyboardType = UIKeyboardType.default
        sampleTextField.returnKeyType = UIReturnKeyType.done
        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing;
        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        myNewView.addSubview(sampleTextField)

        self.view.addSubview(myNewView)

    }

    @IBAction func backgroundColorChanged(_ sender: UISlider)
    {
        let redValue = redUISlider.value
        let greenValue = greenUISlider.value
        let blueValue = blueUISlider.value
        let alphaValue = skinAlphaUISlider.value
        
        redLbl.text = String(format: "%.0f", redValue)
        greenLbl.text = String(format: "%.0f", greenValue)
        blueLbl.text = String(format: "%.0f", blueValue)

        myNewView.backgroundColor = UIColor(red: CGFloat(redValue/255), green: CGFloat(greenValue/255), blue: CGFloat(blueValue/255), alpha: CGFloat(alphaValue))
        print("backgroundColorChanged alphaValue: \(alphaValue)")
        
    }
    @IBAction func headImageRadiusChanged(_ sender: UISlider) {
        let radiusValue = imageRadiusUISider.value
        print("radiusValue: \(radiusValue)")

        giraffeImageView.layer.cornerRadius = CGFloat(radiusValue * 100)
        borderLbl.text = "\(String(format: "%.2f",radiusValue))"
    }
    @IBAction func borderColorChanged(_ sender: UISlider) {
        let borderValue = borderUISlider.value
        print("borderValue: \(borderValue)")
        gradientLayer.locations = [0,Float(borderValue), 1] as [NSNumber]
        gradientLbl.text = "\(String(format: "%.2f",borderValue))"
    }
    
    @IBAction func skinImageAlphaChanged(_ sender: UISlider) {
        let skinChagneValue = skinAlphaUISlider.value
        print("skinChagneValue: \(skinChagneValue)")
        skinImageView.alpha = CGFloat(skinChagneValue)
        alphaLbl.text = "\(String(format: "%.2f",skinChagneValue))"
    }
}

