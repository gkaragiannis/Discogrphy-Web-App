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
				<th>Title</th>
				<th>Singer</th>
				<th>Composer</th>
				<th>Writer</th>
				<th>CD</th>
				<th>Company</th>
				<th>Production Year</th>
			</tr>
			
			%for row in rows: 				
  			<tr>
  				<td>{{row['titlos']}}</td>
  				<td>{{row['tragoudistis']}}</td>
  				<td>{{row['sinthetis']}}</td>
  				<td>{{row['stixourgos']}}</td>
  				<td>{{row['code_cd']}}</td>
  				<td>{{row['etaireia']}}</td>
  				<td>{{row['etos']}}</td>
  			</tr>
			%end
		</table>
		
		<hr>
	</body>
	
	<div id="footer">
		Copyright &copy; 2016, gkaragiannis, akyttaris
	</div>
	
</html>