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
    @State var iDidList:[String]=[]
    @State var iNotDidList:[String]=[]
   
    
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
                   
                    if !iDidList.isEmpty{//ıddlist boş olup olmadığını kontrol ediyoruz
                        Section(header:Text("I Did Lİst")){
                            ForEach(iDidList,id:\.self){doneTodo in
                                HStack{
                                    Text(doneTodo)
                                    Spacer()
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.blue)
                                }
                               
                              
                         //       if (todoList == [] && INotDidList == []){
                                    
                            //        Button{
                            //            resetbutton(coco:doneTodo )
                                        
                                        
                            //        }label: {
                             //           Text("Reset")
                              //              .frame(maxWidth: .infinity)
                             //               .padding()
                             //               .background(.red.opacity(0.8))
                            //                .cornerRadius(5)
                                            
                            //        }
                                        
                                    
                                    
                            //    }
                                    
                            }
                            .onDelete(perform:listDelate2)
                           
                        }
                        
                        
                    }
                    
                    if !iNotDidList.isEmpty{
                        Section(header:Text("I didn't complete")){
                            ForEach(iNotDidList,id:\.self){
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
                            .onDelete(perform:listDelate3)
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
    
    func listDelate2(indexset:IndexSet){
        iDidList.remove(atOffsets: indexset)
    }
    
    func listDelate3(indexset:IndexSet){
        iNotDidList.remove(atOffsets: indexset)
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
            iDidList.append(todo)//görevi ıdidlist içine aktarır
            todoList.remove(at: index)//totodlist içinden listeyi siler
        }
    
    }
    func NotAsdone(dodo:String){
        if let index=todoList.firstIndex(of: dodo){
            iNotDidList.append(dodo)
            todoList.remove(at: index)
        }
    }
    
    func NotAsdoneOkey(lolo:String){
        if let index = iNotDidList.firstIndex(of: lolo){
            iDidList.append(lolo)
            iNotDidList.remove(at: index)
            
        }
        
    }
    
    //func resetbutton(coco:String){
   //     if let index = IDidList.firstIndex(of: coco){
    //        IDidList.remove(at: index)
   //     }
 //   }
   
    
    
}

#Preview {
    ContentView()
}
