FROM ubuntu:latest
RUN apt update && apt-get install sudo wget unzip -y && apt-get install -y gnupg curl && rm -rf /var/lib/apt/lists/*
#RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
#RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.lista > /dev/null
RUN sudo apt update && sudo apt install packer
RUN packer -version

CMD ["sleep", "infinity"]
 
