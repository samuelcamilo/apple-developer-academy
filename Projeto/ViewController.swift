//
//  ViewController.swift
//  Projeto
//
//  Created by LAB ADA FOR on 09/11/17.
//  Copyright © 2017 LAB ADA FOR. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarControllerDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if(tabBarController.selectedIndex == 0){
            
            let vc = UIViewController(nibName: "TesteController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

