import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var txtInfo: UITextView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var langPicker: UIPickerView!
    
        var languageList: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        languageList = ["English", "French", "German","Hindi"]
        //by default
        changeLanguage(lang: "en")
    }
    func numberOfComponents( in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)  -> Int {
        return languageList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languageList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if languageList[row] == "French" {
            changeLanguage(lang: "fr")
        } else if languageList[row] == "German" {
            changeLanguage(lang: "de")
        } else if languageList[row] == "English" {
            changeLanguage(lang: "en")
        } else {
            changeLanguage(lang: "hi")
        }
    }
    func changeLanguage(lang: String) {
        lblTitle.text = "title".localizeString(string: lang)
        txtInfo.text = "info".localizeString(string: lang)
    }
}
extension String {
    func localizeString(string: String) -> String {
        let path = Bundle.main.path(forResource: string, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
