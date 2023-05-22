//
//  WorkoutsViewController.swift
//  GymBuddy
//
//  Created by InPeace on 07/04/23.
//

import UIKit

final class WorkoutsViewController: UIViewController {
  
  let baseView = WorkoutsView()
  
  // MARK: - Overrides
  override func viewDidLoad() {
    super.viewDidLoad()
    view = baseView
    title = "GYM BUDDY"

    baseView.tableView.dataSource = self
    baseView.tableView.delegate = self
  }
}

// MARK: - TableView DataSource

extension WorkoutsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = baseView.tableView.dequeueReusableCell(withIdentifier: String(describing: WorkoutsTableViewCell.self), for: indexPath) as? WorkoutsTableViewCell else { return UITableViewCell() }
    cell.configure(text: "Treino 1")
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
