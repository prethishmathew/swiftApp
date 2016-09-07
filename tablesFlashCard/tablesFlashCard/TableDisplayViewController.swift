//
//  TableDisplayViewController.swift
//  tablesFlashCard
//
//  Created by sweety prethish on 6/13/16.
//  Copyright © 2016 myrattles. All rights reserved.
//

import UIKit
import Foundation

class TableDisplayViewController: UIViewController
{
    var multiplicationCalculator : TableGenerator = TableGenerator()
    
    var onQuestionScreen: Bool = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        multiplicationCalculator.CurrentTable = self.CurrentTable
        multiplicationCalculator.CurrentPointer = -1
        self.onQuestionScreen = true
        self.labelName.text = String(multiplicationCalculator.getCurrent()) + " X " + String(multiplicationCalculator.CurrentTable)
        
        
        
        
        let leftGesture = UISwipeGestureRecognizer(target: self, action: #selector(TableDisplayViewController.GetNext(_:)))
        leftGesture.direction = .Left
        self.view.addGestureRecognizer(leftGesture)
        
        let upGesture = UISwipeGestureRecognizer(target: self, action: #selector(TableDisplayViewController.GetNext(_:)))
        upGesture.direction = .Up
        self.view.addGestureRecognizer(upGesture)
        
        
        let rightGesture = UISwipeGestureRecognizer(target: self, action: #selector(TableDisplayViewController.GetPrev(_:)))
        rightGesture.direction = .Right
        self.view.addGestureRecognizer(rightGesture)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var CurrentTable : Int = 1
    let offstageLeft = CGAffineTransformMakeTranslation(-150, 0)
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func GetPrev(sender:UISwipeGestureRecognizer)  {
        
        let transitionOptions = UIViewAnimationOptions.TransitionCurlDown
        var textLabel:String
        if !self.onQuestionScreen
        {
            textLabel = String(multiplicationCalculator.CurrentTable) + " X " + String(multiplicationCalculator.getCurrent())
        }
        else
        {
            textLabel = String(multiplicationCalculator.CurrentTable) + " X " + String(multiplicationCalculator.getPrev())
        }
        self.onQuestionScreen = true
        UIView.transitionWithView(self.view, duration: 0.5, options: transitionOptions, animations: {
            
            self.labelName.text  = textLabel
            
            
            }, completion: { finished in
        })
        
    }
    
    func GetNext(sender:UISwipeGestureRecognizer)  {
        
        let transitionOptions = UIViewAnimationOptions.TransitionCurlUp
        var textLabel:String
        
        if onQuestionScreen {
            //Generate Answer
            onQuestionScreen = false
            textLabel = String(multiplicationCalculator.CurrentTable * multiplicationCalculator.getCurrent())
        
        }
        
        else
        
        {
            
            // Generate Question - "Was" NOT a Question
            onQuestionScreen = true
            textLabel = String(multiplicationCalculator.CurrentTable) + " X " + String(multiplicationCalculator.getNext())
        
        }
        
        if multiplicationCalculator.CurrentPointer >= multiplicationCalculator.multiplierApp.count - 1
        {
         
            
            textLabel = " Congratulations !!!"
            self.labelName.text = textLabel
            
        }
        
        else
        
        {
            UIView.transitionWithView(self.view, duration: 0.5, options: transitionOptions, animations: {
            
            self.labelName.text  = textLabel
            
            
            }, completion: { finished in
        })
        }
        
 }
    
    
    func slideInFromLeft(duration: NSTimeInterval = 0.5, completionDelegate: AnyObject? = nil) {
        // Create a CATransition animation
        let slideInFromLeftTransition = CATransition()
        
        // Set its callback delegate to the completionDelegate that was provided (if any)
        if let delegate: AnyObject = completionDelegate {
            slideInFromLeftTransition.delegate = delegate
        }
        
        // Customize the animation's properties
        slideInFromLeftTransition.type = kCATransitionPush
        slideInFromLeftTransition.subtype = kCATransitionFromRight
        slideInFromLeftTransition.duration = duration
        slideInFromLeftTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        slideInFromLeftTransition.fillMode = kCAFillModeRemoved
        
        // Add the animation to the View's layer
        self.view.layer.addAnimation(slideInFromLeftTransition, forKey: "slideInFromLeftTransition")
    }
    
    @IBOutlet weak var labelName: UILabel!
    

}