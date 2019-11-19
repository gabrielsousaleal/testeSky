//
//  DetalhesViewController.swift
//  testeSky
//
//  Created by Gabriel Sousa on 19/11/19.
//  Copyright © 2019 Gabriel Sousa. All rights reserved.
//

import Foundation
import Auk
import UIKit

class DetalhesViewController: UIViewController {
    
    //*************************************************************
    //MARK: STORYBOARD OUTLETS
    //*************************************************************
    
    @IBOutlet var imagensScrollView: UIScrollView!
    
    @IBOutlet var tituloLabel: UILabel!
    
    @IBOutlet var sinopseLabel: UILabel!
    
    @IBOutlet var duracaoLabel: UILabel!
    
    @IBOutlet var anoLabel: UILabel!
    
    //*************************************************************
    //MARK: VARIAVEIS
    //*************************************************************
    
    var filme: FilmeObjeto?
    
    var listaImagens: [UIImage] = []
    
    
    //*************************************************************
    //MARK: FUNCOES DA VIEW
    //*************************************************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurarTela()
        
    }
    
    
    //*************************************************************
    //MARK: STORYBOARD ACTIONS
    //*************************************************************
    
    
    @IBAction func voltar(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    //*************************************************************
    //MARK: LAYOUT
    //*************************************************************
    
    func configurarTela(){
        
        navigationController?.navigationBar.isHidden = true
        
        setarLabels()
        
        baixarImagensFilme()
        
    }
    
    func setarLabels() {
        
        tituloLabel.text = filme?.filmeDecodable?.title ?? "???"
        
        sinopseLabel.text = filme?.filmeDecodable?.overview ?? "????"
        
        duracaoLabel.text = filme?.filmeDecodable?.duration ?? "??"
        
        anoLabel.text = filme?.filmeDecodable?.release_year ?? "??"
        
    }
    
    func configurarCarrossel() {
        
        for imagem in listaImagens {
        
                imagensScrollView.auk.settings.contentMode = .scaleAspectFill
                imagensScrollView.auk.show(image: imagem)
                imagensScrollView.contentInsetAdjustmentBehavior = .never
                
            }
        
    }
    
    
    //*************************************************************
    //MARK: ETC
    //*************************************************************
    
    func baixarImagensFilme() {
        
        DAOFilme().baixarBackDrops( urls: filme?.filmeDecodable?.backdrops_url ?? [] ) { imagens in
            
            DispatchQueue.main.async {
                
                self.listaImagens = imagens
            
                self.configurarCarrossel()
                
            }
        
        }
        
    }
    
}




extension DetalhesViewController {
 override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
}
}
