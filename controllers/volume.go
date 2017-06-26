package controllers

import (
	"context"

	"github.com/astaxie/beego"
	"github.com/docker/docker/api/types/filters"
	"github.com/docker/docker/client"
)

type VolumeController struct {
	beego.Controller
}

// @router /volume/index [get]
func (c *VolumeController) ListVolume() {
	cli, err := client.NewEnvClient()
	if err != nil {
		panic(err)
	}
	volumes, err := cli.VolumeList(context.Background(), filters.Args{})
	c.Data["Volumes"] = volumes
	c.LayoutSections = make(map[string]string)
	c.Layout = "layout/main.tpl"
	c.LayoutSections["Scripts"] = "js/tablelist.tpl"
	c.TplName = "volume/index.tpl"

}
