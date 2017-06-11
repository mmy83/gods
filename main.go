package main

import (
	"github.com/mmy83/gods/functools"

	"github.com/astaxie/beego"
	_ "github.com/mmy83/gods/routers"
)

func main() {
	beego.AddFuncMap("datetime", functools.Phpdate)
	beego.Run()
}
