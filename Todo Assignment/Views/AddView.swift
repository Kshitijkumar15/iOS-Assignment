import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText : String = ""
    @State var descriptionText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Add a new task here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 60)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(20)
                
                TextField("Add task description here", text: $descriptionText)
                    .padding(.horizontal)
                    .frame(height: 60)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(20)
                Button(action: save, label: {
                    Text("Save")
                })
            }
            .padding(14)
            
        }
        .navigationTitle("New Task")
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
    }
    
    func save(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText, description: descriptionText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate()-> Bool{
        if textFieldText.count < 3 {
            alertTitle = "Title should be atleast 3 characters long!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert()-> Alert{
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider{
    static var previews: some View{
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
