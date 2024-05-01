//
//  ViewController.swift
//  Counter
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var placeTextView: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        placeTextView.text = "История изменений:"
        placeTextView.isEditable = false
        updateCounter()
        
    }
    var counter = 0
    
    @IBAction func plus(_ sender: Any) {
        counter += 1
        updateCounter()
        placeTextView.text += "\n[\(date())]: Значение изменено на +1"
        let range = NSMakeRange(placeTextView.text.count - 1, 0)
        placeTextView.scrollRangeToVisible(range)
    }
    @IBAction func minus(_ sender: Any) {
        if counter > 0{
            counter -= 1
            placeTextView.text += "\n[\(date())]: Значение изменено на -1"
        }else{
            placeTextView.text += "\n[\(date())]: Попытка уменьшить значение счетчика ниже 0"
        }
        let range = NSMakeRange(placeTextView.text.count - 1, 0)
        placeTextView.scrollRangeToVisible(range)
        updateCounter()
    }
    
    @IBAction func reset(_ sender: Any) {
        counter = 0
        placeTextView.text += "\n[\(date())]: Значение сброшено"
        let range = NSMakeRange(placeTextView.text.count - 1, 0)
        placeTextView.scrollRangeToVisible(range)
        updateCounter()
    }
    
    func updateCounter(){
        counterLabel.text = "Значение счетчика: \(counter)"
    }
    
    func date() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter.string(from: Date())
    }
}

