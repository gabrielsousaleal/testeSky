//
//  testeSkyTests.swift
//  testeSkyTests
//
//  Created by Gabriel Sousa on 18/11/19.
//  Copyright © 2019 Gabriel Sousa. All rights reserved.
//

import XCTest
@testable import testeSky

class testeSkyTests: XCTestCase {

      
    var dao: DAOFilme!
      
    var filmesVC: FilmesViewController!
      

    override func setUp() {
        
        dao = DAOFilme()
        
        filmesVC = UIStoryboard(name: "FilmesStoryboard", bundle: nil).instantiateViewController(withIdentifier: "FilmesViewController") as? FilmesViewController
        
        filmesVC.preload()
            
    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //*******************************************************
    //MARK: TESTES DA API
    //*******************************************************
    
    func testarDAOBaixarFilmes(){
                        
        var listaFilmes: [FilmeObjeto] = []
        
        let exp = expectation(description: "Pegar lista filmes")

        dao.baixarFilmesJSON { filmes in
            
            listaFilmes = filmes
            
            exp.fulfill()
            
        }
            
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            print("Total de resultados -> ", listaFilmes.count)
            XCTAssertLessThan(0, listaFilmes.count)
        }
        
        
    }
    
    func testarDAObaixarPoster(){
        
        let url: String  = "https://image.tmdb.org/t/p/w1280/vAyQkuAozNiad5pjOW7yJlnxtxb.jpg"
        
        var poster: UIImage?
        
        let exp = expectation(description: "Baixar poster")
        
        dao.baixarPoster(url: url) { imagem in
            
            poster = imagem
            exp.fulfill()
            
        }
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            print("tamanho da imagem -> ", poster?.size ?? 0)
            XCTAssert(poster != nil, "Falha ao baixar poster")
        }
        
        
    }
    
    func testarDAObaixarBackdrops(){
        
        let backdropsURLS = ["https://image.tmdb.org/t/p/w533_and_h300_bestv2/xu9zaAevzQ5nnrsXN6JcahLnG4i.jpg","https://image.tmdb.org/t/p/w533_and_h300_bestv2/gq4Z1pfOWHn3FKFNutlDCySps9C.jpg"]
                
        var backdrops: [UIImage] = []
        
        let exp = expectation(description: "Baixar backdrops")
        
        dao.baixarBackDrops(urls: backdropsURLS) { imagens in
            
            backdrops = imagens
            
            exp.fulfill()
            
        }
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            print("quantidade de backdrops -> ", backdrops.count)
            XCTAssert(backdrops.count > 0, "Falha ao baixar backdrops")
        }
        
        
    }


}


extension UIViewController {
   
    func preload() {
        _ = self.view
    }
   
}
