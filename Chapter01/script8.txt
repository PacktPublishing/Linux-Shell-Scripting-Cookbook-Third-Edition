 construct to iterate from a start to end value, instead of the 
seq
 command used in the previous example.
 This construct is slightly faster than invoking the 
seq
 command.
19.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
The aforementioned debugging methods
 are provided by Bash built-ins. They produce debugging information in a fixed format. 
In many cases, we need debugging information in our own format. We can define a _DEBUG environment variable to enable and disable debugging and generate messages
 in our own debugging style.
