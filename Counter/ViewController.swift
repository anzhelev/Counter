//
//  ViewController.swift
//  Counter
//
//  Created by Andrey Zhelev on 16.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    // объекты на экране
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var plusCountButton: UIButton!
    @IBOutlet weak var minusCountButton: UIButton!
    @IBOutlet weak var resetCountButton: UIButton!
    @IBOutlet weak var logTextView: UITextView!
    
    // переменные
    private var count: Int = 0 // счетчик
    private var newRecord: String = ""// новая запись в логе
    
    // обработка нажатия кнопки plusCountButton (увеличиваем счет)
    @IBAction func plusButtonIsPressed(_ sender: Any) {
        count += 1
        newRecord = "\n\(dateToString())  Значение изменено на +1"
        screenUpdate()
    }
    
    // обработка нажатия кнопки minusButtonIsPressed (уменьшаем счет)
    @IBAction func minusButtonIsPressed(_ sender: Any) {
        if count == 0 {
            newRecord = "\n\(dateToString())  Попытка уменьшить значение счетчика ниже 0"
        } else {
            count -= 1
            newRecord = "\n\(dateToString())  Значение изменено на -1"
        }
        screenUpdate()
    }
    
    // обработка нажатия кнопки resetCountButton (сбрасываем счетчик)
    @IBAction func resetCountButton(_ sender: Any) {
        count = 0
        newRecord = "\n\(dateToString())  Значение сброшено"
        screenUpdate()
    }
    
    // функция обновления отображаемых значений
    private func screenUpdate() {
        countLabel.text = String(count)
        logTextView.insertText(newRecord)
        logTextView.scrollRangeToVisible(NSMakeRange(0,Int.max))
    }
    
    //  функция форматирования текущей даты в строку
    private func dateToString() -> String {
        let df = DateFormatter()
        df.dateFormat = "yyyy.MM.dd HH:mm:ss"
        return df.string(from: Date())
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
}

