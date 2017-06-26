package controllers

import (
	"context"

	"github.com/astaxie/beego"
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
)

type ServiceController struct {
	beego.Controller
}

// @router /service/index [get]
func (c *ServiceController) ListService() {
	c.Data["Services"] = ""
	cli, err := client.NewEnvClient()
	if err != nil {
		panic(err)
	}
	opt := types.ServiceListOptions{}
	services, err := cli.ServiceList(context.Background(), opt)
	//	fmt.Println(services)
	c.Data["Services"] = services
	c.LayoutSections = make(map[string]string)
	c.Layout = "layout/main.tpl"
	c.LayoutSections["Scripts"] = "js/tablelist.tpl"
	c.TplName = "service/index.tpl"
}

// @router /service/create [get]
func (c *ServiceController) CreateService() {
	cli, err := client.NewEnvClient()
	if err != nil {
		panic(err)
	}
	images, err := cli.ImageList(context.Background(), types.ImageListOptions{All: true})
	c.Data["Images"] = images
	c.LayoutSections = make(map[string]string)
	c.Layout = "layout/main.tpl"
	c.LayoutSections["Scripts"] = "js/tablelist.tpl"
	c.TplName = "service/create.tpl"
}

// @router /service/store [post]
func (c *ServiceController) StoreService() {
	c.TplName = "service/create.tpl"
}

// @router /service/remove [get]
func (c *ServiceController) RemoveService() {

}

// @router /service/update [post]
func (c *ServiceController) UpdateService() {

}

// @router /service/info [post]
func (c *ServiceController) InfoService() {

}
