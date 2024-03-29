[![Build Status](https://travis-ci.org/digital-york/oasis.svg?branch=master)](https://travis-ci.org/digital-york/oasis)

## OASIS

![OASIS](app/assets/images/WhiteBckG_BiggerWords.png)

The Open Accessible Summaries In Language Studies (OASIS) initiative aims to make research findings on language learning and teaching available and accessible to a wide audience.


## On behalf of the OASIS project team:

<p><a target="_blank" href="https://www.york.ac.uk/education/our-staff/academic/emma-marsden/">Emma Marsden</a> (University of York; project coordinator)</p>
<p><a target="_blank" href="http://www.uva.nl/profiel/a/n/s.j.andringa/s.j.andringa.html">Sible Andringa</a> (University of Amsterdam)</p>
<p><a target="_blank" href="http://www.concordia.ca/artsci/education/faculty.html?fpid%3Dlaura-collins">Laura Collins</a> (Concordia University)</p>
<p><a target="_blank" href="http://cls.psu.edu/people/cnj1">Carrie Jackson</a> (Penn State University)</p>
<p><a target="_blank" href="https://lukeplonsky.wordpress.com/">Luke Plonsky</a> (Georgetown University)</p>
<p><a target="_blank" href="http://digitalcreativity.ac.uk/people/dr-rowena-kasprowicz">Rowena Kasprowicz</a> (University of York)</p>
 
## Network Collaborators

<p><a target="_blank" href="https://liberalarts.iupui.edu/directory/bio/manton">Marta Anton</a></p>
<p><a target="_blank" href="https://www.york.ac.uk/education/our-staff/academic/claudine-bowyer-crane/">Claudine Bowyer-Crane</a></p>
<p><a target="_blank" href="https://german.georgetown.edu/story/1242751814140.html">Heidi Byrnes</a></p>
<p><a target="_blank" href="http://sls.msu.edu/people/core-faculty/aline-godfroid/">Aline Godfroid</a></p>
<p><a target="_blank" href="https://www.reading.ac.uk/education/about/staff/s-j-graham.aspx">Suzanne Graham</a></p>
<p><a target="_blank" href="https://www.york.ac.uk/language/people/academic-research/heather-marsden/">Heather Marsden</a></p>
<p><a target="_blank" href="http://aplng.la.psu.edu/people/kzm197">Kevin McManus</a></p>
<p><a target="_blank" href="https://www1.essex.ac.uk/langling/staff/profile.aspx?ID=2332">Florence Myles</a></p>
<p><a target="_blank" href="http://polio.msu.domains/">Charlene Polio</a></p>
<p><a target="_blank" href="https://iris.ucl.ac.uk/iris/browse/profile?upi=AREVE24">Andrea Revesz</a></p>
<p><a target="_blank" href="https://psychology.pitt.edu/people/natasha-tokowicz-phd">Natasha Tokowicz</a></p>
<p><a target="_blank" href="http://www.pitt.edu/~tessa/">Tessa Warren</a></p>

## Post-doctoral researchers 
 
Elizabeth Bailey<br/>
<a href="http://digitalcreativity.ac.uk/people/dr-rowena-kasprowicz">Rowena Kasprowicz</a><br/>
<a href="https://www.york.ac.uk/education/research/progress/david-oreilly/#tab-1">David O’Reilly</a><br/>
Fatma Said<br/><br/> 

## Research assistants

Catherine van Beuningen<br/>
Lais de Oliveira Borges<br/>
Ines Martin<br/>
June Ruivivar<br/>
Sophie Thompson<br/><br/>

## Professional associations

American Council for Teachers of Foreign<br/>
Languages: <a href="https://www.actfl.org/">ACTFL</a> (Ali Moeller)<br/>
Association for Language Learning: <a href="https://www.all-languages.org.uk/">ALL</a> (Annalise Gordon)<br/>
Centre for Applied Linguistics: <a href="http://www.cal.org/">CAL</a> (Joel Gomez)<br/>
International Federation of Foreign Language Teaching Associations: <a href="https://fiplv.com/">FIPLV</a> (Terry Lamb)<br/>
<a href="https://www.tenaxschoolstrust.co.uk/">Tenax Schools Trust</a> (Ian Bauckham)<br/>

![](app/assets/images/ESRC-logo-300x258.jpg)

## Quick start
0. Assume that Docker is avaiable
```
❯ docker-compose --version                                                                 ═
docker-compose version 1.24.1, build 4667896b
```
Generate local ssh key
```
ssh-keygen -i rsa docker/oasis_id_rsa
```

1. Set .env with Docker variables. Use .env.template as starting point
```
cp .env.template .env
```
Customise as required

2. Set config/application.yml
```
# Used by SMTP for workflow email notification, once enabled
# oasis_host: https://test.oasis-database.org
development:
  application_database_adapter: postgresql
  application_database_name: oasis
  application_database_host: postgresdb
  application_database_username: oasis
  application_database_password: oasis
  fedora_base_path: /oasis-development
  fedora_url: http://fcrepo:8080/fcrepo/rest
  fits_path: /fits/fits.sh
  log_level: error
  redis_namespace: oasis-public
  realtime_notifications: 'false'
  redis_host: redis
  redis_port: '6379'
  solr_url: http://solr:8983/solr/hyrax-development
  secret_key_base: xxxx
```
3. Build docker images. Note this will take up to 1h depending on network and laptop speed.
```
❯ docker compose build

# Check images builded
❯ docker compose images
CONTAINER                   REPOSITORY                   TAG                 IMAGE ID            SIZE
oasis-docker-app-1          oasis-docker-app             latest              dd2e3a780415        4.06GB
oasis-docker-console-1      oasis-docker-console         latest              f65bc54e190c        4.06GB
oasis-docker-fcrepo-1       ualbertalib/docker-fcrepo4   4.7                 15806dadb895        603MB
oasis-docker-postgresdb-1   postgres                     12-alpine           f976fa42a711        230MB
oasis-docker-redis-1        redis                        5                   99ee9af2b6b1        110MB
oasis-docker-solr-1         solr                         7-alpine            64cb096f9679        300MB
oasis-docker-web-1          oasis-docker-web             latest              28960e732066        4.06GB
```
4. Start your docker stack
```
❯ docker compose up
...
lots of logs
...

# Check status from an other terminal
❯ docker compose ps                                                                  ⏎ ═ ✹ ✚
NAME                        IMAGE                            COMMAND                  SERVICE             CREATED             STATUS                         PORTS
oasis-docker-fcrepo-1       ualbertalib/docker-fcrepo4:4.7   "catalina.sh run"        fcrepo              About an hour ago   Up About an hour               0.0.0.0:8080->8080/tcp
oasis-docker-postgresdb-1   postgres:12-alpine               "docker-entrypoint.s…"   postgresdb          About an hour ago   Up About an hour (unhealthy)   0.0.0.0:5432->5432/tcp
oasis-docker-redis-1        redis:5                          "docker-entrypoint.s…"   redis               About an hour ago   Up About an hour (healthy)     0.0.0.0:6379->6379/tcp
oasis-docker-solr-1         solr:7-alpine                    "solr-precreate hyra…"   solr                About an hour ago   Up About an hour (healthy)     0.0.0.0:8983->8983/tcp
oasis-docker-web-1          oasis-docker-web                 "/bin/docker-entrypo…"   web                 54 minutes ago      Up 53 minutes                  0.0.0.0:3000->3000/tcp
```

The local source code is shared with Docker ${APP_DIR} volume. Any changes to .erb files, while running rails servers  in development mode, will be seen instantly. Changes to gems and new *.rb will require rebuild image. This should be faster as the process is staged.   

The build process will create qazwsx:oasis-admin@york.ac.uk admin user. Use this link to sign in http://127.0.0.1:3000/users/sign_in

5. Known issues

Solr data re not store at external volume. Remove Solr container to start fresh.

Upgrading hyrax application requires to rung DB migration, run ```docker-compose run web bundle exec rails db:migrate RAILS_ENV=development```. The command will be executed on stoping web service with Control+C as web container starts rails server.

Hyrax app creates application PID at /var/run/hyrax/hyrax.pid. Occasionally, restarting docker will not clean the file. On this occassion web service fails to start. Simply stop docker and start it again. Ultimetly, this can be also solved by removing web container with volumes and rebuild it.
```
docker-compose rm
docker volume rm oasis-docker_state 

# all all Oasis volumes
docker volume rm $(docker volume ls -q|grep oasis) 
```

You can connect to the rails console with pry environment: ```docker attach oasis-docker-console-1``` where _oasis-docker-console-1_ is the name of the container to connect to. You can also debug Ruby code by adding ```binding. pry``` at *.erb or *.rb source code and restart docker. When the execution of the app code hits the above trap,  the execution stops, and you can attach terming to this application state by running ```docker attach oasis-docker-web-1```. Now you can inspect the code variables and many more. For more information on how to use Pry IRB, see this [link](https://github.com/pry/pry). 