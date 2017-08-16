FROM python:3.5.3-alpine
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
RUN apk add --no-cache --virtual .runtime-deps libgfortran libffi freetype libpng mariadb-client-libs mariadb-dev netcat-openbsd jpeg-dev zlib-dev bash
ENV LIBRARY_PATH=/lib:/usr/lib
RUN apk add --no-cache --virtual .build-deps gcc libc-dev g++ gfortran libgfortran libffi-dev freetype-dev libpng-dev
RUN echo @version35 http://dl-cdn.alpinelinux.org/alpine/v3.5/community >> /etc/apk/repositories
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
RUN apk add --no-cache lapack@version35
RUN apk add --no-cache lapack-dev@version35
CMD ["bash"]
