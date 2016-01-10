FROM    centos:centos6

# Enable Extra Packages for Enterprise Linux (EPEL) for CentOS
RUN     yum install -y epel-release
# Install Node.js and npm
RUN     yum install -y nodejs npm

# Setting workdir
WORKDIR /src

# Install app dependencies
RUN     npm install express

# Install postgres client
RUN     yum install -y postgresql-server

# Install ssh client
RUN     yum install -y openssh-clients

# Bundle app source
COPY . /src

# Set Environment variable
ENV PGPASSWORD docker

EXPOSE  8080
CMD ["node","/src/keepAliveService.js"]

