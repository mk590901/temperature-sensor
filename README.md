# TOIT Temperature Sensor Simulator

## Introduction

The project consists of two applications: server and client apps.

## Server

The server is a temperature sensor emulator. It's described by a state machine that responds to event *start*. The measurement process takes two seconds after which the sensor produces a random value in the range from 24°C to 42°C. The values are generated in a certain predefined order, giving the appearance of a gradual temperature change. If event *start* occurs during a measure, the the measurement is stopped and sensor returns the value *cancel*. The server also handles the *exit* event, closing the task that is processing the input message stream. Pay attention to the **Task** class (task.toit) implemented *thread*.

## Client

The client is a separate application that sends commands to the server to start the measurement or interrupt it, depending on the delay between sendings. Having completed its work, the client closes the task of incoming measurement results messages and sends an exit signal, stopping the server.

## Run apps

The client and server run separately. Each app launches from their own terminal window. The server starts first, then the client as shown in movie. There are 3 ways to do it:

> On the same chip, using cloud topics. Strange as it may seem, toitware has implemented the ability to run several independent applications in parallel on one chip. In this case, both the server and the client are running on a controller called **nuc**:

- $ toit run -d=nuc cloud_task_server.toit
- $ toit run -d=nuc cloud_task_client.toit

> On different chips. You should simply specify the names of the ESP32 chips when starting the server and client. In this case, the server is launched on the **nuc** controller, the client - on the **mini** controller.

- $ toit run -d=nuc cloud_task_server.toit
- $ toit run -d=mini cloud_task_client.toit

> If you slightly change the application by replacing the topics in files **cloud_task_server.toit**, **cloud_task_client**, and **outer_pubsub.toit**: "cloud:demo/ping" to "device:demo/ping" and "cloud:demo/pоng" to "device:demo/pоng", you'll get server and client that exchange data inside one chip without  data messaging via the internet:

- $ toit run -d=nuc cloud_task_server.toit
- $ toit run -d=nuc cloud_task_client.toit

> File *trace_run_client_server.txt* contains the output printed on terminals for cases 1 and 2. The prefix **<<** is the data that the application receives, and the prefix **>>** corresponds to the data that the application sends to its account partner via the *internet*.

# Movie

https://github.com/mk590901/temperature-sensor/assets/125393245/e7c1d652-9be1-48b5-9170-9e9cdd7e604c

