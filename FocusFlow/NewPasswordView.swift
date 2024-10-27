//
//  NewPasswordView.swift
//  FocusFlow
//
//  Created by Nevin Özkan on 27.10.2024.
//

import SwiftUI

struct NewPasswordView: View {
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isConfirmPasswordVisible: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        ZStack {
            Image("Image")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.2)

            VStack(spacing: 20) {
                HStack {
                    Button(action: {
                        // Geri butonuna basıldığında yapılacak işlemler
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .bold))
                    }
                    Spacer()
                    Image("logo")
                        .offset(y:-40)
                        .frame(width: 135, height: 53)
                    Spacer()
                }
                .padding(.top, 40)
                .padding(.horizontal, 20)
                
                Spacer()

                Text("Yeni Şifre Belirle")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)

            
                passwordField(title: "Yeni Şifre", text: $newPassword, isVisible: $isPasswordVisible)

                
                passwordField(title: "Şifreyi Tekrarla", text: $confirmPassword, isVisible: $isConfirmPasswordVisible)

               
                Button(action: savePassword) {
                    Text("Yeni Şifreyi Kaydet")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(25)
                        .frame(width: UIScreen.main.bounds.width - 48)
                }
                .padding(.horizontal, 24)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Bilgilendirme"), message: Text(alertMessage), dismissButton: .default(Text("Tamam")))
                }

               
                VStack(alignment: .leading, spacing: 8) {
                    Text("Şifrede bulunması gerekenler:")
                        .font(.headline)
                    HStack {
                        Image(systemName: newPassword.count >= 8 ? "checkmark.circle" : "circle")
                            .foregroundColor(newPassword.count >= 8 ? .green : .gray)
                        Text("En az 8 karakter")
                            .foregroundColor(.black)
                    }
                    HStack {
                        Image(systemName: containsUpperAndLowercase(password: newPassword) ? "checkmark.circle" : "circle")
                            .foregroundColor(containsUpperAndLowercase(password: newPassword) ? .green : .gray)
                        Text("Büyük ve küçük harfler")
                            .foregroundColor(.black)
                    }
                    HStack {
                        Image(systemName: containsDigit(password: newPassword) ? "checkmark.circle" : "circle")
                            .foregroundColor(containsDigit(password: newPassword) ? .green : .gray)
                        Text("En az 1 rakam")
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 10)

                Spacer()
            }
            .padding()
        }
    }

   
    private func passwordField(title: String, text: Binding<String>, isVisible: Binding<Bool>) -> some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(.systemGray6))
            .frame(height: 50)
            .overlay(
                HStack {
                    if isVisible.wrappedValue {
                        TextField(title, text: text)
                            .padding()
                    } else {
                        SecureField(title, text: text)
                            .padding()
                    }
                    Button(action: {
                        isVisible.wrappedValue.toggle()
                    }) {
                        Image(systemName: isVisible.wrappedValue ? "eye" : "eye.slash")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 10)
                }
            )
            .padding(.horizontal, 24)
    }

    
    private func savePassword() {
        if newPassword == confirmPassword && isPasswordStrong(password: newPassword) {
            alertMessage = "Şifreniz başarıyla kaydedildi!"
            showAlert = true
        } else {
            alertMessage = "Şifre kriterleri sağlanamıyor veya şifreler uyuşmuyor."
            showAlert = true
        }
    }

   
    private func isPasswordStrong(password: String) -> Bool {
        return password.count >= 8 && containsUpperAndLowercase(password: password) && containsDigit(password: password)
    }

    private func containsUpperAndLowercase(password: String) -> Bool {
        let uppercase = CharacterSet.uppercaseLetters
        let lowercase = CharacterSet.lowercaseLetters
        return password.rangeOfCharacter(from: uppercase) != nil && password.rangeOfCharacter(from: lowercase) != nil
    }

    private func containsDigit(password: String) -> Bool {
        return password.rangeOfCharacter(from: .decimalDigits) != nil
    }
}

#Preview {
    NewPasswordView()
}
