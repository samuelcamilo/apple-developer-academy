//
//  FormularioViewController.swift
//  Projeto
//
//  Created by LAB ADA FOR on 27/11/17.
//  Copyright © 2017 LAB ADA FOR. All rights reserved.
//

import UIKit
import Foundation
import MessageUI
import IQKeyboardManagerSwift


var arrayFavoritos: [String] = []

class FormularioViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, MFMailComposeViewControllerDelegate {
    

    // MARK: -
    // MARK: -
    // MARK: IBOUTLET - PROGRAMA
    @IBOutlet weak var myLabelLinha: UILabel!
    
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    @IBOutlet weak var btnEnviar: UIButton!
    @IBOutlet weak var btnFavorito: UIButton!
    
    @IBOutlet weak var textNome: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textNumeroVeiculo: UITextField!
    @IBOutlet weak var textHorario: UITextField!
    @IBOutlet weak var textNomeCobrador: UITextField!
    
    @IBOutlet weak var textViewReclamacoes: UITextView!
   
    
    
    // MARK: -
    // MARK: -
    // MARK: VARIAVEIS - PROGRAMA
    var linhaOnibus: String?
    var nota: String?
    var favorito: Bool = false
    
   
    
    
    // MARK: -
    // MARK: -
    // MARK: FUNÇÃO VIEW DID LOAD - PROGRAMA
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        nota = "0/5 - Sem Avaliação"
        
        textViewReclamacoes.delegate = self
        
        self.btnEnviar.layer.cornerRadius = btnEnviar.frame.height / 3
        
        textNome.delegate = self
        textEmail.delegate = self
        textNumeroVeiculo.delegate = self
        textHorario.delegate = self
        textNomeCobrador.delegate = self
        textViewReclamacoes.delegate = self
        
        if linhaOnibus != nil{
            
            myLabelLinha.text = linhaOnibus
            
        }
        
