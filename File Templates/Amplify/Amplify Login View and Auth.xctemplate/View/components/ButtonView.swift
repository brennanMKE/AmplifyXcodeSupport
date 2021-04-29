import SwiftUI

struct ButtonView: View {

    var buttonText: String
    var buttonAction: () -> Void
    var body: some View {
        Button(action: {
            self.buttonAction()
        }, label: {
            Text(buttonText)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .background(Color.orange)
                .cornerRadius(3)
        }).padding()
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: "testText", buttonAction: {
            print("button clicked")
        })
    }
}