package controllers

import (
	//	"context"
	//	"fmt"

	"github.com/astaxie/beego"
	//	"github.com/docker/docker/api/types"
	//	"github.com/docker/docker/client"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	c.Redirect(c.URLFor("SwarmController.InfoSwarm"), 302)
	//	c.Data["Website"] = "beego.me"
	//	c.Data["Email"] = "astaxie@gmail.com"
	//	c.Data["Title"] = "这是一个栗子"
	//	c.TplName = "index.tpl"

	//	cli, err := client.NewEnvClient()
	//	if err != nil {
	//		panic(err)
	//	}

	//	containers, err := cli.ContainerList(context.Background(), types.ContainerListOptions{All: true})
	//	if err != nil {
	//		panic(err)
	//	}

	//	c.Data["Con"] = containers
	//	for _, container := range containers {
	//		fmt.Printf("%s %s\n", container.ID[:10], container.Image)
	//	}
}
