#Filename: automate_expect.tcl

spawn ./backup.sh
 
expect {

 "*folder*" {

  send "notes\n"

  exp_continue
 
 }

 "*type*" {

   send "docx\n"

   exp_continue

  }

}
