import UIKit

class AddTodoItemViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0
        {
            color = colors[0]
            return "White"
        }
        
        if row == 1
        {
            color = colors[1]
            return "Yellow"
        }
        
        if row == 2
        {
            color = colors[2]
            return "Green"
        }
        
        if row == 3
        {
            color = colors[3]
            return "Blue"
        }
        
        color = colors[4]
        return "Red"
    }
    
        /*
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> UIColor? {
     
            print(color.)
        
            return colors[row]
        }
        */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ColorsViewPicker.delegate = self
        ColorsViewPicker.dataSource = self
        
        //textField.text = todoItem?.itemName ?? ""
    }
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBOutlet weak var textField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sender = sender as? UIBarButtonItem, sender == doneButton {
            if let text = textField.text, text.count > 0 {
                todoItem = ToDoItem(itemName: text, color:color ?? UIColor.white)
            } }
    }
    
    var todoItem:ToDoItem?
    
    var color:UIColor?
    
    @IBOutlet weak var ColorsViewPicker: UIPickerView!
    
    let colors = [UIColor.white, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.red]
}
