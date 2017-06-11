<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">集群信息</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		{{if .Err}}
		<div class="panel panel-default">
			<div class="panel-heading">
			   	提示
			</div>
			<div class="panel-body">
				<h1 class="text-center">这个节点不是一个集群，请初始化集群或者加入一个集群</h1>
			</div>
		</div>
		<div class="text-center">
			<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#initSwarm">初始化集群</button>
			<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#joinSwarm">加入集群</button>
		</div>
		<div class="modal fade" id="initSwarm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title" id="myModalLabel">创建集群</h4>
		            </div>
					<form role="form" method="post" action="{{urlfor "SwarmController.InitSwarm"}}">
		            		<div class="modal-body">
		                		<div class="row">
								<div class="col-lg-12">
					                	<div class="form-group has-success">
		                                	<label>ListenAddr</label>
										<label class="control-label" for="inputSuccess">Input with success</label>
		                                	<input name="ListenAddr" class="form-control" placeholder="0.0.0.0：2377">
		                            	</div>
									<div class="form-group has-success">
		                                	<label>AdvertiseAddr</label>
										<label class="control-label" for="inputSuccess">Input with success</label>
		                                	<input name="AdvertiseAddr" class="form-control" placeholder="192.168.1.1：2377">
		                            	</div>
		            				</div>
							</div>
		            		</div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			                <button type="submit" class="btn btn-primary">创建</button>
			            </div>
					</form>
		        </div>
		        <!-- /.modal-content -->
		    </div>
		    <!-- /.modal-dialog -->
		</div>
		<div class="modal fade" id="joinSwarm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title" id="myModalLabel">加入集群</h4>
		            </div>
	            		
					<form role="form" method="post" action="{{urlfor "SwarmController.JoinSwarm"}}">
						<div class="modal-body">
							<div class="row">
								<div class="col-lg-12">
					                	<div class="form-group has-success">
		                                	<label>ListenAddr</label>
										<label class="control-label" for="inputSuccess">Input with success</label>
		                                	<input name="ListenAddr" class="form-control" placeholder="Enter text">
		                            	</div>
									<div class="form-group has-success">
		                                	<label>AdvertiseAddr</label>
										<label class="control-label" for="inputSuccess">Input with success</label>
		                                	<input name="AdvertiseAddr" class="form-control" placeholder="Enter text">
		                            	</div>
									<div class="form-group has-success">
		                                	<label>join-token</label>
										<label class="control-label" for="inputSuccess">Input with success</label>
										<textarea name="JoinToken" class="form-control" rows="3" placeholder="Enter text"></textarea>
		                            	</div>
									<div class="form-group has-success">
		                                	<label>RemoteAddrs</label>
										<label class="control-label" for="inputSuccess">Input with success</label>
										<textarea name="RemoteAddrs" class="form-control" placeholder="Enter text" rows="3"></textarea>
		                            	</div>
										
		            				</div>
							</div>
						</div>
			            <div class="modal-footer">
			                	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			                	<button type="submit" class="btn btn-primary">加入</button>
			            	</div>
					</form>
		        </div>
		        <!-- /.modal-content -->
		    </div>
		    <!-- /.modal-dialog -->
		</div>
	</div>
</div>
{{else}}
<ul>
<li>
ID:{{.Swarm.ID}}
</li>
<li>
version:{{.Swarm.Version}},
</li>
<li>
created_at:{{.Swarm.CreatedAt}},
</li>
<li>
update_at:{{.Swarm.UpdatedAt}},
</li>
<li>
join-token-Worker:{{.Swarm.JoinTokens.Worker}},
</li>
<li>
join-token-Manager:{{.Swarm.JoinTokens.Manager}},
</li>
</ul>
<a href="{{urlfor "SwarmController.LeaveSwarm"}}" class="btn btn-primary btn-lg btn-block" role="button">离开集群</a>
{{end}}

