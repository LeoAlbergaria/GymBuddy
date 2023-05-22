//
//  WorkoutsViewController.swift
//  GymBuddy
//
//  Created by InPeace on 07/04/23.
//

import UIKit

final class WorkoutsViewController: UIViewController {
  
  let baseView = WorkoutsView()
  var viewModel: WorkoutsViewModelProtocol?
  var workouts: Workouts?
  
  // MARK: - Overrides
  override func viewDidLoad() {
    super.viewDidLoad()
    view = baseView
    title = "GYM BUDDY"
    
    viewModel?.loadData(completion: { success in
      guard success else {
        debugPrint("deu ruim!")
        return
      }
      
      guard let workouts = self.viewModel?.model else { return }
      self.workouts = workouts
      self.baseView.tableView.reloadData()
    })
    
    baseView.tableView.dataSource = self
    baseView.tableView.delegate = self
  }
}

// MARK: - TableView DataSource

extension WorkoutsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let modelCount = viewModel?.model.count else { return 0 }
    return modelCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = baseView.tableView.dequeueReusableCell(withIdentifier: String(describing: WorkoutsTableViewCell.self), for: indexPath) as? WorkoutsTableViewCell else { return UITableViewCell() }
    
    guard let workout = workouts?[indexPath.row],
          let title = workout.title,
          let description = workout.description,
          let date = workout.lastDate else { return cell }
    
    cell.configure(text: title, description: description, date: date)
    cell.separatorInset = .zero
    cell.selectionStyle = .none
    return cell
  }
}

// MARK: - TableView Delegate

extension WorkoutsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("treino 1")
  }
}
