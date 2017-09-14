<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/base/commons/pages/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
${style_css }
${friendone_js}
${easyui_css}
${jquery_js}
${jquery_form_js}
${flexigrid_js}
${flexigrid_css} 
${jmpopups_js}
${WdatePicker_js}
${jquery_easyui_min_js} 
${jquery_combox_js }
<script type="text/javascript" src="${ctx }/slm/template/scripts/Validator.js"></script>
<script type="text/javascript" src="${ctx }/slm/template/scripts/HashMap.js"></script>
<link rel="stylesheet" href="${ctx }/slm/template/swlupload/css/swfupload/default.css" type="text/css" />
<link rel="stylesheet" href="${ctx }/slm/template/swlupload/css/swfupload/button.css" type="text/css" />
<script src="${ctx }/slm/template/swlupload/scripts/swfupload/handlers.js" type="text/javascript"></script>
<script src="${ctx }/slm/template/swlupload/scripts/swfupload/swfupload.js" type="text/javascript"></script>
<script src="${ctx}/slm/frames/multiSelect/jquery.multiSelect.js"></script>
<link href="${ctx}/slm/frames/multiSelect/jquery.multiSelect.css" rel="stylesheet" type="text/css"/>
<script src="${ctx}/slm/frames/multiSelect/jquery.multiselect2side.js" type="text/javascript"></script>
<link rel="stylesheet" href="${ctx}/slm/template/styles/jquery.multiselect2side.css" type="text/css" media="screen" />  

</head>
<body ><!-- style="margin: 4px;" -->
<div style="width:100%;min-width:780px; " align="center">
<div style="text-align: left;"> 
<div align="left" class="caption" >需求管理 &gt; 新建需求</div> 	
<div style="">
</div>	
<table  border="0" cellspacing="0" cellpadding="0"  class="tbcss" style="float:left;margin-top: 1px;width:1118px;">
	<tr>
		<td>
			<table  width="760" border="0" cellspacing="0" cellpadding="0"  class="tbcss" style="margin-top: 1px;">
				<tr>
					<th class="specalt" width="120px"><font color=red>*</font>需求申请名称</th>
					<td colspan="3">
						<input type="text" style="width: 559px;" name="r_name" id="r_name" class="input-text"  maxlength="200" /> 
					</td>
				</tr>
				<tr>
					<th class="specalt"><font color=red >*</font>需求申请人</th>
					<td>
						<input type="text" style="width: 138px;" name="r_applyer" id="r_applyer" value="${sessionScope.loginuser.userName}" class="input-text" readonly="readonly" />
					</td>
					<th class="specalt"><font color=red>*</font>需求提出部门</th>
					<td>
						<input type="text" style="width: 138px;" name="r_resource" id="r_resource"  value="${sessionScope.loginuser.orgname}" class="input-text" readonly="readonly" />
						<input name="orgcode" id="orgcode" value="${sessionScope.loginuser.orgCode}" type=hidden />
					</td>
				</tr>
				<tr>
					<th class="specalt"><font color=red>*</font>子公司</th>
					<td >
						<fd:select dataSource="A_it_product" name="r_it_product" nullOption="true" style="width:158px;" selectedName="咪咕数媒" onchange="queryItsystem(this.value);"></fd:select>
					</td>
					<th class="specalt"><font color=red>*</font>产品线</th>
					<td id="c_it_systd" >
					</td>
				</tr>
				<tr>
					<th class="specalt"><font color=red>*</font>产品需求主管</th>
					<td id="c_it_manager" >
			<!-- 			<input type="text" style="width: 138px;" name="r_productdirector" id="r_productdirector" value="" class="input-text" readonly="readonly" /> -->
					</td>
			<!-- 		<input type="hidden" style="width: 138px;" name="r_productdirector" id="r_productdirector" value="" class="input-text" readonly="readonly" /> -->
					<th class="specalt">要求完成时间</th>
					<td >
						<input name="r_finishtime" id="r_finishtime" class="input-date"  type="text" style="width:138px;" onfocus="new WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',minDate:'%y-%M-%d'})" readonly="readonly"/> 
					</td>
				</tr>
				<tr>
					<th class="specalt">需求提出时间</th>
					<td>
						<jsp:useBean id="now" class="java.util.Date"/>
						<input name="r_starttime" id="r_starttime" class="input-date"  type="text" style="width: 138px;" value="<fmt:formatDate value="${now}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly"/>
					</td>
				</tr>
			</table>
			
			<table width="760" border="0" cellspacing="0" cellpadding="0"  class="tbcss" style="border-top:0px solid #C1DAD7;">
				<tr>
					<th class="specalt" width="120px"><font color=red>*</font>需求描述</th>
					<td>
						<textarea style="width: 559px;min-height: 120px;" class="input-textarea" name="r_des" id="r_des" 
						autoHeight="true" >
