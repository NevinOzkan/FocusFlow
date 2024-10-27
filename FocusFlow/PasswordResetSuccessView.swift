//
//  PasswordResetSuccessView.swift
//  FocusFlow
//
//  Created by Nevin Özkan on 28.10.2024.
//

import SwiftUI

struct PasswordResetSuccessView: View {
    @State private var isLoading: Bool = true
    
    var body: some View {
        ZStack {
            Image("Image")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.2)
            
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 135, height: 53)
                    .padding(.top, 50)
                
                Spacer()
                
                Text("Şifreniz başarıyla sıfırlandı.")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.green))
                        .scaleEffect(1.5)
                        .padding(.top, 20)
                        .rotationEffect(.degrees(360)) 
                        .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
                }

                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Şifre Sıfırlama")
        .onAppear {
            // Yüklenme simgesini başlat
            isLoading = true
        }
    }
}

#Preview {
    PasswordResetSuccessView()
}
