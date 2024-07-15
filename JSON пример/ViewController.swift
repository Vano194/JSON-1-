//
//  ViewController.swift
//  JSON пример 1 
//
//  Created by Иван Галиченко on 11.07.2024.
// видос старый и сслыка выдает 404 но это ладно а вот почему не могу в info после App Transport Security написать allow arbitary loads и на что его заменить вопрос да ив ообще так делали во времена swift 4 не забыть спросить насколько мнеоно надо может метод уже устарел

import UIKit

struct ThreeCitiesWeather: Decodable {
    var minsk: String?
    var riga: String?
    var madrid: String?
}

struct City: Decodable {
    var temperature: String
    var weather: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
      let urlString = "http://swiftbook.ru/json/JSONddata_swift4.json"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            guard error == nil else  { return }
            
            do {
                let threeCitiesWeather = try JSONDecoder().decode(ThreeCitiesWeather.self, from: data)
                print(threeCitiesWeather)
                
                
            } catch let error {
                print(error)
            }
            
        } .resume()
        
    }

}

