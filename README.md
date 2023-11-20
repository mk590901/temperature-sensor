# Temperature Sensor Simulator

## Introduction

The project consists of two applications: server and client apps.

## Server

The server is a temperature sensor emulator. It's described by a state machine that responds to event start. The measurement process takes two seconds after which the sensor produces a random value in the range from 24°C to 42°C. The values are generated in a certain predefined order, giving the appearance of a gradual temperature change. If event start occurs during a measure, the the measurement is stopped and sensor returns the value cancel. The server also handles the exit event, closing the task that is processing the input message stream. Pay attention to the Task class (task.toit).

## Client

The client is a separate application that sends commands to the server to start the measurement or interrupt it, depending on the delay between sendings. Having completed its work, the client closes the task of incoming measurement results messages and sends an exit signal, stopping the server.

## Run apps

The client and server run separately. Everyone is on their own terminal. The server starts first, then the client. There are 3 ways to do it:
1. On the same chip, using cloud topics. Strange as it may seem, toitware has implemented the ability to run several independent applications in parallel on one chip.
2. On different chips. You should simply specify the names of the ESP32 chips when starting the server and client. In this case, the server is launched on the nuc controller, the client - on the mini controller.
3. If you slightly change the application by changing the topics in files A, B, and C, you will get two applications that exchange data inside one chip without access to the Internet.

# Movie

https://github.com/mk590901/temperature-sensor/assets/125393245/e7c1d652-9be1-48b5-9170-9e9cdd7e604c

