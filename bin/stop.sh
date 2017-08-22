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

NETWORK=$(docker \
    inspect \
    --format "{{range .NetworkSettings.Networks}}{{.NetworkID}}{{end}}" \
    $(cat ~/sshd.cid)
) &&
    docker container ls --quiet --filter network=${NETWORK} | while read CONTAINER
    do
        docker container stop ${CONTAINER} &&
            docker container rm --force --volumes ${CONTAINER}
    done 
    docker network rm ${NETWORK} &&
    rm -f ~/sshd.cid