package controllers

import (
	"context"
	"fmt"

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

// @router /container/create [post]
func (c *ContainerController) CreateContainer() {

}

// @router /container/delete [get]
func (c *ContainerController) DeleteContainer() {

}

// @router /container/update [post]
func (c *ContainerController) UpdateContainer() {

}

// @router /container/info [post]
func (c *ContainerController) InfoContainer() {

}

// @router /container/start [get]
func (c *ContainerController) StartContainer() {

}

// @router /container/stop [get]
func (c *ContainerController) StopContainer() {

}
