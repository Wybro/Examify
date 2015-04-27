//
//  newCourseViewController.swift
//  GradeCoach
//
//  Created by Connor Wybranowski on 4/25/15.
//  Copyright (c) 2015 Wybro. All rights reserved.
//

import UIKit

class newCourseViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var newCourseName: UITextField!
    @IBOutlet weak var newCourseGrade: UISegmentedControl!
    @IBOutlet weak var newCourseGradeModifier: UISegmentedControl!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.newCourseName.delegate = self
        newCourseName.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addCourse(sender: AnyObject) {
       if !newCourseName.text.isEmpty {
            var courseName = newCourseName.text
            var desiredGrade = newCourseGrade.titleForSegmentAtIndex(newCourseGrade.selectedSegmentIndex)! + newCourseGradeModifier.titleForSegmentAtIndex(newCourseGradeModifier.selectedSegmentIndex)!
            courseMgr.addCourse(courseName, goal: desiredGrade)
            navigationController?.popToRootViewControllerAnimated(true)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }


}
