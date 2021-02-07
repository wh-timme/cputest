import SwiftUI

struct ContentView: View {
    @State var result_sc : String = "Single Core Not Run"
    @State var result_mc : String = "Multi Core Not Run"
    var body: some View {
        VStack {
            Button("Run Single Core Fib(45)", action: fib_sc)
        Text(result_sc)
            .padding()
        Divider()
        Button("Run 4 Cores Fib(45)", action: fib_mc)
        Text(result_mc)
            .padding()}
    }
    func fib_sc() {
        let start = DispatchTime.now()
        self.result_sc = String(fib(n:45))
        self.result_sc = String(Double(DispatchTime.now().uptimeNanoseconds - start.uptimeNanoseconds)/1000000000)
    }
    func fib_mc() {
        Thread.detachNewThread { self.result_mc = String(fib(n:45)) }
        Thread.detachNewThread { self.result_mc = String(fib(n:45)) }
        Thread.detachNewThread { self.result_mc = String(fib(n:45)) }
        let start = DispatchTime.now()
        self.result_mc = String(fib(n:45))
        self.result_mc = String(Double(DispatchTime.now().uptimeNanoseconds - start.uptimeNanoseconds)/1000000000)
    }
    func fib(n:Int64) -> Int64 {
        if n <= 2 {
            return 1
        } else {
            return fib(n:n-1) &+ fib(n:n-2)
        }
    }
}

