//
//  ViewController.swift
//  TestSVG
//
//  Created by Eldar Pikunov on 11.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.attributedText = makeHtmlAttributedString(from: makeHtmlString())
    }
    
}

extension ViewController {
    func makeHtmlAttributedString() -> NSAttributedString? {
        makeHtmlAttributedString(from: makeHtmlString())
    }
}

extension ViewController {
    private func makeHtmlString() -> String {
        let svgText = """
        <svg version="1.1" xmlns="https://urldefense.com/v3/__http://www.w3.org/2000/svg__;!!GF_29dbcQIUBPA!kAAOyQVnQylethoFAu1GdTba_Qq3ZTQji_olI3gGknFjUH5NAwOKtTLE23q9kwuTa5E$ [w3[.]org]" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 800 300" style="background-color:lightgrey;">
        
            <!-- Pattern -->
        <text text-anchor="middle" x="70%" y="50%" dy=".35em" class="text">
               Replay Ads
           </text>
           <rect fill="#D52B1E" height="320" width="320"/>
        <rect fill="#fff" height="60" width="200" x="60" y="130"/>
        <rect fill="#fff" height="200" width="60" x="130" y="60"/>


        </svg>
        """
        
        let style = """
                    <style>
                    .text {
                      font: 200 6.5em/1  'Open Sans', Impact; text-transform: uppercase;
                      stroke-width: 6;
                      fill:#f8f8ff;
                      stroke-linejoin: round;
                      stroke-dasharray: 70 330;
                      stroke-dashoffset: 0;
                      animation: stroke 6s infinite linear; }
            
                      .text:nth-child(5n + 1) {
                        stroke: #F2385A;
                        animation-delay: -1.2s; }
                      .text:nth-child(5n + 2) {
                        stroke: #D52B1E;
                        animation-delay: -2.4s; }
                      .text:nth-child(5n + 3) {
                        stroke: #E9F1DF;
                        animation-delay: -3.6s; }
                      .text:nth-child(5n + 4) {
                        stroke: #56D9CD;
                        animation-delay: -4.8s; }
                      .text:nth-child(5n + 5) {
                        stroke: #3aa1bf;
                        animation-delay: -6s; }
                    @keyframes stroke {
                      100% {
                        stroke-dashoffset: -400; } }
            
                        </style>
            """
        let html = """
            <html>
                <head>
                \(style)
                </head>
                <body>
                \(svgText)
                </body>
            </html>
        """
        
        return html
    }
    
    private func makeHtmlAttributedString(from htmlString: String) -> NSAttributedString? {
        guard let data = htmlString.data(using: String.Encoding.unicode) else {
            return nil
        }
        return try? NSAttributedString(
            data: data,
            options: [.documentType : NSAttributedString.DocumentType.html],
            documentAttributes: nil
        )
    }
}

