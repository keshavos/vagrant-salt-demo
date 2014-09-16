#Salt stack demo & POC

###Objective and aim

* To install and configure a salt stack solution with
    * Salt master depoloyed on an Ubuntu VM
    * 2 minions deployed on separate Ubuntu VM's
    * Windows minion (currently not configurable through Vagrant)

### Installation

* Run `vagrant up` from the project root. This will:
    * Instantiate the master on a private network at `192.168.33.10`
    * Instantiate 2 ubuntu minions
    * ####Install and configure the salt master
        * `vagrant ssh master`
        * `sudo su`
        * `sudo apt-get update`
        * `apt-get --yes -q install python-software-properties`
        * `add-apt-repository ppa:saltstack/salt`
        * `apt-get --yes -q update`
        * `apt-get --yes -q install salt-master`
        * Edit the interface ip address on the master
        * `vi /etc/salt/master`.
            * Uncomment and edit the following properties:
                ```
                file_roots:
                    base:
                        - /srv/salt
                ```
            * Restart the salt-master service
                `service salt-master restart`

    * ####Install and configure salt Ubuntu minions
        * `vagrant ssh minion1`
        * `sudo su`
        * `sudo apt-get update`
        * `apt-get --yes -q install python-software-properties`
        * `add-apt-repository ppa:saltstack/salt`
        * `apt-get --yes -q install salt-minion`
        * Edit the minion config file `vi /etc/salt/minion` to:
            ```
            master:  192.168.33.10
            ```
        * `vi /etc/salt/minion_id` and edit it to minion1 #change it accordingly with additional minions
        * `service salt-minion restart`

    * ####Install and configure Windows minions
        * < to be updated >

* ####Connect minions to master
    * On the master, view and accept the keys from the minions
        * `salt-key -L` #lists all accepted, pending keys
        * `salt-key -a minion1` to accept a specific minion or `salt-key -A` to accept all pending keys
        * Test your connection
            * `salt-run manage.status` #displays status of all minions
            * `salt-run manage.up` #displays minions which are up
            * `salt-run manage.down` #displays minions which are down
        * ```salt '*' test.ping``` #pings all minions. Replace '*' with minion id to target a specific minion
* ####Install packages on the minions from the master
    * The Vagrantfile specifies a 'srv'shared folder between the host and the master. This helps in developing on the host machine and using the master to deploy these scripts as this a shared folder and master has access to the same folder

###Example
 * The srv/ contains example sls file which provides state configuration to be installed on a minion and windows hosts
 * On the master, run `salt '*' state.highstate`
    * This should install vim, git on the ubuntu minions
    * Install firefox, chrome, npp, msysgit on the windows minions


