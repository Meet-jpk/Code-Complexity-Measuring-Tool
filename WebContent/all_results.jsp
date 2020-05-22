<%@page import="tool.service.*"%>
<%@page import="tool.model.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Measuring Tool</title>
	<link rel="stylesheet" href="../ComplexityMTool/assets/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/main.css">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
</head>
<body>
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
		        <a class="nav-link font-weight-bold text-light" href="index.jsp" data-toggle="modal">Home</a>
	        </li>
	        <li class="nav-item">
		        <a class="nav-link font-weight-bold text-light" href="index.jsp" data-toggle="modal">Log Out</a>
	        </li>
	      </ul>
	  </div>
	</nav>
		
	<div class="container">
	<br>
	  <div class="row">
	  	<div class="col">
	  	
	  	<div class="form-group">
				<button type="button" class="btn btn-outline-primary float-left" id="ofiles" onclick="clicks()">Open File</button>
		</div>			
	  	</div>
	  	<div class="col">
			  <div class="form-group">
				<button type="button" class="btn btn-outline-primary float-right" onClick="location.href='test_code.jsp'">Change Weight</button>
			</div>  
	  	</div>
  	</div>
  	<br>
  	
<form action="test_code.jsp">
  	<div class="row">
	  	<div class="col">
			<div class="form-group">
	  			<textarea rows="20" cols="6" class="form-control" name="test_code" required><%=session.getAttribute("test_code").toString() %></textarea>
	  		</div>
		<!-- <div class="form-group">
				<button type="button" class="btn btn-outline-primary float-left" id="ofiles" onclick="clicks()">Open File</button>
				<input type="file" class="d-none" id="attachment" accept=".java">
		</div> -->
	  	</div>
	  	<div class="col">
	  		<div class="border">
		  		<div class="p-2" style="height: 490px;max-height:75%;overflow-y: scroll;">
		  			<div id="sizeFactor">
		  			<br>
		  				<h5 align="center">complexity of a program due to all the factors</h5>
		  				<table class="table">
  							<thead class="thead-light">
			  					<tr>
			  						<th>Line no</th>
			  						<th>Program statements</th>
			  						<th>Cs</th>
			  						<th>Cv</th>
			  						<th>Cm</th>
			  						<th>Ci</th>
			  						<th>Ccp</th>
			  						<th>Ccs</th>
			  						<th>TCps</th>
			  					</tr>
			  				</thead>
			  				<tbody>
			  					<%
			  						codeSizeService test = new codeSizeService();
									ArrayList<size> arrayList = test.test(session.getAttribute("test_code").toString());
									
									VariableService test1 = new VariableService();
									ArrayList<Variables> arrayList1 = test1.test(session.getAttribute("test_code").toString());
									
									methodService test2 = new methodService();
									ArrayList<Methods> arrayList2 = test2.test(session.getAttribute("test_code").toString());
									
									CouplingService test5 = new CouplingService();
									ArrayList<Coupling> arrayList5 = test5.test(session.getAttribute("test_code").toString());
									
									controlStructureService test3 = new controlStructureService();
				  					int condition= 2;
				  					int loop = 3;
				  					int switchCase= 2;
				  					int caseOnly=1;
									ArrayList<Control> arrayList3 = test3.test(session.getAttribute("test_code").toString(),condition,loop,switchCase,caseOnly);
									
									int totalCs=0;
									int totalCv=0;
									int totalCm=0;
									int totalCcs=0;
									int totalCi=0;
									int totalCcp=0;
									
									InheritanceService test4 = new InheritanceService();
									ArrayList<Inheritance> arrayList4 = test4.test(session.getAttribute("test_code").toString());
									
									for (int i = 0; i <arrayList4.size();i++) {
										int Ci=arrayList4.get(i).getDirect()+arrayList4.get(i).getIndirect();;
										if(Ci==0){
											Ci=0;
										}else if(Ci==1){
							                Ci=1;
							            }else if(Ci==2){
							                Ci=2;
							            }else if(Ci==3){
							                Ci=3;
							            }else if(Ci>4){
							                Ci=4;
							            }
										totalCi=totalCi+Ci;
									}
									
									for (int i = 0; i <arrayList.size();i++) {
										
										int Cs =arrayList.get(i).getKeyword()+arrayList.get(i).getIdentifier()+arrayList.get(i).getOperator()+arrayList.get(i).getNumerical()+arrayList.get(i).getStringCount();
										totalCs=totalCs+Cs;
										
										int Wvs =(arrayList1.get(i).getGlobal()*2)+arrayList1.get(i).getLocal();
							            
							            int Npdtv = arrayList1.get(i).getGlobal()+arrayList1.get(i).getLocal();
							            
							            int Cv = Wvs*(Npdtv+arrayList1.get(i).getComposite()*2);
										
							            totalCv=totalCv+Cv;
										
										int Wmrt =(arrayList2.get(i).getComposite_method()*2)+arrayList2.get(i).getPrimitive_method();
							            
							            int Cm = Wmrt+(arrayList2.get(i).getPrimitive_parameters()+(arrayList2.get(i).getComposite_parameters()*2));
										
							            totalCm=totalCm+Cm;
							            
							            int Ccs = (arrayList3.get(i).getLine_weight()*arrayList3.get(i).getNo_of_control())+arrayList3.get(i).getCspps();
										
							            totalCcs=totalCcs+Ccs;
							            
										int Nr=arrayList5.get(i).getRecursive()*2;
										
										int Nmcms=arrayList5.get(i).getRegular_regular()*2;
										
										int Nmcrms=arrayList5.get(i).getRegular_recursive()*3;
										
										int Nrmcrms=arrayList5.get(i).getRecursive_recursive()*4;
										
										int Nrmcms=arrayList5.get(i).getRecursive_regular()*3;
										
										int Ccp =Nr+Nmcms+Nmcrms+Nrmcrms+Nrmcms+arrayList5.get(i).getRegular_global()+arrayList5.get(i).getRegular_regular();
							            
										totalCcp=totalCcp+Ccp;
										
										int rowTotal=Cs+Cv+Cm+Ccp+Ccs;
										
								%>
			  					<tr>
			  						<td><%=arrayList.get(i).getLineNumber() %></td>
			  						<td><%=arrayList.get(i).getLine() %></td>
			  						<td><%=Cs %></td>
			  						<td><%=Cv %></td>
			  						<td><%=Cm %></td>
			  						<td>0</td>
			  						<td><%=Ccp %></td>
			  						<td><%=Ccs %></td>
			  						<td><%=rowTotal %></td>
			  					</tr>
			  					<% 
									}	
									int total=totalCs+totalCv+totalCm+totalCi+totalCcp+totalCcs;
								%>
								<tr>
			  						<td></td>
			  						<td>Total</td>
			  						<td><%=totalCs %></td>
			  						<td><%=totalCv %></td>
			  						<td><%=totalCm %></td>
			  						<td><%=totalCi %></td>
			  						<td><%=totalCcp %></td>
			  						<td><%=totalCcs %></td>
			  						<td><%=total %></td>
			  					</tr>
			  				</tbody>
		  				</table>
		  			</div>
		  		</div>
	  		</div>
	  		<br>
  			<div class="form-group">
  				<input type="submit" class="btn btn-outline-primary float-right" value="Calculate" style="width:250px;margin-right:220px;">
  			</div>
	  	</div>
	  </div>
  	</div>
  	</form>
  	
  	<br>
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
          </a>
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
  	
</body>
</html>