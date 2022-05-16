import SwiftUI

struct ContentView: View {
  @State var dice: (Int, Int)? = nil
  
  var body: some View {
    VStack {
      if let (die1, die2) = dice {
        HStack {
          Image(systemName: "die.face.\(die1)")
            .resizable()
            .frame(width: 100, height: 100)
          Image(systemName: "die.face.\(die2)")
            .resizable()
            .frame(width: 100, height: 100)
        }
      } else {
        Text("Click below to roll dice.")
      }
      
      Button("Roll Dice", action: didPressRollDice)
        .font(.title2)
        .padding()
        .foregroundColor(.blue)
        .background(
          RoundedRectangle(cornerRadius: 20)
            .stroke(Color.gray, lineWidth: 2)
        )
    }
  }
  
  func didPressRollDice() {
    let die1 = Int.random(in: 1...6)
    let die2 = Int.random(in: 1...6)
    dice = (die1, die2) //we create a state variable. System then knows it has to update the body.
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
