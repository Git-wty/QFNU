var lname = document.getElementById("lname");
var lpassword = document.getElementById("lpassword");
var lrepassword = document.getElementById("lrepassword");
var lsurname=document.getElementById("lsurname");
var lschool=document.getElementById("lschool");
var login_btn=document.getElementById("login_btn");
var ec = document.getElementsByClassName("ececk_warning");
var userpattern = /^[a-zA-Z0-9_]{6,18}$/;
var pwdpattern = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z]).*$/;
var a,b,c;

lname.focus();

lname.onblur = function() {
	if(userpattern.test(lname.value)) {
		ec[0].innerText = "";
		a=1;
	} else if(lname.value == "") {
		ec[0].innerText = "用户名不能为空";

	} else {
		ec[0].innerText = "用户名长度为6-18个数字英文字符或下划线";

	}
}

lname.onfocus = function() {
	ec[0].innerText = "";
}





lpassword.onblur = function() {
	if(pwdpattern.test(lpassword.value)) {
		ec[1].innerText = "";
		b=1;
	} else if(lpassword.value == "") {
		ec[1].innerText = "密码不能为空";
	} else {
		ec[1].innerText = "必须包含英文字母大小写和数字，长度不能少于6个字符";
	}
}

lpassword.onfocus = function() {
	ec[1].innerText = "";
}

lrepassword.onblur = function() {

	if(lrepassword.value == "") {
		ec[2].innerText = "确认密码不能为空";
	} else if(lrepassword.value === lpassword.value) {
		ec[2].innerText = "";
		c=1;
	} else {
		ec[2].innerText = "两次密码不相同";
	}
}

lrepassword.onfocus = function() {
	ec[2].innerText ="";
}

lsurname.onblur=function(){
	if(lsurname.value==""){
		ec[3].innerText="真实姓名不能为空";
	}
}

lsurname.onfocus=function(){
	ec[3].innerText="";
}

lschool.onblur=function(){
	if(lschool.value==""){
		ec[4].innerText="所在学校不能为空";
	}
}

lschool.onfocus=function(){
	ec[4].innerText="";
}

function checking(){
	if(a!=1){
		alert("请检查用户名的格式是否正确");
		return false;
	}
	else if(b!=1){
		alert("请检查密码的格式是否正确");
		return false;
	}
	else if(c!=1){
		alert("请检查确认密码是否正确填写");
		return false;
	}
}