list view applicaion that we want to take a email and number and make it visible in UI as a recycler view

UI

For the UI I takes a container and added two textformfield wrapped with a form and for the submission maked a material button wrapped with container for styling.
After this the email and number will shown in a customized container that wrapped with a listview.seperated.The list will be available as the length of the details we submitted

STORE DATA

For storing data I used shared preference package that can store values in disk as a key value pair.
I stored email and number in two shared preferrense properties that using setString list that store the list of string items.

VALIDATION

For the validation I used the regex values for the email and number the number provided as the indian number.
Email want to be in the email format also I cheaked the value is existed or not by a loop.
