//
//  SettingsViewController.swift
//  Prework
//
//  Created by Sakib Ahmed on 1/21/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipOneTextField: UITextField!
    @IBOutlet weak var tipTwoTextField: UITextField!
    @IBOutlet weak var tipThreeTextField: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        defaults.synchronize()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        tipOneTextField.text = defaults.string(forKey: "tipOne")
        tipTwoTextField.text = defaults.string(forKey: "tipTwo")
        tipThreeTextField.text = defaults.string(forKey: "tipThree")
    }
    @IBAction func setTipOne(_ sender: Any) {
        let tipOne = String(tipOneTextField.text!)
        let setTipOne = Double(tipOne.dropLast())
        defaults.set(setTipOne, forKey: "tipOneNum")
        defaults.set(tipOne, forKey: "tipOne")
    }
    @IBAction func setTipTwo(_ sender: Any) {
        let tipTwo = String(tipTwoTextField.text!)
        let setTipTwo = Double(tipTwo.dropLast())
        defaults.set(setTipTwo, forKey: "tipTwoNum")
        defaults.set(tipTwo, forKey: "tipTwo")
    }
    @IBAction func setTipThree(_ sender: Any) {
        let tipThree = String(tipThreeTextField.text!)
        let setTipThree = Double(tipThree.dropLast())
        defaults.set(setTipThree, forKey: "tipThreeNum")
        defaults.set(tipThree, forKey: "tipThree")
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