需求描述：
用户：
解决什么问题：
需求来源：
对标：
验收标准：</textarea>
					</td>
				</tr>
				<tr>
					<th class="specalt" width="120px"><font color=red>*</font>需求价值</th>
					<td>
						<textarea style="width: 559px;min-height: 120px;" class="input-textarea" name="r_value" id="r_value" autoHeight="true"></textarea>
					</td>
				</tr>
				<tr>
					<th class="specalt" width="120px">需求价值评估标准</th>
					<td>
						<textarea style="width: 559px;min-height: 120px;" class="input-textarea" name="r_value_eval" id="r_value_eval" autoHeight="true">
主观判断：
需求价值量化指标：
可考核时间：
配套资源：</textarea>
					</td>
				</tr>
				<tr>
					<th class="specalt" width="120px">备注</th>
					<td>
						<textarea style="width: 559px;min-height: 70px;" class="input-textarea" name="remark" id="remark" defaultvalue="输入字数数量不得大于2000" autoHeight="true"></textarea>
					</td>
				</tr>
				<tr>
					<th class="specalt">需求文档</th>
					<td>
						<!-- 将以下代码放入要使用上传功能的页面处 -->
						<input type="hidden" name="filetype" id="filetype" value="业务需求文档" ></input>
						<span id="spanButtonPlaceholder"></span>
						<div id="divFileProgressContainer"></div>
						<div id="thumbnails">
							<table id="infoTable" border="0" width="500" style="padding: 2px;margin-top:8px;">
							</table>
						</div>
					</td>
				</tr>
			</table>
			<table >
				<tr>
					<td align="left" style="padding-left: 360px;height: 30px;">
						<input type="button" onclick="submitform();" class="btn-five" value="提  交"/>&nbsp;&nbsp;
						<input type="button" onclick="saveform();" class="btn-five" value="保  存"/>
					</td>
				</tr>
			</table>
		</td>
		<td rowspan="1">
			<table border="0" cellpadding="0" class="tbcss" style="width:351px; margin:-4px";>
			     <tr >
					<td colspan="2">
						<a style="float:right;margin-right:123px;" href="${ctx }/slm/requestmgr/new-req-inst2.html" target="_blank">新建需求帮助说明</a><br />
					</td>
				</tr>
				<tr >
					<td colspan="2" style="text-align:center;"><font style="font-family:'宋体';font-weight:bold;">产品线对应的产品主管</font></></td>
				</tr>
				<tr>
					<td style="width:154px;">咪咕阅读</td>
					<td>戴骏翔(前台),杨延龙(后台),金永夫(技术内部)</td>
				</tr>
				<tr>
					<td>咪咕阅读</td>
					<td>罗晓芳</td>
				</tr>
				<tr>
					<td>企业阅读</td>
					<td>滕慧旭</td>
				</tr>
				<tr>
					<td>灵犀</td>
					<td>胡文青(灵犀),裘思科(灵犀bI)</td>
				</tr>
				<tr>
					<td>咪咕中信</td>
					<td>范战新</td>
				</tr>
				<tr>
					<td>咪咕书城</td>
					<td>孟翔宇</td>
				</tr>
				<tr>
					<td>咪咕文学网</td>
					<td>林旭</td>
				</tr>
				<tr>
					<td>咪咕学堂TV(在线教育)</td>
					<td>胡健磊</td>
				</tr>
				<tr>
					<td>手机报</td>
					<td>滕慧旭(企业版),陈俊(个人版)</td>
				</tr>
				<tr>
					<td>咪咕文化一级产品</td>
					<td>叶际斌</td>
				</tr>
				<tr>
					<td>ALM平台</td>
					<td>冯钢</td>
				</tr>
				<tr>
					<td colspan="2"><font color="blue">产品主管即产品经理的主管，流程里起到分配产品经理的作用</font></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;"><font style="font-family:'宋体';font-weight:bold;">系统大类对应部门需求主管</font></td>
				</tr>
				<tr>
					<td>BI</td>
					<td>朱耀伟</td>
				</tr>
				<tr>
					<td>客户端[阅读基线]</td>
					<td>王志君</td>
				</tr>
				<tr>
					<td>客户端[Kindle]</td>
					<td>罗晓芳</td>
				</tr>
				<tr>
					<td>企业阅读客户端[IOS]</td>
					<td>张晓庆</td>
				</tr>
				<tr>
					<td>企业阅读客户端[android]</td>
					<td>桑松玲</td>
				</tr>
				<tr>
					<td>书城平台</td>
					<td>胡红萍</td>
				</tr>
				<tr>
					<td>灵犀</td>
					<td>胡文青</td>
				</tr>
				<tr>
					<td>灵犀BI</td>
					<td>裘思科</td>
				</tr>
				<tr>
					<td>平台</td>
					<td>金永夫</td>
				</tr>
				<tr>
					<td>平台内部</td>
					<td>金永夫</td>
				</tr>
				<tr>
					<td>行业平台</td>
					<td>薛帆</td>
				</tr>
				<tr>
					<td>前端</td>
					<td>杨宗星</td>
				</tr>
				<tr>
					<td>设计</td>
					<td>魏丽萍</td>
				</tr>
				<tr>
					<td>在线教育</td>
					<td>莫春晓</td>
				</tr>
				<tr>
					<td>咪咕文化一级产品</td>
					<td>杨宗星</td>
				</tr>
				<tr>
					<td>手机报</td>
					<td>陈俊</td>
				</tr>
				<tr>
					<td>ALM平台</td>
					<td>冯钢</td>
				</tr>
				<tr>
					<td>咪咕中信</td>
					<td>张彦丰</td>
				</tr>
				<tr>
					<td colspan="2"><font color="blue">需求主管即需求经理的主管，流程里起到分配需求经理的作用，使需求能落实到分析人员</font></td>
				</tr>
			</table> 
		</td>
	</tr>
	<tr>
