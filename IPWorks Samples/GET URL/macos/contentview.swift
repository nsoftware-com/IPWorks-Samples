import SwiftUI
import IPWorks

struct ContentView: View, HTTPDelegate {
    
    var client = HTTP()

    var documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/"
    @State private var url: String = "https://www.nsoftware.com"
    @State private var output: String = ""
        
    var body: some View {
        VStack(alignment: .leading)
        {
          Text("Type in the URL and click the 'Get URL' button to retrieve the page specified by the URL.").foregroundColor(Color.blue)
            HStack {
                Text("URL:")

                TextField("", text: $url)
                getButton()
            }
          TextEditor(text: $output)
        }
        .padding(10.0)
    }

    @ViewBuilder
    private func getButton() -> some View {
      Button(action: {
        //client.runtimeLicense = ""
        client.delegate = self
        output = ""                
        do
        {                    
          try client.get(url: url)
          output += client.transferredData
        }
        catch
        {
          output = "Error: \(error)"
          return
        }
      } , label: {
        Text("Get").font(.system(size: 20))
          .frame(minWidth: 100, minHeight: 30)
          .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray))
      })
      .buttonStyle(PlainButtonStyle())
    }
    
    nonisolated func onConnected(statusCode: Int32, description: String) { }    
    nonisolated func onConnectionStatus(connectionEvent: String, statusCode: Int32, description: String) { }    
    nonisolated func onDisconnected(statusCode: Int32, description: String) { }    
    nonisolated func onEndTransfer(direction: Int32) { }    
    nonisolated func onError(errorCode: Int32, description: String) { }    
    nonisolated func onHeader(field: String, value: String) { }    
    nonisolated func onLog(logLevel: Int32, message: String, logType: String) { }    
    nonisolated func onRedirect(location: String, accept: inout Bool) { }    
    nonisolated func onSetCookie(name: String, value: String, expires: String, domain: String, path: String, secure: Bool) { }    
    nonisolated func onSSLServerAuthentication(certEncoded: Data, certSubject: String, certIssuer: String, status: String, accept: inout Bool) { }    
    nonisolated func onSSLStatus(message: String) { }    
    nonisolated func onStartTransfer(direction: Int32) { }    
    nonisolated func onStatus(httpVersion HTTPVersion: String, statusCode: Int32, description: String) { }    
    nonisolated func onTransfer(direction: Int32, bytesTransferred: Int64, percentDone: Int32, text: Data) { }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
