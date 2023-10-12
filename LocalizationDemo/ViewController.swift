//
//  ViewController.swift
//  LocalizationDemo
//
//  Created by Neosoft on 12/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDegree: UILabel!
    @IBOutlet weak var lblDOB: UILabel!
    @IBOutlet weak var lblBloodGrp: UILabel!
    @IBOutlet weak var lblProfession: UILabel!
    @IBOutlet weak var lblContact: UILabel!
    
    let languages = ["English","Hindi","Japanese"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func showAlert(){
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Select Language", message: "Choose your preferred language", preferredStyle: .actionSheet)
            
            for (index,language) in self.languages.enumerated() {
                let action = UIAlertAction(title: language, style: .default) { action in
                    print("Selected language: \(language)")
                    self.changeLanguage(index: index)
                }
                alertController.addAction(action)
                
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            if let popoverController = alertController.popoverPresentationController {
                popoverController.sourceView = self.view
                popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            }
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    func changeLanguage(index: Int){
        switch index{
        case 0:
            lblContact.text = "Contact".localizableString(loc: "en")
            lblName.text = "Name".localizableString(loc: "en")
            lblProfession.text =  "Profession".localizableString(loc: "en")
            lblDOB.text = "DOB".localizableString(loc: "en")
            lblBloodGrp.text = "BloodGrp".localizableString(loc: "en")
            lblDegree.text = "Degree".localizableString(loc: "en")
        case 1:
            lblContact.text = "Contact".localizableString(loc: "hi")
            lblName.text = "Name".localizableString(loc: "hi")
            lblProfession.text =  "Profession".localizableString(loc: "hi")
            lblDOB.text = "DOB".localizableString(loc: "hi")
            lblBloodGrp.text = "BloodGrp".localizableString(loc: "hi")
            lblDegree.text = "Degree".localizableString(loc: "hi")
        case 2:
            lblContact.text = "Contact".localizableString(loc: "ja")
            lblName.text = "Name".localizableString(loc: "ja")
            lblProfession.text =  "Profession".localizableString(loc: "ja")
            lblDOB.text = "DOB".localizableString(loc: "ja")
            lblBloodGrp.text = "BloodGrp".localizableString(loc: "ja")
            lblDegree.text = "Degree".localizableString(loc: "ja")
        default:
            lblName.text = "Name".localizableString(loc: "en")
            lblProfession.text =  "Profession".localizableString(loc: "en")
            lblDOB.text = "DOB".localizableString(loc: "en")
            lblBloodGrp.text = "BloodGrp".localizableString(loc: "en")
            lblDegree.text = "Degree".localizableString(loc: "en")
        }
    }
    @IBAction func btnChooseLanguageTapped(_ sender: UIButton) {
        showAlert()
    }
    
}

extension String{
    func localizableString(loc: String) -> String{
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self,tableName: nil,bundle: bundle!,value:"", comment: "")
    }
}
