package main

import (
	"fmt"
	"os"

	"github.com/gin-gonic/gin"
)

func main() {
	g := gin.New()
	g.GET("/server1", func(c *gin.Context) {
		c.JSON(200, "This is server1 route")
	})
	g.GET("/", func(c *gin.Context) {
		c.JSON(200, "helloworld from server1")
	})
	g.NoRoute(func(c *gin.Context) {
		c.JSON(404, "this is from gin not found"+c.Request.RequestURI)
	})
	port := os.Getenv("port")
	if port == "" {
		port = "8080"
	}
	g.Run(fmt.Sprintf(":%s", port))
}
