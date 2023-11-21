//
//  UITableView+Extension.swift
//  SharedDSKit
//
//  Created by 강민성 on 11/21/23.
//

import UIKit
import SharedUtils

extension UITableView {
  func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
      guard let cell = self.dequeueReusableCell(withIdentifier: T.className,
                                                for: indexPath) as? T else {
          fatalError("Could not find cell with reuseID \(T.className)")
      }
      return cell
  }

  func register<T: UITableViewCell>(cell: T.Type,
                                    forCellReuseIdentifier reuseIdentifier: String = T.className
  ) {
    self.register(cell, forCellReuseIdentifier: reuseIdentifier)
  }
}
