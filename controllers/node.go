package controllers

import (
	"context"

	"github.com/astaxie/beego"
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
)

type NodeController struct {
	beego.Controller
}

// @router /node/index
func (c *NodeController) ListNode() {
	cli, err := client.NewEnvClient()
	if err != nil {
		panic(err)
	}
	opt := types.NodeListOptions{}
	nodes, err := cli.NodeList(context.Background(), opt)

	c.Data["Nodes"] = nodes
	c.LayoutSections = make(map[string]string)
	c.Layout = "layout/main.tpl"
	c.LayoutSections["Scripts"] = "js/node/index.tpl"
	c.TplName = "node/index.tpl"

}
