//___FILEHEADER___

import SwiftUI

struct ___FILEBASENAMEASIDENTIFIER___: View {
    @EnvironmentObject var session: ___VARIABLE_productName:identifier___AuthService

    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @State var loading: Bool = false

    func signIn() {
        guard email != "" else {
            error = "Please enter your email and password"
            return
        }
        guard password != "" else {
            error = "Please enter your password"
            return
        }

        loading = true
        session.signIn(email: email, password: password) { result in
            self.loading = false
            switch result {
            case .success:
                print("Sign In complete")
                self.error = ""
            case .failure(let error):
                self.error = error.localizedDescription
            }
        }
    }
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                VStack {
                    TitleView(title: "Sign In")
                    InputContainerView(inputName: "Email Address *",
                                       placeholderText: "Enter your email address",
                                       inputValue: $email)
                    InputContainerView(inputName: "Password *",
                                       placeholderText: "Enter your password",
                                       isSecure: true,
                                       inputValue: $password)
                    ButtonView(buttonText: "Sign In",
                               buttonAction: self.signIn)
                    HStack {
                        Text("Forgot your password?")
                        Text("Reset password").foregroundColor(.orange)
                    }
                    if error != "" {
                        Text(error).font(.system(size: 16, weight: .semibold)).foregroundColor(.red).padding()
                    }
                    Spacer()
                    HStack {
                        Text("No account?")
                        Text("Create account").foregroundColor(.orange)
                    }
                }.padding()
                VStack {
                    Spacer()
                    ActivityIndicator(isAnimating: loading)
                        //.configure { $0.color = UIColor.gray }
                        .padding()
                    Spacer()
                }
            }
        }.navigationBarHidden(true).navigationBarTitle("")
    }
}

struct Authenticator_Previews: PreviewProvider {
    static var previews: some View {
        ___FILEBASENAMEASIDENTIFIER___()
    }
}

