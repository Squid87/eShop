<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<script src="jquery.js"></script>
	<script>
		function addBasket(id){
			var dataStr = "id_good="+id;	
			alert(id);
			$.ajax(
				{
					type:"GET",
					url:"catalog",
					data:dataStr,
					success:function(msg){
						$("h1").html(msg);						
					}
				}		
			)
			
		}
		
	</script>
	
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
</head>
<body>
	<h1></h1>
	<table width="50%" height="30%" border="1">
		<c:forEach items="${goods}" varStatus="num" var="good">
			<tr>
				<td>${num.count}</td>
				<td>${good.title}</td>
				<td>${good.price}</td>
				<td><a onclick="addBasket(${good.id})" href='#'>Добавить в корзину</a></td>
			</tr>
		</c:forEach>
	</table>
	<a href="Basket">Перейти в корзину</a>
</body>
</html>