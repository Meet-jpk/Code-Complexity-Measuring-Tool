<%@page import="java.io.PrintWriter"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<link rel="stylesheet" type="text/css" href="assets/css/main.css">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Home</title>

<script> 
	/* validations */
	function validateCustomerRegister()
	{ 
		 var name = document.signUp.name.value;
		 var userName = document.signUp.userName.value;
		 var email = document.signUp.email.value;
		 var password1 = document.signUp.password1.value; 
		 var password2 = document.signUp.password2.value;
		 var zip = document.signUp.zip.value;
		 var contactNumber = document.signUp.contactNumber.value;
		 
		 if (name == null || name == "")
		 { 
			 alert("Name can't be blank"); 
			 return false; 
		 }
		 else if (userName == null || userName == "")
		 { 
			 alert("User Name can't be blank"); 
			 return false; 
		 }
		 else if (email == null || email == "")
		 { 
			 alert("Email Address can't be blank"); 
			 return false; 
		 }
		 else if (password1 == null || password1 == "")
		 { 
			 alert("Password can't be blank"); 
			 return false; 
		 }
		 else if(password1.length < 6)
		 { 
			 alert("Password must be at least 6 characters long."); 
			 return false; 
		 } 
		 else if (password2 == null || password2 == "")
		 { 
			 alert("Re-entered Password can't be blank"); 
			 return false; 
		 }
		 else if (password1 != password2)
		 { 
			 alert("Both Passwords should be same"); 
			 return false; 
		 } 
		 
		 else if (zip == null || zip == "")
		 { 
			 alert("ZIP code can't be blank"); 
			 return false; 
		 }
		 else if (zip.length != 5)
		 { 
			 alert("ZIP code has only 5 numbers"); 
			 return false; 
		 }
		 else if (contactNumber == null || contactNumber == "")
		 { 
			 alert("Contact Number can't be blank"); 
			 return false; 
		 }
		 else if (contactNumber.length != 10 )
		 { 
			 alert("Contact Number has only 10 digits"); 
			 return false; 
		 }
		 
		 
	 } 
	
	function validateLogin()
	{ 
		 var uname = document.login.uname.value;
		 var pass = document.login.pass.value; 

		 if (uname == null || uname == "")
		 { 
			 alert("Please Enter Valid User Name...!!!"); 
			 return false; 
		 }

		 else if (pass == null || pass == "")
		 { 
			 alert("Please Enter Password...!!!"); 
			 return false; 
		 }
	 } 
	
	function validateInquiry()
	{ 
		 var userName = document.contactUS.userName.value;
		 var msg = document.contactUS.msg.value; 

		 if (userName == null || userName == "")
		 { 
			 alert("Please Enter User Name...!!!"); 
			 return false; 
		 }

		 else if (msg == null || msg == "")
		 { 
			 alert("Please Enter Messege...!!!"); 
			 return false; 
		 }
	 } 	
</script> 

<style>
	img:hover {
  	transform: scaleX(-1);
}
</style>

</head>
<body>

<!-- navigation bar -->
<nav class="navbar navbar-expand-lg bg-dark">
  <a class="navbar-brand font-weight-bold text-light">Code Complexity Measuring Tool</a>
 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button> 

  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">

      <li class="nav-item">
        <a class="nav-link" href="#" tabindex="-1" data-toggle="modal" data-target="#myModal-write-to-us" ></a>
      </li>
    </ul>

	<ul class="navbar-nav  mt-2  ">
	    <span>&nbsp &nbsp</span>
	      <li class="nav-item">
	        <a class="nav-link font-weight-bold text-light" href="#" data-toggle="modal" data-target="#myModal-login">Login</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link font-weight-bold text-light" href="#" data-toggle="modal" data-target="#myModal-customer-signup">SignUp</a>
        </li>    
         <li class="nav-item">
	        <a class="nav-link font-weight-bold text-light" href="#" data-toggle="modal"  data-target="#my-ContactUs">ContactUs</a>
        </li>
      </ul>
    
  </div>
