<%@page import="meetmydoctor.DocDet"%>
<%@page import="meetmydoctor.Question"%>
<%@page import="java.util.*"%>

<div class="row">
	<div class="large-3 columns">
		<p>&nbsp;</p>
	</div>	
	<div class="large-6 columns">
		<form action="Question_entry" method="get">
			<fieldset>
				<legend>Ask A Question</legend>
				<div class="row">
					<div class="large-12 columns">
						<label>Question</label>
						<textarea name="question1" rows="5" cols="20" placeholder="Enter your disease symptoms or reason for appointment"></textarea>
					</div>
				</div>
				<div class="row"> 							
					<div class="large-12 columns">
						<input type="submit" class="blue button radius" name="submit" value="Ask" />
					</div>
				</div>
			</fieldset>
		</form>
		<% Object obj = request.getAttribute("submit");
		if(obj!=null){
		String submit = obj.toString();
		if(submit.equals("1")){
		 %>
		<div class="row">
			<div class="large-12 columns red">
				<p class="text-center">Your question has been submitted successfully</p>
			</div>
		</div>
		<%} else{
		 %>
		<div class="row">
			<div class="large-12 columns red">
				<p class="text-center">Some error occurred please try again</p>
			</div>
		</div>
		<%
		}
		} %>
	</div>
</div>
<div class="row">
	<div class="large-12 columns">
		<h3 class="text-center">Your Questions and their answers</h3>
	</div>
</div>
<div class="row">
	<div class="large-3 columns">
		<p>&nbsp;</p>
	</div>	
	<div class="large-6 columns">
		<table>
			<thead>
				<tr>
				<th>Question No</th>
				<th colspan="2">Question Description</th>
				<th>Answer</th>
				</tr>
			</thead>
			<tbody>
				<% ArrayList<String[]> questions = Question.patQuestions(session.getAttribute("userid").toString());
				   if(questions!=null){
				   		Iterator<String[]> itr = questions.iterator();
				   		int sno=0;
						while(itr.hasNext()){
						sno++;
						%><tr><% 
							String[] str = itr.next();
							for(int i =0;i<str.length;i+=3){
							%><td><%=sno %></td><%
							%><td colspan="2"><%=str[i+2] %></td><%String qid = str[i];
							%><td><a href="Answer?qid=<%=qid%>">View</a></td><%
							%></tr><% if(request.getAttribute("ans")!=null&&request.getAttribute("questionid").toString().equals(qid)){
							ArrayList<String[]> answers = Question.allAnswers(qid);
							Iterator<String[]> itr2 = answers.iterator();
							int ano=0;
							while(itr2.hasNext()){ano++;
							%><tr><%
							String[] str1 = itr2.next();
							for(int j =0;j<str1.length;j+=4){
							%><td></td><%
							%><td><%=str1[j+3] %></td><%String docid = str1[j+2]; String[] docd = DocDet.getDetails(docid);
							%><td>by <%=docd[0] %></td><%
							%><td></td><%
							
							}%></tr><%}
						}
					}}}
				 %>
			</tbody>
		</table>
	</div>
</div>