        if arrayFavoritos.contains(linhaOnibus!)
        {
            btnFavorito.setImage(#imageLiteral(resourceName: "StarGreen"), for: UIControlState.normal)
            favorito = true
        }
        else
        {
            btnFavorito.setImage(#imageLiteral(resourceName: "StarGray"), for: UIControlState.normal)
            favorito = false
        }
    }

    
    // MARK: -
    // MARK: -
    // MARK: AÇÃO BOTÃO 1 ESTRELA
    @IBAction func star1Button(_ sender: Any) {
        
        star1.setImage(#imageLiteral(resourceName: "Yellow Star"), for: UIControlState.normal)
        star2.setImage(#imageLiteral(resourceName: "StarGray"), for: UIControlState.normal)
        star3.setImage(#imageLiteral(resourceName: "StarGray"), for: UIControlState.normal)
        star4.setImage(#imageLiteral(resourceName: "StarGray"), for: UIControlState.normal)
        star5.setImage(#imageLiteral(resourceName: "StarGray"), for: UIControlState.normal)
        
        nota = "1/5 - Muito Ruim"
        
    }

    
    // MARK: -
    // MARK: -
    // MARK: AÇÃO BOTÃO 2 ESTRELAS
    @IBAction func star2Button(_ sender: Any) {
        
        star1.setImage(#imageLiteral(resourceName: "Yellow Star"), for: UIControlState.normal)
        star2.setImage(#imageLiteral(resourceName: "Yellow Star"), for: UIControlState.normal)
        star3.setImage(#imageLiteral(resourceName: "StarGray"), for: UIControlState.normal)
        star4.setImage(#imageLiteral(resourceName: "StarGray"), for: UIControlState.normal)
        star5.setImage(#imageLiteral(resourceName: "StarGray"), for: UIControlState.normal)
        
        nota = "2/5 - Ruim"
        
    }
    
    
    // MARK: -
    // MARK: -
    // MARK: AÇÃO BOTÃO 3 ESTRELAS
    @IBAction func star3Button(_ sender: Any) {
        
        star1.setImage(#imageLiteral(resourceName: "Yellow Star"), for: UIControlState.normal)
        star2.setImage(#imageLiteral(resourceName: "Yellow Star"), for: UIControlState.normal)
        star3.setImage(#imageLiteral(resourceName: "Yellow Star"), for: UIControlState.normal)
        star4.setImage(#imageLiteral(resourceName: "StarGray"), for: UIControlState.normal)
        star5.setImage(#imageLiteral(resourceName: "StarGray"), for: UIControlState.normal)
        
        nota = "3/5 - Bom"
        
    }
    
    
    // MARK: -
    // MARK: -
    // MARK: AÇÃO BOTÃO 4 ESTRELAS
    @IBAction func star4Button(_ sender: Any) {

        star1.setImage(#imageLiteral(resourceName: "Yellow Star"), for: UIControlState.normal)
        star2.setImage(#imageLiteral(resourceName: "Yellow Star"), for: UIControlState.normal)
        star3.setImage(#imageLiteral(resourceName: "Yellow Star"), for: UIControlState.normal)
        star4.setImage(#imageLiteral(resourceName: "Yellow Star"), for: UIControlState.normal)
        star5.setImage(#imageLiteral(resourceName: "StarGray"), for: UIControlState.normal)
        
        nota = "4/5 - Muito Bom"
        
    }
    
    
    // MARK: -
    // MARK: -
    // MARK: AÇÃO BOTÃO 5 ESTRELAS
    @IBAction func star5Button(_ sender: Any) {
        
        star1.setImage(#imageLiteral(resourceName: "Yellow Star"), for: UIControlState.normal)
        star2.setImage(#imageLiteral(resourceName: "Yellow Star"), for: UIControlState.normal)
        star3.setImage(#imageLiteral(resourceName: "Yellow Star"), for: UIControlState.normal)
        star4.setImage(#imageLiteral(resourceName: "Yellow Star"), for: UIControlState.normal)
        star5.setImage(#imageLiteral(resourceName: "Yellow Star"), for: UIControlState.normal)
        
        nota = "5/5 - Excelente"
        
    }
    

    // MARK: -
    // MARK: -
    // MARK: AÇÃO FAVORITAR ONIBUS
    @IBAction func favoritarOnibus(_ sender: Any) {
        if (favorito == false) {
            favorito = true
            btnFavorito.setImage(#imageLiteral(resourceName: "StarGreen"), for: UIControlState.normal)
            
            arrayFavoritos.append(linhaOnibus!)
            print(arrayFavoritos)
            
            
            
        } else
        {
            favorito = false
            btnFavorito.setImage(#imageLiteral(resourceName: "StarGray"), for: UIControlState.normal)
            if let index = arrayFavoritos.index(of: linhaOnibus!) {
                arrayFavoritos.remove(at: index)
            }
            print(arrayFavoritos)
        }
    }

    
    // MARK: -
    // MARK: AÇÃO DE ENVIO DE EMAIL
    @IBAction func sendEmailButton(_ sender: Any) {
        
        let mailComposeViewController = configureMailComposeViewController()
        if MFMailComposeViewController.canSendMail(){
            
            self.present(mailComposeViewController, animated: true, completion: nil)
            //self.showSendMailSuccessAlert()
            
        }
        textNome.text = ""
        textEmail.text = ""
        textHorario.text = ""
        textNomeCobrador.text = ""
        textNumeroVeiculo.text = ""
        textViewReclamacoes.text = ""
        
        star1.setImage(#imageLiteral(resourceName: "StarGray"), for: UIControlState.normal)
        star2.setImage(#imageLiteral(resourceName: "StarGray"), for: UIControlState.normal)
        star3.setImage(#imageLiteral(resourceName: "StarGray"), for: UIControlState.normal)
        star4.setImage(#imageLiteral(resourceName: "StarGray"), for: UIControlState.normal)
        star5.setImage(#imageLiteral(resourceName: "StarGray"), for: UIControlState.normal)
    }
    
    // MARK: -
    // MARK: -
    // MARK: AÇÃO BOTÃO CANCELAR
    @IBAction func btnCancel(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    // MARK: -
    // MARK: -
    // MARK: FUNÇÃO ESCONDER TECLADO - TEXTVIEW
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if(text == "\n"){
            textView.resignFirstResponder()
            return false
        }
        
        return true
    }
    
    
    // MARK: -
    // MARK: -
    // MARK: FUNÇÃO ESCONDER TECLADO - TEXTFIELD
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    // MARK: -
    // MARK: FUNÇÃO DE PREPARAÇÃO PARA ENVIO DO EMAIL
    func configureMailComposeViewController() -> MFMailComposeViewController{
        
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        
        mailComposeVC.setToRecipients(["immmael@gmail.com"])  // EMAIL SINDIÔNIBUS
        mailComposeVC.setBccRecipients(["\(textEmail.text!)"])
        mailComposeVC.setSubject("\(String(describing: myLabelLinha.text!))")
        mailComposeVC.setMessageBody("Nome: \(textNome.text!)\n Número do Veículo: \(textNumeroVeiculo.text!)\n Horário: \(textHorario.text!)\n Nome do Motorista/Cobrador: \(textNomeCobrador.text!)\n Descrição da Reclamação: \(textViewReclamacoes.text!)\n Nota: \(nota!)", isHTML: false)
        
        return mailComposeVC
        
    }
    
    
    // MARK: -
    // MARK: FUNÇÃO DISMISS - VIEW EMAIL
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
    
    }
}
