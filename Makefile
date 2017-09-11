build:
	pushd httpd && docker build -t nlsun/httpd . && popd && \
		pushd siege && docker build -t nlsun/siege . && popd


run:
	docker run -dit -p 80:80 --name httpd nlsun/httpd && \
		docker run -dit --link httpd:httpd.local --name siege nlsun/siege

push:
	docker push nlsun/httpd && \
		docker push nlsun/siege

clean:
	docker rm -vf httpd
	docker rm -vf siege
