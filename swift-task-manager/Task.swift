//
//  Task.swift
//  swift-task-manager
//
//  Created by Devan Allara on 8/22/17.
//  Copyright © 2017 Devan Allara. All rights reserved.
//

import Foundation
//6. Create the task class
class Task {
    var title: String
    var description: String
    var priority: Priority
    
    init(title: String, description: String, priority: Priority) {
        self.title = title
        self.description = description
        self.priority = priority
    }
    
}
