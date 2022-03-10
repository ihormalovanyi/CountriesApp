# CountriesApp
Majority Task

Simple Demo app with a prototype of architecture. 

Main feature parts: 

- Domain is business logic and models. 
- Process is a Feature BL core. It receives messages from UI and updates the UI State, and notifies the UI that state was changed. But there are many ways to implement this. I choose the fastest way now. 
- UI is part that contains all that corresponds with UI: Controllers, Views, Cells, States, etc... 
- Network. 

In this example, there is just one feature. But there's possible to grow it up. 
The Router in architecture I chose is a root object after AppDelegate, of course. The Router creates the flows (or features) and fires them. If simpler, the Router controls UI, transitions, and implements the logic: how and what to show and setup. Connecting UI with Process.

In the future, there's possible to make the architecture modular and separated. But now it is simplified, as the task is very simple.
