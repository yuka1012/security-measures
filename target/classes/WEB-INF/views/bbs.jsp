<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>掲示板</title>
</head>
<body>
<h3>XSS脆弱性の確認</h3>
<p>内容に<br>
「&lt;script&gt;alert("XSS！");&lt;/script&gt;」<br>
と入力し投稿ボタンを押してください。</p>
<h3>XSRF脆弱性の確認</h3>
<p>内容に<br>
「このページ面白いよ！&lt;br&gt;&lt;a href="http://localhost:8080/security/xsrfattack.html"&gt;クリックしてみて！&lt;/a&gt;」<br>
と入力し投稿ボタンを押してください。</p>
<form action="${pageContext.request.contextPath}/bbs/postArticle" method="post">
	名前<br>
	<input type="text" name="name"><br>
	内容<br>
	<textarea rows="5" cols="20" name="body"></textarea><br>
	<input type="submit" value="投稿"><br>
</form>

<c:forEach var="article" items="${articleList}" varStatus="status">
	<hr>
	番号:${status.index}<br>
	名前:${article.name}<br>
	内容:${article.body}<br>
	<form action="${pageContext.request.contextPath}/bbs/deleteArticle" method="post">
	    <input type="hidden" name="index" value="${status.index}">
		<input type="submit" value="削除">
	</form>
</c:forEach>
</body>
</html>