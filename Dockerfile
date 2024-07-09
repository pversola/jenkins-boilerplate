FROM jenkins/jenkins:lts 
# เปลี่ยนเป็น root เพื่อทำการติดตั้งซอฟต์แวร์
USER root 
# ติดตั้ง Docker 
RUN apt install curl
RUN curl -fsSL https://get.docker.com -o get-docker.sh && \     
    sh get-docker.sh && \     
    rm get-docker.sh 
# ติดตั้ง Docker Compose (เลือกใช้ตามความจำเป็น) 
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \     
chmod +x /usr/local/bin/docker-compose 
# เปลี่ยนกลับไปใช้ผู้ใช้งาน jenkins เพื่อความปลอดภัยในการรัน Jenkins 
USER jenkins