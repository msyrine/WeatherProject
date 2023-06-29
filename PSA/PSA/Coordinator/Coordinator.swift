//
//  Coordinator.swift
//  PSA
//
//  Created by syrine methlouthi on 29/06/2023.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}