</tr>
</table>

<form name="newdemandform" id="newdemandform" method="post" action="">
	<input name="problem_synopsis" id="problem_synopsis" type=hidden />
	<input name="problem_description" id="problem_description" type=hidden />
	<input name="A_value" id="A_value" type=hidden />
	<input name="A_applyer_id" id="A_applyer_id" value="${sessionScope.loginuser.userID}" type="hidden" />
	<input name="A_applyer" id="A_applyer" type="hidden" />
<!-- 	<input name="A_reqline" id="A_reqline" type="hidden" /> -->
	<input name="A_submit_id" id="A_submit_id" type="hidden" />
	<input name="A_submit_name" id="A_submit_name" type="hidden" />
	<input name="A_comdate" id="A_comdate" type="hidden" />
	<!-- 
	<input name="A_firstsort" id="A_firstsort" type="hidden" />
	<input name="A_secondsort" id="A_secondsort" type="hidden" />
	 -->
	<input name="A_value" id="A_value" type="hidden" />
	<input name="A_resource" id="A_resource" type="hidden" />
	<input name="A_begindate" id="A_begindate" type=hidden />
	<input name="attachment" id="attachment" type=hidden />
	<input name="filenames" id="filenames" type=hidden />
	<input name="A_it_product" id="A_it_product" type=hidden />
	<input name="A_it_system" id="A_it_system" type=hidden />
<!-- 	<input name="A_reqattr" id="A_reqattr" type=hidden /> -->
	<input name="A_value_eval" id="A_value_eval" type=hidden />
	<input name="A_productdirector" id="A_productdirector" type=hidden />
	<input name="A_productdirector_id" id="A_productdirector_id" type=hidden />
	<input name="A_remark" id="A_remark" type=hidden />
</form>	
</div>
</div>
</body>


<SCRIPT type=text/javascript>

$(function(){
	$("#r_reqline").sexyCombo({autoFill: true});
	$("#r_it_product").sexyCombo({autoFill: true});
	$("#r_it_system").sexyCombo({autoFill: true});
// 	$("#r_reqattr").multiSelect({ oneOrMoreSelected: '*' });//需求属性
	//$("#r_firstsort").sexyCombo({autoFill: true});
	//$("#secondsort").sexyCombo({autoFill: true});
	//第一次加载产品线
	queryItsystem("");
});

