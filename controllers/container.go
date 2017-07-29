package controllers

import (
	"context"
	"fmt"
	"time"

	"github.com/astaxie/beego"
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
)

type ContainerController struct {
	beego.Controller
}

// @router /container/index [get]
func (c *ContainerController) ListContainer() {

	cli, err := client.NewEnvClient()
	if err != nil {
		panic(err)
	}
	opt := types.ContainerListOptions{All: true}
	containers, err := cli.ContainerList(context.Background(), opt)

	fmt.Println(containers)
	c.Data["Containers"] = containers
	c.LayoutSections = make(map[string]string)
	c.Layout = "layout/main.tpl"
	c.LayoutSections["Scripts"] = "js/container/index.tpl"
	c.TplName = "container/index.tpl"
}

// @router /container/create [get]
func (c *ContainerController) CreateContainer() {
	cli, err := client.NewEnvClient()
	if err != nil {
		panic(err)
	}
	images, err := cli.ImageList(context.Background(), types.ImageListOptions{All: true})
	c.Data["Images"] = images
	c.LayoutSections = make(map[string]string)
	c.Layout = "layout/main.tpl"
	c.LayoutSections["Scripts"] = "js/tablelist.tpl"
	c.TplName = "container/create.tpl"
}

// @router /container/store [post]
func (c *ContainerController) StoreContainer() {

}

// @router /container/delete:id [get]
func (c *ContainerController) DeleteContainer() {
	id := c.GetString("id")
	cli, err := client.NewEnvClient()
	if err != nil {
		panic(err)
	}
	err = cli.ContainerRemove(context.Background(), id, types.ContainerRemoveOptions{})
	if err != nil {
		if client.IsErrContainerNotFound(err) {
			panic(err)
		}
	}
	c.Redirect(c.URLFor("ContainerController.ListContainer"), 302)
}

// @router /container/update [post]
func (c *ContainerController) UpdateContainer() {

}

// @router /container/info [post]
func (c *ContainerController) InfoContainer() {

}

// @router /container/start:id [get]
func (c *ContainerController) StartContainer() {
	id := c.GetString("id")
	cli, err := client.NewEnvClient()
	err = cli.ContainerStart(context.Background(), id, types.ContainerStartOptions{})
	if err != nil {
		if client.IsErrContainerNotFound(err) {
			panic(err)
		}
	}
	c.Redirect(c.URLFor("ContainerController.ListContainer"), 302)
}

// @router /container/stop:id [get]
func (c *ContainerController) StopContainer() {
	id := c.GetString("id")
	cli, err := client.NewEnvClient()
	if err != nil {
		panic(err)
	}
	var t time.Duration = 0
	err = cli.ContainerStop(context.Background(), id, &t)
	if err != nil {
		if client.IsErrContainerNotFound(err) {
			panic(err)
		}
	}
	c.Redirect(c.URLFor("ContainerController.ListContainer"), 302)
}

// @router /container/restart:id [get]
func (c *ContainerController) RestartContainer() {
	id := c.GetString("id")
	cli, err := client.NewEnvClient()
	if err != nil {
		panic(err)
	}
	var t time.Duration = 0
	err = cli.ContainerRestart(context.Background(), id, &t)
	if err != nil {
		if client.IsErrContainerNotFound(err) {
			panic(err)
		}
	}
	c.Redirect(c.URLFor("ContainerController.ListContainer"), 302)
}
