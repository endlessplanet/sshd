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

(
    THIS=$(cat /var/opt/docker/sshd.counter) &&
        NEXT=$((${THIS}+1)) &&
        tee -a /root/.ssh/authorized_keys > /tmp/out.txt 2> /tmp/err.txt &&
        echo ${NEXT} > /var/opt/docker/sshd.counter &&
        echo ${THIS}
) 200> /var/opt/docker/sshd.lock