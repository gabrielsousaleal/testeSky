//
//  FilmesViewController.swift
//  testeSky
//
//  Created by Gabriel Sousa on 18/11/19.
//  Copyright © 2019 Gabriel Sousa. All rights reserved.
//

import Foundation
import UIKit

class FilmesViewController: UIViewController {
    
    //*************************************************************
    //MARK: STORYBOARD OUTLETS
    //*************************************************************
    
   @IBOutlet var FilmesCollectionView: UICollectionView!
    
    
    //*************************************************************
    //MARK: VARIAVEIS
    //*************************************************************
    
    var listaFilmes: [FilmeObjeto] = []

    
    //*************************************************************
    //MARK: FUNCOES DA VIEW
    //*************************************************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setarDelegates()
        
        configurarTela()
        
        DAOFilme().baixarFilmesJSON { filmes in
            
            DispatchQueue.main.async {
            
            self.listaFilmes = filmes
            
            self.FilmesCollectionView.reloadData()
                
            }
            
        }
        
    }
    
    
    //*************************************************************
    //MARK: LAYOUT
    //*************************************************************
    
    func configurarTela(){
        
        navigationController?.navigationBar.isHidden = true
        
        setarLayoutCells()
        
    }
    
    func setarLayoutCells(){
        
        let screen = UIScreen.main.bounds
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 16, bottom: 10, right: 16)
        layout.itemSize = CGSize(width: screen.width/2.30, height: 276)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 40
        
        FilmesCollectionView.collectionViewLayout = layout
        
    }
    
    //*************************************************************
    //MARK: DELEGATES
    //*************************************************************
    
    func setarDelegates(){
        
        FilmesCollectionView.delegate = self
        FilmesCollectionView.dataSource = self
        
    }
    
}


//*************************************************************
//MARK: COLLECTION VIEW DELEGATE
//*************************************************************

extension FilmesViewController: UICollectionViewDelegate {
    
    
}

//*************************************************************
//MARK: COLLECTION VIEW DATASOURSE
//*************************************************************


extension FilmesViewController: UICollectionViewDataSource {
    
    //MARK: NUMBER OF ITENS
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaFilmes.count
    }
    
    //MARK: CELL FOR ITEM
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmeCell", for: indexPath) as! FilmeCell
        
        let row = indexPath.row
        
        let filme = listaFilmes[row]
        
        cell.configurarCell(filme: filme)
        
        return cell
        
    }
    
    //MARK: DID SELECT ITEM
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let filme = listaFilmes[indexPath.row]
        
        //INSTANCIAR VIEW CONTROLLER DETALHES
        let storyboard = UIStoryboard(name: "DetalhesStoryboard", bundle: nil)
        
        let detalhesVC = storyboard.instantiateViewController(identifier: "DetalhesViewController") as? DetalhesViewController
        
        detalhesVC?.filme = filme
        
        navigationController?.pushViewController(detalhesVC!, animated: true)
        
        
    }
    
}

extension FilmesViewController {
 override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
}
}
