//
//  main.swift
//  swift-task-manager
//
//  Created by Devan Allara on 8/16/17.
//  Copyright © 2017 Devan Allara. All rights reserved.
//

import Foundation

var tasks = [task]()

//5. Create function to add a task to the tasks array
func addTask() {
    print("What's the title of your task?")
    let title = readLine()
    print("Give a description of your task")
    let description = readLine()
    print("Is this a low, medium, or high priority task?")
    var priorityInput = readLine()
    while priorityInput?.uppercased() != "LOW" && priorityInput?.uppercased() != "MEDIUM" && priorityInput?.uppercased() != "HIGH"{
        print("Please input a valid selection")
        priorityInput = readLine()
    }
    var priority: Priority!
    switch priorityInput?.uppercased() {
        case "LOW"?:
            priority = .Low
        case "MEDIUM"?:
            priority = .Medium
        case "HIGH"?:
            priority = .High
        default:
            priority = .Low
    }
    let newTask = task(title: title!, description: description!, priority: priority)
    tasks.append(newTask)
    print("New Task Created! Press enter to return to the main menue")
    _ = readLine()
    mainMenu()
    
}
//8. Create the view tasks function
func viewTasks() {
    if tasks.count == 0 {
        print("You need to create some tasks first! Press enter to return to the main menue")
        _ = readLine()
        mainMenu()
    }
    var counter = 1
    print("""
        Tasks:
        """)
    for task in tasks {
        print("\(counter). \(task.title)")
        counter += 1
    }
    print("Please select a task you want to view")
    var selectedTask = Int(readLine()!)!
    while selectedTask > tasks.count {
        print("Please select a valid task")
        selectedTask = Int(readLine()!)!
    }
    print("""
        Title: \(tasks[selectedTask - 1].title)
        Description: \(tasks[selectedTask - 1].description)
        Priority: \(tasks[selectedTask - 1].priority)
        """)
    print("""
        Would you like to view another task or return to the main menu?
        1. Main Menu
        2. View Another task
        """)
    var userSelection = Int(readLine()!)!
    while userSelection != 1 && userSelection != 2 {
        print("Please make a valid selection")
        userSelection = Int(readLine()!)!
    }
    userSelection == 1 ? mainMenu() : viewTasks()
}
//9. Create remove task function
func removeTask() {
    if tasks.count == 0 {
        print("You need to create some tasks first! Press enter to return to the main menue")
        _ = readLine()
        mainMenu()
    }
    var counter = 1
    print("""
        Tasks:
        """)
    for task in tasks {
        print("\(counter). \(task.title)")
        counter += 1
    }
    print("Please select the task you want to remove")
    var selectedTask = Int(readLine()!)!
    while selectedTask > tasks.count {
        print("Please select a valid task")
        selectedTask = Int(readLine()!)!
    }
    tasks.remove(at: selectedTask - 1)
    print("The task was removed!")
    print("""
        Would you like to remove another task or return to the main menu?
        1. Main Menu
        2. Remove Another task
        """)
    var userSelection = Int(readLine()!)!
    while userSelection != 1 && userSelection != 2 {
        print("Please make a valid selection")
        userSelection = Int(readLine()!)!
    }
    userSelection == 1 ? mainMenu() : removeTask()
    
    
}

//1. Create the main menu text
func mainMenu() {
    print("""
            *******************************
            * Welcome To The Task Manager!*
            *******************************
            
            Please select an option
            1. Add Task
            2. View Tasks
            3. Remove Tasks
            """)

    //2. Convert the user input into an int
    var selection = Int(readLine()!)!
    
    //3. Validate the users input so that they choose a valid optionn
    while selection != 1 && selection != 2 && selection != 3 {
      print("Please input a valid option")
        selection = Int(readLine()!)!
    }
    
    //4. Switch which function runs based on which option was selected
    switch selection {
    case 1:
        addTask()
    case 2:
        viewTasks()
    case 3:
        removeTask()
    default:
        print("Please enter a valid option!")
        mainMenu()
    }
    }
//10. call main menu function
mainMenu()


















