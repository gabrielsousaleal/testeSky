//
//  Filme.swift
//  testeSky
//
//  Created by Gabriel Sousa on 18/11/19.
//  Copyright © 2019 Gabriel Sousa. All rights reserved.
//

import Foundation
import UIKit

//**********************************************************
//MARK: DECODABLE
//**********************************************************

struct Filme: Decodable {
    
    let title: String
    let overview: String
    let duration: String
    let release_year: String
    let cover_url: String
    let backdrops_url: [String]
    let id: String
    
}

struct ListaFilmes: Decodable {
    
    let filmes: [Filme]
    
}




//**********************************************************
//MARK: OBJETO
//**********************************************************

class FilmeObjeto {
    
    let filmeDecodable: Filme?
    
    var poster: UIImage?
        
    init(filmeDecodable: Filme, completion: @escaping (FilmeObjeto) -> () ) {
        
        self.filmeDecodable = filmeDecodable
        
        DAOFilme().baixarPoster(url: filmeDecodable.cover_url, completion: { imagem in
            
            self.poster = imagem
                
            completion(self)
 
        })
        
    }
    
    
    
    //**********************************************************
    //MARK: FUNCOES DO OBJETO
    //**********************************************************

    func getBackDrops( completion: @escaping ([UIImage]) -> () ) {
        
        DAOFilme().baixarBackDrops(urls: filmeDecodable?.backdrops_url ?? []) { backdrops in
            
            print(backdrops)
            
            completion(backdrops)
            
        }
        
    }
    
    
    
}



