//
//  ViewController.swift
//  loginGuide
//
//  Created by MacOS on 15/04/2018.
//  Copyright © 2018 MacOS. All rights reserved.
//

import UIKit

class ViewloginController:  UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // làm mới lại dữ liệu
        //collectionview.reloadData()
        coordinator.animate(alongsideTransition: { (_) in
            let index = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionview.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }) { (_) in
            
        }
    }
    
    let mangDuLieuTextView: [structDuLieuTextView] = {
        let trang1 = structDuLieuTextView(tieude: "thi triển võ công!", noiDung: "cho chúng tôi thấy được sự lợi hại của các hạ đi,khai triển chiêu thức đi nào", anhNen: "page1", anhnenNgang: "page2")
        let trang2 = structDuLieuTextView(tieude: "shâu mi nao!", noiDung: "Hay cho chúng tôi thấy được sự lợi hại của các hạ đi,khai triển chiêu thức đi nào", anhNen: "page4",anhnenNgang: "page3")
        let trang3 = structDuLieuTextView(tieude: "lẹt đu ít! , ơ", noiDung: "Hay cho chúng tôi thấy được sự lợi hại của các hạ đi,khai triển chiêu thức đi nào", anhNen: "page1",anhnenNgang: "page2")
        let trang4 = structDuLieuTextView(tieude: "hự hự chết mẹ tao rồi", noiDung: "Hay cho chúng tôi thấy được sự lợi hại của các hạ đi,khai triển chiêu thức đi nào", anhNen: "page4",anhnenNgang: "page3")
        return [trang1,trang2,trang3,trang4]
    }()
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mangDuLieuTextView.count + 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == mangDuLieuTextView.count
        {
        let login = collectionView.dequeueReusableCell(withReuseIdentifier: "celldn", for: indexPath)
            return login
        
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celid", for: indexPath) as! cellCuaCollectionLon
        cell.LaytextPage = mangDuLieuTextView[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func xuLyAn()
    {
        pageControlBottomAnchor?.constant = 40
        buttonbackBottomAnchor?.constant = 40
        buttonNextBottomAnchor?.constant = 40
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    func xuLyHien()
    {
        pageControlBottomAnchor?.constant = 0
        buttonbackBottomAnchor?.constant = -8
        buttonNextBottomAnchor?.constant = -8
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    
    
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        print(pageNumber)
        pageControl.currentPage = pageNumber
        if pageNumber == mangDuLieuTextView.count
        {
            pageControlBottomAnchor?.constant = 40
            buttonbackBottomAnchor?.constant = 40
            buttonNextBottomAnchor?.constant = 40
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        else{
            pageControlBottomAnchor?.constant = 0
            buttonbackBottomAnchor?.constant = -8
            buttonNextBottomAnchor?.constant = -8
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    var titleButtonBack: String?
    
    let buttonBack : UIButton = {
    let bt1 = UIButton()
        //bt1.backgroundColor = UIColor.blue
        bt1.translatesAutoresizingMaskIntoConstraints = false
        bt1.setTitle(  "Skip", for: UIControlState.normal)
        bt1.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        bt1.setTitleColor(UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1), for: .normal)
        //bt1.layer.borderWidth = 0.5
//        bt1.layer.borderCol
        //bt1.layer.cornerRadius = 6
        bt1.addTarget(self, action: #selector(XuliBt1), for: UIControlEvents.touchUpInside)
    return bt1
    }()
    let buttonNext : UIButton =
    {
        let bt2 = UIButton()
        bt2.setTitle("Next", for: UIControlState.normal)
        bt2.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        bt2.setTitleColor(UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1), for: .normal)
        bt2.addTarget(self, action: #selector(XulyNext), for: .touchUpInside)
        bt2.translatesAutoresizingMaskIntoConstraints = false
        return bt2
    }()
    @objc func XulyNext()
    {
        pageControl.currentPage  = pageControl.currentPage + 1
        let chiSoTiepTheo = min(pageControl.currentPage, mangDuLieuTextView.count + 1)
        let index = IndexPath(item: chiSoTiepTheo, section: 0)
        collectionview.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        if chiSoTiepTheo == mangDuLieuTextView.count
        {
            pageControlBottomAnchor?.constant = 40
            buttonbackBottomAnchor?.constant = 40
            buttonNextBottomAnchor?.constant = 40
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        else{
            pageControlBottomAnchor?.constant = 0
            buttonbackBottomAnchor?.constant = -8
            buttonNextBottomAnchor?.constant = -8
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    @objc func XuliBt1()
    {
        
        let index = IndexPath(item: mangDuLieuTextView.count , section: 0)
        collectionview.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        print("123")
        pageControl.currentPage = mangDuLieuTextView.count
        
        if pageControl.currentPage == mangDuLieuTextView.count
        {
            pageControlBottomAnchor?.constant = 40
            buttonbackBottomAnchor?.constant = 40
            buttonNextBottomAnchor?.constant = 40
            UIView.animate(withDuration: 0.75, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        else{
            pageControlBottomAnchor?.constant = 0
            buttonbackBottomAnchor?.constant = -8
            buttonNextBottomAnchor?.constant = -8
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    lazy var pageControl:UIPageControl = {
        let page = UIPageControl()
        page.pageIndicatorTintColor = UIColor.gray
        page.currentPageIndicatorTintColor = UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1)
        page.numberOfPages = mangDuLieuTextView.count + 1
        page.translatesAutoresizingMaskIntoConstraints = false
        return page
    }()
    
    let collectionview: UICollectionView =
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collec = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collec.translatesAutoresizingMaskIntoConstraints = false
        return collec
    }()
    //thông báo đã hiển thị bán phím
    
    fileprivate func ThongbaoDaHienThiBanPhim()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    @objc func keyboardShow()
    {
    print("da show ket board")
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: -50, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
    @objc func keyBoardHide()
    {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height )
        }, completion: nil)
    }
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = UIColor.white
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.isPagingEnabled = true
        
        
        
        setLayoutCollectionView()
        ThongbaoDaHienThiBanPhim()
        
        
        
        collectionview.register(cellCuaCollectionLon.self, forCellWithReuseIdentifier: "celid")
        collectionview.register(cellDangNhap.self, forCellWithReuseIdentifier: "celldn")
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    var pageControlBottomAnchor: NSLayoutConstraint?
    var buttonbackBottomAnchor: NSLayoutConstraint?
    var buttonNextBottomAnchor: NSLayoutConstraint?
    
    
    func setLayoutCollectionView()
    {
        
        view.addSubview(collectionview)
        view.addSubview(pageControl)
        view.addSubview(buttonBack)
        view.addSubview(buttonNext)
        
        
        
        
        buttonBack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10) .isActive = true
        buttonbackBottomAnchor =  buttonBack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        buttonbackBottomAnchor?.isActive = true
        buttonBack.widthAnchor.constraint(equalToConstant: 60).isActive = true
        buttonBack.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        buttonNext.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10) .isActive = true
        buttonNextBottomAnchor = buttonNext.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        buttonNextBottomAnchor?.isActive = true
        buttonNext.widthAnchor.constraint(equalToConstant: 60).isActive = true
        buttonNext.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControlBottomAnchor = pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        pageControlBottomAnchor?.isActive = true
       
        collectionview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
    }
}














