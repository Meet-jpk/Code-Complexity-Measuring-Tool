<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Measuring Tool</title>
	<link rel="stylesheet" type="text/css" href="assets/css/main.css">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css"> 
	<link rel="stylesheet" href="../ComplexityMTool/assets/css/bootstrap.min.css">
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
				<button type="button" class="btn btn-outline-primary float-right">Change Weight</button>
			</div>  
	  	</div>
  	</div>
  	<br>
  	<form action="code_tool_servlet" method="post">
  	<div class="row">
	  	<div class="col">
			<div class="form-group">
	  			<textarea rows="23" cols="6" class="form-control" name="test_code" required placeholder="Upload or Insert the code here ..."></textarea>
	  		</div>
			<!-- <div class="form-group">
				<button type="button" class="btn btn-primary float-right" id="ofiles" onclick="clicks()">Open File</button>
			</div> -->
	  	</div>
	  	<div class="col">
	  		<div class="border">
		  		<div class="p-2" style="height: 490px;max-height:75%;overflow-y: scroll;">
					<div class="form-group">
			  			<select class="form-control col-8 " id="selectDiv" name="selectFactor" onchange="viewDiv()">
			  				<option value="size">Size Factor</option>
			  				<option value="variable">Variable Factor</option>
			  				<option value="method">Method Factor</option>
			  				<option value="controlStructure">Control Structure Factor</option>
			  				<option value="inheritance">Inheritance Factor</option>
			  				<option value="coupling">Coupling Factor</option>
			  				<option value="all">All The Factor</option>
			  			</select>
		  			</div>
		  			<div class="" id="sizeFactor">
		  			<br>
		  				<h5 align="center">Weight Related To The Size Factor</h5>
		  				<table class="table">
  							<thead class="thead-light">
			  					<tr>
			  						<th>Program Component</th>
			  						<th>Weight</th>
			  					</tr>
			  				</thead>
			  				<tbody>
			  					<tr>
			  						<td>Keyword</td>
			  						<td>
							  			<select class="form-control" name="sizeKeyword">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
			  						</td>
			  					</tr>
			  					<tr>
			  						<td>Identifier</td>
			  						<td>
							  			<select class="form-control" name="sizeIdentifier">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>Operator</td>
			  						<td>
							  			<select class="form-control" name="sizeOperator">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>Numerical Value</td>
			  						<td>
							  			<select class="form-control" name="sizeNumerical">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>String Iiteral</td>
			  						<td>
							  			<select class="form-control" name="sizeString">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  				</tbody>
		  				</table>
		  			</div>
		  			<div class="d-none" id="variableFactor">
		  			<br>
		  				<h5 align="center">Weight Related To The Variable Factor</h5>
		  				<table class="table">
  							<thead class="thead-light">
			  					<tr>
			  						<th>Program Component</th>
			  						<th>Weight</th>
			  					</tr>
			  				</thead>
			  				<tbody>
			  					<tr>
			  						<td>Global Variable</td>
			  						<td>
							  			<select class="form-control" name="variableGlobal">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
			  						</td>
			  					</tr>
			  					<tr>
			  						<td>Local Variable</td>
			  						<td>
							  			<select class="form-control" name="variableLocal">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>Primitive Data Type Variable</td>
			  						<td>
							  			<select class="form-control" name="variablePrimitive">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>Composite Data Type Variable</td>
			  						<td>
							  			<select class="form-control"  name="variableComposite">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  				</tbody>
		  				</table>
		  			</div>
		  			<div class="d-none" id="methodFactor">
		  			<br>
		  				<h5 align="center">Weight Related To The Method Factor</h5>
		  				<table class="table">
  							<thead class="thead-light">
			  					<tr>
			  						<th>Program Component</th>
			  						<th>Weight</th>
			  					</tr>
			  				</thead>
			  				<tbody>
			  					<tr>
			  						<td>Method with a primitive return type</td>
			  						<td>
							  			<select class="form-control" name="methodPrimitive">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
			  						</td>
			  					</tr>
			  					<tr>
			  						<td>Method with a composite return type</td>
			  						<td>
							  			<select class="form-control" name="methodComposite">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>Primitive data type parameter</td>
			  						<td>
							  			<select class="form-control" name="methodPrimitiveData">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>Composite data type parameter</td>
			  						<td>
							  			<select class="form-control" name="methodCompositeData">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  				</tbody>
		  				</table>
		  			</div>
		  			<div class="d-none" id="structureFactor">
		  			<br>
		  				<h5 align="center">Weight Related To The Control Structure Factor</h5>
		  				<table class="table">
  							<thead class="thead-light">
			  					<tr>
			  						<th>Control Structure Type</th>
			  						<th>Weight</th>
			  					</tr>
			  				</thead>
			  				<tbody>
			  					<tr>
			  						<td>A conditional control structure such as an 'if' or 'else-if' condition</td>
			  						<td>
							  			<select class="form-control" name="condition">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
			  						</td>
			  					</tr>
			  					<tr>
			  						<td>An iterative control structure such as an 'for' , 'while' , or 'do-while' loop</td>
			  						<td>
							  			<select class="form-control" name="loop">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>The 'switch' statement in a 'switch-case' control structure</td>
			  						<td>
							  			<select class="form-control" name="switchCase">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>Each 'case' statement in a 'switch-case' control structure</td>
			  						<td>
							  			<select class="form-control" name="caseOnly">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  				</tbody>
		  				</table>
		  			</div>
		  			<div class="d-none" id="inheritanceFactor">
		  			<br>
		  				<h5 align="center">Weight Related To The Inheritance Factor</h5>
		  				<table class="table">
  							<thead class="thead-light">
			  					<tr>
			  						<th>Inherited Pattern</th>
			  						<th>Weight</th>
			  					</tr>
			  				</thead>
			  				<tbody>
			  					<tr>
			  						<td>A class with no Inheritance(direct or indirect)</td>
			  						<td>
							  			<select class="form-control" name="Inheritance">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
			  						</td>
			  					</tr>
			  					<tr>
			  						<td>A class inheriting(direct or indirect) from one user-defined class</td>
			  						<td>
							  			<select class="form-control" name="Inheritance1">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>A class inheriting(direct or indirect) from two user-defined classes</td>
			  						<td>
							  			<select class="form-control" name="Inheritance2">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>A class inheriting(direct or indirect) from three user-defined classes</td>
			  						<td>
							  			<select class="form-control" name="Inheritance3">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>A class inheriting(direct or indirect) from more than three user-defined classes</td>
			  						<td>
							  			<select class="form-control" name="Inheritance4">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  				</tbody>
		  				</table>
		  			</div>
		  			<div class="d-none" id="couplingFactor">
		  			<br>
		  				<h5 align="center">Weight Related To The Coupling Factor</h5>
		  				<table class="table">
  							<thead class="thead-light">
			  					<tr>
			  						<th>Coupling Type</th>
			  						<th>Weight</th>
			  					</tr>
			  				</thead>
			  				<tbody>
			  					<tr>
			  						<td>A recursive call</td>
			  						<td>
							  			<select class="form-control" name="recursive">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
			  						</td>
			  					</tr>
			  					<tr>
			  						<td>A regular method calling another regular method in the same file</td>
			  						<td>
							  			<select class="form-control" name="regularRegular">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>A regular method calling another regular method in a different file</td>
			  						<td>
							  			<select class="form-control">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>A regular method calling a recursive method in the same file</td>
			  						<td>
							  			<select class="form-control" name="regularRecursive">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>A regular method calling a recursive method in a different file</td>
			  						<td>
							  			<select class="form-control">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>A recursive method calling another recursive method in the same file</td>
			  						<td>
							  			<select class="form-control" name="recursiveRecursive">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>A recursive method calling another recursive method in a different file</td>
			  						<td>
							  			<select class="form-control">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>A recursive method calling a regular method in the same file</td>
			  						<td>
							  			<select class="form-control" name="recursiveRegular">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>A recursive method calling a regular method in a different file</td>
			  						<td>
							  			<select class="form-control">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>A regular method referencing a global variable in the same file</td>
			  						<td>
							  			<select class="form-control" name="regularGlobal">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>A regular method referencing a global variable in a different file</td>
			  						<td>
							  			<select class="form-control">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>A recursive method referencing a global variable in the same file</td>
			  						<td>
							  			<select class="form-control" name="recursiveGlobal">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  					<tr>
			  						<td>A recursive method referencing a global variable in a different file</td>
			  						<td>
							  			<select class="form-control">
							  				<option value="0">0</option>
							  				<option value="1">1</option>
							  				<option value="2">2</option>
							  				<option value="3">3</option>
							  				<option value="4">4</option>
							  			</select>
							  		</td>
			  					</tr>
			  				</tbody>
		  				</table>
		  			</div>
		  		</div>
	  		</div>
	  		<br>
  			<div class="form-group">
  				<input type="submit" class="btn btn-outline-primary float-right" value="Calculate" style="width:250px;margin-right:140px;">
  			</div>
	  	</div>
	  </div>
  	</div>
  	</form>
  	
  	<form action="uploadFileServer" id="uploadFileForm" method="post">
  		<input type="text" class="d-none" id="zipPath" name="zipPath">
  		<input type="file" name="file" class="d-none" id="fileUpload" onchange="fileUploadSubmit()" accept=".zip">
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
<script>

	function clicks(){
		
		document.getElementById('fileUpload').click();
		
	}
	
	function fileUploadSubmit(){
		
		document.getElementById("zipPath").value =document.getElementById("fileUpload").value;
		
		alert(document.getElementById("fileUpload"));
		
		document.getElementById("uploadFileForm").submit();
		
	}

	function viewDiv(){
		var div = document.getElementById('selectDiv').value;
		
		if(div=="size"){
			hideAll();
			document.getElementById('sizeFactor').classList.add("d-block");
		}else if(div=="variable"){
			hideAll();
			document.getElementById('variableFactor').classList.add("d-block");
		}else if(div=="method"){
			hideAll();
			document.getElementById('methodFactor').classList.add("d-block");
		}else if(div=="controlStructure"){
			hideAll();
			document.getElementById('structureFactor').classList.add("d-block");
		}else if(div=="inheritance"){
			hideAll();
			document.getElementById('inheritanceFactor').classList.add("d-block");
		}else if(div=="coupling"){
			hideAll();
			document.getElementById('couplingFactor').classList.add("d-block");
		}else if(div=="all"){
			hideAll();
		}
	}
	
	function hideAll(){
		
		document.getElementById('sizeFactor').classList.remove("d-block");
		document.getElementById('variableFactor').classList.remove("d-block");
		document.getElementById('methodFactor').classList.remove("d-block");
		document.getElementById('structureFactor').classList.remove("d-block");
		document.getElementById('inheritanceFactor').classList.remove("d-block");
		document.getElementById('couplingFactor').classList.remove("d-block");
		
		document.getElementById('sizeFactor').classList.add("d-none");
		document.getElementById('variableFactor').classList.add("d-none");
		document.getElementById('methodFactor').classList.add("d-none");
		document.getElementById('structureFactor').classList.add("d-none");
		document.getElementById('inheritanceFactor').classList.add("d-none");
		document.getElementById('couplingFactor').classList.add("d-none");
		
	}
	
</script>