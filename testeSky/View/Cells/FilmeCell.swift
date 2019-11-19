//
//  FilmeCell.swift
//  testeSky
//
//  Created by Gabriel Sousa on 18/11/19.
//  Copyright © 2019 Gabriel Sousa. All rights reserved.
//

import Foundation
import UIKit

class FilmeCell: UICollectionViewCell {
    

    @IBOutlet var posterView: UIImageView!
    
    @IBOutlet var viewClassificacao: UIView!
    
    @IBOutlet var nomeLabel: UILabel!
    
    @IBOutlet var classificacaoLabel: UILabel!
    
    
    func configurarCell(filme: FilmeObjeto) {
        
        posterView.image = filme.poster
        
        nomeLabel.text = filme.filmeDecodable?.title ?? "?????"
        
        posterView.layer.cornerRadius = 6
        
    }
    
    
}
