<?php 

  // hide all basic notices from PHP
  error_reporting(E_ALL ^ E_NOTICE);

  echo "Started\n";

  // Get Variables
  $name = $_POST['visitorName'];
  echo "Name: $name\n";
  $email = $_POST['visitorMail'];
  echo "Mail: $email\n";
  $comments = $_POST['visitorMessage'];
  echo "Message: $comments\n";
		
  $emailTo = 'simvascular@gmail.com';
  $subject = 'Submitted svSite message from '.$name;
  $body = "Name: $name \n\nEmail: $email \n\nComments: $comments";
  $headers = 'From: ' .' <'.$emailTo.'>' . "\r\n" . 'Reply-To: ' . $email;

  if(mail($emailTo, $subject, $body, $headers)){
    echo "Mail Sent\n";
  }else{
    echo "Mail Not Sent\n";
  }
        
  // set our boolean completion value to TRUE
  $emailSent = true;

  echo "Finish.\n";

?>