FROM ubuntu:16.04
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN apt-get update && apt-get install -y python-software-properties software-properties-common postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3 sudo
USER postgres
RUN  /etc/init.d/postgresql start &&\
  psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
  createdb -O docker docker &&\
  psql --command "CREATE USER root WITH SUPERUSER PASSWORD 'root';" &&\
  createdb -O root root &&\
  psql --command "ALTER USER postgres WITH PASSWORD 'postgres';"
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf
USER root
RUN adduser ayu --gecos "ayu,100,99999999,99999" --disabled-password
RUN echo "ayu:ayu" | sudo chpasswd
RUN usermod -aG sudo ayu
EXPOSE 5432
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]
RUN apt-get update &&\
  apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev git curl wget libpq-dev vim tcl redis-server
USER ayu
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN $HOME/.rbenv/bin/rbenv install 2.3.0
RUN $HOME/.rbenv/bin/rbenv global 2.3.0
RUN $HOME/.rbenv/bin/rbenv install 2.5.0
RUN $HOME/.rbenv/versions/2.3.0/bin/gem install bundler -v 1.17.3
RUN $HOME/.rbenv/versions/2.5.0/bin/gem install rails -v 4.2.4
USER root
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

# Instaling nodejs for both rails & angular
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get install --yes nodejs
RUN npm install -g bower@1.8.8
RUN npm install -g gulp@2.2.0

EXPOSE 3000
EXPOSE 3001
EXPOSE 3002
EXPOSE 3003
EXPOSE 3004
EXPOSE 3005
EXPOSE 9000

COPY Readme.docker.build.md .
COPY Readme.env.setup.md .
CMD [ "./entrypoint.sh" ]