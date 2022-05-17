import SwiftUI

struct ContentView: View {
  @State var dice: (Int, Int)? = nil
  @State var numberOfDice = 2
  
  let generator = UINotificationFeedbackGenerator()
  
  var body: some View {
    ZStack {
      background
      
      VStack(spacing: 40) {
        Text("DYCE ROLL")
          .font(.system(size: 60))
          .fontWeight(.bold)
          .foregroundColor(.modernBlue)
          .padding(.bottom, 20)
        
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
       
        HStack{
          Button(action: decrementDice) {
            Image(systemName: "minus.circle")
              .resizable()
              .frame(width: 30, height: 30)
              .foregroundColor(.modernBlue)
          }
          
          Text("\(numberOfDice) dice")
            .font(.title)
          
          Button(action: incrementDice) {
            Image(systemName: "plus.circle")
              .resizable()
              .frame(width: 30, height: 30)
              .foregroundColor(.modernBlue)
          }
        }
      }
    }
  }
  
  var background: some View {
    Image("background-wall")
      .resizable(resizingMode: .tile)
      .edgesIgnoringSafeArea(.all)
  }
  
  var rollButton: some View {
    Button(action: rollDice) {
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
  
  func rollDice() {
    let die1 = Int.random(in: 1...6)
    let die2 = Int.random(in: 1...6)
    dice = (die1, die2) //we create a state variable. System then knows it has to update the body.

    generator.notificationOccurred(.success)
  }
  
  func decrementDice() {
    numberOfDice -= 1
  }
  
  func incrementDice() {
    numberOfDice += 1
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