$(document).ready(function() {	
// 	debugger;
	//进页面时查询总监id
    var under = getCheckedVal("under");
		var options = { 
    	        success:       callbackUser, 
    	        url:		"${ctx}/ajaxAction.do?method=json&common=getUserByRole&classes=organizationServiceImpl&id="+"${sessionScope.loginuser.orgCode}"+"&roleid="+"depadirector",
    	        type:      'post', 
    	        dataType:  'json',       
    	        clearForm: false        
    	    };
    	$('#frm').ajaxSubmit(options);
});

var r_submit_id="";//部门总监， 改造前是部门需求管理员
var r_submit_name="";
function callbackUser(ret){
if (ret!=null){   
	if (ret.list!=null){
		r_submit_id=ret.list[0].userid;//部门总监id
		r_submit_name=ret.list[0].username;//部门总监
		
		} 
	}
}

/**
 * 获取当前系统时间
 */
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    return currentdate;
}

function submitform() {
	// 需求申请名称
	var r_name=$("#r_name").val();
	// 需求申请人编号
	var r_applyMan=$("#r_applyer").val();
	// 需求申请人姓名
	var r_applyer = "${sessionScope.loginuser.userID}";
	// 需求提出部门
	var r_resource=$("#r_resource").val();
	//子公司
	var r_it_product=$("#r_it_product").find("option:selected").text();
	//产品线
	var r_it_system=$("#r_it_system").find("option:selected").text();
	//业务线--已去掉
// 	var req_line = $("#r_reqline").find("option:selected").text();
	// 完成时间
	var r_finishtime=$("#r_finishtime").val();
	//一级分类
//	var r_firstsort = $("#r_firstsort").find("option:selected").text();
	// 提出时间
	var r_starttime=$("#r_starttime").val();
	//二级分类
//	var secondsort =$("#secondsort").find("option:selected").text();
	//需求属性--已去掉
// 	var r_reqattr = $("#r_reqattr").text().replaceAll(",",";");;
	//产品管理主管
	var r_productdirector_id=$("#r_productdirector_id option:selected").val();//一个人
	// 需求描述、价值、标准
	var r_des=$("#r_des").val();
	var r_value =$("#r_value").val();
	var r_value_eval =$("#r_value_eval").val();
	var remark =$("#remark").val();
	var validator = new Validator();
	validator.checkNull(r_submit_id, "您的科室可能没有配置相关审批领导，请联系维护人员！");
	
	validator.checkNull(r_name, "请填写需求申请名称");
	validator.checkNull(r_applyMan, "请选择需求申请人");
	validator.checkNull(r_resource, "请选择需求提出部门");
// 	validator.checkNull(req_line, "请选择业务线");
// 	validator.checkNull(r_finishtime, "请输入完成时间");
	//validator.checkNull(r_firstsort, "请选择一级分类");
	validator.checkNull(r_starttime, "请选择需求提出时间");
// 	validator.checkNull(r_reqattr, "请选择需求属性");
	//validator.checkNull(secondsort, "请选择二级分类");
	validator.checkNull(r_des, "请填写需求描述");
	validator.checkNull(r_value, "请填写需求价值");
	validator.checkNull(r_it_product, "请选择子公司");
	validator.checkNull(r_it_system, "请选择产品线");
	
	validator.checkNull(r_productdirector_id, "此产品线缺少产品需求主管，请联系维护人员！");
	
	if(r_finishtime!=""&&r_finishtime!=null){
		if(dateDiff(r_finishtime,r_starttime)<0){
			validator.addErr("需求完成时间必须大于需求提出时间");
		}
	}
	var filenames = "";
	//获取页面中附件列表中的附件名称
	$("#infoTable tr td:nth-child(2)").each(function(){
		//alert($(this).text());
		filenames = filenames =="" ? $(this).text():filenames+";"+$(this).text();
  	});
	//360浏览器上传附件后表格显示跟IE不一致，获取不到附件名称
	if(filenames=='' || filenames =='undefined'){
		$("#infoTable tr td:nth-child(3)").each(function(){
			//alert($(this).text());
			filenames = filenames =="" ? $(this).text():filenames+";"+$(this).text();
	  	});
	}
 	if(validator.hasErr()){
		alert(validator.toString());
		return;
 	}
	$("#problem_synopsis").val(r_name);// 需求名称
	$("#problem_description").val(r_des.trim());// 需求描述
	$("#A_value").val(r_value.trim());// 需求价值
	$("#A_value_eval").val(r_value_eval);//需求价值评估标准
// 	$("#A_reqline").val(req_line);// 业务线
	//$("#A_firstsort").val(r_firstsort);// 需求价值
	//$("#A_secondsort").val(secondsort);//优先级	
	$("#A_submit_id").val(r_submit_id);//部门总监id -例jainghb
	$("#A_submit_name").val(r_submit_name);//部门总监
	$("#A_begindate").val(r_starttime);// 开始时间
	$("#A_comdate").val(r_finishtime);// 完成时间
	$("#A_applyer").val(r_applyMan);
	$("#A_resource").val(r_resource);
	$("#filenames").val(filenames);//页面中最终显示的附件名称
	$("#A_it_product").val(r_it_product);// 子公司
	$("#A_it_system").val(r_it_system);// 产品线
	var remark = "";
	$("#A_remark").val(remark);// 备注
	
	if(remark != "" || remark.length <= 2000 ){
		$("#A_remark").val("${sessionScope.loginuser.userName }"+","+remark+","+ getNowFormatDate()+";");
	}else{
		alert("输入字数数量大于2000,当前字数为:" + remark.length );
	}
	
// 	$("#A_reqattr").val(r_reqattr);//需求属性
	$("#A_productdirector_id").val(r_productdirector_id);//产品管理主管
	$("#A_productdirector").val($("#r_productdirector_id option:selected").text());//产品管理主管name
	
	var options = {     
	       
	        url:	   '${ctx}/ajaxAction.do?method=json&common=addtwo&classes=businessRequirementServiceImpl&opertype=add',
	        success:   addcallback,  // post-submit callback  表单提交成功后被调用的回调函数
	        type:      'post',        // 'get' or 'post', override for form's 'method' attribute 
	        dataType:  'json',        // 'xml', 'script', or 'json' (expected server response type) 
		    clearForm: true
	    };	      
	showProcessing("数据提交中，请稍候...");
	$('#newdemandform').ajaxSubmit(options);
	disableButtons();
}
function addcallback(ret){

	if (ret.jsondata.retCode=="0000"){
		//重新加載
		alert(ret.jsondata.retDesc);
		location.href = "${ctx}/callAction.do?method=call&nextPage=/slm/requestmgr/new-req.jsp";
		//window.location.reload();
	}else if(ret.jsondata.retCode=="2222"){
		alert(ret.jsondata.retDesc);
	}else{
		alert("操作失败");
	}		
}

