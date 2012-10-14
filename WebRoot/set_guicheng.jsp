<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
  <head>  
    <title>基本规程设置</title>
    <link href="${pageContext.request.contextPath }/css/subcss.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.6.min.js"></script>
		 <script type="text/javascript" src="${pageContext.request.contextPath }/js/zDialog_inner.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/zDrag.js"></script>


 

<script type="text/javascript">

//隔行变色
	$(document).ready(function(){
			
			 $(".stripe_tb tr").mouseover(function(){ //如果鼠标移到class为stripe_tb的表格的tr上时，执行函数
			 $(this).addClass("over");}).mouseout(function(){ //给这行添加class值为over，并且当鼠标一出该行时执行函数
			 $(this).removeClass("over");}) //移除该行的class
			 $(".stripe_tb tr:even").addClass("alt"); //给class为stripe_tb的表格的偶数行添加class值为alt
			
		});
</script>

    <script type="text/javascript">
    function addgc() {
    	
    	var action = $("#action").val();
    	var conts = $("#conts").val();
    	var pionts = $("#pionts").val();
    	var others = $("#others").val();
    	//var sportsname = $("select").find("option:selected").text();
		if (action.length == 0) {
		Dialog.alert("内容不能为空!");
		return false;
		}
		if (conts.length == 0) {
		Dialog.alert("内容不能为空!");
		return false;
		}
		if (pionts.length == 0) {
		Dialog.alert("内容不能为空!");
		return false;
		}
		if (others.length == 0) {
		Dialog.alert("内容不能为空!");
		return false;
		}
    	
		$.ajax( {
					url : "${pageContext.request.contextPath }/servlet/GuiChengServlet",
					type : 'post',
					data : { action:action,conts:conts,pionts:pionts,others:others},
				
					success : function(mm) {
						var revalue = mm.replace(/\r\n/g, '');
						 
						if (revalue == "success") {
							Dialog.alert("提交成功!", function() {
								window.location.href = window.location.href;
							});
						} else
							Dialog.alert("提交失败!", function() {
								window.location.href = window.location.href;
							});
					}
					 
				});
	
}
</script>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"><style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
-->
</style></head>
  <body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="pageTitle">赛前设置-->赛事规程</span></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>
  <%-- <div style="position:relative; margin:0 auto;  width: 702px; height: 1310px; border: 2px outset #0099FF; ">--%>
    <table width="55%" height="54" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" class="stripe_tb" align="center">
	  	<tr class="tableTitle" height="30" >
	  	  <td width="702" align="center" colspan="3">基本规程</td>
       </tr>
      
      <tr class="tableContent">
        <td>参赛办法 ：</td>
        <td colspan="2"><textarea name="action" id="action" cols="60" rows="15"></textarea></td>
      </tr>
      <tr class="tableContent">
        <td>竞赛说明：</td>
        <td colspan="2"><textarea name="conts" id="conts" cols="60" rows="15"></textarea></td>
      </tr>
      <tr class="tableContent">
        <td>计分方法：</td>
        <td colspan="2"><textarea name="pionts" id="pionts" cols="60" rows="15"></textarea></td>
      </tr>
       <tr class="tableContent">
        <td width="132" height="1">其他：</td>
        <td colspan="2">
        <label>
          <textarea name="others" id="others" cols="60" rows="15"></textarea>
        </label></td>
      </tr>
       <tr class="tableContent">
        <td  colspan="3" align="center">
        
			<input type="button" name="button" id="button" onClick="addgc()" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;
			
       
       <a href="${pageContext.request.contextPath }/servlet/SeleteGuiChengServlet"><input type="button" style="fontsize:12px;" value="修改"/></a></td>
        </tr>
   </table>
   </td>
   </tr>
   </table>
<br/>

</body>
</html>
