import SwiftUI

struct ContentView: View {
  @State var dice: (Int, Int)? = nil
  
  let generator = UINotificationFeedbackGenerator()
  
  var body: some View {
    ZStack {
      background
      
      VStack {
        Text("DYCE ROLL")
          .font(.system(size: 60))
          .fontWeight(.heavy)
          .foregroundColor(.modernBlue)
        
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
          VStack {
            Image("dice-in-motion")
              .resizable()
              .frame(width: 100, height: 100)
            Text("Click below to roll dice.")
          }
        }
        
        rollButton
      }
    }
  }
  
  var background: some View {
    Image("background-wall")
      .resizable(resizingMode: .tile)
      .edgesIgnoringSafeArea(.all)
  }
  
  var rollButton: some View {
    Button(action: didPressRollDice) {
      Text("Roll Dice")
        .font(.title)
        .padding(.vertical, 20)
        .padding(.horizontal, 40)
        .foregroundColor(.modernBlue)
        .background(
          RoundedRectangle(cornerRadius: 20)
            .stroke(Color.modernBlue, lineWidth: 3)
            .background(Color.white)
        )
    }
  }
  
  func didPressRollDice() {
    let die1 = Int.random(in: 1...6)
    let die2 = Int.random(in: 1...6)
    dice = (die1, die2) //we create a state variable. System then knows it has to update the body.

    generator.notificationOccurred(.success)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
