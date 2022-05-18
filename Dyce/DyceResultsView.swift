import SwiftUI

struct DyceResultsView: View {
  let dice: [Int]

  var body: some View {
    ForEach(0 ..< dice.count, id: \.self) { i in
      Image(systemName: "die.face.\(dice[i])")
        .resizable()
        .frame(width: 100, height: 100)
    }
  }
}

struct DyceResultsView_Previews: PreviewProvider {
  static var previews: some View {
    DyceResultsView(dice: [1,5,2,6])
  }
}
