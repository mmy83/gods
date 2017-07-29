<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">创建服务</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
		    <div class="panel panel-default">
				<div class="panel-heading">基本信息</div>
                   	<!-- /.panel-heading -->
                    	<div class="panel-body">
					<div class="form-group has-success">
						<labe>服务名</label>
						<label class="control-label" for="inputSuccess">Input with success</label>
						<input type="text" class="form-control" id="inputSuccess">
						<p class="help-block">Example block-level help text here.</p>
					</div>
					<div class="form-group has-success">
						<label>镜像</label>
						<label class="control-label" for="inputSuccess">Input with success</label>
							<select class="form-control">
							{{range $key, $val := .Images}}
								<option value="{{substr $val.ID 7 500}}">{{$val.RepoDigests}}:{{$val.RepoTags}}</option>
							{{end}}
							</select>
					</div>
					<div class="form-group  has-success">
						<label>类型</label>
						<label class="control-label" for="inputSuccess">Input with success</label>
						<div class="radio">
							<label class="radio-inline">
								<input type="radio" name="optionsRadiosInline" id="optionsRadiosInline1" value="option1" checked="">全局
							</label>
							<label class="radio-inline">
								<input type="radio" name="optionsRadiosInline" id="optionsRadiosInline2" value="option2">副本
							</label>
						</div>
					</div>
					<div class="form-group has-success">
						<labe>副本数</label>
						<label class="control-label" for="inputSuccess">Input with success</label>
						<input type="text" class="form-control" id="inputSuccess">
						<p class="help-block">Example block-level help text here.</p>
					</div>
				</div>
				<!-- /.panel-body -->
				</div>
			</div>
			<div class="col-lg-12">
                	<div class="panel panel-default">
					<div class="panel-heading">参数</div>
                    	<!-- /.panel-heading -->
                    	<div class="panel-body">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs">
							<li class="active"><a href="#runtime" data-toggle="tab">运行命令</a></li>
							<li><a href="#resource" data-toggle="tab">资源配置</a></li>
							<li><a href="#expose-port" data-toggle="tab">端口</a></li>
							<li><a href="#mount" data-toggle="tab">挂载</a></li>
							<li><a href="#restart-policy" data-toggle="tab">重启策略</a></li>
                        	</ul>
                        	<!-- Tab panes -->
						<div class="tab-content">
							<br />
							<div class="tab-pane fade in active" id="runtime">
								<div class="form-group has-success">
									<label>用户</label>
									<label class="control-label" for="inputSuccess">Input with success</label>
									<input type="text" class="form-control" id="inputSuccess">
									<p class="help-block">Example block-level help text here.</p>
								</div>
								<div class="form-group has-success">
									<label>目录</label>
									<label class="control-label" for="inputSuccess">Input with success</label>
									<input type="text" class="form-control" id="inputSuccess">
									<p class="help-block">Example block-level help text here.</p>
								</div>
								<div class="form-group has-success">
									<label>命令</label>
									<label class="control-label" for="inputSuccess">Input with success</label>
									<input type="text" class="form-control" id="inputSuccess">
									<p class="help-block">Example block-level help text here.</p>
								</div>
								<div class="form-group has-success">
									<label>环境变量</label>
									<button type="button" class="btn btn-primary">+</button>
									<!-- <label class="control-label" for="inputSuccess">Input with success</label>
									<input type="text" class="form-control" id="inputSuccess">
									<p class="help-block">Example block-level help text here.</p> -->
								</div>
							</div>
							<div class="tab-pane fade" id="resource">
								<div class="form-group has-success">
									<label>CPU</label>
									<label class="control-label" for="inputSuccess">Input with success</label>
									<input type="text" class="form-control" id="inputSuccess">
									<p class="help-block">Example block-level help text here.</p>
								</div>
								<div class="form-group has-success">
									<label>内存</label>
									<label class="control-label" for="inputSuccess">Input with success</label>
									<input type="text" class="form-control" id="inputSuccess">
									<p class="help-block">Example block-level help text here.</p>
								</div>
								<div class="form-group has-success">
									<label>网络</label>
									<button type="button" class="btn btn-primary">+</button>
									<!-- <label class="control-label" for="inputSuccess">Input with success</label>
									<input type="text" class="form-control" id="inputSuccess">
									<p class="help-block">Example block-level help text here.</p> -->
								</div>
							</div>
							<div class="tab-pane fade" id="expose-port">
								<div class="form-group has-success">
									<label class="control-label" for="inputSuccess">Input with success</label>
									<button type="button" class="btn btn-primary">+</button>
									<p class="help-block">Example block-level help text here.</p>
								</div>
								<div class="form-group has-success">
									<label class="control-label" for="inputSuccess">Input with success</label>
									<input type="text" class="form-control" id="inputSuccess">
									<p class="help-block">Example block-level help text here.</p>
								</div>
							</div>
							<div class="tab-pane fade" id="mount">
								<div class="form-group has-success">
									<label class="control-label" for="inputSuccess">Input with success</label>
									<button type="button" class="btn btn-primary">+</button>
									<p class="help-block">Example block-level help text here.</p>
								</div>
								<div class="form-group has-success">
									<label>重试次数</label>
			                         <label class="control-label" for="inputSuccess">Input with success</label>
			                         <input type="text" class="form-control" id="inputSuccess">
									<p class="help-block">Example block-level help text here.</p>
			                     </div>
							</div>
							<div class="tab-pane fade" id="restart-policy">
								<div class="form-group has-success">
									<label>策略</label>
									<label class="control-label" for="inputSuccess">Input with success</label>
									<div class="radio">
										<label class="radio-inline">
											<input type="radio" name="optionsRadiosInline" id="optionsRadiosInline1" value="option1" checked="">无
										</label>
										<label class="radio-inline">
											<input type="radio" name="optionsRadiosInline" id="optionsRadiosInline2" value="option2">任意
										</label>
										<label class="radio-inline">
											<input type="radio" name="optionsRadiosInline" id="optionsRadiosInline2" value="option2">故障
										</label>
									</div>
									<p class="help-block">Example block-level help text here.</p>
								</div>
								<div class="form-group has-success">
									<label>重试次数</label>
			                         <label class="control-label" for="inputSuccess">Input with success</label>
			                         <input type="text" class="form-control" id="inputSuccess">
									<p class="help-block">Example block-level help text here.</p>
			                     </div>
								<div class="form-group has-success">
									<label>延迟时间</label>
			                         <label class="control-label" for="inputSuccess">Input with success</label>
			                         <input type="text" class="form-control" id="inputSuccess">
									<p class="help-block">Example block-level help text here.</p>
			                     </div>
								<div class="form-group has-success">
									<label>窗口</label>
			                         <label class="control-label" for="inputSuccess">Input with success</label>
			                         <input type="text" class="form-control" id="inputSuccess">
									<p class="help-block">Example block-level help text here.</p>
			                     </div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
           	</div>
		<button type="button" class="btn btn-primary btn-lg btn-block">创建</button>
		<br /><br /><br />
		<!-- /.col-lg-6 -->
	</div>
</div>