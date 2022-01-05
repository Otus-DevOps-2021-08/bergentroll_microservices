define build_image
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