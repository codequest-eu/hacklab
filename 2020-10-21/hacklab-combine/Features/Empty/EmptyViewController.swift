//
//  EmptyViewController.swift
//  hacklab-combine
//
//  Created by Michal Cichecki on 20/10/2020.
//

import Foundation

import UIKit

class EmptyViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
}
