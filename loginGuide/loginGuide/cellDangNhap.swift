//
//  cellDangNhap.swift
//  loginGuide
//
//  Created by MacOS on 15/04/2018.
//  Copyright © 2018 MacOS. All rights reserved.
//

import UIKit
class cellDangNhap: UICollectionViewCell {
    let HinhDaiDien: UIImageView =
    {
        let img =  UIImageView()
        img.image = UIImage(named: "logo")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
    return img
    }()
    let label:UILabel =
    {
    let lbl1 = UILabel()
        lbl1.text = "Tên đăng nhập"
        lbl1.font = UIFont.systemFont(ofSize: 16)
        lbl1.textColor = UIColor.black
    return lbl1
    }()
    let ôNhậpTênĐăngNhập: cantextField =
        {
            let text = cantextField()
            text.placeholder = "Enter Email"
            text.layer.borderWidth = 0.5
            text.layer.cornerRadius = 6
            text.layer.borderColor = UIColor.lightGray.cgColor
            text.keyboardType = .emailAddress
            text.translatesAutoresizingMaskIntoConstraints  = false
            return text 
        }()
    class cantextField : UITextField  {
        override func textRect(forBounds bounds: CGRect) -> CGRect {
            return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
        }
        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
        }
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1)
        backgroundColor = UIColor(white: 1, alpha: 1)
        setupLayOut()
    }
    func setupLayOut()
    {
        addSubview(HinhDaiDien)
        addSubview(ôNhậpTênĐăngNhập)
        
        ôNhậpTênĐăngNhập.topAnchor.constraint(equalTo: HinhDaiDien.bottomAnchor, constant: 40).isActive = true
        ôNhậpTênĐăngNhập.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        ôNhậpTênĐăngNhập.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        ôNhậpTênĐăngNhập.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        HinhDaiDien.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        HinhDaiDien.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height / 10) .isActive = true
    
    
    
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
