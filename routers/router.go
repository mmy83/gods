package routers

import (
	"github.com/astaxie/beego"
	"github.com/mmy83/gods/controllers"
)

func init() {
	beego.Include(&controllers.SwarmController{})
	beego.Include(&controllers.ServiceController{})
	beego.Include(&controllers.TaskController{})
	beego.Include(&controllers.ContainerController{})

	beego.Router("/", &controllers.MainController{})
}
