//
//  InputView.swift
//  QRCodeApp
//
//  Created by 平山奈々海 on 2023/12/19.
//

import SwiftUI

struct URLInputView: View {
    @Binding var url : String
    var body: some View {
        VStack {
            HStack {
                Text("URL")
                    .font(.footnote)
                    .bold()
                Text("*")
                    .font(.footnote)
                    .bold()
                    .foregroundStyle(.red)
                Spacer()
            }
            TextField("入力してください", text: $url)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.URL)
                .font(.title3)
        }
        .padding(6)
    }
}

#Preview {
    URLInputView(url: .constant("fafafa"))
}
