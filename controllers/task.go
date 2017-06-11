package controllers

import (
	//	"context"
	"fmt"

	"github.com/astaxie/beego"
	//	"github.com/docker/docker/client"
)

type TaskController struct {
	beego.Controller
}

// @router /task/index [get]
func (c *TaskController) ListTask() {
	c.Data["Services"] = ""
	fmt.Println("")

}

// @router /task/info [post]
func (c *TaskController) InfoTask() {

}
