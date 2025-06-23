# script v1.0
# FROM jenkins/jenkins:lts-jdk17

# USER root

# # Java 17 + Docker CLI 설치
# RUN apt-get update && \
#     apt-get install -y \
#     docker.io \
#     docker-compose && \
#     apt-get clean

# # Docker 명령어가 없다고 나올 수 있으니 /usr/bin에 심볼릭 링크도 설정 (보완책)
# RUN ln -s /usr/bin/docker.io /usr/bin/docker || true

# # Jenkins 유저도 docker 실행할 수 있도록 그룹 추가
# RUN usermod -aG docker jenkins

# USER jenkins


# script v1.1
# FROM jenkins/jenkins:lts

# USER root

# # Java 17 + Docker CLI 설치
# RUN apt-get update && \
#     apt-get install -y \
#     openjdk-17-jdk \
#     docker.io \
#     docker-compose && \
#     apt-get clean

# # JAVA_HOME을 Java 17로 명시적으로 설정
# ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
# ENV PATH="$JAVA_HOME/bin:/usr/bin:/usr/local/bin:$PATH"

# # Java 17을 기본으로 설정 (심볼릭 링크 변경)
# RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-17-openjdk-amd64/bin/java 1 && \
#     update-alternatives --set java /usr/lib/jvm/java-17-openjdk-amd64/bin/java

# # Docker 명령어가 없다고 나올 수 있으니 /usr/bin에 심볼릭 링크도 설정 (보완책)
# RUN ln -s /usr/bin/docker.io /usr/bin/docker || true

# # Jenkins 유저도 docker 실행할 수 있도록 그룹 추가
# RUN usermod -aG docker jenkins

# # Jenkins에서도 인식 가능하게 환경 설정
# RUN echo "JAVA_HOME=$JAVA_HOME" >> /etc/environment


# USER jenkins




# script v1.2
FROM jenkins/jenkins:lts

USER root

# Java 17 설치 (기존과 동일)
RUN apt-get update && \
    apt-get install -y \
    openjdk-17-jdk && \
    apt-get clean

# Docker CE (Client, Engine) 및 Docker Compose V2 플러그인 설치
# 기존의 docker.io 와 docker-compose 설치 부분을 대체합니다.
# Docker 공식 가이드에 따라 GPG 키와 레포지토리를 추가합니다.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \
    mkdir -m 0755 -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
    rm -rf /var/lib/apt/lists/*

# JAVA_HOME을 Java 17로 명시적으로 설정 (기존과 동일)
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="$JAVA_HOME/bin:/usr/bin:/usr/local/bin:$PATH"

# Java 17을 기본으로 설정 (심볼릭 링크 변경) (기존과 동일)
RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-17-openjdk-amd64/bin/java 1 && \
    update-alternatives --set java /usr/lib/jvm/java-17-openjdk-amd64/bin/java

# Docker 명령어가 없다고 나올 수 있으니 /usr/bin에 심볼릭 링크도 설정 (보완책)
# docker-ce-cli 설치 시에는 보통 필요 없지만, 안전을 위해 유지해도 무방합니다.
RUN ln -s /usr/bin/docker.io /usr/bin/docker || true

# Jenkins 유저도 docker 실행할 수 있도록 그룹 추가 (기존과 동일)
RUN usermod -aG docker jenkins

# Jenkins에서도 인식 가능하게 환경 설정 (기존과 동일)
RUN echo "JAVA_HOME=$JAVA_HOME" >> /etc/environment

USER jenkins