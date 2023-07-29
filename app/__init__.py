from config import config
from flask import Flask
from flask_bootstrap import Bootstrap
from flask_mail import Mail
from flask_sqlalchemy import SQLAlchemy
from flask_moment import Moment
from flask_login import LoginManager

db = SQLAlchemy()
bootstrap = Bootstrap()
email = Mail()
time = Moment()
login_manager = LoginManager()

def create_app(config_name):
    app = Flask(__name__)
    app.config.from_object(config[config_name])

    config[config_name].init_app(app)
    db.init_app(app)
    bootstrap.init_app(app)
    email.init_app(app)


    #blueprpints
    from .main import main as main_blueprint
    from .products import product as prod_blueprint

    app.register_blueprint(main_blueprint)
    app.register_blueprint(prod_blueprint, url_prefix='/products')

    return app


