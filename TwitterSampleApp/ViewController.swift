//
//  ViewController.swift
//  TwitterSampleApp
//
//  Created by 坂本　大貴 on 2022/12/07.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBAction func addButton(_ sender: UIButton) {
        transitionToEditorView()
    }
    
    var recordList: [TweetRecord] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        navigationItem.title = "ホーム"
        configureButton()
       
        }
    
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTweetData()
        tableView.reloadData()
    }
    // TweetRecordにツイートのデータを格納するメソッド
    func setTweetData() {
        let realm = try! Realm()
        let result = realm.objects(TweetRecord.self)
        recordList = Array(result)
    }
    
    // ボタンを丸くするメソッド
    private func configureButton() {
        addButton.layer.cornerRadius = addButton.bounds.width / 2
    }
    
    // ＋ボタンがタップされた際のメソッド
    private func transitionToEditorView() {
        let storyboard = UIStoryboard(name: "EditorViewController", bundle: nil)
        guard let editorViewController = storyboard.instantiateInitialViewController() as? EditorViewController else { return }
        present(editorViewController, animated: true)
    }

}

extension ViewController: UITableViewDataSource {
            
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! MainTableViewCell
        let tweetRecord: TweetRecord = recordList[indexPath.row]
        cell.userName.text = tweetRecord.userName
        cell.tweetText.text = tweetRecord.tweetText
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "main", bundle: nil)
        let editorViewController = storyboard.instantiateViewController(identifier: "EditorViewController") as! EditorViewController
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(editorViewController, animated: true)
        let tweetData = recordList[indexPath.row]
        editorViewController.configure(tweet: tweetData)
    }
}
