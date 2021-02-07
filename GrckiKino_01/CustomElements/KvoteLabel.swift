//
//  KvoteLabel.swift
//  GrckiKino_01
//
//  Created by Damnjan Markovic on 7.2.21..
//


import UIKit

public class KvoteLabel : UILabel {
    
    var textInLabel: String
    
    init?(textInLabel: String){
        self.textInLabel = textInLabel
        let frame = CGRect()
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    required init?(coder aDecoder: NSCoder, textInLabel: String) {
//        super.init(coder: aDecoder)
//         self.textInLabel = textInLabel
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    class B: A {
//        var y: Int
//        init(x: Int, y: Int) {
//            self.y = y
//            super.init(x: x)
//        }
//    }
    
    
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setuUpStyle()
//
//    }
//
//
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setuUpStyle()
//
//    }

    
//    required init?(textInLabel: String) {
//        super.init(textInLabel: textInLabel)
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setuUpStyle()
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setuUpStyle()
//
//    }
    
    
//    init?(textInLabel: String, coder: NSCoder) {
//        super.init(coder: coder, textInLabel: textInLabel)
//        self.textInLabel = textInLabel
//       setuUpStyle()
//
//   }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setuUpStyle()
//
//    }
    
    
    
    fileprivate func setuUpStyle() {
        text = "Tekst"
        backgroundColor = .red
        textAlignment = .center
        font = Constants.fontKvote
        adjustsFontSizeToFitWidth = true
        textColor = .white
        numberOfLines = 0

    }
    
    
    
    
}

