from . import product
from flask import render_template

@product.route('/<name>')
def products(name):
    return render_template('products.html', name=name)