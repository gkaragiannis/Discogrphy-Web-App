<html>

	<style>
		#header{
			padding:5px;
			text-shadow: 2px 2px #d1d1d1;
		}
		#body{
			padding: 3px;

		}
		#footer {
    	background:#4E4E4E;
    	color:white;
    	text-align:right;
    	font-size: 12px;
		}
		.button{
    	width:50%;
    	height:10%;
    	border: none;
    	border-radius: 8px;
    	font-family:Comic Sans MS;
    	font-size: 18px;
    	/*font-weight: bold;*/
    	padding: 16px 32px;
    	text-decoration: none;
    	margin: 4px 2px;
    	cursor: pointer;
		}
		.button1{
			background-color: #4E4E4E;
			color: #EAEAEA;
		}
		.button1:hover{
			background-color: #1AC4DE;
			color: #212121;
		}
	</style>

	<body style="font-family:Comic Sans MS;">
		<div id="header">
			<img src="http://www.di.uoa.gr/sites/default/themes/ditheme/images/logodit_el.png" style="width:100%;height:18%;">
		</div>

		<div id="body" align="center">
			<br><br>
			<button class="button button1" onclick="location.assign('/artist_req')">UPDATE & SEARCH ARTISTS</button>
			<br><br>
			<button class="button button1" onclick="location.assign('/song_req')">SEARCH SONGS</button>
			<br><br>
			<button class="button button1" onclick="location.assign('/artist_ins')">INSERT ARTIST</button>
			<br><br>
			<button class="button button1" onclick="location.assign('/song_ins')">INSERT SONG</button>
			<br><br>
		</div>

		<div id="footer">
			Copyright &copy; 2016, gkaragiannis, akyttaris
		</div>
	</body>

</html>
