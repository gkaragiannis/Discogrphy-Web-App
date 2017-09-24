<html>
	
	<style>
		#header{
			padding:5px;
			text-shadow: 2px 2px #d1d1d1;
		}
		table, th, td{
			border: none;
			border-collapse: collapse;
			padding: 3px;
		}
		th{
			padding: 10px;
		}
		tr:nth-child(odd){
			background-color: lightblue
		}
		.button{
    	width:100%;
    	height:100%;
    	border: none;
			border-radius: 3px;
    	font-family:Comic Sans MS;
    	text-decoration: none;
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
		#footer {
    	background:#4E4E4E;
    	color:white;
    	text-align:right;
    	font-size: 12px;
		}
	</style>
	
	<div id="header">
		<img src="http://www.di.uoa.gr/sites/default/themes/ditheme/images/logodit_el.png" style="width:100%;height:18%;">
		<h1 style="color:blue">Presentation of Artists</h1>
	</div>
	
	<body style="font-family:Comic Sans MS;text-align:center">
		<hr>
		<table align="center" style="text-align:center;width:100%;">
			<tr style="background-color:lightgrey;">
				<th>National ID</th>
				<th>Name</th>
				<th>Surname</th>
				<th>Birth Year</th>
				<th>Edit?</th>
			</tr>
			
			%for row in rows:				
  			<tr>
  				<td>{{row['ar_taut']}}</td>
  				<td>{{row['onoma']}}</td>
  				<td>{{row['epitheto']}}</td>
  				<td>{{row['etos_gen']}}</td>
  				<td><button class="button button1" onclick="location.assign('/artist_upd{{row['url']}}')">Edit Me!</button></td>
  			</tr>
			%end
		</table>
		
		<hr>
	</body>
	
	<div id="footer">
		Copyright &copy; 2016, gkaragiannis, akyttaris
	</div>
	
</html>