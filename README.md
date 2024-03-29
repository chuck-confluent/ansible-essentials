# Read Me!

Use `docker-compose up -d` to download the docker image and start three ubuntu servers and an Ansible master. Take control of the Ansible master with `docker-compose exec ansible-master bash`.

Make sure to put the proper permissions on the private key on the Ansible Master.

From within the `ansible-master` container:

    root@asnible-master: chmod 400 ~/.ssh/id_rsa

From the `ansible-master` container, verify that you can connect to root on `server-1`, `server-2`, and `server-3` over `ssh`. For example:

    root@ansible-master: ssh root@server-1

Test Ansible with the `ping` module:

    root@ansible-master: ansible all -i /etc/ansible/host_inventory -m ping

Note the structure of the command. We have:

    root@ansible-master: ansible <group of hosts> -i <host inventory> -m <module>

- Host inventory: List of host IP addresses or hostnames
- Groups: We can collect hosts into logical groups. A host can belong to multiple groups.
- Modules: Code packaged with Ansible that runs on the remote machines. There are many of these! look up "Module Index" in the Ansible documentation.
