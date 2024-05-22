
FROM ubuntu AS build-stage
RUN apt-get update && apt-get install -y git
RUN git config --global user.name "leandro-siqueira-ads"
RUN git config --global user.email "leandrosiqueira16@hotmail.com"
RUN echo 'Building...' > /build.txt


FROM ubuntu AS test-stage
RUN apt-get update && apt-get install -y git
COPY --from=build-stage /build.txt /build.txt
RUN git config --global user.name "leandro-siqueira-ads"
RUN git config --global user.email "leandrosiqueira16@hotmail.com"
RUN echo 'Testing...' >> /build.txt


FROM ubuntu
RUN apt-get update && apt-get install -y git
COPY --from=test-stage /build.txt /build.txt
RUN git config --global user.name "leandro-siqueira-ads"
RUN git config --global user.email "leandrosiqueira16@hotmail.com"
CMD cat /build.txt