</nav>

	<!--end navigation bar -->

<div class="container">

  <!-- Modal login-->
  <div class="modal fade" id="myModal-login" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title ">Login</h4>

        </div>
        <div class="modal-body">
            <form action="Login" method="post" class="" name="login" onsubmit="return validateLogin()">            

		  <div class="form-row">
		    
		    <div class="col-md-12">
		      <label for="">User Name</label>
		      <input type="text" name="uname" class="form-control" id="" placeholder="User name" >
		
		    </div>
		    <div class="col-md-12">
		      <label for="">Password</label>
		      <input type="password" name="pass" class="form-control" id="" placeholder="Password" >
		    </div>
		  </div>
		<br>
		  <input type="submit"  class="btn btn-outline-primary" placeholder="Login" onClick="location.href='index.jsp'" value="Login"/> 
		  <span>&nbsp;</span>
		  <button class="btn btn-outline-primary" type="reset">Clear</button>
		</form>
		        </div>
		      </div>
		      
		    </div>
		  </div>
		  
		</div><!-- End Modal login-->


<div class="container">

  <!-- Modal  signup-->
  <div class="modal fade" id="myModal-customer-signup" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Sign Up</h4>
          
        </div>
        <div class="modal-body">
          <form action="SignUp" method="post" class="" name="signUp" onsubmit="return validateCustomerRegister()">    
               
		  	<div class="form-row">
		  	
		    <div class="col-md-12 mb-3">
		      <label for="">Name</label>
		      <input type="text" name="name" class="form-control" id="" placeholder="Enter your Name" >
		
		    </div>
		    <div class="col-md-12 mb-3">
		      <label for="">User name</label>
		      <input type="text" name="userName" class="form-control" id="" placeholder="Enter your Username" >
		
		    </div>
		    
		              <div class="col-md-12 mb-3">
		    <label for="">Email</label>
		      <input type="text" name="email" class="form-control" id="" placeholder="Enter Your Email Address" >
		    </div>
		    
		     <div class="col-md-6 mb-3">
		      <label for="">Password</label>
		      <input type="password" name="password1" class="form-control" id="" placeholder="Enter Password" >
		    </div>
		  
		      <div class="col-md-6 mb-3">
		      <label for="">Re-enter Password</label>
		      <input type="password" name="password2" class="form-control" id="" placeholder="Re-Enter Password" >
		    </div>
		    
		     <div class="col-md-6 mb-3">
		      <label for="">Contact Number</label>
		      <input type="number" name="contactNumber" class="form-control" id="" placeholder="Contact Number" >
		    </div>
		    
		    <div class="col-md-6 mb-3">
		      <label for="">ZIP</label>
		      <input type="number" name="zip" class="form-control" id="" placeholder="ZIP code" >
		    </div>    
		  </div>
		
		  <input type="submit"  class="btn btn-outline-primary" placeholder="SignUp"  onClick="location.href='index.jsp'" value="SignUp"/>
		  <span>&nbsp;</span>
		  <button class="btn btn-outline-primary" type="reset">Clear</button>
		
		</form>
        </div>
      </div>
      
    </div>
  </div>
  
</div><!-- End Modal signup--> 

<!-- Contact Us-->
<div class="container">

  <!-- Modal login-->
  <div class="modal fade" id="my-ContactUs" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title ">Contact Us</h4>

        </div>
        <div class="modal-body">
            <form action="ContactUs" method="post" class="" name="contactUS" onsubmit="return validateInquiry()">            

		  <div class="form-row">
		    
		    <div class="col-md-12">
		      <label for="">User Name</label>
		      <input type="text" name="userName" class="form-control" id="" placeholder="User name" >
		
		    </div>
		    <div class="col-md-12">
		      <label for="">Message</label>
		      <input type="text" name="msg" class="form-control" id="" placeholder="Message" >
		    </div>
		  </div>
		  <br>
		  <input type="submit"  class="btn btn-outline-primary" placeholder="Submit" onClick="location.href='index.jsp'" value="Submit"/> 
		  <span>&nbsp;</span>
		  <button class="btn btn-outline-primary" type="reset">Clear</button>
		</form>
		        </div>
		      </div>     
		    </div>
		  </div>
		  
		</div>
