package routers

import (
	"github.com/astaxie/beego"
	"github.com/mmy83/gods/controllers"
)

func init() {
	beego.Include(&controllers.SwarmController{})

	beego.Router("/", &controllers.MainController{})
}
