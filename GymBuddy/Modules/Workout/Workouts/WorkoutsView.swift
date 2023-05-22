//
//  WorkoutsView.swift
//  GymBuddy
//
//  Created by InPeace on 07/04/23.
//

import UIKit

final class WorkoutsView: BaseView {

  // MARK: - Properties

  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .text
    label.text = "Workouts"
    label.font = UIFont.boldSystemFont(ofSize: 36.0)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .grouped)
    tableView.register(WorkoutsTableViewCell.self, forCellReuseIdentifier: String(describing: WorkoutsTableViewCell.self))
    tableView.separatorStyle = .none
    tableView.backgroundColor = .clear
    tableView.tableHeaderView = titleLabel
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
      tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
    ])
  }
}
