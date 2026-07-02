#!/bin/bash
set -e

sudo /bin/sh -c "$(curl -fsSL https://steampipe.io/install/steampipe.sh)"
steampipe plugin install aws
