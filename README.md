Ticketing System Using Flutter and Dart

Data were stored inside of file.json for the registerstion number, in and out. The system will check if the number entered by the user is in the json or not. If not it will prompt out Car is not registered. If yes, other condition/function will be continue the process.

First function will take the sub data from the registered number, which is the in and out. This to calculate how long have the car entered the parking space. The system ignored the extra minutes in the in and out value due to the rate is only based on the hours.

Second function, will determined the rate based on the date from in and out value, if the date falls on weekdays based on library calender then the rate will follow as per weekday rate(as mention in the assessment question) and vice versa.

From 2 function above, we can call the values to calculate the total rate but need to add extra condition because there is max rate for a day. The total rate need to return.

In main function need to call all these function and return all the data. Display the details of the resgited number, in and out, together eith the total rate value charged.






