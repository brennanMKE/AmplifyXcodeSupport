import SwiftUI

struct InputContainerView: View {
    var inputName: String
    var placeholderText: String
    var isSecure: Bool = false
    var disabled: Bool = false

    @Binding var inputValue: String

    var body: some View {
        VStack {
            HStack {
                Text(inputName)
                Spacer()
            }

            if isSecure {
                SecureField(placeholderText, text: $inputValue)
                    .padding()
                    .border(Color.gray)
            } else {
                TextField(placeholderText, text: $inputValue)
                    .padding()
                    .border(Color.gray).disabled(self.disabled)
            }
        }.padding()
    }
}

struct InputContainerView_Previews: PreviewProvider {

    static var previews: some View {
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        @State var inputValue: String = ""
        var body: some View {
            InputContainerView(inputName: "inputName", placeholderText: "placeholder text", inputValue: $inputValue)
        }
    }
}