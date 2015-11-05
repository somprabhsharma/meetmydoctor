<%@page import="meetmydoctor.DocDet"%>
<%@page import="meetmydoctor.Question"%>
<%@page import="java.util.*"%>

<div class="row">
	<div class="large-12 columns">
		<h3 class="text-center">Answer A Question</h3>
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
				<% ArrayList<String[]> questions = Question.allQuestions();
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
							int a = Question.checkAnsStatus(session.getAttribute("userid").toString(), qid);
							if(a==1){
							%><td>Your have answered this question</td><%
							} else{
								if(request.getAttribute("done")!=null&&request.getAttribute("qqid").toString().equals(qid)){
								String done = request.getAttribute("done").toString();
								if(done.equals("1")){
									%><td>Answer successfully submitted</td><%
								}
								else{
									%><td>Some error occured please submit again.<form action="Answer_entry?qid=<%=qid%>" method="get"><textarea name="ans" rows="3" cols="15" placeholder="Enter your answer"></textarea><input type="submit" value="Answer" class="blue button radius"/> </form></td><%
								}
							} else{
							%><td><form action="Answer_entry" method="get"><input type="hidden" name="qid" value="<%=qid%>"/><textarea name="ans" rows="3" cols="15" placeholder="Enter your answer"></textarea><input type="submit" value="Answer" class="blue button radius"/> </form></td><%
							}
							}
							}%></tr><%
						}
					}
				 %>
			</tbody>
		</table>
	</div>
</div>