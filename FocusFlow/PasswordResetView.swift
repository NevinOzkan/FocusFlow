//
//  ContentView.swift
//  FocusFlow
//
//  Created by Nevin Özkan on 25.10.2024.
//

import SwiftUI

struct PasswordResetView: View {
    @State private var email: String = ""
    @State private var isEmailValid: Bool = true
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isLoading: Bool = false // Yükleme durumu

    var body: some View {
        NavigationView {
            ZStack {
                Image("Image")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.2)
                
                VStack {
                    Spacer().frame(height: 20) // Üst boşluk için spacer
                    
                    // Diğer öğeler
                    VStack(alignment: .center) {
                        Text("Şifre Sıfırlama")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.bottom, 10)
                        
                        Text("Şifreyi sıfırlamak için e-posta adresinizi giriniz.")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .padding(.bottom, 20)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.systemGray6))
                                .frame(width: 300, height: 40)
                            
                            HStack {
                                Text("@")
                                    .foregroundColor(.black)
                                    .font(.system(size: 30))
                                    .padding(.leading, 30)
                                    .padding(.trailing, 2)
                                
                                TextField("E-Posta", text: $email)
                                    .padding(.leading, 8)
                                    .keyboardType(.emailAddress)
                                    .autocapitalization(.none)
                            }
                            .padding(.horizontal)
                        }
                        .padding(.bottom, 10)
                        
                        if !isEmailValid {
                            Text("Geçersiz e-posta adresi.")
                                .foregroundColor(.red)
                                .padding(.bottom, 10)
                        }
                        
                        Button(action: {
                            resetPassword()
                        }) {
                            if isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                    .frame(width: 300, height: 40)
                            } else {
                                Text("ŞİFRE SIFIRLAMA TALEBİ GÖNDER")
                                    .frame(width: 300, height: 40)
                                    .background(Color(red: 0.6, green: 0, blue: 0.8))
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .bold))
                                    .cornerRadius(25)
                            }
                        }
                        .padding(.top, 10)
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Duyuru"), message: Text(alertMessage), dismissButton: .default(Text("Tamam")))
                        }
                    }
                    .padding()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding(.top, 10) // Üst boşluk için padding
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Geriye dönme işlemi
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }

    private func resetPassword() {
        if email.isEmpty || !email.contains("@") {
            isEmailValid = false
            return
        }
        
        isEmailValid = true
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            alertMessage = "E-posta adresinize şifre sıfırlama talebi gönderildi. Lütfen E-postanızı kontrol ediniz."
            showAlert = true
            isLoading = false
        }
    }
}

#Preview {
    PasswordResetView()
}
