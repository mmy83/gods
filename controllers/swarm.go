package controllers

import (
	"context"
	"fmt"
	"strings"

	"github.com/astaxie/beego"
	"github.com/docker/docker/api/types/swarm"
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
	//if err != nil {
	//	panic(err)
	//}
	fmt.Println(swarm)

	c.Data["Err"] = err
	c.Data["Swarm"] = swarm
	c.Layout = "layout/main.tpl"
	c.TplName = "swarm/index.tpl"
	c.LayoutSections = make(map[string]string)
	//	c.LayoutSections["Scripts"] = "js/swarm/index.tpl"
}

// @router /swarm/init [post]
func (c *SwarmController) InitSwarm() {
	listen := c.GetString("ListenAddr")
	advertise := c.GetString("AdvertiseAddr")
	req := swarm.InitRequest{AdvertiseAddr: advertise, ListenAddr: listen}
	cli, err := client.NewEnvClient()
	if err != nil {
		panic(err)
	}
	res, err := cli.SwarmInit(context.Background(), req)
	if err != nil {
		panic(err)
	}
	fmt.Println(res)
	c.Redirect(c.URLFor(".InfoSwarm"), 302)
}

// @router /swarm/leave [get]
func (c *SwarmController) LeaveSwarm() {
	cli, err := client.NewEnvClient()
	if err != nil {
		panic(err)
	}
	err = cli.SwarmLeave(context.Background(), true)
	//	if err != nil {
	//		panic(err)
	//	}
	c.Redirect(c.URLFor(".InfoSwarm"), 302)
}

// @router /swarm/join [post]
func (c *SwarmController) JoinSwarm() {
	listen := c.GetString("ListenAddr")
	advertise := c.GetString("AdvertiseAddr")
	jointoken := c.GetString("JoinToken")
	reomte := c.GetString("RemoteAddrs")
	reomteArr := strings.Split(reomte, "\n")
	cli, err := client.NewEnvClient()
	if err != nil {
		panic(err)
	}
	req := swarm.JoinRequest{AdvertiseAddr: advertise, ListenAddr: listen, JoinToken: jointoken, RemoteAddrs: reomteArr}
	err = cli.SwarmJoin(context.Background(), req)
	if err != nil {
		fmt.Print("加入失败")
		fmt.Println(err)
	}
	c.Redirect(c.URLFor(".InfoSwarm"), 302)

}
