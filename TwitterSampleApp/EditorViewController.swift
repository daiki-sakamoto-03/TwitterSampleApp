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
    
    var tweetData = TweetRecord()

    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweetButton(_ sender: UIButton) {
        
        // TextFieldに入力された値をTweetRecordに代入する
        tweetData.userName = inputUserNameTextField.text!
        tweetData.tweetText = inputTweetTextField.text!
        saveRecord()
    }
    
    
    func displayData() {
        inputUserNameTextField.text = tweetData.userName
        inputTweetTextField.text = tweetData.tweetText
    }
    
    // EditorViewControllerにツイートデータを渡すメソッド
    func configure(tweet: TweetRecord) {
        tweetData.userName = tweet.userName
        tweetData.tweetText = tweet.tweetText
    }
    
    var delegate: EditorViewControllerDelegate?
    
    @IBOutlet weak var inputUserNameTextField: UITextField!
    @IBOutlet weak var inputTweetTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
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
                tweetData.userName = user
            }
            if let tweetText = inputTweetTextField.text {
                tweetData.tweetText = tweetText
            }
            realm.add(tweetData)
        }
        delegate?.recordUpdate()
        dismiss(animated: true)
        print("userName: \(tweetData.userName), tweetText: \(tweetData.tweetText)")
    }
            
}


