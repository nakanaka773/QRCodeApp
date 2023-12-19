//
//  InputView.swift
//  QRCodeApp
//
//  Created by 平山奈々海 on 2023/12/19.
//

import SwiftUI

struct InputView: View {
    @Binding var url : String
    var body: some View {
        HStack {
            Text("URL")
            TextField("入力してください", text: $url)
                .textFieldStyle(.roundedBorder)
            .padding()
        }
        .padding()
    }
}

#Preview {
    InputView(url: .constant("fafafa"))
}
