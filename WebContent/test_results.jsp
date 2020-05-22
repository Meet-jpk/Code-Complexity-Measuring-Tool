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
	  	</div>   

	  	<div class="col">
	  		<div class="border">
		  		<div class="p-2" style="height: 490px;max-height:75%;overflow-y: scroll;">
		  			<% if(session.getAttribute("type").toString().equals("size")){ %>
		  			<div id="sizeFactor">
		  			<br>
		  				<h5 align="center">Weight Related To The Size Factor</h5>
		  				<table class="table">
  							<thead class="thead-light">
			  					<tr>
			  						<th>Line no</th>
			  						<th>Program statements</th>
			  						<th>Nkw</th>
			  						<th>Nid</th>
			  						<th>Nop</th>
			  						<th>Nnv</th>
			  						<th>Nsl</th>
			  						<th>Cs</th>
			  					</tr>
			  				</thead>
			  				<tbody>
			  					<%
			  						codeSizeService test = new codeSizeService();
									ArrayList<size> arrayList = test.test(session.getAttribute("test_code").toString());
									
									for (size sizes : arrayList) {
										
										int Nkw = sizes.getKeyword()*Integer.parseInt(session.getAttribute("sizeKeyword").toString());
										int Nid = sizes.getIdentifier()*Integer.parseInt(session.getAttribute("sizeIdentifier").toString());
										int Nop = sizes.getOperator()*Integer.parseInt(session.getAttribute("sizeOperator").toString());
										int Nnv = sizes.getNumerical()*Integer.parseInt(session.getAttribute("sizeNumerical").toString());
										int Nsl = sizes.getStringCount()*Integer.parseInt(session.getAttribute("sizeString").toString());
										int total =Nkw+Nid+Nop+Nnv+Nsl;
								%>
			  					<tr>
			  						<td><%=sizes.getLineNumber() %></td>
			  						<td><%=sizes.getLine() %></td>
			  						<td><%=sizes.getKeyword() %></td>
			  						<td><%=sizes.getIdentifier() %></td>
			  						<td><%=sizes.getOperator() %></td>
			  						<td><%=sizes.getNumerical() %></td>
			  						<td><%=sizes.getStringCount() %></td>
			  						<td><%=total %></td>
			  					</tr>
			  					<% 
									}	
								%>
			  				</tbody>
		  				</table>
		  			</div>
		  			<%}
		  			if(session.getAttribute("type").toString().equals("variable")){ %>
		  			<div id="variableFactor">
		  			<br>
		  				<h5 align="center">Weight Related To The Variable Factor</h5>
		  				<table class="table">
  							<thead class="thead-light">
			  					<tr>
			  						<th>Line no</th>
			  						<th>Program statements</th>
			  						<th>Wvs</th>
			  						<th>Npdtv</th>
			  						<th>Ncdtv</th>
			  						<th>Cv</th>
			  					</tr>
			  				</thead>
			  				<tbody>
			  					<%
			  						VariableService test1 = new VariableService();
									ArrayList<Variables> arrayList1 = test1.test(session.getAttribute("test_code").toString());
									
									for (Variables variables : arrayList1) {
										
										int Wvs =(variables.getGlobal()*Integer.parseInt(session.getAttribute("variableGlobal").toString()))+(variables.getLocal())*Integer.parseInt(session.getAttribute("variableLocal").toString());
							            
							            int Npdtv = variables.getGlobal()+variables.getLocal();
							            
							            int Cv = Wvs*((Npdtv*Integer.parseInt(session.getAttribute("variablePrimitive").toString()))+(variables.getComposite()*Integer.parseInt(session.getAttribute("variableComposite").toString())));
										
								%>
			  					<tr>
			  						<td><%=variables.getLineNumber() %></td>
			  						<td><%=variables.getLine() %></td>
			  						<td><%=Wvs %></td>
			  						<td><%=Npdtv %></td>
			  						<td><%=variables.getComposite() %></td>
			  						<td><%=Cv %></td>
			  					</tr>
			  					<% 
									}	
								%>
			  				</tbody>
		  				</table>
		  			</div>
		  			<%}else if(session.getAttribute("type").toString().equals("method")){ %>
		  			<div id="methodFactor">
		  			<br>
		  				<h5 align="center">Weight Related To The Method Factor</h5>
		  				<table class="table">
  							<thead class="thead-light">
			  					<tr>
			  						<th>Line no</th>
			  						<th>Program statements</th>
			  						<th>Wmrt</th>
			  						<th>Npdtp</th>
			  						<th>Ncdtp</th>
			  						<th>Cm</th>
			  					</tr>
			  				</thead>
			  				<tbody>
			  					<%
			  						methodService test2 = new methodService();
									ArrayList<Methods> arrayList2 = test2.test(session.getAttribute("test_code").toString());
									
									for (Methods methods : arrayList2) {
										
										int Wmrt =(methods.getComposite_method()*Integer.parseInt(session.getAttribute("methodComposite").toString()))+(methods.getPrimitive_method()*Integer.parseInt(session.getAttribute("methodPrimitive").toString()));
							            
							            int Cm = Wmrt+((methods.getPrimitive_parameters()*Integer.parseInt(session.getAttribute("methodPrimitiveData").toString()))+(methods.getComposite_parameters()*Integer.parseInt(session.getAttribute("methodCompositeData").toString())));
										
										
								%>
			  					<tr>
			  						<td><%=methods.getLineNumber() %></td>
			  						<td><%=methods.getLine() %></td>
			  						<td><%=Wmrt %></td>
			  						<td><%=methods.getPrimitive_parameters() %></td>
			  						<td><%=methods.getComposite_parameters() %></td>
			  						<td><%=Cm %></td>
			  					</tr>
			  					<% 
									}	
								%>
			  				</tbody>
		  				</table>
		  			</div>
		  			<%}else if(session.getAttribute("type").toString().equals("controlStructure")){ %>
		  			<div id="structureFactor">
		  			<br>
		  				<h5 align="center">Weight Related To The Control Structure Factor</h5>
		  				<table class="table">
  							<thead class="thead-light">
			  					<tr>
			  						<th>Line no</th>
			  						<th>Program statements</th>
			  						<th>Wtcs</th>
			  						<th>NC</th>
			  						<th>Ccspps</th>
			  						<th>Ccs</th>
			  					</tr>
			  				</thead>
			  				<tbody>
			  					<%
			  						controlStructureService test3 = new controlStructureService();
			  					int condition= Integer.parseInt(session.getAttribute("condition").toString());
			  					int loop = Integer.parseInt(session.getAttribute("loop").toString());
			  					int switchCase= Integer.parseInt(session.getAttribute("switchCase").toString());
			  					int caseOnly=Integer.parseInt(session.getAttribute("caseOnly").toString());
									ArrayList<Control> arrayList3 = test3.test(session.getAttribute("test_code").toString(),condition,loop,switchCase,caseOnly);
									
									for (Control control : arrayList3) {
										int total = (control.getLine_weight()*control.getNo_of_control())+control.getCspps();
								%>
			  					<tr>
			  						<td><%=control.getLineNumber() %></td>
			  						<td><%=control.getLine() %></td>
			  						<td><%=control.getLine_weight() %></td>
			  						<td><%=control.getNo_of_control() %></td>
			  						<td><%=control.getCspps() %></td>
			  						<td><%=total %></td>
			  					</tr>
			  					<% 
									}	
								%>
			  				</tbody>
		  				</table>
		  			</div>
		  			<%}else if(session.getAttribute("type").toString().equals("inheritance")){ %>
		  			<div id="inheritanceFactor">
		  			<br>
		  				<h5 align="center">Weight Related To The Inheritance Factor</h5>
		  				<table class="table">
  							<thead class="thead-light">
			  					<tr>
			  						<th>Count</th>
			  						<th>Class Name</th>
			  						<th>No of direct inheritances</th>
			  						<th>No of indirect inheritances</th>
			  						<th>Total inheritances</th>
			  						<th>Ci</th>
			  					</tr>
			  				</thead>
			  				<tbody>
			  					<%
			  						InheritanceService test4 = new InheritanceService();
									ArrayList<Inheritance> arrayList4 = test4.test(session.getAttribute("test_code").toString());
									
									for (Inheritance inheritance : arrayList4) {
										int total = inheritance.getDirect()+inheritance.getIndirect();
										
										int Ci=total;
										if(Ci==0){
											Ci=Integer.parseInt(session.getAttribute("Inheritance").toString());
										}else if(Ci==1){
							                Ci=Integer.parseInt(session.getAttribute("Inheritance1").toString());
							            }else if(Ci==2){
							                Ci=Integer.parseInt(session.getAttribute("Inheritance2").toString());
							            }else if(Ci==3){
							                Ci=Integer.parseInt(session.getAttribute("Inheritance3").toString());
							            }else if(Ci>4){
							                Ci=Integer.parseInt(session.getAttribute("Inheritance4").toString());
							            }
								%>
			  					<tr>
			  						<td><%=inheritance.getLineNumber() %></td>
			  						<td><%=inheritance.getClassName() %></td>
			  						<td><%=inheritance.getDirect() %></td>
			  						<td><%=inheritance.getIndirect() %></td>
			  						<td><%=total %></td>
			  						<td><%=Ci %></td>
			  					</tr>
			  					<% 
									}	
								%>
			  				</tbody>
		  				</table>
		  			</div>
		  			<%}else if(session.getAttribute("type").toString().equals("coupling")){ %>
		  			<div id="couplingFactor">
		  			<br>
		  				<h5 align="center">Weight Related To The Coupling Factor</h5>
		  				<table class="table">
  							<thead class="thead-light">
			  					<tr>
			  						<th>Line no</th>
			  						<th>Program statements</th>
			  						<th>Nr</th>
			  						<th>Nmcms</th>
			  						<th>Nmcmd</th>
			  						<th>Nmcrms</th>
			  						<th>Nmcrmd</th>
			  						<th>Nrmcrms</th>
			  						<th>Nrmcrmd</th>
			  						<th>Nrmcms</th>
			  						<th>Nrmcmd</th>
			  						<th>Nmrgvs</th>
			  						<th>Nmrgvd</th>
			  						<th>Nrmrgvs</th>
			  						<th>Nrmrgvd</th>
			  						<th>Ccp</th>
			  					</tr>
			  				</thead>
			  				<tbody>
			  					<%
			  						CouplingService test5 = new CouplingService();
									ArrayList<Coupling> arrayList5 = test5.test(session.getAttribute("test_code").toString());
									
									for (Coupling coupling : arrayList5) {
										
										int Nr=coupling.getRecursive()*Integer.parseInt(session.getAttribute("recursive").toString());
										
										int Nmcms=coupling.getRegular_regular()*Integer.parseInt(session.getAttribute("regularRegular").toString());
										
										int Nmcrms=coupling.getRegular_recursive()*Integer.parseInt(session.getAttribute("regularRecursive").toString());
										
										int Nrmcrms=coupling.getRecursive_recursive()*Integer.parseInt(session.getAttribute("recursiveRecursive").toString());
										
										int Nrmcms=coupling.getRecursive_regular()*Integer.parseInt(session.getAttribute("recursiveRegular").toString());
										
										int total =Nr+Nmcms+Nmcrms+Nrmcrms+Nrmcms+(coupling.getRegular_global()*Integer.parseInt(session.getAttribute("regularGlobal").toString()))+(coupling.getRegular_regular()*Integer.parseInt(session.getAttribute("recursiveGlobal").toString()));
							            
										
								%>
			  					<tr>
			  						<td><%=coupling.getLineNumber() %></td>
			  						<td><%=coupling.getLine() %></td>
			  						<td><%=coupling.getRecursive() %></td>
			  						<td><%=coupling.getRegular_regular() %></td>
			  						<td>0</td>
			  						<td><%=coupling.getRegular_recursive() %></td>
			  						<td>0</td>
			  						<td><%=coupling.getRecursive_recursive() %></td>
			  						<td>0</td>
			  						<td><%=coupling.getRecursive_regular() %></td>
			  						<td>0</td>
			  						<td><%=coupling.getRegular_global() %></td>
			  						<td>0</td>
			  						<td><%=coupling.getRegular_regular() %></td>
			  						<td>0</td>
			  						<td><%=total %></td>
			  					</tr>
			  					<% 
									}	
								%>
			  				</tbody>
		  				</table>
		  			</div>
		  			<%}%>
		  		</div>
	  		</div>
	  		<br>
  			<div class="form-group">
  				<input type="submit" class="btn btn-outline-primary float-right" value="Calculate" style="width:250px;margin-right:210px;">
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