//
//  WorkoutsViewModel.swift
//  GymBuddy
//
//  Created by InPeace on 23/04/23.
//

import Foundation

protocol WorkoutsViewModelProtocol {
  func loadData(completion: @escaping (Bool) -> Void)
  var model: Workouts { get }
}

class WorkoutsViewModel {
  var model: Workouts = []
}

extension WorkoutsViewModel: WorkoutsViewModelProtocol {
  func loadData(completion: @escaping (Bool) -> Void) {
    model.append(Workout(title: "Peito", description: "Treino de peito", lastDate: Date()))
    model.append(Workout(title: "Costas", description: "Treino de costas", lastDate: Date()))
    model.append(Workout(title: "Perna", description: "Treino de perna", lastDate: Date()))
    
    completion(true)
  }
}
