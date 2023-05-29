//
//  UserDefaultsExtensions.swift
//  GymBuddy
//
//  Created by Leonardo Albergaria on 28/05/23.
//

import Foundation

// Keys
private let keyWorkouts = "keyWorkouts"

extension UserDefaults {
  /// Set Codable object into UserDefaults
  /// - Parameters:
  ///   - object: Codable Object
  ///   - forKey: Key string
  /// - Throws: UserDefaults Error
  public func set<T: Codable>(object: T, forKey: String) throws {
    
    let jsonData = try JSONEncoder().encode(object)
    
    set(jsonData, forKey: forKey)
  }
  
  /// Get Codable object into UserDefaults
  /// - Parameters:
  ///   - object: Codable Object
  ///   - forKey: Key string
  /// - Throws: UserDefaults Error
  public func get<T: Codable>(objectType: T.Type, forKey: String) throws -> T? {
    
    guard let result = value(forKey: forKey) as? Data else {
      return nil
    }
    
    return try JSONDecoder().decode(objectType, from: result)
  }
  
  // MARK: - Workouts
  static func setWorkouts(_ workout: Workout) {
    do {
      var workouts: Workouts? = getWorkouts()
      if workouts != nil {
        workouts?.append(workout)
      } else {
        workouts = [workout]
      }
      try UserDefaults.standard.set(object: workouts, forKey: keyWorkouts)
      UserDefaults.standard.synchronize()
    } catch let error {
      print(error)
    }
  }
  
  static func getWorkouts() -> Workouts? {
    do {
      return try UserDefaults.standard.get(objectType: Workouts.self, forKey: keyWorkouts)
    } catch let error {
      print(error)
      return nil
    }
  }
}

