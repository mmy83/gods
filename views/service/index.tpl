<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">服务列表</h1>
		<a type="button" href="{{urlfor "ServiceController.CreateService"}}" class="btn btn-primary btn-lg text-rigth">创建服务</a>
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
						<th>NAME</th>
						<th>REPLICAS</th>
						<th>IMAGE</th>
						<th>COMMAND</th>
						<th>操作</th>
					</tr>
			    	</thead>
				    	<tbody>  
						{{range $key, $val := .Services}}
						<tr class="odd gradeX">
				            	<td class="">{{substr $val.ID 0 12}}</td>
				            	<td>{{$val.Spec.Name}}</td>
				            	<td class="sorting_1">{{$val.Spec.Mode.Replicated.Replicas}}</td>
				            	<td>{{$val.Spec.TaskTemplate.ContainerSpec.Image}}</td>
				            	<td>{{$val.Spec.TaskTemplate.ContainerSpec.Command}}</td>
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



