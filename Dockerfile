FROM ruby:2.2

RUN sed -i -s '/debian jessie-updates main/d' /etc/apt/sources.list
RUN apt update && apt install -y nano unixodbc unixodbc-dev freetds-dev sqsh tdsodbc libdbd-odbc-ruby

COPY files/freetds.conf /etc/freetds/freetds.conf
COPY files/odbcinst.ini /etc/odbcinst.ini
COPY files/odbc.ini /etc/odbc.ini

RUN gem install dbi --version 0.4.5
RUN gem install dbd-odbc --version 0.2.4
RUN gem install ruby-odbc
RUN gem install rails-sqlserver-2000-2005-adapter -s https://gems.github.com
