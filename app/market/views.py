from . import shop
from ..models import Products, Categories
from .forms import ProductForm, PreOrderForm
from .. import db
from flask import render_template, redirect, url_for, flash, request
from werkzeug.utils import secure_filename

@shop.route('/add_product', methods=['POST', 'GET'])
def add_product():
    form = ProductForm()
    if form.validate_on_submit():
        #form data
        prd_name = form.product_name.data
        old_pr = form.old_price.data
        pr = form.price.data
        desc = form.description.data
        category = form.category.data
        img1=form.image1.data
        img2=form.image2.data
        img3=form.image3.data
        img4=form.image4.data

        #names of uploaded files
        file1_name = secure_filename(img1.filename)
        file2_name = secure_filename(img2.filename)
        file3_name = secure_filename(img3.filename)
        file4_name = secure_filename(img4.filename)

        prod_category = Categories.query.filter_by(name=category).first()
        if prod_category:
            product = Products(product_name=prd_name, description=desc, price=pr,
                            old_price=old_pr,
                            category=prod_category,
                            image1=file1_name,
                            image2=file2_name,
                            image3=file3_name,
                            image4=file4_name)
        else:
            flash('choose category from list')
            return redirect(url_for('shop.add_product'))
        db.session.add(product)
        db.session.commit()
        return redirect(url_for('shop.add_product'))
    return render_template('shop/add_product.html', form=form)


@shop.route('/page1')
def page1():
    products = Products.query.all()
    return render_template('shop/shop.html', products=products)


@shop.route('/page1/product_details/<desc>', methods=['GET', 'POST'])
def product_details(desc):
    order = PreOrderForm()
    product = Products.query.filter_by(description=desc).first()
    return render_template('shop/product_details.html', product=product, order=order)

@shop.route('/page1/product_details/preorder/<desc>', methods=['GET', 'POST'])
def preorder(desc):
    product= Products.query.filter_by(description=desc).first()
    if request.method == 'POST':
        quantity = request.form.get('quantity')
    return render_template('shop/preorder.html', quantity=quantity, product=product)
        





        



