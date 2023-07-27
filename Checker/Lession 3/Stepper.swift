//
//  Stepper.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 26.07.2023.
//

import SwiftUI
import CoreML

struct StepperView: View {
    
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
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Text("hen do you want wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amounth of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmounth.formatted()) hours", value: $sleepAmounth, in: 4...12, step: 0.25)
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily coffee intake ")
                        .font(.headline)
                    
                    Stepper(cofeeAmounth == 1 ? "1 cup" : "\(cofeeAmounth) cups", value: $cofeeAmounth, in: 1...20)
                }
            }
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Calculate" , action: calculateBedtime)
            }
            .alert(alertTittle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let predictiom = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmounth, coffee: Double(cofeeAmounth))
            let sleepTime = wakeUp - predictiom.actualSleep
            alertTittle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTittle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime"
        }
        showingAlert = true
    }
    
}

struct Stepper_Previews: PreviewProvider {
    static var previews: some View {
        StepperView()
    }
}
