build_all: build_tailwind .WAIT build_zola gen_banner

gen_banner:
	@zola build -u "file://${PWD}/public" && \
	chromium --headless --disable-gpu --screenshot  --window-size=601,280 ./public/banner/index.html && \
	convert screenshot.png ./static/images/banner.jpg

build_tailwind:
	@npx tailwind --minify --input=./templates/site.css --output=./static/css/site.css

build_zola:
	@zola build

build: build_tailwind .WAIT build_zola

tailwind_watch:
	@npx tailwind --watch --input=./templates/site.css --output=./static/css/site.css

zola_serve:
	@zola serve

dev: tailwind_watch zola_serve
