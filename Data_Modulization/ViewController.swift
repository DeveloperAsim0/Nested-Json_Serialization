//
//  ViewController.swift
//  Data_Modulization
//
//  Created by Tarun Meena on 11/03/20.
//  Copyright © 2020 Mihir Vyas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

struct origin {
    var name: String
    var url: String
}

class ViewController: UIViewController { 

    @IBOutlet weak var tableview: UITableView!
    
    var charName = [String]()
    var status   = [String]()
    var spicies  = [String]()
    var type     = [String]()
    var myself = [origin]()
    var newname = [String]()
    var newURL = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
         get_Data()
//        tableView.estimatedRowHeight = 68.0
//        tableView.rowHeight = UITableViewAutomaticDimension
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func get_Data() {
        let url = "https://api.myjson.com/bins/cqdzi"
        request(url).responseJSON { (myResponse) in
            switch myResponse.result {
            case .success:
                print(myResponse.result)
                let myresult = try? JSON(data: myResponse.data!)
                print(myresult!["results"])
                let resultArray = myresult!["results"]
                self.charName.removeAll()
                self.status.removeAll()
                self.type.removeAll()
                self.spicies.removeAll()
                for i in resultArray.arrayValue{
                    let nameID = i["name"].stringValue
                    self.charName.append(nameID)
                    let urlID = i["status"].stringValue
                    self.status.append(urlID)
                    let typeID = i["type"].stringValue
                    self.type.append(typeID)
                    let spiciesID = i["species"].stringValue
                    self.spicies.append(spiciesID)
                    let id = i["origin"]
                    print("id:- \(id)")
                    print("idurl:- \(id["url"])")
                    let newjob = origin(name: "\(id["name"])", url: "\(id["url"])")
                    print("newJob:- \(newjob)")
                    self.newname.append(newjob.name)
                    self.newURL.append(newjob.url)
                    print("newurl:- \(self.newURL)")
                }
                self.tableview.reloadData()
                break
                
            case .failure:
                print(Error.self)
               break
            }
        }
    }

}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell") as! CollectionViewCell
        cell.user_name_Details.text    = charName[indexPath.row]
        cell.user_status_Details.text  = status[indexPath.row]
        cell.user_type_Details.text    = type[indexPath.row]
        cell.user_spicies_Details.text = newURL[indexPath.row]
        
        return cell
    }
    
}


