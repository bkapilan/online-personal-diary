<?php
    include "../database/database.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Sign Up</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body style="background-color: #999999;">
	
	<div class="limiter">
		

			<div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50">

				<?php
						use PHPMailer\PHPMailer\PHPMailer;

                        if(isset($_POST["submit"])) {
							$sql = "SELECT * FROM user_account WHERE email = '{$_POST["email"]}'";
							$res = $db->query($sql);
							
							if($res->num_rows > 0) {
								echo '<script type="text/javascript">
										window.onload = function()
										{alert("Email address already taken!");}
										</script>';
								if(($_POST["pass"]) != ($_POST["cpass"])) {
									echo '<script type="text/javascript">
										window.onload = function()
										{alert("Email address already taken!\nPassword doesn\'t match!");}
										</script>';
								}
							}
							else {
								if(($_POST["pass"]) != ($_POST["cpass"])) {
									echo '<script type="text/javascript">
										window.onload = function()
										{alert("Password doesn\'t match!");}
										</script>';
								}
								else {
									
									//Sanitize form data
									$name = $db->real_escape_string($_POST["name"]);
									$email = $db->real_escape_string($_POST["email"]);
									

									//Generate token
									$token = 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM01234567890!$/()*';
									$token = str_shuffle($token);
									$token = substr($token, 0, 10);

									//Password encryption
									$hashedPassword = password_hash($_POST["pass"], PASSWORD_BCRYPT);
									$chashedPassword = password_hash($_POST["cpass"], PASSWORD_BCRYPT);

									//Insert into database
									$sql = "INSERT INTO user_account (name, email, pass, cpass, isEmailConfirmed, token)
                                		VALUES ('$name', '$email', '$hashedPassword', '$chashedPassword', '0', '$token')";
									$db->query($sql);
									
									if($db) {
										/*
										//Send Email
										$to = $email;
										$subject = "Please verify email!";
										$message = "Please click on the link below:<br><br>
													<a href='http://localhost/OPD/other/login/login.php?
																token=$token'>Verify Email Here!</a>";
										$headers = "From: hello@opdiary.com \r\n";

										mail($to, $subject, $message, $headers);

										header('location: verifyEmail.php');
										*/


										$to = $email; // Send email to our user
										$subject = 'Signup | Verification'; // Give the email a subject 
										$message = '
										
										Thanks for signing up!
										Your account has been created, you can login with the following credentials after you have activated your account by pressing the url below.
										
										------------------------
										Username: '.$name.'
										------------------------
										
										Please click this link to activate your account:
										http://localhost/OPD/other/login/login.php?token=$token
										'; // Our message above including the link
															
										$headers = 'From:noreply@yourwebsite.com' . "\r\n"; // Set from headers
										mail($to, $subject, $message, $headers); // Send our email

										
										header('location: verifyEmail.php');





										echo '<script type="text/javascript">
											window.onload = function()
											{alert("User Registration Success!");}
											</script>';
									}
									else {
										echo '<script type="text/javascript">
											window.onload = function()
											{alert("Error!");}
											</script>';
									}


									/*
									include_once "PHPMailer/PHPMailer.php";

									$mail = new PHPMailer();
									$mail->setFrom(address: 'hello@opdiary.com');
									$mail->addAddress($_POST["email"], $_POST["name"]);
									$mail->Subject = "Please verify email!";
									$mail->isHTML(isHTML: true);
									$mail->Body = "
										Please click on the link below:<br><br>

										<a href='http://localhost/OPD/other/login/login.php?email=$_POST["email"]&token=$token'></a>  
									";
									if($mail->send()) {
										echo '<script type="text/javascript">
											window.onload = function()
											{alert("User Registration Success!\nPlease verify your email!");}
											</script>';
									}
									else {
										echo '<script type="text/javascript">
											window.onload = function()
											{alert("Wrong!");}
											</script>';
									}
									*/

									
								}
							}
						}
                    ?>


				<form class="login100-form validate-form" action="<?php echo $_SERVER["PHP_SELF"]; ?>" method="post">
					<span class="login100-form-title p-b-59">
						Sign Up Here
					</span>

					<div class="wrap-input100 validate-input" data-validate="Name is required">
						<span class="label-input100">Full Name</span>
						<input class="input100" type="text" name="name" placeholder="Name...">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<span class="label-input100">Email</span>
						<input class="input100" type="text" name="email" placeholder="Email addess...">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="pass" placeholder="*************">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Confirm Password is required">
						<span class="label-input100">Confirm Password</span>
						<input class="input100" type="password" name="cpass" placeholder="*************">
						<span class="focus-input100"></span>
					</div>
