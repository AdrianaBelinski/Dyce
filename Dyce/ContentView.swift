import SwiftUI

struct ContentView: View {
  var body: some View {
    Button("Roll Dice", action: didPressRollDice)
      .font(.title2)
      .padding()
      .foregroundColor(.blue)
      .background(
        RoundedRectangle(cornerRadius: 20)
          .stroke(Color.gray, lineWidth: 2)
      )
  }
  
  func didPressRollDice() {
    print("User pressed roll dice.")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
