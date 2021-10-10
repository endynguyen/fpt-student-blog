

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account Page</title>        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
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
    <body>
        <div class="limiter">
            <div class="container-login100" style="background-image: url('images/bg-01.jpg');">
                <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                    <jsp:useBean id="USER_ERROR" class="group1.dto.UserError">
                        <jsp:setProperty name="USER_ERROR" property="userIDError" value="1234"/>
                    </jsp:useBean>
                    <form class="login100-form validate-form" action="MainController" method="POST" >
                        <span class="login100-form-title p-b-49">
                            Create Acount
                        </span>
                        <div class="wrap-input100 validate-input m-b-23" data-validate = "UserID is empty">
                            <span class="label-input100">UserID</span>
                            <input class="input100" type="text" name="userID" placeholder="Type your userID">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div>
                        <p class="label-input100">${requestScope.USER_ERROR.getUserIDError()}</p>
                        <div class="wrap-input100 validate-input m-b-23" data-validate = "Name is empty">
                            <span class="label-input100">Full Name</span>
                            <input class="input100" type="text" name="name" placeholder="Type your Full Name">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div>
                        <p class="label-input100">${requestScope.USER_ERROR.getNameError()}</p>
                        <div class="wrap-input100 validate-input m-b-23" data-validate="Password is required">
                            <span class="label-input100">Password</span>
                            <input class="input100" type="password" name="password" placeholder="Type your password">
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                        </div>
                        <p class="label-input100">${requestScope.USER_ERROR.getConfirmError()}</p>
                        <div class="wrap-input100 validate-input m-b-23" data-validate="Password is required">
                            <span class="label-input100">Confirm Password</span>
                            <input class="input100" type="password" name="confirm" placeholder="Type your confirm password">
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                        </div>
                        <p class="label-input100">${requestScope.USER_ERROR.getConfirmError()}</p>
                        <div class="wrap-input100 validate-input m-b-23">
                            <span class="label-input100">Phone Number</span>
                            <input class="input100" type="text" name="phone" placeholder="Type your Phone Number">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div>
                        <div class="wrap-input100 validate-input m-b-23">
                            <span class="label-input100">Email Address</span>
                            <input class="input100" type="text" name="email" placeholder="Type your Email Address">
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div>
                        <input type="hidden" name="role" value="US">
                        <p class="label-input100">${requestScope.USER_ERROR.getMessageError()}</p>
                        <div class="text-right p-t-8 p-b-31">
                            <a href="login.jsp">
                                Have an account ? Sign in 
                            </a>
                        </div>
                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button type="submit" name="action" value="Create" class="login100-form-btn">
                                    Create
                                </button>                           
                            </div>
                        </div>

                        <div class="txt1 text-center p-t-54 p-b-20">
                            <span>
                                Or Sign Up Using
                            </span>
                        </div>

                        <div class="flex-c-m">
                            <a href="#" class="login100-social-item bg1">
                                <i class="fa fa-facebook"></i>
                            </a>

                            <a href="#" class="login100-social-item bg2">
                                <i class="fa fa-twitter"></i>
                            </a>

                            <a href="#" class="login100-social-item bg3">
                                <i class="fa fa-google"></i>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div id="dropDownSelect1"></div>

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
