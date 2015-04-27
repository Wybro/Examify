//
//  TaskManager.swift
//
//  Created by Connor  Wybranowski on 4/26/15.
//  Copyright (c) 2015 Wybros. All rights reserved.
//

import UIKit

// Global-scope code - can be accessed across application
var courseMgr: CourseManager = CourseManager()

struct course {
    var courseTitle: String
    var courseGoal: String
    var requirements: [courseWork]
}

struct courseWork {
    var type: String
    var weight: Int
}

class CourseManager: NSObject {
    
    // variable setup to hold array of courses
    var courses = [course]()
    
    func addCourse(name: String, goal: String){
//        courses.append((name, desc))
//        courses.append(course(courseTitle: name, courseGoal: goal))
        courses.append(course(courseTitle: name, courseGoal: goal, requirements: [courseWork]()))
    }
    
    func removeCourse(index: NSIndexPath){
        courses.removeAtIndex(index.row)
    }
    
    func addCourseWork(typeOfWork: String, weightOfWork: Int, index: NSIndexPath){
        courses[index.row].requirements.append(courseWork(type: typeOfWork, weight: weightOfWork))
    }
    
    func removeCourseWork(courseIndex: NSIndexPath, courseWorkIndex: NSIndexPath){
        courses[courseIndex.row].requirements.removeAtIndex(courseWorkIndex.row)
    }
    
    func getCourseWork(index: Int) -> [courseWork]{
        return courses[index].requirements
    }
    
    func getCourseWorkItems(courseIndex: Int, courseWorkIndex: Int) -> courseWork {
        return courses[courseIndex].requirements[courseWorkIndex]
    }
   
}
