//
//  ContentView.swift
//  DJSwiftUI
//
//  Created by zhihu on 2021/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            LoginViewII().environmentObject(Store())
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
