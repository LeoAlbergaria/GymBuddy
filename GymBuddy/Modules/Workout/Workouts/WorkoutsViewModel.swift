//
//  WorkoutsViewModel.swift
//  GymBuddy
//
//  Created by InPeace on 23/04/23.
//

import Foundation

protocol WorkoutsViewModelProtocol {
  func loadData(completion: @escaping (Bool) -> Void)
  func newWorkout(title: String, description: String)
  
  var model: Workouts { get }
}

class WorkoutsViewModel {
  var model: Workouts = []
}

extension WorkoutsViewModel: WorkoutsViewModelProtocol {
  func loadData(completion: @escaping (Bool) -> Void) {
    guard let workouts = UserDefaults.getWorkouts() else {
      completion(false)
      return
    }
    
    model = workouts
    completion(true)
  }
  
  func newWorkout(title: String, description: String) {
    UserDefaults.setWorkouts(Workout(title: title, description: description, lastDate: Date()))
  }
}
