//
//  ViewController.swift
//  paperDoll
//
//  Created by Alisha on 2020/12/26.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var headView: UIScrollView!
    @IBOutlet weak var bodyView: UIScrollView!
    @IBOutlet weak var faceView: UIScrollView!
    @IBOutlet weak var colorView: UIView!

    @IBOutlet weak var maskView: UIView!
    @IBOutlet weak var currentMaskColor: UIView!
    
    @IBOutlet weak var peopleView: UIView!
    @IBOutlet weak var faceImageView: UIImageView!
    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var bodyImageView: UIImageView!
    
    @IBOutlet weak var peopleCopyView: UIView!
    @IBOutlet weak var headCopyImageView: UIImageView!
    @IBOutlet weak var bodyCopyImageView: UIImageView!
    @IBOutlet weak var faceCopyImageView: UIImageView!
    
    @IBOutlet weak var redSliderText: UILabel!
    @IBOutlet weak var greenSliderText: UILabel!
    @IBOutlet weak var blueSliderText: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var maskTurnOnSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        headView.isHidden = false
        bodyView.isHidden = true
        faceView.isHidden = true
        colorView.isHidden = true
        peopleCopyView.isHidden = false
        maskView.isHidden = true
        peopleView.isHidden = true
        currentMaskColor.backgroundColor = UIColor.black
        currentMaskColor.layer.cornerRadius = 5
        peopleCopyView.backgroundColor = UIColor.clear
        peopleCopyView.frame = CGRect(x: 117, y: 45, width: 157, height: 303)
        redSlider.isEnabled = false
        greenSlider.isEnabled = false
        blueSlider.isEnabled = false
        
    }
    
    @IBAction func selectQuestion(_ sender: UIButton) {
        let numberFace = Int.random(in: 1...27)
        faceImageView.image = UIImage(named: "face\(numberFace)")
        faceCopyImageView.image = UIImage(named: "face\(numberFace)")
        
        let numberHead = Int.random(in: 1...45)
        headImageView.image = UIImage(named: "head\(numberHead)")
        headCopyImageView.image = UIImage(named: "head\(numberHead)")
        
        let numberBody = Int.random(in: 1...27)
        bodyImageView.image = UIImage(named: "body\(numberBody)")
        bodyCopyImageView.image = UIImage(named: "body\(numberBody)")
        
    }

    @IBAction func selectHead(_ sender: UIButton) {
        headView.isHidden = false
        bodyView.isHidden = true
        faceView.isHidden = true
        colorView.isHidden = true
    }
    
    @IBAction func selectBody(_ sender: UIButton) {
        bodyView.isHidden = false
        headView.isHidden = true
        faceView.isHidden = true
        colorView.isHidden = true
    }
    
    @IBAction func selectFace(_ sender: UIButton) {
        faceView.isHidden = false
        headView.isHidden = true
        bodyView.isHidden = true
        colorView.isHidden = true
    }
    
    @IBAction func selectBrush(_ sender: UIButton) {
        colorView.isHidden = false
        headView.isHidden = true
        faceView.isHidden = true
        bodyView.isHidden = true
    }
    
    @IBAction func itemHead(_ sender: UIButton) {
        if maskTurnOnSwitch.isOn {
            headImageView.image = sender.currentImage
            headCopyImageView.image = headImageView.image
        }else {
            headCopyImageView.image = sender.currentImage
            headImageView.image = headCopyImageView.image
        }
    }
    
    @IBAction func itemBody(_ sender: UIButton) {
        if maskTurnOnSwitch.isOn {
            bodyImageView.image = sender.currentImage
            bodyCopyImageView.image = bodyImageView.image
        }else {
            bodyCopyImageView.image = sender.currentImage
            bodyImageView.image = bodyCopyImageView.image
        }
        
    }
    
    @IBAction func itemFace(_ sender: UIButton) {
        if maskTurnOnSwitch.isOn {
            faceImageView.image = sender.currentImage
            faceCopyImageView.image = faceImageView.image
        }else {
            faceCopyImageView.image = sender.currentImage
            faceImageView.image = faceCopyImageView.image
        }
        
    }

    //遮色片開關
    @IBAction func changeMaskColor(_ sender: UISwitch) {
        if maskTurnOnSwitch.isOn{
            peopleCopyView.isHidden = true
            maskView.isHidden = false
            peopleView.isHidden = false
            maskView.frame = CGRect(x: 117, y: 45, width: 157, height: 303)
            peopleView.frame = maskView.bounds
            maskView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
            maskView.mask = peopleView
        }
        else {
            maskView.isHidden = true
            peopleView.isHidden = true
            peopleCopyView.isHidden = false
        }
    }
    @IBAction func maskColorSlider(_ sender: UISlider) {
        currentMaskColor.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        redSliderText.text = String(format: "%.2f",redSlider.value)
        greenSliderText.text = String(format:"%.2f", greenSlider.value)
        blueSliderText.text = String(format:"%.2f", blueSlider.value)
    }
    @IBAction func sliderEnabledSwitch(_ sender: UISwitch) {
        if redSwitch.isOn {
            redSlider.isEnabled = true
        }else {
            redSlider.isEnabled = false
        }
        if greenSwitch.isOn {
            greenSlider.isEnabled = true
        }else {
            greenSlider.isEnabled = false
        }
        if blueSwitch.isOn {
            blueSlider.isEnabled = true
        }else {
            blueSlider.isEnabled = false
        }
        
    }
    
    
    
}

