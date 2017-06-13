package controllers

import (
	"context"

	"github.com/astaxie/beego"
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/client"
)

type ImageController struct {
	beego.Controller
}

// @router /image/index [get]
func (c *ImageController) ListImage() {

	cli, err := client.NewEnvClient()
	if err != nil {
		panic(err)
	}
	opt := types.ImageListOptions{All: true}
	images, err := cli.ImageList(context.Background(), opt)

	c.Data["Images"] = images
	c.LayoutSections = make(map[string]string)
	c.Layout = "layout/main.tpl"
	c.LayoutSections["Scripts"] = "js/image/index.tpl"
	c.TplName = "image/index.tpl"
}

// @router /image/create [get]
func (c *ImageController) CreateImage() {

}

// @router /image/store [post]
func (c *ImageController) StoreImage() {

}

// @router /image/remove:id [get]
func (c *ImageController) RemoveImage() {
	id := c.GetString("id")
	cli, err := client.NewEnvClient()
	if err != nil {
		panic(err)
	}
	_, err = cli.ImageRemove(context.Background(), id, types.ImageRemoveOptions{})
	if err != nil {
		if client.IsErrImageNotFound(err) {
			panic(err)
		}
	}
	c.Redirect(c.URLFor("ImageController.ListImage"), 302)
}
