#!/usr/bin/env python
# -*- coding: utf-8 -*-
from os import getenv

from flask import Flask

app = Flask(__name__)
# instance/config.py
# app.config.from_object('config')
# APP_CONFIG_FILE='/var/www/yourapp/config/prod.py'
# app.config.from_envvar('APP_CONFIG_FILE')


@app.route('/')
def root():
    return 'Site root.'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=getenv('PORT'))
