<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">容器列表</h1>
		<button type="button" class="btn btn-primary btn-lg text-rigth">创建容器</button>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
		      	DataTables Advanced Tables
		    	</div>
			<div class="panel-body">
		
			<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
			    	<thead>
			        	<tr role="row">
						<th>ID</th>
						<th>IMAGE</th>
						<th>COMMAND</th>
						<th>CREATED</th>
						<th>STATUS</th>
						<th>PORTS</th>
						<th>NAMES</th>
					</tr>
			    	</thead>
				    	<tbody>  
						{{range $key, $val := .Containers}}
						<tr class="odd gradeX">
				            	<td class="">{{substr $val.ID 0 12}}</td>
				            	<td>{{$val.Image}}</td>
				            	<td class="sorting_1">{{$val.Command}}Image</td>
				            	<td>{{$val.Created}}</td>
				            	<td>{{$val.Status}}</td>
							<td>{{$val.Ports}}</td>
				            	<td>{{$val.Names}}</td>
				        	</tr>
						{{end}}
					</tbody>
			</table>
		</div>
	</div>
</div>



