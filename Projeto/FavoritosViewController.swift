//
//  FavoritosViewController.swift
//  Projeto
//
//  Created by LAB ADA FOR on 11/12/17.
//  Copyright © 2017 LAB ADA FOR. All rights reserved.
//

import UIKit

class FavoritosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    // MARK: -
    // MARK: -
    // MARK: IBOUTLET - PROGRAMA
    @IBOutlet weak var table: UITableView!
    
    
    // MARK: -
    // MARK: -
    // MARK: VARIAVEIS - PROGRAMA
    var indexOnibus : Int = 0
    
    
    // MARK: -
    // MARK: -
    // MARK: FUNÇÃO AO CARREGAR VIEW - PROGRAMA
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        //print(arrayFavoritos.count)
        
    }

    
    // MARK: -
    // MARK: -
    // MARK: FUNÇÃO AO APARECER VIEW - PROGRAMA
    override func viewDidAppear(_ animated: Bool) {
        table.reloadData()
    }

    
    // MARK: -
    // MARK: -
    // MARK: NUMERO DE LINHAS - TABLEVIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayFavoritos.count
    }

    
    // MARK: -
    // MARK: -
    // MARK: CONFIGURAÇÃO DAS CÉLULAS - TABLEVIEW
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        cell.textLabel?.text = arrayFavoritos[indexPath.row]
        let cores = UIColor(red: 0.0/255.0, green: 161.0/255.0, blue: 146.0/255.0, alpha: 1.0)
        
        cell.textLabel?.textColor = cores
        
        return cell
    }
    
    
    // MARK: -
    // MARK: -
    // MARK: FUNÇÃO PARA PASSAR VALOR DE UMA VARIAVEL A OUTRA VIEW
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // levando o nome do bus para FormularioViewController
        if segue.identifier == "FavoritosViewController" {
            if let nextSegue = segue.destination as? FormularioViewController, let indexPath = table.indexPathForSelectedRow {
                nextSegue.linhaOnibus = arrayFavoritos[indexPath.row]
            }
        }
    }
    
}
