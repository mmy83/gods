<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">镜像列表</h1>
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
						<th>REPOSITORY</th>
						<th>TAG</th>
						<th>IMAGE ID</th>
						<th>CREATED</th>
						<th>SIZE</th>
						<th></th>
					</tr>
			    	</thead>
				    	<tbody>  
						{{range $key, $val := .Images}}
						<tr class="odd gradeX">
				            	<td class="">{{$val.RepoDigests}}</td>
				            	<td>{{$val.RepoTags}}</td>
				            	<td>{{substr $val.ID 0 12}}</td>
				            	<td>{{$val.Created|datetime}}</td>
				            	<td>{{$val.Size}}</td>
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