function dateDiff(d1,d2){
	var result = Date.parse(d1.replace(/-/g,"/"))- Date.parse(d2.replace(/-/g,"/"));
	return result;
}

//自动适应高度
$.fn.autoHeight = function(){
	function autoHeight(elem){
		elem.style.height = 'auto';
		elem.scrollTop = 0; //防抖动
		elem.style.height = elem.scrollHeight + 'px';
	}
	
	this.each(function(){
		autoHeight(this);
		$(this).on('keyup', function(){
			autoHeight(this);
		});
	});
};
$('textarea[autoHeight]').autoHeight();

var swfu;
//页面加载初始化上传控件,360浏览器SWFUpload新定义了一个jsessionid 导致ActionFilter中获取不到login，因此参数中需要传jsessionid
window.onload = function () {
	swfu = new SWFUpload({
		upload_url: '${ctx}/ajaxAction.do;jsessionid=<%=request.getSession().getId()%>?method=json&common=uploadFile&classes=businessRequirementServiceImpl',
		// File Upload Settings
		file_size_limit : "",	// 1000MB
		file_types : "",
		file_types_description : "",
		file_upload_limit : "0",
		
		file_queue_error_handler : fileQueueError,
		file_dialog_complete_handler : fileDialogComplete,//选择好文件后提交
		file_queued_handler : fileQueued,
		upload_progress_handler : uploadProgress,
		upload_error_handler : uploadError,
		upload_success_handler : uploadSuccess,//一个文件上传成功后调用
		upload_complete_handler : uploadComplete,

		// Button Settings
		button_image_url : "${ctx }/slm/template/swlupload/images/swfupload/SmallSpyGlassWithTransperancy_17x18.png",
		button_placeholder_id : "spanButtonPlaceholder",
		button_width: 450,
		button_height: 18,
		button_text : '<span class="button">选择附件</span>',
		button_text_style : '.button { font-family: Helvetica, Arial, sans-serif; font-size: 12pt; } .buttonSmall { font-size: 10pt; }',
		button_text_top_padding: 0,
		button_text_left_padding: 18,
		button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
		button_cursor: SWFUpload.CURSOR.HAND,
		flash_url : "${ctx }/slm/template/swlupload/scripts/swfupload/swfupload.swf",

		custom_settings : {
			upload_target : "divFileProgressContainer"
		},
		debug: false  //是否显示调试窗口
	});
};

