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
		input[type=submit]{
    	width:20%;
    	height:8%;
    	border: none;
    	border-radius: 8px;
    	background-color: #4E4E4E;
    	font-family:Comic Sans MS;
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
		#footer {
    	background:#4E4E4E;
    	color:white;
    	text-align:right;
    	font-size: 12px;
		}
	</style>
	
	<div id="header">
		<img src="http://www.di.uoa.gr/sites/default/themes/ditheme/images/logodit_el.png" style="width:100%;height:18%;">
		<h1 style="color:blue">Insert Artist</h1>
	</div>
	
	<form action="/artist_ins" method="GET">
		<body style="font-family:Comic Sans MS;text-align:center">
			<hr>
			<table align="center">
				<tr>
					<td>National ID:</td>
					<td><input type="text" name="natId" id="natId" required></td>
				</tr>
				<tr>
					<td>Name:</td>
					<td><input type="text" name="fName" id="fName" required></td>
				</tr>
				<tr>
					<td>Surname:</td>
					<td><input type="text" name="lName" id="lName" required></td>
				</tr>
				<tr>
					<td>Birth Year:</td>
					<td><input type="number" name="birth" id="birth" step="1" min="0" max="2016" required></td>
				</tr>
			</table>
			<br>
			<input type="submit" name="art_ins" onclick="alert('New artist inserted!')" value="Submit">
			<hr>
		</body>
	</form>
	
	<div id="footer">
		Copyright &copy; 2016, gkaragiannis, akyttaris
	</div>
	
</html>