package router

import (
	"ai_project/internal/user"
	"github.com/gin-gonic/gin"
)

var r *gin.Engine

func InitRouter(userHandler *user.Handler) {
	r := gin.Default()
	r.POST("/signup", userHandler.CreateUser)
	//r.Run(":9999")

}

func Start(addr string) error {
	return r.Run(addr)
}
