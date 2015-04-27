//
//  CourseViewController.swift
//  GradeCoach
//
//  Created by Connor Wybranowski on 4/26/15.
//  Copyright (c) 2015 Wybro. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var courseGoal: UILabel!
    @IBOutlet weak var courseWorkTableView: UITableView!
    
    
    var selectedCourseName: String?
    var selectedCourseGoal: String?
    var selectedCourseIndex: NSIndexPath!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        courseName.text = selectedCourseName
        courseGoal.text = selectedCourseGoal
        
    }
    
    override func viewDidAppear(animated: Bool) {
        courseWorkTableView.reloadData()
//        println(courseMgr.getCourseWork(selectedCourseIndex.row).count)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            //            println("Before: " + "\(courseMgr.courses.count)")
            tableView.beginUpdates()
            courseMgr.removeCourseWork(selectedCourseIndex, courseWorkIndex: indexPath)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
            tableView.endUpdates()
        }
        //        println("After: " + "\(courseMgr.courses.count)")
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseMgr.getCourseWork(selectedCourseIndex.row).count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CourseItem", forIndexPath: indexPath) as! CourseWorkTableViewCell
        cell.courseWorkTitle.text = courseMgr.getCourseWorkItems(selectedCourseIndex.row, courseWorkIndex: indexPath.row).type
        cell.courseWorkWeight.text = "\(courseMgr.getCourseWorkItems(selectedCourseIndex.row, courseWorkIndex: indexPath.row).weight)" + "%"
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "newCourseWork"{
            var DestViewController = segue.destinationViewController as! newCourseWorkViewController
            DestViewController.courseIndex = selectedCourseIndex
        }
    }
    
    


}
