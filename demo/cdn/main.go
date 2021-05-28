package main

import (
	"fmt"
	"os"

	"github.com/gin-contrib/static"
	"github.com/gin-gonic/gin"
)

func main() {
	g := gin.New()
	g.GET("/", func(c *gin.Context) {
		c.JSON(200, "cdn is up")
	})
	g.Use(static.Serve("/file", static.LocalFile("/tmp", false)))

	g.NoRoute(func(c *gin.Context) {
		c.JSON(404, "this is from gin not found "+c.Request.RequestURI)
	})
	port := os.Getenv("port")
	if port == "" {
		port = "8080"
	}
	g.Run(fmt.Sprintf(":%s", port))
}
