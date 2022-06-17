//
//  PreviewViewController.swift
//  MovieKSY
//
//  Created by 소프트웨어컴퓨터 on 2022/06/07.
//

import UIKit
import WebKit

class PreviewViewController: UIViewController {

    var movieName = ""
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = movieName
        let urlKorString =
        "https://www.youtube.com/results?search_query=" + movieName + " + 예고편"
        
        let urlString = urlKorString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        guard let url = URL(string:urlString) else { return }
        let request = URLRequest(url:url)
        webView.load(request)        // Do any additional setup after loading the view.
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
