//
//  Workout.swift
//  GymBuddy
//
//  Created by InPeace on 23/04/23.
//

import Foundation

typealias Workouts = [Workout]

struct Workout: Codable {
  let title: String?
  let description: String?
  let lastDate: Date?
    
    init(title: String?, description: String?, lastDate: Date?) {
        self.title = title
        self.description = description
        self.lastDate = lastDate
    }
}
