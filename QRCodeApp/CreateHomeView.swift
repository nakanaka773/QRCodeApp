//
//  SampleView.swift
//  QRCodeApp
//
//  Created by 平山奈々海 on 2023/12/19.
//

import SwiftUI
import CoreImage.CIFilterBuiltins
import UIKit
import Photos

struct CreateHomeView: View {
    @State private var url : String = ""
    @State private var source : String = ""
    @State private var medium : String = ""
    
    @State private var qrShow = false
    
    @State var showAlert = false
    @State var fullAlert = false
    @State var clipAlert = false

    var combinedURL: String {
        return url + "?utm_source=" + source + "&utm_medium=" + medium
    }
    
    var body: some View {
        VStack {
            URLInputView(url: $url)
            SourceInputView(source: $source)
            MediumInputView(medium: $medium)
            
            
            Spacer()
            VStack {
                HStack {
                    Text("作成されたURL")
                        .font(.footnote)
                        .bold()
                    Spacer()
                }
                .padding(.bottom,7)
                HStack{
                    VStack {
                    
                        Text(combinedURL)
                            .foregroundStyle(.gray)
                         
                        Spacer()
                    }
                    Spacer()
                    Button {
                        clipAlert = true
                        UIPasteboard.general.string = combinedURL
                    } label: {
                        Image(systemName: "doc.on.doc")
                    }
                    .alert("コピー", isPresented: $clipAlert) {
                        Text("了解")
                    } message: {
                        Text("クリップボードにコピーしました")
                    }
                }
                .padding()
                .bold()
                .frame(width: 350, height: 120)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 2)
                        .fill(.gray)
                }
                
            }
            .padding()
            Button {
                if url == "" {
                    fullAlert = true
                    return
                }
                if source == "" {
                    fullAlert = true
                    return
                }
                if medium == "" {
                    fullAlert = true
                    return
                }
                self.qrShow = true
            } label: {
                Text("QRコードを作成")
                    .frame(width: 350, height: 60)
                    .foregroundStyle(.white)
                    .background(.cyan)
                    .bold()
                    .font(.title2)
            }
            .alert("不十分", isPresented: $fullAlert) {
                Text("戻る")
            } message: {
                Text("３つ全てに文字を入力する必要があります")
            }
        }
        .padding()
        .sheet(isPresented: $qrShow) {
            VStack {
                VStack {
                    HStack {
                        Text("作成したURL")
                            .font(.footnote)
                            .bold()
                        Spacer()
                    }
                    .padding(4)
                    HStack{

                        Text(combinedURL)
                            .font(.title3)
        
                        Spacer()
                    }
                    .padding()
                    .bold()
                    .frame(width: 350)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(lineWidth: 2)
                            .fill(.gray)
                    }
  
                }
                Spacer()
                
                Image(uiImage: generateQR(from: combinedURL))
                 
                Spacer()
                Button {
                    showAlert = true
                    
                } label: {
                    Text("ダウンロード")
                        .frame(width: 350, height: 60)
                        .foregroundStyle(.white)
                        .background(.cyan)
                        .bold()
                        .font(.title2)
                }
                .alert("保存する", isPresented: $showAlert) {
                    Button("了解") {
                        saveImageToCameraRoll(image: generateQR(from: combinedURL))
                                }
                } message: {
                    Text("QRコードをダウンロードします")
                }

            }
            .padding()
        }
       
        
    }
    func generateQR(from string:String) -> UIImage{
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        filter.setValue("H", forKey: "inputCorrectionLevel")
        
        if let outputimage = filter.outputImage {
            let extent = outputimage.extent
            let scale = min(150 / extent.width, 150 / extent.height) // サイズを調整
            let transformedImage = outputimage.transformed(by: CGAffineTransform(scaleX: scale, y: scale))
            
            if let cgImage = context.createCGImage(transformedImage, from: transformedImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }
        
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
        
    }
    func saveImageToCameraRoll(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
}



#Preview {
    CreateHomeView()
}
