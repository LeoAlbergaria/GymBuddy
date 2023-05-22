//
//  BaseView.swift
//  GymBuddy
//
//  Created by InPeace on 10/04/23.
//

import UIKit

open class BaseView: UIView {
  lazy var activity: UIActivityIndicatorView = {
    let activity = UIActivityIndicatorView()
    activity.hidesWhenStopped = true
    activity.startAnimating()
    return activity
  }()
  override public init(frame: CGRect) {
    
    super.init(frame: frame)
    
    setup()
    setupConstraints()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    
    super.init(coder: aDecoder)
    
    setup()
    setupConstraints()
  }
  
  open func setup() {}
  
  open func setupConstraints() {}
}
