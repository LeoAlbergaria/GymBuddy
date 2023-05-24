//
//  WorkoutsView.swift
//  GymBuddy
//
//  Created by InPeace on 07/04/23.
//

import UIKit

final class WorkoutsView: BaseView {

  // MARK: - Properties
  lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .grouped)
    tableView.register(WorkoutsTableViewCell.self, forCellReuseIdentifier: String(describing: WorkoutsTableViewCell.self))
    tableView.separatorStyle = .none
    tableView.backgroundColor = .clear
    tableView.sectionHeaderHeight = 55
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()

  override func setup() {
    addSubview(tableView)
    backgroundColor = .black
  }

  override func setupConstraints() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: topAnchor),
      tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
    ])
  }
}
