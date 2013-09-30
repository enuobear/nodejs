<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Images</title>
	<style type="text/css">
		*{ padding:0; margin:0; }
		body{
			font-size:12px;
			background:#f8f8f8;
			font-family:Arial;
			-webkit-text-size-adjust:none;
			-webkit-tap-highlight-color:rgba(0,0,0,0);
		}
		nav,ul{
			list-style:none;
		}
		nav{
			position:fixed;
			left:30px;
			top:0;
			width:240px;
			height:100%;
			background:#fff;
			color:#999;
		}
		nav h1{
			text-align:center;
			font:40px/100px Arial;
			color:#000;
			text-shadow:1px 0 1px rgba(0,0,0,.2);
			margin-bottom:10px;
			background:#eee;
		}
		nav li{
			border-bottom:1px solid #f8f8f8;
			line-height:40px;
			text-indent:10px;
			cursor:pointer;
		}
		nav li:hover,
		nav li.current{
			background:#f8f8f8;
			position:relative;
			color:#000;
		}
		nav li:hover:before,
		nav li.current:before{
			content:"";
			display:block;
			height:40px;
			width:10px;
			background:#000;
			position:absolute;
			left:-10px;
			top:0;
		}
		section{
			padding-left:300px;
		}
		h2{
			width:100%;
			font:12px/40px Arial;
		}
		ul{
			list-style:none;
			font-size:0;
		}
		ul li{
			display:inline-block;
			width:200px;
			height:320px;
			margin:0 20px 20px 0;
			text-align:center;
			font:12px/30px Arial;
			background:#fff;
			border:5px solid rgba(255,255,255,1);
			box-shadow:1px 1px 1px rgba(0,0,0,.1);
		}
		ul li img{
			display:block;
		}
		ul li img:hover{
			-webkit-filter:sepia(.3);
		}

		hgroup{
			width:50px;
			height:50px;
			position:absolute;
			top:50%;
			left:50%;
			margin:-50px 0 0 -25px;
			display:none;
			z-index:2;
		}
		.circle {
			background-color:rgba(0,0,0,0);
			border:5px solid rgba(0,0,0,0);
			opacity:.9;
			border-right:5px solid rgba(0,0,0,.9);
			border-left:5px solid rgba(0,0,0,.9);
			border-radius:50px;
			box-shadow:0 0 35px rgba(0,0,0,.2);
			width:50px;
			height:50px;
			margin:0 auto;
			-webkit-animation:spinPulse 1s infinite linear;
		}
		.circle1 {
		    background-color:rgba(0,0,0,0);
		    border:5px solid rgba(0,0,0,0);
		    opacity:.9;
		    border-left:5px solid rgba(0,0,0,.9);
		    border-right:5px solid rgba(0,0,0,.9);
		    border-radius:50px;
		    box-shadow:0 0 15px rgba(0,0,0,.2);
		    width:30px;
		    height:30px;
		    position:absolute;
		    left:50%;
		    top:50%;
		    margin:-15px;
		    -webkit-animation:spinoffPulse 1s infinite linear;
		}
		@-webkit-keyframes spinPulse {
		    0% {
		        -webkit-transform:rotate(160deg);
		        opacity:0;
		        box-shadow:0 0 1px rgba(0,0,0,.2);
		    }
		    50% {
		        -webkit-transform:rotate(145deg);
		        opacity:1;
		    }
		    100% {
		        -webkit-transform:rotate(-320deg);
		        opacity:0;
		    };
		}
		@-webkit-keyframes spinoffPulse {
		    0% {
		        -webkit-transform:rotate(0deg);
		    }
		    100% {
		        -webkit-transform:rotate(360deg);
		    };
		}
	</style>
	<script type="text/javascript" src="jquery-1.5.2.min.js"></script>
</head>
<body>
	<nav>
		<h1>SPECIAL</h1>
		<li class="current"></li>
		<li data-dir="w/39">w39</li>
		<li data-dir="w/40">w40</li>
		<li data-dir="ru502">ru502</li>
	</nav>
	<section>
		<h2></h2>
		<ul></ul>
	<section>
	<hgroup>
		<div class="circle"></div>
		<div class="circle1"></div>
	</hgroup>
	<script type="text/javascript">
		$(function(){
			var $list 	 = $("ul"),
				$nav  	 = $("nav li"),
				$total   = $("h2"),
				$loading = $("hgroup"),
				$host    = "http://192.168.58.75:1111/";

			show("ru502");

			$nav.click(function(){
				var dir = $(this).attr("data-dir");
				$nav.removeClass("current");
				$(this).addClass("current");
				show(dir);
			});

			function show(dir){
				var $str = "";
				$.ajax({
					url: $host+'show.php',
					type: 'POST',
					data: {
						'filedir': dir
					},
					dataType: 'json',
					beforeSend: function(XMLHttpRequest){
						$loading.css({
							"display": "block"
						})
					},
					success: function(json){
						$list.html("");
						$loading.css({
							"display": "none"
						})
						$total.html("total:"+json.length);
						$.each(json,function(index,entry){
							$str += "<li><img src="+$host+entry.fileDir+"/"+entry.fileName+" />"+entry.fileName+"</li>";
						});
						$list.append($str);
					},
					error: function(json){
						alert(error);
					}
				});
			}
		});
	</script>
</body>
</html>
