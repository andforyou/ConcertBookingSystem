import Foundation
import SwiftUI

class SeatViewModel: ObservableObject {
    @Published var seats: [Seat] = []

    init() {
        loadSeats()
    }

    func loadSeats() {
        var generatedSeats = [Seat]()
        for row in 1...5 {
            for number in 1...8 {
                generatedSeats.append(
                    Seat(id: UUID(), row: row, number: number, status: .available)
                )
            }
        }
        seats = generatedSeats
    }

    func toggleSeatBooking(_ seat: Seat) {
        guard let index = seats.firstIndex(where: { $0.id == seat.id }) else { return }
        seats[index].status = (seat.status == .available) ? .booked : .available
    }
}
