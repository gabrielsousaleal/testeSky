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
    //MARK: FUNCOES DA VIEW
    //*************************************************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurarTela()
        
        DAOFilme().baixarFilmesJSON { filmes in
            
            
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
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
        
        return UICollectionViewCell()
        
    }
    
    
    
}