<!-- Contact Us-->
			
<!-- Try out Code-->

 	<div class="bg-white py-5">
  <div class="container">
    <div class="row mb-4">
      <div class="col-lg-5">
        <h2 class="display-4 font-weight-light">Try Out Your Code</h2>
      </div>
    </div>
		  <div class="row justify-content-md-center">
		    <div class="col-md-auto">
		      <img src="assets/img/logo3.png" alt="logo"  width="200" height="200">
		    </div>
		  </div>
		  
	 <div class="row justify-content-md-center">
	    <div class="col-md-auto">
	     <br>
		 <input type="submit"  class="btn btn-outline-primary" placeholder="Let's Strat"  onClick="location.href='test_code.jsp'" value="Let's Strat" width="20px" height="20px" />
		<br>
	    </div>
	  </div>	  
		</div>
	</div>		
<!--End Try out Code-->

	<!-- About Us -->

	<div class="bg-light">
	  <div class="container">
	    <div class="row h-100 align-items-center py-5">
	      <div class="col-lg-6">
	        <h1 class="display-4">About Us</h1>
	        <p class="lead text-muted mb-0">What we're about
	        Complexity of a code base is a measure of the quality of the code that the programmer writes it help to see vulnerabilities,
	        
	        duplication happen in code and help to reduce the redeclaration of variables in a program.
	        
	        So, since it is a very import aspect to every programmer to verify the code quality of you code base we have made it easy through our solution.
	        
	        Although there are many complexity measure tools exists most of them don not have the ability to calculate the complexity when a folder structure containing list of files is scanned and apart from that our solution show the complexity details of the each and every line in all the files which will help the programmer to identify where you can reduce the complexity of the program..
	       </p>
	      </div>
	      <div class="col-lg-6 d-none d-lg-block"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834136/illus_kftyh4.png" alt="" class="img-fluid"></div>
	    </div>
	  </div>
	</div>

		<!-- End About Us -->

	<!-- Learn More About Functions-->
	<div class="bg-white py-5">
	  <div class="container">
	    <div class="row align-items-center mb-5">
	      <div class="col-lg-6 order-2 order-lg-1"><i class="fa fa-bar-chart fa-2x mb-3 text-primary"></i>
	        <h2 class="font-weight-light">Code Complexity Measuring Tool Research</h2>
	        <p class="font-italic text-muted mb-4">According to SLLIT 3rd year 1st Semester ITPM module we had to develop a code complexity measuring tool to measure the complexity of a given code. As a group, we made a solution to measure the complexity of a java program.</p>
	        <a href="https://ceylontechniblog2020.blogspot.com/b/post-preview?token=APq4FmBwj5ysC5bYSwPkXX00FYRpnGYM_ZfO3g0DGgrAmOpF6A8bv8z4caVJkcfqMtfRkfCbF_No8cXdzvEXTwNiV5Er6EOb1IT_Mzq01PQvtiqJVfUKc9MKStt_gznZojazCoMlLQ7J&postId=2469410254875196548&type=POST" class="btn btn-light px-5 rounded-pill shadow-sm">Learn More</a>
	      </div>
	      <div class="col-lg-5 px-5 mx-auto order-1 order-lg-2"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834139/img-1_e25nvh.jpg" alt="" class="img-fluid mb-4 mb-lg-0"></div>
	    </div>
	    <div class="row align-items-center">
	      <div class="col-lg-5 px-5 mx-auto"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834136/img-2_vdgqgn.jpg" alt="" class="img-fluid mb-4 mb-lg-0"></div>
	      <div class="col-lg-6"><i class="fa fa-leaf fa-2x mb-3 text-primary"></i>
	        <h2 class="font-weight-light">Object Oriented Programming (OOPs) Concept in Java</h2>
	        <p class="font-italic text-muted mb-4">Object-oriented programming: As the name suggests, Object-Oriented Programming or OOPs refers to languages that uses objects in programming. Object-oriented programming aims to implement real-world entities like inheritance, hiding, polymorphism etc in programming. The main aim of OOP is to bind together the data and the functions that operate on them so that no other part of the code can access this data except that function..</p>
	        <a href="https://www.geeksforgeeks.org/object-oriented-programming-oops-concept-in-java/" class="btn btn-light px-5 rounded-pill shadow-sm">Learn More</a>
	      </div>
	    </div>
	  </div>
	</div>

