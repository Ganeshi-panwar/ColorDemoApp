//
//  DetailViewController.swift
//  ColorDemo
//
//  Created by Mohit Mali on 04/09/23.
//

import UIKit

class DetailViewController: UIViewController {
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = color ?? .blue
    }
    

}
