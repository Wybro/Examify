//
//  newCourseWorkViewController.swift
//  GradeCoach
//
//  Created by Connor Wybranowski on 4/26/15.
//  Copyright (c) 2015 Wybro. All rights reserved.
//

import UIKit

class newCourseWorkViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var assignmentType: UITextField!
    @IBOutlet weak var assignmentWeight: UITextField!
    var courseIndex: NSIndexPath!
    @IBOutlet weak var addButton: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.assignmentType.delegate = self
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        assignmentType.becomeFirstResponder()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addCourseWork(sender: AnyObject) {
        if !assignmentType.text.isEmpty && !assignmentWeight.text.isEmpty && assignmentWeight.text.toInt() <= 100 {
            courseMgr.addCourseWork(assignmentType.text, weightOfWork: assignmentWeight.text.toInt()!, index: courseIndex)
            navigationController?.popViewControllerAnimated(true)
            
        }
    }
    
    // Ensure that only numbers can be entered for course weight
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if (textField == assignmentWeight) {
            let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
            if let range = string.rangeOfCharacterFromSet(invalidCharacters, options: nil, range: Range<String.Index>(start: string.startIndex, end: string.endIndex)) {
                return false
            }
            return true
        }
        return true
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == assignmentType  {
            self.assignmentWeight.becomeFirstResponder()
            self.assignmentWeight.delegate = self
        }
        else if textField == assignmentWeight {
            self.view.endEditing(true)
        }
        return true
    }
    
    

}
