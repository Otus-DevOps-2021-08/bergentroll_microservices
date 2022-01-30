define build_image
echo `git show --format="%h" HEAD | head -1` > $(dir $<)/build_info.txt
echo `git rev-parse --abbrev-ref HEAD` >> $(dir $<)/build_info.txt
docker build $(dir $<) --tag $(username)/$@:$(tag)
endef

username = bergentroll
tag = latest

# Supposed to not to be overrided
images = ui comment post prometheus

.PHONY: all $(MAKECMDGOALS)

all: push

all-images: $(images)

ui: ../src/ui/Dockerfile
	$(build_image)

comment: ../src/comment/Dockerfile
	$(build_image)

post: ../src/post-py/Dockerfile
	$(build_image)

prometheus: ../monitoring/prometheus/Dockerfile
	$(build_image)

push: $(images)
	$(foreach img,$?,docker push $(username)/$(img):$(tag);)

clean:
	$(foreach img,$(images),docker image rm --force $(username)/$(img):$(tag);)