<!--
					<div class="wrap-input100 validate-input">
						<span class="label-input100">Time Zone</span>
						<select class="input100" name="timezone" required>
                                        <option value="-12:00">(GMT -12:00) Eniwetok, Kwajalein</option>
                                        <option value="-11:00">(GMT -11:00) Midway Island, Samoa</option>
                                        <option value="-10:00">(GMT -10:00) Hawaii</option>
                                        <option value="-09:50">(GMT -9:30) Taiohae</option>
                                        <option value="-09:00">(GMT -9:00) Alaska</option>
                                        <option value="-08:00">(GMT -8:00) Pacific Time (US &amp; Canada)</option>
                                        <option value="-07:00">(GMT -7:00) Mountain Time (US &amp; Canada)</option>
                                        <option value="-06:00">(GMT -6:00) Central Time (US &amp; Canada), Mexico City</option>
                                        <option value="-05:00">(GMT -5:00) Eastern Time (US &amp; Canada), Bogota, Lima</option>
                                        <option value="-04:50">(GMT -4:30) Caracas</option>
                                        <option value="-04:00">(GMT -4:00) Atlantic Time (Canada), Caracas, La Paz</option>
                                        <option value="-03:50">(GMT -3:30) Newfoundland</option>
                                        <option value="-03:00">(GMT -3:00) Brazil, Buenos Aires, Georgetown</option>
                                        <option value="-02:00">(GMT -2:00) Mid-Atlantic</option>
                                        <option value="-01:00">(GMT -1:00) Azores, Cape Verde Islands</option>
                                        <option value="+00:00" selected="selected">(GMT) Western Europe Time, London, Lisbon, Casablanca</option>
                                        <option value="+01:00">(GMT +1:00) Brussels, Copenhagen, Madrid, Paris</option>
                                        <option value="+02:00">(GMT +2:00) Kaliningrad, South Africa</option>
                                        <option value="+03:00">(GMT +3:00) Baghdad, Riyadh, Moscow, St. Petersburg</option>
                                        <option value="+03:50">(GMT +3:30) Tehran</option>
                                        <option value="+04:00">(GMT +4:00) Abu Dhabi, Muscat, Baku, Tbilisi</option>
                                        <option value="+04:50">(GMT +4:30) Kabul</option>
                                        <option value="+05:00">(GMT +5:00) Ekaterinburg, Islamabad, Karachi, Tashkent</option>
                                        <option value="+05:50">(GMT +5:30) Bombay, Calcutta, Madras, New Delhi</option>
                                        <option value="+05:75">(GMT +5:45) Kathmandu, Pokhara</option>
                                        <option value="+06:00">(GMT +6:00) Almaty, Dhaka, Colombo</option>
                                        <option value="+06:50">(GMT +6:30) Yangon, Mandalay</option>
                                        <option value="+07:00">(GMT +7:00) Bangkok, Hanoi, Jakarta</option>
                                        <option value="+08:00">(GMT +8:00) Beijing, Perth, Singapore, Hong Kong</option>
                                        <option value="+08:75">(GMT +8:45) Eucla</option>
                                        <option value="+09:00">(GMT +9:00) Tokyo, Seoul, Osaka, Sapporo, Yakutsk</option>
                                        <option value="+09:50">(GMT +9:30) Adelaide, Darwin</option>
                                        <option value="+10:00">(GMT +10:00) Eastern Australia, Guam, Vladivostok</option>
                                        <option value="+10:50">(GMT +10:30) Lord Howe Island</option>
                                        <option value="+11:00">(GMT +11:00) Magadan, Solomon Islands, New Caledonia</option>
                                        <option value="+11:50">(GMT +11:30) Norfolk Island</option>
                                        <option value="+12:00">(GMT +12:00) Auckland, Wellington, Fiji, Kamchatka</option>
                                        <option value="+12:75">(GMT +12:45) Chatham Islands</option>
                                        <option value="+13:00">(GMT +13:00) Apia, Nukualofa</option>
                                        <option value="+14:00">(GMT +14:00) Line Islands, Tokelau</option>
                                    </select>
					</div>


					<div class="wrap-input100 validate-input">
						<span class="label-input100">Gender</span>
						<label><input class="input100" type="radio" name="gender" value="M" data-validate = "Must Select">Male</label>
                    	<label><input class="input100" type="radio" name="gender" value="F" data-validate = "Must Select">Female</label>
						
					</div>
-->
					
		
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" type="submit" name="submit">
								Sign Up
							</button>
						</div>

						<a href="../login/login.php" class="dis-block txt3 hov1 p-r-30 p-t-10 p-b-10 p-l-30">
							Log in
							<i class="fa fa-long-arrow-right m-l-5"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>