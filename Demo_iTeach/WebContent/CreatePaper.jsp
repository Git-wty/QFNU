<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>

	<head>
		<meta charset="UTF-8">
		<title></title>

		<style>
			body{
				background: #f3f5f6;;
			}
			.all{
				position: relative;
			}
			.title {
				height: 37px;
				background-color: #2d3447;
				line-height: 37px;
				text-align: center;
				color: white;
			}
			
			.paper{
				width: 600px;
				margin: 0 auto;
				color: orangered;
				font: "微软雅黑";
				font-size: 18px;
				font-weight: bold;
			}
			
			.paper input{
				margin: 10px;
				width: 160px;
				height: 25px;
				border: 1px solid gold;
			}
			
			.question_type {
				margin: 120px 0 120px 20px;
				position: fixed;
				top: 0;
				width: 150px;
				height: 300px;
				border: solid 1px  #dde5ed;;
			}
			
			.question_type button{
				width: 120px;
			    height: 32px;
			    border-radius: 2px;
			    background-color: #2672ff;
			    line-height: 32px;
			    text-align: center;
			    color: #fff;
			    font-size: 14px;
			    cursor: pointer;
			    border: none;
			    margin: 10px 10px 20px 10px;
			}
			
			.submit{
				position: absolute;
				left: 50%;
				bottom: -150px;
			}
			
			.submit button{
				width: 112px;
			    height: 32px;
			    border-radius: 2px;
			    background-color: #2672ff;
			    line-height: 32px;
			    text-align: center;
			    color: #fff;
			    font-size: 14px;
			    cursor: pointer;
			    border: none;
			}
			
			.main{
				width: 80%;
				margin: 0 auto;
				font: "微软雅黑";
				font-size: 17px;
				
			}
			
			.hint{
				height: 300px;
				border: dashed 1px #2672ff;
				text-align: center;
				line-height: 300px;
				font-size: 16px;
			}
			
			.main input{
				width: 300px;
				height: 25px;
				margin: 10px;
				color: gold;
				border: 1px solid silver;
			}
			
			.main input[type="radio"]{
				vertical-align: middle;
				width: 16px;
			}
			
			.main input[type="checkbox"]{
				vertical-align: middle;
				width: 16px;
			}
			
			.main form{
				text-align: center;
				padding-left: 100px;
				padding-right: 100px;
			}
			
			input[class^="delete"]{
					position:absolute;
					display: block;
					float: right;
					width: 50px;
					height: 50px;
					border-radius: 50%;
					background: url(img/chahao.png);
					background-repeat: no-repeat;
					background-size: 50px 50px;
			}
			
			
		</style>
	</head>

	<body>
		<div class="all">
			<div class="title">
				在线组卷
			</div>
			
 			<div class="paper"> 
 				
 						试卷编号:<%=(int)request.getAttribute("paper_id") %>
						
 						试卷名称:<%= (String)request.getAttribute("paper_name") %>
 				
 			</div> 

			<div class="middle">
				<div class="question_type">
					<button class="create_selection">添加选择题</button>
				
<!-- 					<button class="create_multiselection">添加多选题</button> -->
				
