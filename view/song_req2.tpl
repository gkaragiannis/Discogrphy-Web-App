<html>
	
	<style>
		#header{
			padding:5px;
			text-shadow: 2px 2px #d1d1d1;
		}
		table, td{
			border: none;
			border-collapse: collapse;
			padding: 3px;
		}
		input[type=text]{
			width: 100%;
    	padding: 3px 2px;
    	border: none;
    	border-radius: 4px;
    	background-color: #f1f1f1
		}
		input[type=number]{
			width: 100%;
    	padding: 3px 2px;
    	border: none;
    	border-radius: 4px;
    	background-color: #f1f1f1
		}
		select{
    	width: 100%;
    	padding: 3px 2px;
    	border: none;
    	border-radius: 4px;
    	background-color: #f1f1f1;
		}
		input[type=submit]{
    	width:20%;
    	height:8%;
    	border: none;
    	border-radius: 8px;
    	background-color: #4E4E4E;
    	font-size: 18px;
    	/*font-weight: bold;*/
    	padding: 16px 32px;
    	text-decoration: none;
			color: #EAEAEA;
    	margin: 4px 2px;
    	cursor: pointer;
		}
		input[type=submit]:hover{
			background-color: #1AC4DE;
			color: #212121;
		}
		div {
    	border-radius: 5px;
    	background-color: #f2f2f2;
    	padding: 20px;
		}
		#footer {
    	background:#4E4E4E;
    	color:white;
    	text-align:right;
		}
	</style>
	
	<div id="header">
		<img src="http://www.di.uoa.gr/sites/default/themes/ditheme/images/logodit_el.png" style="width:100%;height:18%;">
		<h1 style="color:blue">Presentation of Songs</h1>
	</div>
	
	<div>
		<form action="/song_req" method="GET">
			<body style="font-family:Comic Sans MS;text-align:center">
				<hr>
				<table align="center";vertical-align>
					<tr>
						<td>Song Title:</td>
						<td><input type="text" name="song_title" autofocus></td>
					</tr>
					<tr>
						<td>Production Year:</td>
						<td><input type="number" name="prod_year" step="1" min="0" max="2016"></td>
					</tr>
					<tr>
						<td>Company:</td>
						<td>
							<select name="company">
								<option value=""></option>
							%for comp in comp_list:
								<option value="{{comp['etaireia']}}">{{comp['etaireia']}}</option>
							%end
							</select>
						</td>
					</tr>
				</table>
				<br><br>
				<input type="submit" name="song_req" onclick='alert("New song inserted")' value="Submit">
				<br><br><hr>
			</body>
		</form>
	</div>
	
	<div id="footer">
		Copyright &copy; 2016, gkaragiannis, akyttaris
	</div>
	
</html>