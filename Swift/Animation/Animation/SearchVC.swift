//
//  SearchVC.swift
//  Instacoin
//
//  Created by Kunal on 04/04/22.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var mainContentView: UIView!
    @IBOutlet var segmentUnderLineConstLeft: NSLayoutConstraint!
    @IBOutlet var segmentUnderlineConstRight: NSLayoutConstraint!
    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var videosLbl: UILabel!
    
    @IBOutlet weak var userSearchTableView: UITableView!
    @IBOutlet weak var collectionContentView: UIView!
    @IBOutlet weak var searchVideoCollectionVideo: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var isShowUser = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customization()
       
        userSearchTableView.dataSource = self
        userSearchTableView.delegate = self
        searchVideoCollectionVideo.delegate = self
        searchVideoCollectionVideo.dataSource = self
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: -10, left: 0, bottom: 40, right: 0)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width-10)/2, height: (UIScreen.main.bounds.width+10)/2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        searchVideoCollectionVideo!.collectionViewLayout = layout
        
        //let height = 150.0/375.0*Dimention.fullWidth //sliderCollectionView.collectionViewLayout.collectionViewContentSize.height
        //self.userDataCVHeight.constant = height
        self.view.layoutIfNeeded()
        
    }
    
    // MARK: - Segment button click
    @IBAction func segmentBtnClick(_ sender: UIButton){
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: { [unowned self] in
            if sender.tag == 0{
                segmentUnderlineConstRight.isActive = false
                segmentUnderLineConstLeft.isActive = true
                userLbl.textColor = .white
                videosLbl.textColor = .lightGray
                isShowUser = true
                
            }
            else{
                segmentUnderLineConstLeft.isActive = false
                segmentUnderlineConstRight.isActive = true
                userLbl.textColor = .lightGray
                videosLbl.textColor = .white
                isShowUser = false
                
            }
            view.layoutIfNeeded()
            view.setNeedsLayout()
        }, completion: { [unowned self] finish in
            //debugPrint(finish)
            if isShowUser{
                collectionContentView.isHidden = true
                userSearchTableView.isHidden = false
                userSearchTableView.reloadData()
            }
            else{
                userSearchTableView.isHidden = true
                collectionContentView.isHidden = false
                searchVideoCollectionVideo.reloadData()
            }
        })
        
    }
    
    // MARK: - Customization of View Font and Label
    private func customization() {
        mainContentView.layer.cornerRadius = 40.0
        mainContentView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        userSearchTableView.contentInset.bottom = 40.0
        userSearchTableView.contentInset.top = 15.0
        collectionContentView.isHidden = isShowUser
    }
}

// MARK: - Table view Delegate and Data Source
extension SearchVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTVC", for: indexPath) as? SearchTVC{
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        if let nav = UIStoryboard(name: Identifiers.main, bundle: nil).instantiateViewController(withIdentifier: Identifiers.otherUserProfile) as? OtherUserProfileVC{
//            self.navigationController?.pushViewController(nav, animated: true)
//        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1.0)
        
        UIView.animate(withDuration: 0.5) {
            cell.layer.transform = CATransform3DIdentity
        } completion: { isComplete in
            //debugPrint(isComplete)
        }
        
    }
    
}


// MARK: - Collection View delegate and data source
extension SearchVC: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfilePageCVC", for: indexPath) as! ProfilePageCVC
        if indexPath.row % 2 == 0{
            cell.videoImg.image = UIImage(named: "t5")
        }
        else{
            cell.videoImg.image = UIImage(named: "t6")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1.0)
        
        UIView.animate(withDuration: 0.5) {
            cell.layer.transform = CATransform3DIdentity
        } completion: { isComplete in
            //debugPrint(isComplete)
        }
    }
    
}

// MARK: - Search Bar Delegate
extension SearchVC: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        debugPrint("Search Text----",searchBar.searchTextField.text ?? "")
    }
}
