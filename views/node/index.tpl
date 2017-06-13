<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">节点列表</h1>
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
						<th>Hostname</th>
						<th>State</th>
						<th>Availability</th>
						<th>Role</th>
						<th>Node Addr</th>
						<th>Manager Addr</th>
						<th>Message State</th>Description
						<th>Cpu</th>
						<th>Memory</th>
						<th>Memory</th>
					</tr>
			    	</thead>
				    	<tbody>  
						{{range $key, $val := .Nodes}}
						<tr class="odd gradeX">
				            	<td class="">{{$val.ID}}</td>
				            	<td>{{$val.Description.Hostname}}</td>
				            	<td>{{$val.Status.State}}</td>
				            	<td>{{$val.Spec.Availability}}</td>
							<td>{{$val.Spec.Role}}</td>
							<td>{{$val.Status.Addr}}</td>
							<td>{{$val.ManagerStatus.Addr}}</td>
				            	<td>{{if $val.ManagerStatus.Leader}}Leader{{end}}</td>
							<td>{{$val.Description.Resources.NanoCPUs}}</td>
							<td>{{$val.Description.Resources.MemoryBytes}}</td>
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



