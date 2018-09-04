//
//  TesteController.swift
//  Projeto
//
//  Created by LAB ADA FOR on 13/11/17.
//  Copyright © 2017 LAB ADA FOR. All rights reserved.
//

import UIKit

class TesteController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITabBarControllerDelegate {
    
    
    @IBOutlet weak var btPhoto: UIButton!
    @IBOutlet weak var btEdit: UIButton!
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelHistorico: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btPhoto.layer.cornerRadius = btPhoto.frame.height / 2
        self.btEdit.layer.cornerRadius = btEdit.frame.height / 3
        //self.labelNome.layer.cornerRadius = labelNome.frame.height / 3
        //self.labelNome.layer.masksToBounds = true
        
        self.labelHistorico.layer.cornerRadius = labelHistorico.frame.height / 3
        self.labelHistorico.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    @IBAction func upload(_ sender: UIButton) {
        
        let imagepicker = UIImagePickerController()
        imagepicker.allowsEditing = true
        imagepicker.sourceType = .photoLibrary
        self.present(imagepicker,animated: true, completion: nil)
        
        imagepicker.delegate = self
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerEditedImage] as? UIImage
        btPhoto.setTitle(nil, for: .normal)
        
        btPhoto.setBackgroundImage(image, for: .normal)
        self.btPhoto.layer.masksToBounds = true
        self.btPhoto.layer.cornerRadius = btPhoto.frame.height / 2
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    

}
