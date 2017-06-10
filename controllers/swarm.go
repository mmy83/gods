package controllers

import (
	"context"
	"fmt"

	"github.com/astaxie/beego"
	"github.com/docker/docker/client"
)

type SwarmController struct {
	beego.Controller
}

// @router /swarm/index [get]
func (c *SwarmController) InfoSwarm() {
	cli, err := client.NewEnvClient()
	if err != nil {
		panic(err)
	}
	swarm, err := cli.SwarmInspect(context.Background())
	if err != nil {
		panic(err)
	}
	fmt.Println(swarm)
	c.Data["Swarm"] = swarm
	c.Layout = "layout/main.tpl"
	c.TplName = "swarm/index.tpl"
}

// @router /swarm/init [post]
func (c *SwarmController) InitSwarm() {

}
