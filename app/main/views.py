from . import main
from flask import render_template

@main.route('/')
def index():
    return render_template('index.html')

@main.route('/testimonials')
def testimonials():
    return render_template('testimonials.html')

@main.route('/about')
def about():
    return render_template('about.html')

@main.route('/services')
def services():
    return render_template('services.html')
