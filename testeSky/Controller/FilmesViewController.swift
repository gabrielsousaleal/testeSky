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
    
    func setarDelegates(){
        
        FilmesCollectionView.delegate = self
        FilmesCollectionView.dataSource = self
        
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
        layout.sectionInset = UIEdgeInsets(top: 20, left: 8, bottom: 10, right: 8)
        layout.itemSize = CGSize(width: screen.width/2.30, height: screen.height/2.5)
        layout.minimumInteritemSpacing = 30
        layout.minimumLineSpacing = 40
        
        FilmesCollectionView.collectionViewLayout = layout
        
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaFilmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmeCell", for: indexPath) as! FilmeCell
        
        let row = indexPath.row
        
        let filme = listaFilmes[row]
        
        cell.configurarCell(filme: filme)
        
        return cell
        
    }
    
    
    
}
