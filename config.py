import os

basedir = os.path.abspath(os.path.dirname(__file__))

class Config:
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'khvjchlsknbvyuqw99'
    # MAIL_SERVER = os.environ.get('MAIL_SERVER', 'smtp.yandex.ru')
    # MAIL_PORT = int(os.environ.get('MAIL_PORT', '465'))
    # MAIL_USE_TLS = os.environ.get('MAIL_USE_TLS', 'true').lower() in \
    # ['true', 'on', '1']
    # MAIL_USERNAME = os.environ.get('MAIL_USERNAME') #or 'bkarmani@yandex.com'
    # MAIL_PASSWORD = os.environ.get('MAIL_PASSWORD') #or 'qykibhyehkujqfzl'
    FLASKY_MAIL_SUBJECT_PREFIX = '[Flasky]'
    FLASKY_MAIL_SENDER = 'Flasky Admin <flasky@example.com>'
    FLASKY_ADMIN = os.environ.get('FLASKY_ADMIN')
    SQLALCHEMY_TRACK_MODIFICATIONS = False

    MAIL_SERVER='sandbox.smtp.mailtrap.io'
    MAIL_PORT = 2525
    MAIL_USERNAME = '58eb16ba86f01f'
    MAIL_PASSWORD = 'd3414a5caec978'
    MAIL_USE_TLS = True
    MAIL_USE_SSL =False

    @staticmethod
    def init_app(app):
        pass

class DeveConfig(Config):
    DEBUG = True
    SQLALCHEMY_DATABASE_URI = os.environ.get('DEV_DATABASE_URL') or \
    'sqlite:///' + os.path.join(basedir, 'data-dev.sqlite')

class TestConfig(Config):
    TESTING = True
    SQLALCHEMY_DATABASE_URI = SQLALCHEMY_DATABASE_URI = os.environ.get('TEST_DATABASE_URL') or \
    'sqlite://'

class ProductionConfig(Config):
    DEBUG = True
    SQLALCHEMY_DATABASE_URI =  os.environ.get('DATABASE_URL') or \
    'sqlite:///' + os.path.join(basedir, 'data.sqlite')

config = {
    'development': DeveConfig,
    'testing' : TestConfig,
    'production' : ProductionConfig,
    'default' : DeveConfig
}

#'postgresql://postgres:Bugati1993_##@localhost/e-commerce'