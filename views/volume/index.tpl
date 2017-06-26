<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">数据卷列表</h1>
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
						<th>DRIVER</th>
						<th>VOLUME NAME</th>
						<th>CREATED</th>
						<th></th>
					</tr>
			    	</thead>
				    	<tbody>  
						{{range $key, $val := .Volumes.Volumes}}
						<tr class="odd gradeX">
				            	<td class="">{{$val.Driver}}</td>
				            	<td>{{$val.Name}}</td>
				            	<td>{{$val.CreatedAt}}</td>
							<td>
								<a href="{{urlfor "ContainerController.StartContainer" "id" $val.ID}}" type="button">start</a>
								<a href="{{urlfor "ContainerController.RestartContainer" "id" $val.ID}}" type="button">restart</a>
								<a href="{{urlfor "ContainerController.StopContainer" "id" $val.ID}}" type="button">stop</a>
								<a href="{{urlfor "ContainerController.DeleteContainer" "id" $val.ID}}" type="button">delete</a>
							</td>
				        	</tr>
						{{end}}
					</tbody>
			</table>
		</div>
	</div>
</div>



