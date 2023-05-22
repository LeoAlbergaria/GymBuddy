//
//  WorkoutsTableViewCell.swift
//  GymBuddy
//
//  Created by InPeace on 10/04/23.
//

import UIKit

final class WorkoutsTableViewCell: UITableViewCell {

  // MARK: - Properties

  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .text
    label.font = UIFont.boldSystemFont(ofSize: 24.0)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  lazy var subtitleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .text
    label.font = UIFont.systemFont(ofSize: 14.0)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  lazy var titleStackView: UIStackView = {
    let stack = UIStackView()
    stack.backgroundColor = .main
    stack.addArrangedSubview(titleLabel)
    stack.addArrangedSubview(subtitleLabel)
    stack.axis = .vertical
    stack.spacing = 12
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
  }()

  lazy var dateLabel: UILabel = {
    let label = UILabel()
    label.textColor = .text
    label.font = UIFont.systemFont(ofSize: 14.0)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  lazy var contentStackView: UIStackView = {
    let stack = UIStackView()
    stack.backgroundColor = .clear
    stack.addArrangedSubview(titleStackView)
    stack.addArrangedSubview(dateLabel)
    stack.axis = .vertical
    stack.spacing = 30
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
  }()

  private lazy var cardView: UIView = {
    let view = UIView()
    view.backgroundColor = .main
    view.layer.cornerRadius = 4
    view.addSubview(contentStackView)
    view.clipsToBounds = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  // MARK: - Lifecycle

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }

  // MARK: - Helpers

  func configure(text: String, description: String, date: Date) {
    titleLabel.text = text
    subtitleLabel.text = description
    dateLabel.text = "Ultimo treino: 19/03/2023"
  }

  func setup() {
    addSubview(cardView)
    setupConstraints()
    backgroundColor = .clear
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      cardView.topAnchor.constraint(equalTo: topAnchor),
      cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
      cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
      cardView.trailingAnchor.constraint(equalTo: trailingAnchor),

      contentStackView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
      contentStackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10),
      contentStackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
      contentStackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),

      cardView.heightAnchor.constraint(equalToConstant: 144)
    ])
  }
}

