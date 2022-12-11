//
//  ViewController.swift
//  TwitterSampleApp
//
//  Created by 坂本　大貴 on 2022/12/07.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBAction func addButton(_ sender: UIButton) {
        transitionToEditorView()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        navigationItem.title = "ホーム"
        configureButton()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! MainTableViewCell
        cell.userName.text = "Daiki"
        cell.tweetText.text = "このテキストが改行するかのテストをしたいので、長文を入力してみます。このテキストが改行するかのテストをしたいので、長文を入力してみます。このテキストが改行するかのテストをしたいので、長文を入力してみます。このテキストが改行するかのテストをしたいので、長文を入力してみます。"
        return cell
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

