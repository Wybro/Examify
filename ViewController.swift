//
//  ViewController.swift
//  GradeCoach
//
//  Created by Connor Wybranowski on 4/25/15.
//  Copyright (c) 2015 Wybro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let textColor = UIColor(red: 41/255, green: 149/255, blue: 163/255, alpha: 1)
    
    @IBOutlet weak var courseTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "STHeitiTC-Medium", size: 18)!, NSForegroundColorAttributeName: textColor]
        
        UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "STHeitiTC-Medium", size: 18)!, NSForegroundColorAttributeName: textColor], forState: UIControlState.Normal)
        
      
        
        
    }
    

    override func viewWillAppear(animated: Bool) {
        animateTable()
    }
    
    
    @IBAction func moreInfo(sender: AnyObject) {
        let alert = UIAlertView()
        alert.title = "Getting Started"
        alert.message = "Add a new course by tapping the button in the top right corner."
        alert.addButtonWithTitle("Got it!")
        alert.show()
    }
    
    
    func animateTable() {
        courseTableView.reloadData()
        
        let cells = courseTableView.visibleCells()
        let tableHeight: CGFloat = courseTableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as! UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as! UITableViewCell
            UIView.animateWithDuration(1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: nil, animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
            index += 1
        }
    }
    
    override func viewDidAppear(animated: Bool) {
//        courseTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseMgr.courses.count
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            //            println("Before: " + "\(courseMgr.courses.count)")
            tableView.beginUpdates()
            courseMgr.removeCourse(indexPath)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
            tableView.endUpdates()
        }
        //        println("After: " + "\(courseMgr.courses.count)")
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CourseTableViewCell
        cell.courseName.text = courseMgr.courses[indexPath.row].courseTitle
        cell.goal.text = courseMgr.courses[indexPath.row].courseGoal
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "moreInfo"{
            var indexPath: NSIndexPath = self.courseTableView.indexPathForSelectedRow()!
            var DestViewController = segue.destinationViewController as! CourseViewController
            
//            println(courseMgr.courses[indexPath.row].courseTitle)
//            println(courseMgr.courses[indexPath.row].courseGoal)
            DestViewController.selectedCourseName = courseMgr.courses[indexPath.row].courseTitle
            DestViewController.selectedCourseGoal = courseMgr.courses[indexPath.row].courseGoal
            DestViewController.selectedCourseIndex = indexPath
            
        }
    
    }

}

