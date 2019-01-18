var ename=document.getElementById("ename");
var epassword=document.getElementById("epassord");
var ec=document.getElementsByClassName("ececk_warning");

ename.focus();
ename.onblur=function(){
	if(ename.value=="")
	{
		ec[0].innerText="用户名不能为空";
	}
}

ename.onfocus=function(){
	ec[0].innerText="";
}


epassword.onblur=function(){
	if(epassword.value=="")
	{
		ec[1].innerText="密码不能为空";
	}
}

epassword.onfocus=function(){
	ec[1].innerText="";
}
