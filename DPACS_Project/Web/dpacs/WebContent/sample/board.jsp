<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
	<html lang="en" class=" js no-touch no-android chrome no-firefox no-iemobile no-ie no-ie10 no-ie11 no-ios">
<head>
	<meta charset="utf-8">
	<title>게시판 | Board</title>
	<meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="/css/bootstrap.css" type="text/css">
	<link rel="stylesheet" href="/css/app.css" type="text/css">
	<!--[if lt IE 9]>
	    <script src="js/ie/respond.min.js" cache="false"></script>
	    <script src="js/ie/html5.js" cache="false"></script>
	    <script src="js/ie/fix.js" cache="false"></script>
	  <![endif]-->
	  
	<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/js/bootstrap.js"></script>
	<script type="text/javascript" src="/js/app.js"></script>
	
</head>
<body style="background-color: white;">
	<section class="hbox stretch">
		<!-- .aside -->
		<aside class="bg-dark aside-sm" id="nav">
			<section class="vbox">
				<header class="dker nav-bar">
					<a class="btn btn-link visible-xs"
						data-toggle="class:nav-off-screen" data-target="#nav"> <i
						class="fa fa-bars"></i>
					</a> <a class="btn btn-link visible-xs" data-toggle="class:show"
						data-target=".nav-user"> <i class="fa fa-comment-o"></i>
					</a>
				</header>
				<section class="w-f">
					<div class="lter nav-user hidden-xs pos-rlt">
						<div class="nav-avatar pos-rlt">
							<a href="#" class="thumb-sm avatar animated rollIn"
								data-toggle="dropdown"> <span class="caret caret-white"></span>
							</a>
							<ul class="dropdown-menu m-t-sm animated fadeInLeft">
								<span class="arrow top"></span>
								<li><a href="#">Settings</a></li>
								<li><a href="profile.html">Profile</a></li>
								<li><a href="#"> <span
										class="badge bg-danger pull-right">3</span> Notifications
								</a></li>
								<li class="divider"></li>
								<li><a href="docs.html">Help</a></li>
								<li><a href="signin.html">Logout</a></li>
							</ul>
							<div class="visible-xs m-t m-b">
								<a href="#" class="h3">John.Smith</a>
								<p>
									<i class="fa fa-map-marker"></i> London, UK
								</p>
							</div>
						</div>
						<div class="nav-msg">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <b
								class="badge badge-white count-n">2</b>
							</a>
							<section
								class="dropdown-menu m-l-sm pull-left animated fadeInRight">
								<div class="arrow left"></div>
								<section class="panel bg-white">
									<header class="panel-heading">
										<strong>You have <span class="count-n">2</span>
											notifications
										</strong>
									</header>
									<div class="list-group">
										<a href="#" class="media list-group-item"> <span
											class="pull-left thumb-sm">
										</span> <span class="media-body block m-b-none"> Use awesome
												animate.css<br> <small class="text-muted">28
													Aug 13</small>
										</span>
										</a> <a href="#" class="media list-group-item"> <span
											class="media-body block m-b-none"> 1.0 initial
												released<br> <small class="text-muted">27 Aug
													13</small>
										</span>
										</a>
									</div>
									<footer class="panel-footer text-sm">
										<a href="#" class="pull-right"><i class="fa fa-cog"></i></a> <a
											href="#">See all the notifications</a>
									</footer>
								</section>
							</section>
						</div>
					</div>
					<nav class="nav-primary hidden-xs">
						<ul class="nav">





							<li><a href="board.do"> <i class="fa fa-pencil"></i> <span>Board</span>
							</a></li>

						</ul>
					</nav>
				</section>
				<footer class="footer bg-gradient hidden-xs">
					<a href="modal.lockme.html" data-toggle="ajaxModal"
						class="btn btn-sm btn-link m-r-n-xs pull-right"> <i
						class="fa fa-power-off"></i>
					</a> <a href="#nav" data-toggle="class:nav-vertical"
						class="btn btn-sm btn-link m-l-n-sm"> <i class="fa fa-bars"></i>
					</a>
				</footer>
			</section>
		</aside>
		<!-- /.aside -->
		<!-- .vbox -->
		<section id="content">
			<section class="vbox">
				<header class="header bg-light dker">
					<p>Board</p>
				</header>
				<section class="scrollable wrapper">
					<div class="container">
						<table class="table table-hover">
							<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>날짜</th>
								<th>조회수</th>
							</tr>
							</thead>
							<tbody>
								<tr>
									<td>001</td>
									<td>안녕하세요</td>
									<td>홍길동</td>
									<td>2018.10.10</td>
									<td>2</td>
								</tr>
								<tr>
									<td>002</td>
									<td>bootstrap 짱</td>
									<td>홍길순</td>
									<td>2018.10.11</td>
									<td>10</td>
								</tr>
								<tr>
									<td>003</td>
									<td>감기 조심하세요</td>
									<td>홍길자</td>
									<td>2018.10.12</td>
									<td>12</td>
								</tr>
								<tr>
									<td>004</td>
									<td>Test중</td>
									<td>가가가</td>
									<td>2018.10.13</td>
									<td>6</td>
								</tr>
								<tr>
									<td>005</td>
									<td>Test중(2)</td>
									<td>나나나</td>
									<td>2018.10.14</td>
									<td>7</td>
								</tr>
								<tr>
									<td>006</td>
									<td>Test중(3)</td>
									<td>다다다</td>
									<td>2018.10.15</td>
									<td>11</td>
								</tr>
								<tr>
									<td>007</td>
									<td>Test중(4)</td>
									<td>라라라</td>
									<td>2018.10.16</td>
									<td>22</td>
								</tr>
								<tr>
									<td>008</td>
									<td>Test중(5)</td>
									<td>마마마</td>
									<td>2018.10.17</td>
									<td>28</td>
								</tr>
								<tr>
									<td>009</td>
									<td>Test중(6)</td>
									<td>바바바</td>
									<td>2018.10.18</td>
									<td>18</td>
								</tr>
								<tr>
									<td>010</td>
									<td>Test중(7)</td>
									<td>사사사</td>
									<td>2018.10.19</td>
									<td>23</td>
								</tr>
								<tr>
									<td>011</td>
									<td>Test중(8)</td>
									<td>아아아</td>
									<td>2018.10.20</td>
									<td>20</td>
								</tr>
								<tr>
									<td>012</td>
									<td>Test중(9)</td>
									<td>자자자</td>
									<td>2018.10.21</td>
									<td>27</td>
								</tr>
							</tbody>	
						</table>
						
						<hr/>
						
						<a class="btn btn-default pull-right">글쓰기</a>
						
						<div class="text-center">
							<ul class="pagination">
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
							</ul>
						</div>
					</div>
				</section>
			</section>
			<a href="#" class="hide nav-off-screen-block"
				data-toggle="class:nav-off-screen" data-target="#nav"></a>
		</section>
		<!-- /.vbox -->
	</section>
	<div id="selectTextSize" style="">Item Four</div>
</body>
</html>