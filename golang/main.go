package main

import "github.com/gofiber/fiber/v2"

func main() {
	app := fiber.New(fiber.Config{
		// Prefork:       true,
		CaseSensitive: true,
		StrictRouting: true,
		ServerHeader:  "Fiber",
		AppName:       "Test App v1.0.1",
	})

	app.Get("/", func(c *fiber.Ctx) error {
		c.JSON(map[string]interface{}{
			"message": "hello",
		})

		return nil
	})

	app.Listen(":80")
}
