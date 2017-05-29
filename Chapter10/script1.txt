#/bin/bash


#Description: Signal handler
 

function handler()


{


 echo Hey, received signal : SIGINT


}


# $$ is a special variable that returns process ID of current


# process/script


echo My process ID is $$


#handler is the name of the signal handler function for SIGINT signal


trap 'handler' SIGINT


while true;


do


 sleep 1


done