function fileDialogComplete(){
	uploadfile();
}

//在提交页面时调用该方法上传文件
function uploadfile(){
	 //swfu.addPostParam("instid" , wfinstid); //设置传递的参数
	 swfu.addPostParam("filetype" , $("#filetype").val());
	 swfu.startUpload();//开始上传附件
}

//一个文件上传成功后返回，其中serverData是服务端返回的数据
function uploadSuccess(file,serverData){
	try {
		
		var progress = new FileProgress(file, this.customSettings.progressTarget);
		progress.setComplete();
		progress.setStatus("Complete.");
		progress.toggleCancel(false);
		var ret = JSON.parse(serverData);
		//上传多个文件拼接起来，但可能上传成功后，又删除了附件，所以需要在定义一个参数，从页面中直接获取附件名称
		if(ret.jsondata.retCode=="0000"){
			if($('#attachment').val()==""){
				$('#attachment').val(ret.jsondata.content);
			}else {
				$('#attachment').val($('#attachment').val()+";"+ret.jsondata.content);
			}
		}
	} catch (ex) {
		this.debug(ex);
	}
}

//保存草稿方法
function saveform(){
	// 需求申请名称
	var r_name=$("#r_name").val();
	// 需求申请人编号
	var r_applyMan=$("#r_applyer").val();
	// 需求申请人姓名
	var r_applyer = "${sessionScope.loginuser.userID}";
	// 需求提出部门
	var r_resource=$("#r_resource").val();
	//子公司
	var r_it_product= $("#r_it_product").find("option:selected").text();
	//产品线
	var r_it_system = $("#r_it_system").find("option:selected").text();
	//业务线
// 	var req_line = $("#r_reqline").find("option:selected").text();
	//需求属性
// 	var r_reqattr = $("#r_reqattr").text().replaceAll(",",";");
	// 完成时间
	var r_finishtime=$("#r_finishtime").val();  
	// 提出时间
	var r_starttime=$("#r_starttime").val();
	//产品管理主管
	var r_productdirector_id=$("#r_productdirector_id").val();//一个人
	// 需求描述、价值、标准
	var r_des=$("#r_des").val();
	var r_value =$("#r_value").val();
	var r_value_eval =$("#r_value_eval").val();
	//备注 
	var remark =$("#remark").val();
	var validator = new Validator();
	
	validator.checkNull(r_name, "请填写需求申请名称");
	
	var filenames = "";
	//获取页面中附件列表中的附件名称
	$("#infoTable tr td:nth-child(2)").each(function(){
		//alert($(this).text());
		filenames = filenames =="" ? $(this).text():filenames+";"+$(this).text();
  	});
	//360浏览器上传附件后表格显示跟IE不一致，获取不到附件名称
	if(filenames=='' || filenames =='undefined'){
		$("#infoTable tr td:nth-child(3)").each(function(){
			//alert($(this).text());
			filenames = filenames =="" ? $(this).text():filenames+";"+$(this).text();
	  	});
	}
	//alert(filenames);

 	if(validator.hasErr()){
		alert(validator.toString());
		return;
 	}
	$("#problem_synopsis").val(r_name);// 需求名称
	$("#problem_description").val(r_des.trim());// 需求描述
	$("#A_value").val(r_value.trim());// 需求价值
	$("#A_value_eval").val(r_value_eval);//需求价值评估标准
// 	$("#A_reqline").val(req_line);// 业务线
	$("#A_submit_id").val(r_submit_id);//部门总监，改造前是部门需求管理员
	$("#A_submit_name").val(r_submit_name);//部门需求管理员
	$("#A_begindate").val(r_starttime);// 开始时间
	$("#A_comdate").val(r_finishtime);// 完成时间
	$("#A_applyer").val(r_applyMan);
	$("#A_resource").val(r_resource);
	$("#filenames").val(filenames);//页面中最终显示的附件名称
	$("#A_it_product").val(r_it_product);// 子公司
// 	$("#A_reqattr").val(r_reqattr);//需求属性
	$("#A_it_system").val(r_it_system);// 产品线
	$("#A_remark").val(remark);// 产品线
	
	$("#A_productdirector_id").val(r_productdirector_id);//产品管理主管id
	$("#A_productdirector").val($("#r_productdirector").val());//产品管理主管
	var options = {     
	       
	        url:	   '${ctx}/ajaxAction.do?method=json&common=addtwo&classes=businessRequirementServiceImpl&opertype=save',
	        success:   addcallback,  // post-submit callback  表单提交成功后被调用的回调函数
	        type:      'post',        // 'get' or 'post', override for form's 'method' attribute 
	        dataType:  'json',        // 'xml', 'script', or 'json' (expected server response type) 
		    clearForm: true
	    };	      
	showProcessing("数据提交中，请稍候...");
	$('#newdemandform').ajaxSubmit(options);
	disableButtons();
}

