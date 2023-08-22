//
//  Stepper.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 26.07.2023.
//

import SwiftUI
import CoreML

struct StepperView: View {
    
    @State private var showInfo = false
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmounth = 8.0
    @State private var cofeeAmounth = 1
    
    @State private var alertTittle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .center) {
                if showInfo == false {
                    Text("Enter your details")
                } else {
                    Text("\(alertTittle)")
                    Text(alertMessage)
                }
            }
            .frame(height: 150)
            .font(.system(size: 28))
            .font(.headline)
            .foregroundColor(.indigo)
            
            Form {
                Section {
                    Text("hen do you want wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                Section {
                    Text("Desired amounth of sleep")
                        .font(.headline)
                    Picker("Your sleep amounth" , selection: $sleepAmounth) {
                        ForEach(4..<13) {sleepAmounth in
                            Text(sleepAmounth, format:  .number)
                        }
                    }
                }
                Section {
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    Stepper(cofeeAmounth == 1 ? "1 cup" : "\(cofeeAmounth) cups", value: $cofeeAmounth, in: 1...20)
                }
            }
            Button("Calculate") {
                calculateBedtime()
            }
            .frame(height: 38)
            .font(.system(size: 20, weight: .semibold))
            .foregroundColor(.indigo)
    
            .navigationTitle("Better Rest")
        }
    }
    
    private func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let predictiom = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmounth, coffee: Double(cofeeAmounth))
            let sleepTime = wakeUp - predictiom.actualSleep
            alertTittle = "Your ideal bedtime is"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTittle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime"
        }
        showingAlert = true
        showInfo = true
    }
}


struct Stepper_Previews: PreviewProvider {
    static var previews: some View {
        StepperView()
    }
}
