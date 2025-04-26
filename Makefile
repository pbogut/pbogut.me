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

build_docker:
	@docker build -t ghcr.io/pbogut/pbogut.me:latest .

push_docker:
	@docker push ghcr.io/pbogut/pbogut.me:latest

tailwind_watch:
	@npx tailwind --watch --input=./templates/site.css --output=./static/css/site.css

zola_serve:
	@zola serve

deploy: build .WAIT build_docker
	@docker push ghcr.io/pbogut/pbogut.me:latest && \
	coolify-deploy pbogut_me_prod

dev: tailwind_watch zola_serve
