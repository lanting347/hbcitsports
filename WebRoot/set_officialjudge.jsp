<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<% int num = 0; %>
<% int judNum = 0; %>
	
	<title>jQuery UI Tabs - Default functionality</title>
	<link href="${pageContext.request.contextPath }/css/subcss.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.6.min.js"></script>
	<link type="text/css" href="css/themes/base/jquery.ui.all.css" rel="stylesheet" />
	<!--<script type="text/javascript" src="js/jquery-1.4.2.js"></script>-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.ui.core.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.ui.tabs.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/zDialog_inner.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/zDrag.js"></script>
	<link type="text/css" href="${pageContext.request.contextPath }/css/demos.css" rel="stylesheet" />
	
	<script type="text/javascript">
	$(function() {
		$("#tabs").tabs();
	});
	</script>
	<script type="text/javascript">

$(document).ready(function() {

	$(".stripe_tb tr").mouseover(function() { //如果鼠标移到class为stripe_tb的表格的tr上时，执行函数
				$(this).addClass("over");
			}).mouseout(function() { //给这行添加class值为over，并且当鼠标一出该行时执行函数
				$(this).removeClass("over");
			}) //移除该行的class
		$(".stripe_tb tr:even").addClass("alt"); //给class为stripe_tb的表格的偶数行添加class值为alt

	});
	
	function alterpws1()
		{
			var chiefjudge_1=$('#chiefjudge_1').val();
			var chiefjudge_2=$('#chiefjudge_2').val();
			var trackjudge=$('#trackjudge').val();
			var trackjudge_rollcall_1=$('#trackjudge_rollcall_1').val();
			var  trackjudge_rollcall_2=$('#trackjudge_rollcall_2').val();
			var  trackjudge_rollcall_3=$('#trackjudge_rollcall_3').val();
			var  startingpoint_1=$('#startingpoint_1').val();
			var  startingpoint_2=$('#startingpoint_2').val();
			var  startingpoint_3=$('#startingpoint_3').val();
			var  timejudge_1=$('#timejudge_1').val();
			var  timejudge_2=$('#timejudge_2').val();
			var  timejudge_3=$('#timejudge_3').val();
			var  endpoint_1=$('#endpoint_1').val();
			var  endpoint_2=$('#endpoint_2').val();
			var  endpoint_3=$('#endpoint_3').val();
			var  endpoint_4=$('#endpoint_4').val();
			var  endpoint_5=$('#endpoint_5').val();
			
			var tempStr = /^([\u4e00-\u9fa5]{1,},){0,}([\u4e00-\u9fa5]{1,})$|^\s*$/;
	        if(!tempStr.test(chiefjudge_1)){
		      Dialog.alert("总裁判长包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(chiefjudge_2)){
	          Dialog.alert("副总裁判长包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(trackjudge)){
	          Dialog.alert("径赛裁判长包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(trackjudge_rollcall_1)){
	          Dialog.alert("检录裁判长包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(trackjudge_rollcall_2)){
	          Dialog.alert("检录裁判长助理包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(trackjudge_rollcall_3)){
	          Dialog.alert("检录员包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(startingpoint_1)){
	          Dialog.alert("起点裁判长包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(startingpoint_2)){
	          Dialog.alert("起点裁判长助理包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(startingpoint_3)){
	          Dialog.alert("发令员包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(timejudge_1)){
	          Dialog.alert("记时长包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(timejudge_2)){
	          Dialog.alert("记时员包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(timejudge_3)){
	          Dialog.alert("司线员会包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(endpoint_1)){
	          Dialog.alert("终点裁判长包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(endpoint_2)){
	          Dialog.alert("终点裁判长助理包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(endpoint_3)){
	          Dialog.alert("终点裁判员包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(endpoint_4)){
	          Dialog.alert("终点记录长包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(endpoint_5)){
	          Dialog.alert("终点记录员包含特殊字符，请以英文逗号进行分隔");
	        }else{
									
			$.ajax({
					url :"${pageContext.request.contextPath }/servlet/AddTrackjudgeServlet",
					type : 'post',
				   	data:{chiefjudge_1:chiefjudge_1,chiefjudge_2:chiefjudge_2,trackjudge:trackjudge,
				   	trackjudge_rollcall_1:trackjudge_rollcall_1,trackjudge_rollcall_2:trackjudge_rollcall_2,
				   	trackjudge_rollcall_3:trackjudge_rollcall_3,startingpoint_1:startingpoint_1,
				   	startingpoint_2:startingpoint_2,startingpoint_3:startingpoint_3,timejudge_1:timejudge_1,
				   	timejudge_2:timejudge_2,timejudge_3:timejudge_3,endpoint_1:endpoint_1,endpoint_2:endpoint_2,
				   	endpoint_3:endpoint_3,endpoint_4:endpoint_4,endpoint_5:endpoint_5},
					
					success :function(mm){
							var revalue=mm.replace(/\r\n/g,'');
							if(revalue=="success")
							{
								Dialog.alert("添加成功!",function(){window.location.reload();});
							}
							else
								Dialog.alert("添加失败!");
						}
					});	
				}
		}

		function alterpws2()
		{
			var  fieldjudge=$('#fieldjudge').val();
			var  fieldjudge_1=$('#fieldjudge_1').val();
			var  fieldjudge_2=$('#fieldjudge_2').val();
			var  fieldjudge_3=$('#fieldjudge_3').val();
			var  fieldjudge_4=$('#fieldjudge_4').val();
			var  fieldjudge_5=$('#fieldjudge_5').val();
			var  fieldjudge_6=$('#fieldjudge_6').val();
			
			var tempStr = /^([\u4e00-\u9fa5]{1,},){0,}([\u4e00-\u9fa5]{1,})$|^\s*$/;
	        if(!tempStr.test(fieldjudge)){
		      Dialog.alert("田赛裁判长包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(fieldjudge_1)){
	          Dialog.alert("总记录裁判长包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(fieldjudge_2)){
	          Dialog.alert("记录员包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(fieldjudge_3)){
	          Dialog.alert("检查长包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(fieldjudge_4)){
	          Dialog.alert("检查员包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(fieldjudge_5)){
	          Dialog.alert("场地器材组长包含特殊字符，请以英文逗号进行分隔");
	        }else if(!tempStr.test(fieldjudge_6)){
	          Dialog.alert("器材员包含特殊字符，请以英文逗号进行分隔");
	        }else{
						
			$.ajax({
					url :"${pageContext.request.contextPath }/servlet/AddFieldjudgeServlet",
					type : 'post',
				   	data:{fieldjudge:fieldjudge,fieldjudge_1:fieldjudge_1,fieldjudge_2:fieldjudge_2,
				   	fieldjudge_3:fieldjudge_3,fieldjudge_4:fieldjudge_4,fieldjudge_5:fieldjudge_5,
				   	fieldjudge_6:fieldjudge_6},
					success :function(mm){
							var revalue=mm.replace(/\r\n/g,'');
							if(revalue=="success")
							{
								Dialog.alert("添加成功!",function(){window.location.reload();});
							}
							else
								Dialog.alert("添加失败!");
						}
					});	
				}
		}
		
		
	    

</script>

<style>
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.pageTitle {
	color: #e1e2e3;
	font-size: 12px;
}
#tabs
{
top:20px;

}
#caipan1
{
float:left;
font-size:20px;

}
#caipan2
{
float:left;
font-size:20px;
}
#table
{
font-size:16px;}
.STYLE4 {font-size: medium}
.STYLE5 {font-size: 12px}
.STYLE7 {font-size: 12px; font-weight: bold; }
</style>    

</head>
<body>


<table width="100%" height="31" bgcolor="#353c44" align="center" border="0" cellpadding="0" cellspacing="0" >
	<tr>
		<td>
         <table width="100%" height="19"  border="0" cellpadding="0" cellspacing="0" >
			<tr>
				<td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="pageTitle">赛前设置-->裁判人员设置</span></td>
			</tr>
		</table> 
		</td>
	</tr>
</table>           

<div class="demo">

<div id="tabs">
	<ul class="STYLE5">
		<li><strong><a href="#tabs-1">径赛裁判员</a></strong></li>
		<li><strong><a href="#tabs-2">田赛裁判员</a></strong></li>
		<li><strong><a href="#tabs-3">田赛项目裁判</a></strong></li>
		<li><strong><a href="#tabs-4">学生裁判员</a></strong></li>
	</ul>
<div id="tabs-1" >
<table width="55%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" class="stripe_tb" align="center">
					<tr class="tableTitle">
                   <td  colspan="3" align="right" style="color:red;fontsize:12px;">
                   人名之间请以英文逗号隔开
                   </td>
                   </tr>
					<tr class="tableContent" >
						<td width="347">
							总裁判长：
							</td>
							<td>
						 <input type="text" name="chiefjudge_1" id="chiefjudge_1" />
					  </td>
    </tr>
					<tr class="tableContent" >
						<td>
							副总裁判长：
							</td>
							<td>
							<input type="text" name="chiefjudge_2" id="chiefjudge_2" />
						</td>
					</tr>
					<tr class="tableContent" >
						<td>
							径赛裁判长: 
							</td>
							<td>
							<input type="text" name="trackjudge" id="trackjudge"  />
						</td>
					</tr>
                    	<tr class="tableContent" >
						<td>
							检录裁判长:
							</td>
							<td>
							<input type="text" name="trackjudge_rollcall_1" id="trackjudge_rollcall_1" />
						</td>
					</tr>
                    	<tr class="tableContent" >
						<td>
							检录裁判长助理：
							</td>
							<td>
							<input type="text" name="trackjudge_rollcall_2" id="trackjudge_rollcall_2" />
						</td>
					</tr>
                    	<tr class="tableContent" >
						<td>
							检录员:
							</td>
							<td>
							<textarea name="trackjudge_rollcall_3" id="trackjudge_rollcall_3" cols="45" rows="5"></textarea>
						</td>
					</tr>
                    	<tr class="tableContent" >
						<td>
							起点裁判长：
							</td>
							<td>
							<input type="text" name="startingpoint_1" id="startingpoint_1"/>
						</td>
					</tr>
                    	<tr class="tableContent" >
						<td>
							起点裁判长助理：
							</td>
							<td>
							<input type="text" name="startingpoint_2" id="startingpoint_2"" />
						</td>
					</tr>
                    	<tr class="tableContent" >
						<td>
							发令员：
							</td>
							<td>
							<textarea name="startingpoint_3" id="startingpoint_3" cols="45" rows="5"></textarea>
						</td>
					</tr>
                    	<tr class="tableContent" >
						<td>
							记时长：
							</td>
							<td>
							<input type="text" name="timejudge_1" id="timejudge_1" />
						</td>
					</tr>
                    	<tr class="tableContent" >
						<td>
							记时员：
							</td>
							<td>
							<textarea name="timejudge_2" id="timejudge_2" cols="45" rows="5"></textarea>
						</td>
					</tr>
                    <tr class="tableContent" >
						<td width="347">
							司线员：
							</td>
							<td>
						 <input type="text" name="timejudge_3" id="timejudge_3"/>
					  </td>
    </tr>
					<tr class="tableContent" >
						<td>
							终点裁判长：
							</td>
							<td>
							<input type="text" name="endpoint_1" id="endpoint_1" />
						</td>
					</tr>
					<tr class="tableContent" >
						<td>
							终点裁判长助理： 
							</td>
							<td>
							<input type="text" name="endpoint_2" id="endpoint_2"/>
						</td>
					</tr>
                    	<tr class="tableContent" >
						<td>
							终点裁判员：
							</td>
							<td>
							<textarea name="endpoint_3" id="endpoint_3" cols="45" rows="5"></textarea>
						</td>
					</tr>
                    <tr class="tableContent" >
						<td width="347">
							终点记录长：
							</td>
							<td>
						 <input type="text" name="endpoint_4" id="endpoint_4"/>
					  </td>
    </tr>
					<tr class="tableContent" >
						<td>
							终点记录员：
							</td>
							<td>
							<input type="text" name="endpoint_5" id="endpoint_5"/>
						</td>
					</tr>
				<tr class="tableContent" >
				<td colspan="3">
		<input style="font-size:12px;" type="button"  id="button2" value="提 交" onClick="alterpws1()">
        <input style="font-size:12px;" type="button"  value="修 改" onClick="window.location.href='${pageContext.request.contextPath}/servlet/SelectAllTrackjudgeServlet?sportsid==sportsid}'">
			  </tr>
			</table>
</div>

	<div id="tabs-2" >
<table width="55%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" class="stripe_tb" align="center">
					<tr class="tableTitle">
                   <td  colspan="3" align="right" style="color:red;fontsize:12px;">
                   人名之间请以英文逗号隔开
                   </td>
                   </tr>
					<tr  class="tableContent" >
						<td width="347">
							田赛裁判长：
							</td>
							<td>
						 <input type="text" name="fieldjudge" id="fieldjudge"/>
					    </td>
                    </tr>
					<tr  class="tableContent" >
						<td>
							总记录裁判长：
							</td>
							<td>
							<input type="text" name="fieldjudge_1" id="fieldjudge_1"/>
						</td>
					</tr>
					<tr  class="tableContent" >
						<td>
							记录员：
							</td>
							<td>
							<textarea name="fieldjudge_2" id="fieldjudge_2" cols="45" rows="5" ></textarea>
						</td>
					</tr>
                    <tr  class="tableContent" >
						<td>
							检查长：
							</td>
							<td>
							<input type="text" name="fieldjudge_3" id="fieldjudge_3"/>
						</td>
					</tr>
                  	<tr  class="tableContent" >
						<td>
							检查员：
							</td>
							<td>
							<textarea name="fieldjudge_4" id="fieldjudge_4" cols="45" rows="5" ></textarea>
						</td>
					</tr>
                    <tr  class="tableContent" >
						<td>
							场地器材组长：
							</td>
							<td>
							<input type="text" name="fieldjudge_5" id="fieldjudge_5"/>
						</td>
					</tr>
                    <tr  class="tableContent" >
						<td>
							器材员：
							</td>
							<td>
							<textarea name="fieldjudge_6" id="fieldjudge_6" cols="45" rows="5" ></textarea>
						</td>
					</tr>
					<tr  class="tableContent" >
					<td colspan="3">
				<input style="font-size:12px;" type="button"  id="button1" value="提 交" onClick="alterpws2()">
       <input  style="font-size:12px;" type="button" value="修 改" onClick="window.location.href='${pageContext.request.contextPath }/servlet/SelectAllFiledjudgeServlet?sportsid==sportsid}'">
					</td>
					</tr>
				</table>      
	</div>
	<div id="tabs-3">
	<table width="55%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" class="stripe_tb" align="center">
	<tr class="tableTitle">
                   <td colspan="4" align="right" style="color:red;fontsize:12px;">
                   人名之间请以英文逗号隔开
                  </td>
                   </tr>
			  <tr  class="tableContent" >
			<td><div align="center" class="STYLE7">项目名称</div></td>
            <td><div align="center" class="STYLE7">项目裁判长</div></td>
            <td><div align="center" class="STYLE7">裁判长助理</div></td>
            <td><div align="center" class="STYLE7">裁判员</div></td>
		</tr>
			<c:forEach items="${itemlist}" var="item">
				  <tr  class="tableContent" >
					<td width="20%">
					<input type="hidden" id="id<%=judNum %>"  value="${item[1]}" />
					<input style="font-size:12px;" type="text" id="<%=judNum %>"  value="${item[0]}" /></td>
					<td><input style="font-size:12px;" type="text"  id="judge_1<%=judNum %>" /></td>
					<td><input style="font-size:12px;" type="text"  id="judge_2<%=judNum %>" /></td>
					<td><input style="font-size:12px;" type="text"  id="judge_3<%=judNum %>" /></td>
				</tr> 
				<% judNum++; %>
			</c:forEach>
			  <tr  class="tableContent" >
					<td colspan="4" align="center">
					<input style="font-size:12px;" type="button"  id="button1" value="提 交" onClick="insertFileJudge()">
					<input  style="font-size:12px;" type="button" value="修 改" onClick="window.location.href='${pageContext.request.contextPath }/servlet/SelectFieldItemJudgeServlet'">
				   </td>
				</tr>
		</table>  
		<p>&nbsp;</p> 
		<p>&nbsp;</p>
		<p>&nbsp;</p>
	<script type="text/javascript">
			
		function insertFileJudge(){
	    	var num1 = <%=judNum %>;
	    	var insertString = "INSERT INTO t_fieldjudge(gp2itid,judge_1,judge_2,judge_3) values ";
	    	
	    	var tempStr = /^([\u4e00-\u9fa5]{1,},){0,}([\u4e00-\u9fa5]{1,})$|^\s*$/;
	    	for(var i=0;i<num1;i++){
	    		if (i>0){
	    			insertString = insertString+",";
	    		}
	    		
	    		var flag1 = "id"+i;
	    		var id=document.getElementById(flag1).value;
	    		var flag3 = "judge_1"+i;
	    		var person=document.getElementById(flag3).value;
	    		if(!tempStr.test(person)){
				      Dialog.alert("项目裁判长包含特殊字符，请以英文逗号进行分隔");
				      return;
			        }
	    		var flag4 = "judge_2"+i;
	    		var phone=document.getElementById(flag4).value;
	    		if(!tempStr.test(phone)){
				      Dialog.alert("裁判长助理包含特殊字符，请以英文逗号进行分隔");
				      return;
			        }
	    		var flag5 = "judge_3"+i;
	    		var judges=document.getElementById(flag5).value;
	    		if(!tempStr.test(judges)){
				      Dialog.alert("裁判员包含特殊字符，请以英文逗号进行分隔");
				      return;
			        }
	    		var idnew = parseInt(id); 
	    		insertString = insertString + "("+idnew+",'"+person+"','"+phone+"','"+judges+"')";
	    	}
	    	var type = "fil";
	    
	    	
	    	$.ajax({
					url :"${pageContext.request.contextPath }/servlet/CheckJudgeServlet",
					type : 'post',
				   	data:{judType:type},
					success :function(mm){
							var revalue=mm.replace(/\r\n/g,'');
							if(revalue=="success")
							{
							    var flag = Dialog.confirm("田赛裁判已经添加过，继续添加原纪录将被覆盖，是否继续添加？");
								if(flag == true){
									$.ajax({
											url :"${pageContext.request.contextPath }/servlet/AddStuJudgeServlet",
											type : 'post',
										   	data:{insertString:insertString,judType:type},
											
											success :function(mm){
													var revalue=mm.replace(/\r\n/g,'');
													if(revalue=="success")
													{
														Dialog.alert("添加成功!");
													}
													else
														Dialog.alert("添加失败！");
												}
											});	
								}
							}
							else
								$.ajax({
											url :"${pageContext.request.contextPath }/servlet/AddStuJudgeServlet",
											type : 'post',
										   	data:{insertString:insertString,judType:type},
											
											success :function(mm){
													var revalue=mm.replace(/\r\n/g,'');
													if(revalue=="success")
													{
														Dialog.alert("添加成功!");
													}
													else
														Dialog.alert("添加失败！");
												}
											});	
						}
					});	
	    	
	    }
	    </script>
	</div>
	<div id="tabs-4">
		<table width="55%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" class="stripe_tb" align="center">
		<tr class="tableTitle">
                   <td  colspan="4" align="right" style="color:red;fontsize:12px;"><font>
                   人名之间请以英文逗号隔开</font>
                   </td>
                   </tr>
			  <tr  class="tableContent" >
				<td><div align="center" class="STYLE7"> 系部名称</div></td>
                <td><div align="center" class="STYLE7">系部联系人</div></td>
                <td><div align="center" class="STYLE7">联系人电话</div></td>
                <td><div align="center" class="STYLE7">裁判员</div></td>
			</tr>
				<c:forEach items="${sessionScope.departmentlist1}" var="dep">
					  <tr  class="tableContent" >
						<td width="20%">
						<input type="hidden" id="depid<%=num %>" value="${dep[0]}" />
						<input style="font-size:12px;" type="text"  id="depname<%=num %>" value="${dep[1]}" />	</td>
						
						<td><input style="font-size:12px;" type="text"  id="person<%=num %>" /></td>
						<td><input style="font-size:12px;" type="text"  id="phone<%=num %>" /></td>
						<td><input style="font-size:12px;" type="text"  id="judges<%=num %>" /></td>
						
					</tr>
				<%
					    num++;
				%>
			</c:forEach>
			  <tr  class="tableContent" >
					<td colspan="4" align="center">
					<input style="font-size:12px;" type="button"  id="button1" value="提 交" onClick="insertStuJudge()">
					<input  style="font-size:12px;" type="button" value="修 改" onClick="window.location.href='${pageContext.request.contextPath }/servlet/SelectStuentJudgeServlet'">
					</td>
				</tr>
		</table>
</div>

</div><!-- End demo -->

			<script type="text/javascript">
			

		function insertStuJudge(){
		
	    	var num1 = <%=num %>;
	    	var insertString = "INSERT INTO t_stujudge(sp2dpid,contact,tel,member) VALUES ";
	    	var tempStr = /^([\u4e00-\u9fa5]{1,},){0,}([\u4e00-\u9fa5]{1,})$|^\s*$/;
	    	var phoneStr = /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;
	    	for(var i=0;i<num1;i++){
	    		if (i>0){
	    			insertString = insertString+",";
	    		}
	    		
	    		var flag1 = "depid"+i;
	    		var id=document.getElementById(flag1).value;
	    		var flag3 = "person"+i;
	    		var person=document.getElementById(flag3).value;
	    		if(!tempStr.test(person)){
			      Dialog.alert("系部联系人包含特殊字符，请以英文逗号进行分隔");
			      return;
		        }
	    		var flag4 = "phone"+i;
	    		var phone=document.getElementById(flag4).value;
	    		if(!phoneStr.test(phone)){
			      Dialog.alert("电话号码不正确");
			      return;
		        }
	    		var flag5 = "judges"+i;
	    		var judges=document.getElementById(flag5).value;
	    		if(!tempStr.test(judges)){
		          Dialog.alert("裁判员包含特殊字符，请以英文逗号进行分隔");
		          return;
		        }
	    		var idnew = parseInt(id); 
	    		
	    		
	        
	    		
	    		insertString = insertString + "("+idnew+",'"+person+"','"+phone+"','"+judges+"')";
	    	}
	    	var type = "stu";
	    	
	    	$.ajax({
					url :"${pageContext.request.contextPath }/servlet/CheckJudgeServlet",
					type : 'post',
				   	data:{judType:type},
					success :function(mm){
							var revalue=mm.replace(/\r\n/g,'');
							if(revalue=="success")
							{
								var flag = Dialog.confirm("学生裁判已经添加过，继续添加原纪录将被覆盖，是否继续添加？");
								//var flag = Dialog.confirm("学生裁判已经添加过，继续添加原纪录将被覆盖，是否继续添加？");
								if(flag == true){
									$.ajax({
										url :"${pageContext.request.contextPath }/servlet/AddStuJudgeServlet",
										type : 'post',
									   	data:{insertString:insertString,judType:type},
										
										success :function(mm){
												var revalue=mm.replace(/\r\n/g,'');
												if(revalue=="success")
												{
													Dialog.alert("添加成功!");
												}
												else
													Dialog.alert("添加失败！");
											}
										});	
								}
							}
							else
								$.ajax({
										url :"${pageContext.request.contextPath }/servlet/AddStuJudgeServlet",
										type : 'post',
									   	data:{insertString:insertString,judType:type},
										
										success :function(mm){
												var revalue=mm.replace(/\r\n/g,'');
												if(revalue=="success")
												{
													Dialog.alert("添加成功!");
												}
												else
													Dialog.alert("添加失败！");
											}
										});	
						}
					});	
	    	
	    }
	    </script>

</body>
</html>
