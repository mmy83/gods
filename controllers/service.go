package controllers

import (
	"context"
	"fmt"

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
	fmt.Println(services)
	c.Data["Service"] = services
	c.Layout = "layout/main.tpl"
	c.TplName = "service/index.tpl"
}

// @router /service/create [post]
func (c *ServiceController) CreateService() {

}

// @router /service/delete [get]
func (c *ServiceController) DeleteService() {

}

// @router /service/update [post]
func (c *ServiceController) UpdateService() {

}

// @router /service/info [post]
func (c *ServiceController) InfoService() {

}
