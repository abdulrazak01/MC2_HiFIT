//
//  Result.swift
//  HiFit
//
//  Created by Rian Rusmaldi on 30/05/20.
//  Copyright © 2020 AbdulRazak. All rights reserved.
//

import UIKit

class Result: UIViewController {

    let allExercise = ArrayWork()
 
 
    @IBOutlet weak var tblView: UITableView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        
        tblView.delegate = self
       tblView.dataSource = self
        
     /*   guard let vc = storyboard?.instantiateViewController(identifier: "add") as? ViewController else {
                   return
               }
        
        vc.completion = { WorkText, typeText in
              DispatchQueue.main.async {
                  let new = ResultExercises(WorkText: WorkText, typeText: typeText)
                  self.models.append(new)
                  self.tblView.reloadData()
        }
       
    } */
        
    }

    
    
    @IBAction func shareButton(_ sender: Any) {
        let activityVC = UIActivityViewController (activityItems: ["www.google.com"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
    
    
}

extension Result:UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
extension Result:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }

      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allExercise.list.count
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! makeTableViewCell
        if allExercise.list[indexPath.row].typeExercise == "Warm Up"{
        
        cell.lblW?.text = allExercise.list[indexPath.row].exercise
        cell.lblT.text = allExercise.list[indexPath.row].typeExercise
       
        
        return cell
        }
        return UITableViewCell()
      }
    
}

class makeTableViewCell: UITableViewCell{
 
    @IBOutlet weak var lblW: UILabel!
     @IBOutlet weak var lblT: UILabel!
    
    
}