//根据子公司设置产品线
function queryItsystem(pid){
	pid=$("#r_it_product option:selected").val();//子公司id
	var pName=$("#r_it_product option:selected").text();//子公司name
// 	alert(pName);
	/* var url = "${ctx}/ajaxAction.do?method=json&common=querySystemByPid&classes=ProductTreeServiceImpl&pid="+pid;
	$("#c_it_systd").html("");
	var select = $("<select>");
	select.attr("id","r_it_system");
	select.attr("name","r_it_system");
	
	$("#c_it_systd").html(select);
	var option=$("<option>");
	option.val("");
	option.text("");
	select.append(option);
	$.getJSON(url,function(data){
		$.each(data.list,function(){
			option=$("<option>");
			option.val(this.systemId);
			option.text(this.systemName);
			$("#r_it_system").append(option);
		});
		$("#r_it_system").sexyCombo({autoFill: true});
	}); */
	if(pid!=null&&pid!=""){
		var url = "${ctx}/ajaxAction.do?method=json&common=querySystemByPid&classes=ProductTreeServiceImpl&pid="+pid;
		$("#c_it_systd").html("");
		var select = $("<select onchange='queryItsystem3();'>");
		select.attr("id","r_it_system");
		select.attr("name","r_it_system");
		
		$("#c_it_systd").html(select);
		var option=$("<option>");
		option.val("");
		option.text("");
		select.append(option);
		$.getJSON(url,function(data){
			$.each(data.list,function(){
				option=$("<option>");
				option.val(this.systemId);
				option.text(this.systemName);
				$("#r_it_system").append(option);
			});
			$("#r_it_system").sexyCombo({autoFill: true});
		});
		
	}else{
		//产品线和主管都置为空
		$("#c_it_systd").html("");
		var select = $("<select >");
		select.attr("id","r_it_system");
		select.attr("name","r_it_system");
		$("#c_it_systd").html(select);
		$("#r_it_system").sexyCombo({autoFill: true});
		
// 		$("#r_productdirector").val("");
		$("#r_productdirector_id").val("");
		
	}
}

//根据产品线去查询管理主管	
 function queryItsystem3(){
	var itSystem=$("#r_it_system option:selected").val();//产品线id
	if(itSystem!=null&&itSystem!=""){
		var url = "${ctx}/ajaxAction.do?method=json&common=queryUserByItSys&classes=ProductTreeServiceImpl&itSystem="+itSystem;
		$("#c_it_manager").html("");
		var select = $("<select '>");
		select.attr("id","r_productdirector_id");
		select.attr("name","r_productdirector_id");
		$("#c_it_manager").html(select);
		var option=$("<option>");
		option.val("");
		option.text("");
		select.append(option);
		$.getJSON(url,function(data){
			if(data!=null&&data!=""){
				$.each(data.list,function(){
					option=$("<option>");
					option.val(this.userid);
					option.text(this.username);
					$("#r_productdirector_id").append(option);
				});
				$("#r_productdirector_id").sexyCombo({autoFill: true});
			}else{
				$("#c_it_manager").html("");
				select = $("<select >");
				select.attr("id","r_productdirector_id");
				$("#c_it_manager").html(select);
				$("#r_productdirector_id").sexyCombo({autoFill: true});
			}
		});
		
	}else{
		$("#c_it_manager").html("");
		var select = $("<select >");
		select.attr("id","r_productdirector_id");
		$("#c_it_manager").html(select);
		$("#r_productdirector_id").sexyCombo({autoFill: true}); 
	}
	
} 


</script>
</html>