<!-- Team -->
	<div class="bg-light py-5">
  <div class="container">
    <div class="row mb-4">
      <div class="col-lg-5">
        <h2 class="display-4 font-weight-light">Our team</h2>
        <p class="font-italic text-muted">Students Of Sri Lanka institute of Infromation Technology</p>
      </div>
    </div>

    <div class="row text-center">
      <!-- Team item-->
      <div class="col-xl-3 col-sm-6 mb-5">
        <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834132/avatar-4_ozhrib.png" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
          <h5 class="mb-0">Chethana</h5><span class="small text-uppercase text-muted">Group Leader</span>
          <ul class="social mb-0 list-inline mt-3">
            <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-facebook-f"></i></a></li>
            <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-twitter"></i></a></li>
            <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-instagram"></i></a></li>
            <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-linkedin"></i></a></li>
          </ul>
        </div>
      </div>
      <!-- End-->

      <!-- Team item-->
      <div class="col-xl-3 col-sm-6 mb-5">
        <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834130/avatar-3_hzlize.png" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
          <h5 class="mb-0">Thisura</h5><span class="small text-uppercase text-muted">Developer</span>
          <ul class="social mb-0 list-inline mt-3">
            <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-facebook-f"></i></a></li>
            <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-twitter"></i></a></li>
            <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-instagram"></i></a></li>
            <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-linkedin"></i></a></li>
          </ul>
        </div>
      </div>
      <!-- End-->

      <!-- Team item-->
      <div class="col-xl-3 col-sm-6 mb-5">
        <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834133/avatar-2_f8dowd.png" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
          <h5 class="mb-0">Ramesh</h5><span class="small text-uppercase text-muted">Developer</span>
          <ul class="social mb-0 list-inline mt-3">
            <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-facebook-f"></i></a></li>
            <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-twitter"></i></a></li>
            <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-instagram"></i></a></li>
            <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-linkedin"></i></a></li>
          </ul>
        </div>
      </div>
      <!-- End-->

      <!-- Team item-->
      <div class="col-xl-3 col-sm-6 mb-5">
        <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834132/avatar-4_ozhrib.png" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
		<h5 class="mb-0">Isurangi</h5><span class="small text-uppercase text-muted">Tester</span>
          <ul class="social mb-0 list-inline mt-3">
            <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-facebook-f"></i></a></li>
            <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-twitter"></i></a></li>
            <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-instagram"></i></a></li>
            <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-linkedin"></i></a></li>
          </ul>
        </div>
      </div>
      <!-- End-->

    </div>
  </div>
</div>
	<!--End Team -->


