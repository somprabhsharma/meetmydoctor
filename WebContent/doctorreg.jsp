<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>

<form class="custom" name="docform" action="Doctor_entry" method="post">
						<fieldset>
							<legend>Doctor Registration Form</legend>
							<div class="row">
								<div class="large-12 columns">
									<label>Name</label>
									<input type="text" placeholder="Enter your name" name="dname">
								</div>
							</div>
							<div class="row">
								<div class="large-12 columns">
									<label>Email</label>
									<input type="email" placeholder="Enter your email id" name="demail">
								</div>
							</div>
							<div class="row">
								<div class="large-12 columns">
									<label>Password</label>
									<input type="password" placeholder="Enter your password" name="dpassword">
								</div>
							</div>
							<div class="row">
								<div class="large-12 columns">
									<label>Retype Password</label>
									<input type="password" placeholder="Retype your password" name="dpasswordr">
								</div>
							</div>
							<div class="row">
								<div class="large-12 columns">
									<label>Mob No.</label>
									<input type="text" placeholder="Enter your mobile number" name="dmob">
								</div>
							</div>
							<div class="row" >
								<div class="large-12 columns">
									<label>Specialization</label>
									<select name="dspeciality">
										<option value="0">Select Speciliaty</option>
										<option value="Ayurvedic">Ayurvedic</option>
										<option value="Orthopedics">Orthopedics</option>
										<option value="Pediatrician">Pediatrician</option>
										<option value="Neurologist">Neurologist</option>
										<option value="Cardiologist">Cardiologist</option>
										<option value="Endocrinologist">Endocrinologist</option>
										<option value="Physician">Physician</option>
										<option value="Dentist">Dentist</option>
										<option value="Skin">Skin</option>
										<option value="Gastroenterologist">Gastroenterologist</option>
										<option value="Ophthalmologist">Ophthalmologist</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="large-12 columns">
									<label>Address</label>
								</div>
							</div>
							<div class="row">
								<div class="large-6 columns">
									<textarea rows="4" cols="10" placeholder="Enter your adress" name="daddress"></textarea>
								</div>
								<div class="large-6 columns" style="margin-top:8px;">
									<div class="row">
									
									<% Class.forName("com.mysql.jdbc.Driver");
								Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ddc","root","");

Statement st = conn.createStatement();

ResultSet state = st.executeQuery("select * from state where city is null order by state asc");

%>

									<select id="state1" name="state1">
									<option>Select State</option>

<%

while(state.next()){

%><Option value="<%out.print(state.getString(1));%>"><%out.print(state.getString(1));%></Option><%

}




%>					</select>
									
									</div>
									<div class="row" id="a">
										
									
									</div>
								</div>
							</div>
							<div class="row">
								<div class="large-6 columns">
									<input type="reset" class="blue button radius" value="Reset" style="float:right;" />
								</div>
								<div class="large-6 columns">
									<input type="submit" class="blue button radius" value="Submit" />
								</div>
							</div>
						</fieldset>
					</form>