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
    let die1 = Int.random(in: 1...6)
    let die2 = Int.random(in: 1...6)
    print("Die1: \(die1)")
    print("Die2: \(die2)")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
