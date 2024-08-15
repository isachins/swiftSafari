//
//  Item.swift
//  swiftSafari
//
//  Created by Sachin Sharma on 15/08/24.
//

import Foundation
import SwiftUI

struct Item: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var title: String
    var image: UIImage?
}

//// MARK: With Image URL
//var sampleItems: [Item] = [
//    ///Image Link: https://www.pexels.com/photo/harbor-in-stockholm-sweden-19896879/
//    .init(title: "Fanny Hagan", image: "https://www.pexels.com/photo/harbor-in-stockholm-sweden-19896879/"),
//    
//    ///Image Link: https://www.pexels.com/photo/a-blue-ice-cave-with-a-wooden-walkway-22944463/
//    .init(title: "Han-Chieh Lee", image: "https://www.pexels.com/photo/a-blue-ice-cave-with-a-wooden-walkway-22944463/"),
//    
//    ///Image Link: https://www.pexels.com/photo/a-butterfly-on-a-flower-20672997/
//    .init(title: "新宇E", image: "https://www.pexels.com/photo/a-butterfly-on-a-flower-20672997/"),
//    
//    ///Image Link: https://www.pexels.com/photo/river-and-lake-behind-18970192/
//    .init(title: "Abril Altamirano", image: "https://www.pexels.com/photo/river-and-lake-behind-18970192/"),
//    
//    ///Image Link: https://www.pexels.com/photo/hot-air-balloons-flying-in-cappadocia-at-sunrise-18873058/
//    .init(title: "Gülsah Aydogan", image: "https://www.pexels.com/photo/hot-air-balloons-flying-in-cappadocia-at-sunrise-18873058/"),
//    
//    ///Image Link: https://www.pexels.com/photo/winter-landscape-with-wooden-cottage-in-snowy-forest-8001019/
//    .init(title: "Melike Sayar Melikesayar", image: "https://www.pexels.com/photo/winter-landscape-with-wooden-cottage-in-snowy-forest-8001019/") ,
//    
//    ///Image Link: https://www.pexels.com/photo/branches-with-green-leaves-in-nature-8058776/
//    .init(title: "Maahid Photos", image: "https://www.pexels.com/photo/branches-with-green-leaves-in-nature-8058776/"),
//    
//    ///Image Link: https://www.pexels.com/photo/bush-with-green-fern-leaves-7945985/
//    .init(title: "Pelageia Zelenina", image: "https://www.pexels.com/photo/bush-with-green-fern-leaves-7945985/"),
//    
//    ///Image Link: https://www.pexels.com/photo/tree-growing-among-agricultural-field-in-countryside-7939089/
//    .init(title: "Ofir Eliav", image: "https://www.pexels.com/photo/tree-growing-among-agricultural-field-in-countryside-7939089/"),
//    
//    ///Image Link: https://www.pexels.com/photo/scenic-landscape-of-autumn-forest-with-tall-trees-in-fog-8001169/
//    .init(title: "Melike Sayar Melikesayar", image: "https://www.pexels.com/photo/scenic-landscape-of-autumn-forest-with-tall-trees-in-fog-8001169/"),
//]

// MARK: With UIImage
var sampleItems: [Item] = [
    ///Image Link: https://www.pexels.com/photo/harbor-in-stockholm-sweden-19896879/
   // .init(title: "Fanny Hagan", image: UIImage(named: "pic 1")),
    ///Image Link: https://www.pexels.com/photo/a-blue-ice-cave-with-a-wooden-walkway-22944463/
    .init(title: "Han-Chieh Lee", image: UIImage (named: "Pic 2")),
    ///Image Link: https://www.pexels.com/photo/a-butterfly-on-a-flower-20672997/
    .init(title: "Sachin", image: UIImage (named: "Pic 3")),
    ///Image Link: https://www.pexels.com/photo/river-and-lake-behind-18970192/
    .init(title: "Abril Altamirano", image: UIImage (named: "Pic 4")),
    ///Image Link: https://www.pexels.com/photo/hot-air-balloons-flying-in-cappadocia-at-sunrise-18873058/
    .init(title: "Gülsah Aydogan", image: UIImage(named: "Pic 5")),
    ///Image Link: https://www.pexels.com/photo/winter-landscape-with-wooden-cottage-in-snowy-forest-8001019/
    .init(title: "Melike Sayar Melikesayar", image: UIImage(named: "Pic 6")) ,
    ///Image Link: https://www.pexels.com/photo/branches-with-green-leaves-in-nature-8058776/
    .init(title: "Maahid Photos", image: UIImage (named: "Pic 7")),
    ///Image Link: https://www.pexels.com/photo/bush-with-green-fern-leaves-7945985/
   // .init(title: "Pelageia Zelenina", image: UIImage(named: "pic 8")),
    ///Image Link: https://www.pexels.com/photo/tree-growing-among-agricultural-field-in-countryside-7939089/
    .init(title: "Ofir Eliav", image: UIImage(named: "Pic 9")),
    ///Image Link: https://www.pexels.com/photo/scenic-landscape-of-autumn-forest-with-tall-trees-in-fog-8001169/
    .init(title: "Melike Sayar Melikesayar", image: UIImage(named: "Pic 10")),
]
