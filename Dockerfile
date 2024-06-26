# 根据需要选择不同版本的 jdk 版，具体版本信息查看 https://github.com/docker-library/official-images/blob/master/library/eclipse-temurin
# jdk8
FROM eclipse-temurin:8-jdk-centos7

# jdk11
# FROM eclipse-temurin:11-jdk-centos7

# jdk17
# FROM eclipse-temurin:17-jdk-centos7

# 设置容器时区（ centos7 版本才可以使用该配置修改时区）
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
&& apt-get update && apt-get install -y locales && locale-gen zh_CN.UTF-8 \
&& update-locale LANG=zh_CN.UTF-8 && rm -rf /var/lib/apt/lists/*
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8
