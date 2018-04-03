//
//  SearchBarDelegate.swift
//  CsBootcamp
//
//  Created by Andre Rodrigues on 03/04/18.
//  Copyright © 2018 Bootcampers. All rights reserved.
//

import UIKit

class SearchBarDelegate: NSObject, UISearchBarDelegate {
    
    var textDidChange: ((String) -> ())?
    
    init(searchBar: UISearchBar) {
        super.init()
        searchBar.delegate = self
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text.map { text in
            self.textDidChange?(text)
        }
    }
    
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        textDidChange?("")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        textDidChange?(searchText)
    }
}
