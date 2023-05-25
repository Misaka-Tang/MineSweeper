//
//  testSpaceView.swift
//  MineSweeper
//
//  Created by 唐伟业 on 2023/4/10.
//

import SwiftUI

struct testSpaceView: View {
    var body: some View {
        Button(action: {}, label: {
         Image(systemName: "flag.fill")


        })
        .buttonStyle(PlainButtonStyle())

    }
}

struct testSpaceView_Previews: PreviewProvider {
    static var previews: some View {
        testSpaceView()
    }
}
