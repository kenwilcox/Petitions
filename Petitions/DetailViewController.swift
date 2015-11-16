//
//  DetailViewController.swift
//  Petitions
//
//  Created by Kenneth Wilcox on 11/11/15.
//  Copyright © 2015 Kenneth Wilcox. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
  var webView: WKWebView!
  var detailItem: [String: String]!
  
  @IBOutlet weak var doneButton: UIBarButtonItem!
  
  override func loadView() {
    webView = WKWebView()
    view = webView
    
    if UIDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad {
      self.doneButton.enabled = false
      self.doneButton.tintColor = UIColor.clearColor()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard detailItem != nil else { return }
    
    if let body = detailItem["body"] {
      var html = "<html>"
      html += "<head>"
      html += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
      html += "<style> body { font-size: 150%; } </style>"
      html += "</head>"
      html += "<body>"
      html += body
      html += "</body>"
      html += "</html>"
      webView.loadHTMLString(html, baseURL: nil)
    }
  }
  
  @IBAction func doneButtonPressed(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
  }
}