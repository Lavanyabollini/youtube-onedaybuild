//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Lavanya B R on 08/07/24.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideos()
    }


}

