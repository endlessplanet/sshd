#!/bin/sh
# This file is part of sshd.
#
#    sshd is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    sshd is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with sshd .  If not, see <http://www.gnu.org/licenses/>.

mkdir /var/opt/docker &&
    sed -i "s,#GatewayPorts no,GatewayPorts yes," /etc/ssh/sshd_config &&
    echo 23889 > /var/opt/docker/sshd.counter &&
    touch /root/.ssh/authorized_keys &&
    chmod 0600 /root/.ssh/authorized_keys