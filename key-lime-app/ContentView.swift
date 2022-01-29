import SwiftUI

struct ContentView: View {
    @State private var message = "Loading..."
    
    var body: some View {
        Text(message)
            .padding()
            .onAppear() {
                let session = URLSession.shared
                let url = URL(string: "https://key-lime-api.herokuapp.com/hello_world")
                let task = session.dataTask(with: url!, completionHandler: { data, response, error in
                    if error != nil {
                        print(error!)
                        return
                    }
                    
                    message = String(data: data!, encoding: .utf8)!
                })
                
                task.resume()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
