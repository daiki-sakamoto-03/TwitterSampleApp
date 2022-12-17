//
//  EditorViewController.swift
//  TwitterSampleApp
//
//  Created by 坂本　大貴 on 2022/12/10.
//

import UIKit
import RealmSwift

protocol EditorViewControllerDelegate {
    func recordUpdate()
}

class EditorViewController: UIViewController {
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweetButton(_ sender: UIButton) {
        saveRecord()
    }
    
    var record = TweetRecord(userName: <#String#>, tweetText: <#String#>)
    var delegate: EditorViewControllerDelegate?
    
    @IBOutlet weak var inputUserNameTextField: UITextField!
    @IBOutlet weak var inputTweetTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUserNameTextField()
        configureTweetTextField()
        let realm = try! Realm()

    }
        
    @objc func didTapDone() {
        view.endEditing(true)
    }
    
    // ユーザー名入力時のキーボードに、閉じるボタンを実装するメソッド
    func configureUserNameTextField() {
        let toolBarRect = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35)
        let toolBar = UIToolbar(frame: toolBarRect)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
        toolBar.setItems([doneItem], animated: true)
        inputUserNameTextField.inputAccessoryView = toolBar
    }
    // ツイート入力時のキーボードに、閉じるボタンを実装するメソッド
    func configureTweetTextField() {
        let toolBarRect = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35)
        let toolBar = UIToolbar(frame: toolBarRect)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
        toolBar.setItems([doneItem], animated: true)
        inputTweetTextField.inputAccessoryView = toolBar
    }
    
    // Realmを使用して、ユーザー名・ツイート内容を保存するメソッド
    func saveRecord() {
        let realm = try! Realm()
        try! realm.write {
            if let user = inputUserNameTextField.text {
                record.userName = user
            }
            if let tweetText = inputTweetTextField.text {
                record.tweetText = tweetText
            }
            realm.add(record)
        }
        delegate?.recordUpdate()
        dismiss(animated: true)
    }
            
}


