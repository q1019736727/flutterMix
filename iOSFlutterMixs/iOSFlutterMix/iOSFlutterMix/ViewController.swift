//
//  ViewController.swift
//  iOSFlutterMix
//
//  Created by Chiu Young on 2020/12/24.
//

import UIKit
import FlutterPluginRegistrant

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let flutterVC = FlutterViewController()
        self.navigationController?.pushViewController(flutterVC, animated: true)
    }

}

