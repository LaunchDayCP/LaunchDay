//
//  HomeViewController.swift
//  Ready4Launch
//
//  Created by Eric Suarez on 3/22/17.
//  Copyright © 2017 Eric Suarez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://igdbcom-internet-game-database-v1.p.mashape.com/games/?fields=*&filter[release_dates.platform][eq]=49&filter[aggregated_rating][gte]=90&filter[category][eq]=0")
        let req = NSMutableURLRequest(url: url!)
        req.setValue("eQFAu1b80Wmsh7vUdcXPwp4fd9ihp17b5x1jsnmcWru6Lgp3cY", forHTTPHeaderField: "X-Mashape-Key")
        
        URLSession.shared.dataTask(with: req as URLRequest) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            print(json)
        }.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
