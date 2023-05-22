//
//  WorkoutsViewModel.swift
//  GymBuddy
//
//  Created by InPeace on 23/04/23.
//

import Foundation

protocol WorkoutsViewModelProtocol {
  func loadData(completion: @escaping (Bool) -> Void)
  var model: [Workout] { get }
}

class WorkoutsViewModel {
  var model: [Workout] = []
}

extension WorkoutsViewModel: WorkoutsViewModelProtocol {
  func loadData(completion: @escaping (Bool) -> Void) {
    completion(true)
  }
}