<!-- Footer -->
<footer class="page-footer font-small bg-dark pt-4">

  <!-- Footer Links -->
  <div class="container text-center text-md-left">

    <!-- Footer links -->
    <div class="row text-center text-md-left mt-3 pb-3">

      <!-- Grid column -->
      <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
        <h6 class="text-uppercase mb-4 font-weight-bold text-light">About us</h6>
        <p class=" text-light">What we're about
	        Complexity of a code base is a measure of the quality of the code that the programmer writes it help to see vulnerabilities, 
	        duplication happen in code and help to reduce the redeclaration of variables in a program. 
	        
	    </p>
      </div>
      <!-- Grid column -->

      <hr class="w-100 clearfix d-md-none">

      <!-- Grid column -->
      <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
        <h6 class="text-uppercase mb-4 font-weight-bold text-light">Products</h6>
        <p>
          <a href="https://dzone.com/articles/measuring-code-complexity">Cyclomatic Complexity</a>
        </p>
        <p>
          <a href="https://doc-archives.microstrategy.com/producthelp/10.7/AdvancedReportingGuide/WebHelp/Lang_1033/Content/AdvancedReporting/Creating_a_conditional_metric.htm">Conditional Metrics</a>
        </p>
        <p>
          <a href="https://www.verifysoft.com/en_linesofcode_metrics.html">Lines of Code Metrics</a>
        </p>
        <p>
          <a href="https://www.verifysoft.com/en_halstead_metrics.html">Halstead Metrics</a>
        </p>
      </div>
      <!-- Grid column -->

      <hr class="w-100 clearfix d-md-none">

      <!-- Grid column -->
      <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
        <h6 class="text-uppercase mb-4 font-weight-bold text-light">Useful links</h6>
        <p>
		  <a href="https://stackoverflow.com/questions/2370288/is-there-any-sizeof-like-method-in-java/">Size</a>
		</p> 
        <p>
		 <a href="https://www.cprogramming.com/tutorial/java/syntax-differences-java-c++.html/">Methods</a>
		</p>
        <p>
          <a href="https://www.quora.com/What-is-the-difference-between-C-and-Java-with-variables/">Variables</a>
        </p>
        <p>
          <a href="https://www.geeksforgeeks.org/inheritance-in-java/">Inheritance</a>
        </p>
        <p>
          <a href="https://www.interviewsansar.com/loose-coupling-and-tight-coupling-in-java/">Coupling</a>
        </p>
        <p>
          <a href="https://www.informit.com/articles/article.aspx?p=1321841&seqNum=2/">Control Structure</a>
        </p>
      </div>

      <!-- Grid column -->
      <hr class="w-100 clearfix d-md-none">

      <!-- Grid column -->
      <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
        <h6 class="text-uppercase mb-4 font-weight-bold text-light">Contact</h6>
        <p class="text-light">
          <i class="fa fa-home" aria-hidden="true"></i> SLIIT,Malabe, Kandy Road</p>
        <p class="text-light">
          <i class="fa fa-envelope-o" aria-hidden="true"></i> StudentInfo@gmail.com</p>
        <p class="text-light">
          <i  class="fa fa-phone" aria-hidden="true"></i> + 94 11 234 567 88</p>
        <p class="text-light">
          <i class="fa fa-print" aria-hidden="true"></i> + 94 11 234 567 89</p>
      </div>
      <!-- Grid column -->

    </div>
    <!-- Footer links -->

    <hr>

    <!-- Grid row -->
    <div class="row d-flex align-items-center">

      <!-- Grid column -->
      <div class="col-md-7 col-lg-8">

        <!--Copyright-->
        <p class="text-center text-md-left text-light" >© 2020 Copyright : Code Complexity Measuring Tool
        </p>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-5 col-lg-4 ml-lg-0">

        <!-- Social buttons -->
        <div class="text-center text-md-right">
          <ul>
          <li class="socialMedia "><a href="#"  ><i class="fa fa-facebook"></i></a></li>
          <li class="socialMedia"><a href="#"  ><i class="fa fa-twitter"></i></a></li>
          <li class="socialMedia"><a href="#"  ><i class="fa fa-linkedin"></i></a></li>
          <li class="socialMedia"><a href="#"  ><i class="fa fa-instagram"></i></a></li>
          <li class="socialMedia"><a href="#"  ><i class="fa fa-pinterest"></i></a></li>
          </ul>
        </div>

      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

</footer>
<!-- Footer -->

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>



</body>
</html>