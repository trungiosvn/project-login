//
//  cellCuaCollectionChinh.swift
//  loginGuide
//
//  Created by MacOS on 15/04/2018.
//  Copyright © 2018 MacOS. All rights reserved.
//

import UIKit
class cellCuaCollectionLon: UICollectionViewCell {
    
    var LaytextPage:structDuLieuTextView?
    {
    didSet {
        guard LaytextPage != nil else {
            return
        }
        var anhnenCuaCollectionview:String?
        //cài đặt ảnh khi xoay dọc hoặcg ngan màn hình
        if UIDevice.current.orientation.isLandscape
        {
            anhnenCuaCollectionview = LaytextPage?.anhnenNgang
        }
        else
        {
        anhnenCuaCollectionview = LaytextPage?.anhNen
        }
        //---------
        anhNenCollectionview.image = UIImage(named: anhnenCuaCollectionview!)
        let atributeString = NSMutableAttributedString(string: (LaytextPage!.tieude), attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18), NSAttributedStringKey.foregroundColor : UIColor(white: 0.2, alpha: 1) ])
        
        atributeString.append(NSAttributedString(string: "\n\(String(describing: LaytextPage!.noiDung))", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14),NSAttributedStringKey.foregroundColor: UIColor(white: 0.2, alpha: 1) ]))
        
        textView.attributedText = atributeString
        textView.textAlignment = .center
        
        }
    
    
    }
    
    
    
    
    let textView:UITextView = {
        let txtView = UITextView()
        txtView.text = "HÃY LÀM TẤT CẢ ĐI /n/n/n Hãy cho chúng tôi thấy được sự lợi hại của các hạ đi,khai triển chiêu thức đi nào"
        txtView.backgroundColor = UIColor.white
        txtView.textColor = UIColor.red
        txtView.textAlignment = .center
        txtView.isEditable = false
        txtView.isSelectable = false
        txtView.contentInset = UIEdgeInsets(top: 20, left: 15, bottom: 0, right: 15)
        txtView.translatesAutoresizingMaskIntoConstraints = false
        return txtView
    }()
    let anhNenCollectionview : UIImageView =
    {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "page1")
        img.contentMode = .scaleToFill
        return img
    }()
    let separatorView : UIView =
    {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = UIColor.green
        setUpLayout()
    }
    func setUpLayout()
    {
        
        addSubview(textView)
        addSubview(anhNenCollectionview)
        addSubview(separatorView)
        
        
        separatorView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0) .isActive = true
        separatorView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0) .isActive = true
        separatorView.bottomAnchor.constraint(equalTo: textView.topAnchor, constant: 0) .isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        textView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        textView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3) .isActive = true
        
        
        anhNenCollectionview.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        anhNenCollectionview.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        anhNenCollectionview.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        anhNenCollectionview.bottomAnchor.constraint(equalTo: textView.topAnchor).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
