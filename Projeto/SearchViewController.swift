//
//  SearchViewController.swift
//  Projeto
//
//  Created by LAB ADA FOR on 14/11/17.
//  Copyright © 2017 LAB ADA FOR. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    
    // MARK: -
    // MARK: -
    // MARK: IBOUTLET - PROGRAMA
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var tabBar: UINavigationItem!
    
    
    // MARK: -
    // MARK: -
    // MARK: VARIAVEIS - PROGRAMA
    var linha: [String] = []
    var filter: [String]!
    var indexOnibus : Int = 0
    
    
    // MARK: -
    // MARK: -
    // MARK: FUNÇÃO VIEW DID LOAD - PROGRAMA
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.searchBar.backgroundImage = UIImage() // Tiro a linha do Search.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        table.dataSource = self
        table.delegate = self
        searchBar.delegate = self
        
        guard let path = Bundle.main.path(forResource: "linha", ofType: "json") else {return}
        
        let url = URL(fileURLWithPath: path)
        
        do{
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            //print(json)
            
            guard let array = json as? [Any] else {return}
            
            for onibus in array{
                guard let onibusDict = onibus as? [String: Any] else {return}
                guard let B = onibusDict["B"] as? String else {print("n eh string"); return}
                linha.append(B)
            }
            
        }
        catch{
            print(error)
        }
        
        filter = linha
        
    }
    
    
    // MARK: -
    // MARK: -
    // MARK: NUMERO DE LINHAS - TABLEVIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return filter.count
    }
    
    
    // MARK: -
    // MARK: -
    // MARK: CONFIGURAÇÃO DAS CÉLULAS - TABLEVIEW
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        cell.textLabel?.text = filter[indexPath.row]
        let cores = UIColor(red: 0.0/255.0, green: 161.0/255.0, blue: 146.0/255.0, alpha: 1.0)
        
        cell.textLabel?.textColor = cores
        
     
        return cell
    }
    
    
    // MARK: -
    // MARK: -
    // MARK: LIBERANDO EDIÇÃO DAS LINHAS - TABLEVIEW
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    // MARK: -
    // MARK: -
    // MARK: FUNÇÃO AO SELECIONAR LINHA - TABLEVIEW
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        indexOnibus = indexPath.row
        
        print(filter[indexOnibus])
        
        
        self.performSegue(withIdentifier: "AvaliacaoViewController", sender: filter[indexOnibus])
        
    }
    
    
    // MARK: -
    // MARK: -
    // MARK: FUNÇÃO PARA PASSAR VALOR DE UMA VARIAVEL A OUTRA VIEW
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // levando o nome do bus para FormularioViewController
        if segue.identifier == "AvaliacaoViewController" {
            if let nextSegue = segue.destination as? FormularioViewController {
                nextSegue.linhaOnibus = filter[indexOnibus]
            }
        }
        
    }
    
    
    // MARK: -
    // MARK: -
    // MARK: FUNÇÃO PARA FILTRAR BUSCA DO SEARCHBAR - SEARCHBAR
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filter = searchText.isEmpty ? linha : linha.filter({(dataString: String) -> Bool in
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
            
        })
        table.reloadData()
    }
   
    
    // MARK: -
    // MARK: -
    // MARK: FUNÇÃO PARA ESCONDER TECLADO AO CLICAR EM BUSCAR - SEARCHBAR
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    
    // MARK: -
    // MARK: -
    // MARK: FUNÇÃO PARA ESCONDER TECLADO AO CLICAR EM CANCELAR - SEARCHBAR
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    
    // MARK: -
    // MARK: -
    // MARK: FUNÇÃO PARA ESCONDER TECLADO AO USAR SCROLL DA TABLE - SEARCHBAR
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    
}

