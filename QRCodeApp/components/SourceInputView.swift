//
//  SourceInputView.swift
//  QRCodeApp
//
//  Created by 平山奈々海 on 2023/12/19.
//

import SwiftUI

struct SourceInputView: View {
    @Binding var source : String
    var body: some View {
        VStack {
            HStack {
                Text("Campaign Source")
                    .font(.footnote)
                    .bold()
                Text("*")
                    .font(.footnote)
                    .bold()
                    .foregroundStyle(.red)
                Spacer()
            }
            TextField("入力してください", text: $source)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.URL)
                .font(.title3)
        }
        .padding(6)
    }
}

#Preview {
    SourceInputView(source: .constant(""))
}
