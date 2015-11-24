//
//  ViewController.swift
//  SwiftSampleApp
//
//  Created by Developer 5 on 23/11/15.
//  Copyright (c) 2015 Developer 5. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
 var myView = UIView()
 var myDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Button creation
        let myButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        myButton.frame = CGRectMake(25, 20, 100, 40)
        myButton.backgroundColor = UIColor .greenColor()
        myButton.setTitle("My Button", forState: UIControlState.Normal)
        myButton.layer.cornerRadius = 6
        myButton .setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        myButton.addTarget(self, action: "mybutton_Click:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view .addSubview(myButton)
        
        //TextField creation
        let myTextField = UITextField()
        myTextField.frame = CGRectMake(25, 70, 200, 40)
        myTextField.backgroundColor = UIColor.lightGrayColor()
        myTextField.placeholder = "Enter somthing"
        myTextField.keyboardType = UIKeyboardType.Default
        myTextField.delegate = self
        myTextField.addTarget(self, action: "myTextfield_Action:", forControlEvents: UIControlEvents.TouchDown)
       // myTextField.secureTextEntry = true
        myTextField.layer.cornerRadius = 6
        self.view .addSubview(myTextField)
        
        //Label creation
        let myLabel = UILabel()
        myLabel.backgroundColor = UIColor.clearColor()
        myLabel.frame = CGRectMake(25, 120, 100, 40)
        myLabel.text = "Sivaprasad"
        myLabel.textColor = UIColor.magentaColor()
        self.view .addSubview(myLabel)
        
        //Imageview creation
        let myImageView = UIImageView()
        myImageView.frame = CGRectMake(40, 170, 80, 80)
        myImageView.image = UIImage(named: "image.png")
        myImageView.clipsToBounds = true
        myImageView.layer.cornerRadius = myImageView.frame.size.height/2
        self.view .addSubview(myImageView)
        
        let  items = ["siva","prasad","reddy"]
        
        //Segmentcontroller creation
        let mysegmentController = UISegmentedControl(items: items)
        mysegmentController.frame = CGRectMake(25, 260, 200, 40)
        mysegmentController.addTarget(self, action: "mySegmentIndex_Click:", forControlEvents: UIControlEvents.ValueChanged)
        mysegmentController.tintColor = UIColor.greenColor()
        mysegmentController.layer.cornerRadius = 6
        mysegmentController.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.blackColor()], forState: UIControlState.Selected)
        self.view .addSubview(mysegmentController)
        
        //Switch creation
        let mySwitch = UISwitch()
        mySwitch.frame = CGRectMake(30, 310, 60, 40)
        mySwitch.onTintColor = UIColor.redColor()
        mySwitch .addTarget(self, action: "mySwitch_Click:", forControlEvents: UIControlEvents.ValueChanged)
        self.view .addSubview(mySwitch)
        
        //Slider creation
        let mySlider = UISlider()
        mySlider.frame = CGRectMake(25, 360, self.view.frame.size.width - 50, 30)
        mySlider.minimumValue = 0
        mySlider.maximumValue = 5
        mySlider.continuous = true
        mySlider.addTarget(self, action: "mySlider_ValueChange:", forControlEvents: UIControlEvents.ValueChanged)
        mySlider.addTarget(self, action: "mySlider_Click:", forControlEvents: UIControlEvents.TouchUpInside)
        mySlider.tintColor = UIColor.redColor()
        self.view .addSubview(mySlider)
        
        //Activityindicater creation
        let myActivityIndicater = UIActivityIndicatorView()
        myActivityIndicater.frame = CGRectMake(25, 400, 60, 40)
        myActivityIndicater.center = self.view.center;
        myActivityIndicater.hidesWhenStopped = true
        myActivityIndicater.tag = 10
        myActivityIndicater.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        myActivityIndicater.startAnimating();
        self.view .addSubview(myActivityIndicater)
        
        //Datepicker creation
        let datefield = UITextField()
        datefield.frame = CGRectMake(160, 20, 150, 40)
        datefield.tag = 20
        datefield.backgroundColor = UIColor.lightGrayColor()
        datefield.delegate = self
        datefield.addTarget(self, action: "datepickerselect:", forControlEvents: UIControlEvents.TouchDown)
        datefield.placeholder = "Select Date"
        self.view .addSubview(datefield)
        
        //UIView creation
        myView.frame = CGRectMake(0, self.view.frame.size.height - 200, self.view.frame.size.width, 200)
        myView.backgroundColor = UIColor.lightTextColor()
        myView.hidden = true
        self.view .addSubview(myView)
        
        let doneButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        doneButton.setTitle("Done", forState: UIControlState.Normal)
        doneButton.backgroundColor = UIColor.blueColor()
        doneButton.addTarget(self, action: "done_Click:", forControlEvents: UIControlEvents.TouchUpInside)
        doneButton.frame = CGRectMake(self.view.frame.size.width - 60, 5, 60, 40)
        myView .addSubview(doneButton)
        
        //let myDatePicker = UIDatePicker()
        myDatePicker.frame = CGRectMake(0, 40, self.view.frame.width, 60)
        //myDatePicker.hidden = true
        //myDatePicker.addTarget(self, action: "dateSelection:", forControlEvents: UIControlEvents.ValueChanged)
        myView.addSubview(myDatePicker)
        
    }
    
    //MARK:-Button Action
    func mybutton_Click(sender:UIButton){
        sender.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        sender.backgroundColor = UIColor.purpleColor()
        println("Button Action Working")
        var activityIndicater = UIActivityIndicatorView()
        activityIndicater = self.view.viewWithTag(10) as UIActivityIndicatorView
        if(activityIndicater.hidden == true){
            activityIndicater.startAnimating()
        }
        else{
            activityIndicater.stopAnimating()
        }
    }
    
    func done_Click(sender:UIButton){
        var textField = UITextField()
        textField = self.view .viewWithTag(20) as UITextField
        var dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .ShortStyle
        dateFormatter.dateFormat = "dd:MM:yyyy-HH:mm"
        var strDate = dateFormatter.stringFromDate(myDatePicker.date)
        textField.text = strDate
        //String(format: "%i", selecteddate.date)
        myView.hidden = true
        
    }
    
    //MARK:-TextField Action
    func myTextfield_Action(textField:UITextField){
        textField.backgroundColor = UIColor.redColor()
    }
    
    func datepickerselect(sender:UITextField){
         //myDatePicker = UIDatePicker()
        //myDatePicker.datePickerMode = UIDatePickerMode.Time
        if(myView.hidden == true){
            myView.hidden = false
        }
        else{
            myView.hidden = true
        }
    }
    
    //MARK:-DatePicker Action
    func dateSelection(selecteddate:UIDatePicker){
        
    }
    
    //MARK:-Segment Action
    func mySegmentIndex_Click(index:UISegmentedControl){
     println("selectedIndex \(index.selectedSegmentIndex)")
    }
    
    //MARK:-Switch Action
    func mySwitch_Click(sender:UISwitch){
        if(sender.on){
        println("Switch On")
        }
        else{
        println("Switch Off")
        }
    }
    
    //MARK:-Switch Action
    func mySlider_ValueChange(slider:UISlider){
        println(slider.value)
    }
    
    func mySlider_Click(slider:UISlider){
         println("sliderValue \(slider.value)")
    }
    
    //MARK:-TextField Delegates
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return false
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

