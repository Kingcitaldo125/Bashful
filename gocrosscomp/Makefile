APP_NAME := app
BUILD_DIR := builds

.PHONY: all clean linux-amd64 linux-arm64 darwin-arm64 windows-amd64

all: clean linux-amd64 linux-arm64 darwin-arm64 windows-amd64

clean:
	rm -rf $(BUILD_DIR)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

linux-amd64: $(BUILD_DIR)
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o $(BUILD_DIR)/$(APP_NAME)-linux-amd64 .

linux-arm64: $(BUILD_DIR)
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -a -o $(BUILD_DIR)/$(APP_NAME)-linux-arm64 .

darwin-arm64: $(BUILD_DIR)
	CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -a -o $(BUILD_DIR)/$(APP_NAME)-darwin-arm64 .

windows-amd64: $(BUILD_DIR)
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -a -o $(BUILD_DIR)/$(APP_NAME)-windows-amd64.exe .

# Convenience targets
linux: linux-amd64 linux-arm64
macos: darwin-arm64
windows: windows-amd64

# Show available targets
help:
	@echo "Available targets:"
	@echo "  all         - Build for all platforms"
	@echo "  linux       - Build for Linux (amd64 and arm64)"
	@echo "  macos       - Build for macOS (arm64)"
	@echo "  windows     - Build for Windows (amd64)"
	@echo "  clean       - Remove build directory"
	@echo ""
	@echo "Individual platform targets:"
	@echo "  linux-amd64"
	@echo "  linux-arm64"
	@echo "  darwin-arm64"
	@echo "  windows-amd64"
