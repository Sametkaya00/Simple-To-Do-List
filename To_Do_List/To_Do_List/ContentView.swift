//
//  ContentView.swift
//  To_Do_List
//
//  Created by samet kaya on 25.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State var todotextfield:String=""
    @State var todoList:[String]=[]
    @State var IDidList:[String]=[]
    @State var INotDidList:[String]=[]
   
    
    var body: some View {
        NavigationView{
            VStack{
                
                TextField("Bugün ne yapmak istiyorsunuz ?", text: $todotextfield)
                    .padding()
                    .background(.gray.opacity(0.3))
                    .cornerRadius(5)
               
                  
                Button{
                    if butonNowClick(){
                        butonclick()
                    }
                  
                    
                }label: {
                    Text("Save")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(butonNowClick() ? .blue:.gray)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                
                List{
                    Section(header:Text("To Do List")){
                   
                        ForEach(todoList,id:\.self){todo in
                            Text(todo)
                            
                                .contextMenu{
                                    
                                    Button{
                                        
                                         MarkAsDone(todo: todo)
                                       
                                        
                                    }label: {
                                        Label("Tamamladım", systemImage: "hand.thumbsup.fill")
                                       
                                    }
                                    
                                    Button{
                                        NotAsdone(dodo: todo)
                                    }label: {
                                        Label("Tamamlamadım", systemImage:"hand.thumbsdown.fill" )
                                        
                                       
                                    }
                                  
                                    
                                }
                                
                        }
                        
                        .onDelete(perform:listDelate)
                       
                        
                    }
                   
                    if !IDidList.isEmpty{//ıddlist boş olup olmadığını kontrol ediyoruz
                        Section(header:Text("I Did Lİst")){
                            ForEach(IDidList,id:\.self){doneTodo in
                                HStack{
                                    Text(doneTodo)
                                    Spacer()
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.blue)
                                }
                                
                               
                                
                            }
                        }
                    }
                    
                    if !INotDidList.isEmpty{
                        Section(header:Text("I didn't complete")){
                            ForEach(INotDidList,id:\.self){
                                donedodo in
                                HStack{
                                    Text(donedodo)
                                    Spacer()
                                    Image(systemName: "checkmark.circle.trianglebadge.exclamationmark")
                                        .foregroundColor(.red)
                                }
                               
                                .contextMenu{
                                    Button{
                                        
                                        NotAsdoneOkey(lolo: donedodo)
                                        
                                        
                                    }label: {
                                        Label("Tamamladım", systemImage:"hand.thumbsup.fill")
                                    }
                                }
                                  
                                
                              
                            }
                        }
                    }
                    
                    
                    
                }
                
       
                
                Spacer()
                   
                
            }
            
            .navigationTitle("Basic ToDo App")
            
        }
      
        
        .padding()
       
        
    }
    
   
   
 
    
    func listDelate(indexset:IndexSet){
        todoList.remove(atOffsets: indexset)
    }
    
    func butonNowClick() -> Bool{
        if todotextfield.count>=1{
            return true
        }
        return false
    }
    
    func butonclick(){
        todoList.append(todotextfield)
        todotextfield=""
    }
    func MarkAsDone(todo:String){
        if let index=todoList.firstIndex(of: todo){
            IDidList.append(todo)//görevi ıdidlist içine aktarır
            todoList.remove(at: index)//totodlist içinden listeyi siler
        }
    
    }
    func NotAsdone(dodo:String){
        if let index=todoList.firstIndex(of: dodo){
            INotDidList.append(dodo)
            todoList.remove(at: index)
        }
    }
    
    func NotAsdoneOkey(lolo:String){
        if let index = INotDidList.firstIndex(of: lolo){
            IDidList.append(lolo)
            INotDidList.remove(at: index)
            
        }
        
    }
   
    
    
}

#Preview {
    ContentView()
}
