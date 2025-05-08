import SwiftUI

struct SeatGridView: View {
    @ObservedObject var viewModel: SeatViewModel

    var body: some View {
        VStack {
            Text("Select Your Seats").font(.title2).padding()
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 8)) {
                ForEach(viewModel.seats) { seat in
                    Button(action: {
                        viewModel.toggleSeatBooking(seat)
                    }) {
                        Text("\(seat.row)-\(seat.number)")
                            .padding(8)
                            .background(seat.status == .available ? Color.green : Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
}
