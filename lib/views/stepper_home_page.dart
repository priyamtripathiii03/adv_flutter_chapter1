import 'package:flutter/material.dart';
import 'package:adv_flutter_ch1/utils/global.dart';

class StepperHomePage extends StatefulWidget {
  const StepperHomePage({super.key});

  @override
  State<StepperHomePage> createState() => _StepperHomePageState();
}

class _StepperHomePageState extends State<StepperHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            'Flutter Stepper Demo',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Stepper(
            currentStep: index,
            onStepCancel: () {
              if (index > 0) {
                setState(() {
                  index -= 1;
                });
              }
            },
            onStepContinue: () {
              if (index <= 1) {
                setState(() {
                  index++;
                });
              }
            },
            onStepTapped: (value) {
              setState(() {
                index = value;
              });
            },
            type: isGrid ? StepperType.horizontal : StepperType.vertical,
            steps: <Step>[
              stepOfStepper(
                label: 'Account',
                valueFind: 0,
                controller: txtAccount,
              ),
              stepOfStepper(
                label: 'Address',
                valueFind: 1,
                controller: txtAddress,
              ),
              stepOfStepper(
                label: 'Mobile Number',
                valueFind: 2,
                controller: txtContact,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (isGrid) {
                isGrid = false;
              } else {
                isGrid = true;
              }
            });
          },
          child: (isGrid) ? const Icon(Icons.grid_3x3) : const Icon(Icons.list),
        ),
      ),
    );
  }
  Step stepOfStepper(
      {required int valueFind, required label, required controller}) {
    return Step(
      state: (index > valueFind) ? StepState.complete : StepState.editing,
      stepStyle: const StepStyle(
        color: Colors.blue,
      ),
      title: Text(label),
      content: Container(
        alignment: Alignment.centerLeft,
        child: TextFormField(
          controller: controller,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            label: Text(label),
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}