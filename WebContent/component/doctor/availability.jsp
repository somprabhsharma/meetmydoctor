
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="meetmydoctor.*" %>
<%@ page import="java.util.*" %>



<div class="row">
	<div class="large-4 columns"><p>&nbsp;</p></div>
	<div class="large-4 columns">
	<div class="row">
		<div class="large-12 columns">
			<h3 class="text-center">Set Availability for next week</h3>
		</div>
	</div>
	<form class="custom" action="Availability_entry" method="get">
	<div class="row">
		<div class="large-12 columns">
			<label>Select Date</label>
			
		</div>
	</div>
	<div class="row">
		<div class="large-6 columns">
			<input type="text" class="datepicker" name="sdate" placeholder="start date"/>		
		</div>
		<div class="large-6 columns">
			<input type="text" class="datepicker" name="edate" placeholder="end date"/>							
		</div>
	</div>
	<div class="row">
		<div class="large-12 columns">
				<label>Morning Time Slot</label>					
		</div>
	</div>
	<div class="row">
		<div class="large-6 columns">
			<select name="mstart">
					<option value="0">Start Time</option>
					<option>8:00</option>
					<option>9:00</option>
					<option>10:00</option>
					<option>11:00</option>
					<option>12:00</option>
			</select>
		</div>
		<div class="large-6 columns">
			<select name="mend">
					<option value="0">End Time</option>
					<option>9:00</option>
					<option>10:00</option>
					<option>11:00</option>
					<option>12:00</option>
					<option>13:00</option>
			</select>
		</div>
	</div>
	<div class="row">
		<div class="large-12 columns" id="a">
				<label>AfterNoon Time Slot</label>					
		</div>
	</div>
	<div class="row">
		<div class="large-6 columns">
			<select name="nstart">
					<option value="0">Start Time</option>
					<option>14:00</option>
					<option>15:00</option>
					<option>16:00</option>
			</select>
		</div>
		<div class="large-6 columns">
			<select name="nend">
					<option value="0">End Time</option>
					<option>15:00</option>
					<option>16:00</option>
					<option>17:00</option>
			</select>
		</div>
	</div>
	<div class="row">
		<div class="large-12 columns" id="a">
				<label>Evening Time Slot</label>					
		</div>
	</div>
	<div class="row">
		<div class="large-6 columns">
			<select name="estart">
					<option value="0">Start Time</option>
					<option>18:00</option>
					<option>19:00</option>
					<option>20:00</option>
					<option>21:00</option>
			</select>
		</div>
		<div class="large-6 columns">
			<select name="eend">
					<option value="0">End Time</option>
					<option>19:00</option>
					<option>20:00</option>
					<option>21:00</option>
					<option>22:00</option>
			</select>
		</div>
	</div>

	<div class="row"> 							
		<div class="large-12 columns">
			<input type="submit" class="blue button radius" name="submit" value="submit" />
		</div>
	</div>
	</form>
	</div>	
</div>
<div class="row">
	<div class="large-2 columns"><p>&nbsp;</p></div>
	
	<% if(request.getAttribute("avail")!=null){ %>
		<div class="large-8 columns red">
		<p class="text-center"> Your Availability has been set Successfully!</p>
		</div>
	<% } %>
	
</div>
