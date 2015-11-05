<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <div class="row">
    <div class="large-3 columns"><p>&nbsp;</p></div>
    <div class="large-6 columns">
			<form name="adminform" method="post" action="Admin_entry" >
						<fieldset>
							<legend>Admin Registration Form</legend>
							<div class="row">
								<div class="large-12 columns">
									<label>Name</label>
									<input type="text" placeholder="Enter admin name" name="aname" id="aname" />
								</div>
							</div>
							<div class="row">
								<div class="large-12 columns">
									<label>Email</label>
									<input type="text" placeholder="Enter admin email id" name="aemail" id="aemail"/>
								</div>
							</div>
							<div class="row">
								<div class="large-12 columns">
									<label>Password</label>
									<input type="password" placeholder="Enter admin password" name="apassword" id="apassword"/>
								</div>
							</div>
							<div class="row">
								<div class="large-12 columns">
									<label>Retype Password</label>
									<input type="password" placeholder="Retype admin password" name="apasswordr" id="apasswordr"/>
								</div>
							</div>
							<div class="row">
								<div class="large-12 columns">
									<label>Mob No.</label>
									<input type="text" placeholder="Enter admin mobile number" name="amob" id="amob"/>
								</div>
							</div>
							<div class="row">
								<div class="large-6 columns">
									<input type="reset" class="blue button radius" value="Reset" style="float:right;" />
								</div>
								<div class="large-6 columns">
									<input type="submit" class="blue button radius" value="Add" />
								</div>
							</div>
						</fieldset>
			</form>
	</div>
</div>
<div class="row">
<div class="large-3 columns"><p>&nbsp;</p></div>

			<%
			Object uid = request.getAttribute("uid");
			if(uid!=null){
			if(uid.equals("0")){
				%><div class="large-6 columns red">
				<p class="text-center">Some Error Occurred Please Try Again .</p>
				</div>
				<%
			} else{
				%><div class="large-6 columns red">
				<p class="text-center">You have successfully added an admin. New admin id is : <%= uid.toString() %>.</p>
				</div>
				<%
			}
			}
			%>
</div>