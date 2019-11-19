//
//  DAOFilme.swift
//  testeSky
//
//  Created by Gabriel Sousa on 18/11/19.
//  Copyright © 2019 Gabriel Sousa. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class DAOFilme {
    
    
    func baixarFilmesJSON( completion: @escaping([FilmeObjeto]) -> () ) {
           
           var listaFilmesObj: [FilmeObjeto] = []
                  
           let url = "https://sky-exercise.herokuapp.com/api/Movies"
                  
           let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                                    cachePolicy: .useProtocolCachePolicy,
                                                      timeoutInterval: 10.0)
           request.httpMethod = "GET"

           let session = URLSession.shared
           
           let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                   
               if let erro = error {
                       print(erro.localizedDescription)
                       completion([])
                   }
                   
               if let data = data {
                   do {
                    
                    let json = try JSONDecoder().decode([Filme].self, from: data)
                                                            
                    let semaforo = DispatchSemaphore(value: 1)

                    for filme in json {
                        
                        _ = FilmeObjeto(filmeDecodable: filme, completion: { result in
                            
                            listaFilmesObj.append(result)
                        
                            if listaFilmesObj.count == json.count {
                                semaforo.signal()
                                completion(listaFilmesObj)
                            }
                            
                        })
                     }

                    //USO DE SEMAFORO PARA ESPERAR QUE O FOR SEJA TOTALMENTE EXECUTADO
                    semaforo.wait()
                       }
                        catch {
                          
                           print(error)
                           
                           completion([])
                       }
                
                   }
                   
                    
                  })

                  dataTask.resume()
    
       }
    
    func baixarPoster( url: String, completion: @escaping (UIImage) -> () ) {
               
               Alamofire.request(url).responseImage { (response) in
                   
                   if let result = response.result.value {
                    
                       completion(result)
                       
                   } else {
                       completion(UIImage())
                   }
               }
        
    }
    
    func baixarBackDrops( urls: [String], completion: @escaping ([UIImage]) -> () ) {
        
        var backDrops: [UIImage] = []
        
        let semaforo = DispatchSemaphore(value: 2)

        for url in urls {
                        
            Alamofire.request(url).responseImage { (response) in
                              
                if let result = response.result.value {
                    backDrops.append(result)
                }
                
                if backDrops.count == urls.count {
                    
                    semaforo.signal()
                    completion(backDrops)
                    
                }
                         
            }
            
        }
        
        semaforo.wait()
        
    }
    
    
}