<!-- 					<button class="create_blank">添加填空题</button> -->
					
					<button class="create_judgment">添加判断题</button>

					<button class="create_simple">添加简答题</button>
				</div>
			</div>
			
				<!--添加题目内容区域-->
				<div class="main"> 
					
					
					<form action="selectionServlet" class="servlet_selection">
						
					</form>
					
					
					<form action="JudgmentServlet" class="servlet_judgment">
 					
 					</form>
 					
 					<form action="simpleServlet" class="servlt_simple">
 						
 					</form>
					<div class="hint">
						请点击左侧按钮添加问题
					</div>
					<div class="submit">
				<!--提交按钮-->
				<button class="submit_paper">提交</button>
					</div>
				</div>
				

		</div>

		

	

		

		<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
		<script>
		    var enviroment=0;
			var flag = 0;
			var selection_flag = 0;
			var blank_flag = 0;
			var judgment_flag = 0;
			var multiselection_flag = 0;
			var simple_flag = 0;

			$(document).ready(function() {

				//添加选择题
				$(".create_selection").click(function() {
					selection_flag++;
					flag++;
					$(".servlet_selection").append("<div class='selection_content"+flag+"'> <input type='button' value='' class='delete_selection"+selection_flag+"' />"+"<span class='selection_flag_num"+selection_flag+"'>"+flag+"</span>输入题目说明:<input name='selection_name"+selection_flag+"' /> <input hidden='hidden' value='"+flag+"' name='selection_id"+selection_flag+"' /><br/> <input type='radio' checked='checked' value='A' name='anwser"+selection_flag+"' /> 选择题A选项<input name='selection_a"+selection_flag+"' /> <br /> <input type='radio' value='B' name='anwser"+selection_flag+"' /> 选择题B选项<input name='selection_b"+selection_flag+"' /> <br /> <input type='radio' value='C' name='anwser"+selection_flag+"' /> 选择题C选项<input name='selection_c"+selection_flag+"' /> <br /> <input type='radio' value='D' name='anwser"+selection_flag+"' /> 选择题D选项<input name='selection_d"+selection_flag+"' /> <input hidden='hidden' value='"+selection_flag+"' name='selection_num' /></div><br/>");
					
					if(flag>0){
					$(".hint").css("display","none");
					}else{
					$(".hint").css("display","block");
					}
					for(var i=1;i<=flag;i++)
				{	
					console.log($(".selection_flag_num"+i).text());
					if($(".selection_flag_num"+i).text()==flag){
					$(".delete_selection"+i).css("display","block");
						//删除方法
				$(".delete_selection"+i).click(function(){
					$(".selection_content"+(i-1)).remove();
					flag--;
					selection_flag--;
				});
				}else{
					$(".delete_selection"+i).css("display","none");
					$("[class^=delete_judgment]").css("display","none");
					$("[class^=delete_simple]").css("display","none");
				}
				
			
				}
				

					//		$("."+selection_class).append("<form action='selectionServlet'>选择题序号:<input type='text' name='selection_id'/>选择题名称:<input type='text' name='selection_name_" + selection_flag+ "'/><br/><input type='radio' name='answer' value='r_a'/>选择题A选项:<input type='text' name='selection_a_" + selection_flag+ "'/><br/><input type='radio' name='answer' value='r_b'/>选择题B选项:<input type='text' name='selection_b_" + selection_flag+ "'/><br/><input type='radio' name='answer' value='r_c'/>选择题C选项:<input type='text' name='selection_c_" + selection_flag+ "'/><br/><input type='radio' name='answer' value='r_d'/>选择题D选项:<input type='text' name='selection_d_" + selection_flag+ "'/><br/><button type='submit'>提交</button></form>");

				});	


				//添加判断题
				$(".create_judgment").click(function() {
					judgment_flag++;
					flag++;
					$(".servlet_judgment").append("<div class='judgment_content"+flag+"'> <input type='button' value='' class='delete_judgment"+judgment_flag+"'/>"+"<span class='judgment_flag_num"+judgment_flag+"'>"+flag+"</span>输入题目说明:<input name='judgment_name"+judgment_flag+"' /> <input hidden='hidden' value='"+judgment_flag+"'  name='judgment_id"+judgment_flag+"' /><br/> <input type='radio'  checked='checked' value='正确' name='anwser"+judgment_flag+"' />正确 <input type='radio' value='错误' name='anwser"+judgment_flag+"' />错误<br /><input hidden='hidden'  value='"+judgment_flag+"' name='judgment_num' /> </div>");					
				//判断提示是否需要显示或者消失
				if(flag>0){
					$(".hint").css("display","none");
					}else{
					$(".hint").css("display","block");
					}
					
					for(var i=1;i<=flag;i++)
				{	
					
					if($(".judgment_flag_num"+i).text()==flag){
					$(".delete_judgment"+i).css("display","block");
						//删除方法
				$(".delete_judgment"+i).click(function(){
					$(".judgment_content"+(i-1)).remove();
					
					flag--;
					judgment_flag--;
				});
				}else{
					$(".delete_judgment"+i).css("display","none");
					$("[class^=delete_selection]").css("display","none");
					$("[class^=delete_simple]").css("display","none");
				}
				
			
				}
				
				
					
				});



				//添加简答题
				$(".create_simple").click(function() {
					simple_flag++;
					flag++;
					$(".servlt_simple").append("<div class='simple_content"+flag+"'> <input type='button' value='' class='delete_simple"+simple_flag+"'/>"+"<span class='simple_flag_num"+simple_flag+"'>"+flag+"</span>输入题目说明:<input name='simple_name"+simple_flag+"' /> <input hidden='hidden' value='"+simple_flag+"' name='simple_id"+simple_flag+"' /><br/><input hidden='hidden'  value='"+simple_flag+"' name='simple_num' />  </div>");
				if(flag>0){
					$(".hint").css("display","none");
					}else{
					$(".hint").css("display","block");
					}
			for(var i=1;i<=flag;i++)
				{	
					
					if($(".simple_flag_num"+i).text()==flag){
					$(".delete_simple"+i).css("display","block");
						//删除方法
					console.log(i);
				$(".delete_simple"+i).click(function(){
				
					$(".simple_content"+(i-1)).remove();
					flag--;
					simple_flag--;
				});
				}else{
					$(".delete_simple"+i).css("display","none");
					$("[class^=delete_selection]").css("display","none");
					$("[class^=delete_judgment]").css("display","none");
				}
				
			
				}
				});

				//提交paper表单

				$('.submit_paper').click(function() {
					
						if(selection_flag>0){
							$(".servlet_selection").submit();
							selection_flag=0;
							}
				
						
						window.setTimeout(function(){
							if(judgment_flag>0&&selection_flag==0){
								$(".servlet_judgment").submit();
								judgment_flag=0;
								}
						},100);
						
						window.setTimeout(function(){
							if(simple_flag>0&&selection_flag==0&&judgment_flag==0){
								$(".servlt_simple").submit();
								}
						},200);
						
						
						
					
				
				});
				
				
				
				
				


			
			});
		</script>
	</body>

</html>