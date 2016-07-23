

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var hidari: UITextField!
    @IBOutlet weak var migi: UITextField!
    @IBOutlet weak var fourArithmetic: UIPickerView!
    @IBOutlet weak var result: UILabel!
    
    var option = ["+","-","×","÷"]
    
    @IBAction func calculate(sender: AnyObject) {
        
        let GetHidariNum : Int = Int(hidari.text!)!
        let GetMigiNum: Int = Int(migi.text!)!
        
        //1列目の選択されている値のインデックス番号を取得する
        switch fourArithmetic.selectedRowInComponent(0) {
        case 0:
            result.text = String(GetHidariNum + GetMigiNum)
        case 1:
            result.text = String(GetHidariNum - GetMigiNum)
        case 2:
            result.text = String(GetHidariNum * GetMigiNum)
        case 3:
            result.text = String(GetHidariNum / GetMigiNum)
        default:
            break
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //PickerViewの初期値
        //fourArithmetic.selectRow(1, inComponent: 0, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /* PickerView関数 */
    //pickerに表示する列数を返す
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1  //1列表示
        
    }

    //pickerに表示する行数を返す
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return option.count;  // 選択肢の数
    }
    
    
    //PickerViewへの文字列の表示
    func PickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        return option[row]  //文字の表示
    }
    
    
    
}