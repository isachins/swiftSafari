//
//  test.swift
//  SwiftUIPlayground
//
//  Created by Sachin Sharma on 09/03/24.
//

import SwiftUI

struct test: View {
    let link = URL(string: "https://www.hackingwithswift.com")!
    var body: some View {
        

        VStack(spacing: 20) {
            ShareLink(item: link)
            //ShareLink("Learn Swift here", item: link)
//            ShareLink(item: link) {
//                Label("Learn Swift here", systemImage: "swift")
//            }
        }
    }
}

#Preview {
    test()
}
