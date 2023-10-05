from . import shop
from ..models import Products, Categories
from .forms import ProductForm, PreOrderForm
from .. import db
from flask import render_template, redirect, url_for, flash, request
from werkzeug.utils import secure_filename
from ..emails import send_email
import random
import os


# produce unique random numbers as order number


def order_sn():
    start = str(random.randrange(1, 100, 2))
    middle = str(random.randint(1, 20))
    end = str(random.randrange(0, 100))
    number = start + middle + end
    return number


admin_email = 'sales@primelectron.com'


@shop.route('/add_product', methods=['POST', 'GET'])
def add_product():
    form = ProductForm()
    if form.validate_on_submit():
        # form data
        prd_name = form.product_name.data
        old_pr = form.old_price.data
        pr = form.price.data
        desc = form.description.data
        category = form.category.data
        img1 = form.image1.data
        img2 = form.image2.data
        img3 = form.image3.data
        img4 = form.image4.data

        # names of uploaded files
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

        # save files to static
        img1.save(os.path.join(
            '\home\web\website\app\static\images\product', file1_name))
        img2.save(os.path.join(
            '\home\web\website\app\static\images\product', file2_name))
        img3.save(os.path.join(
            '\home\web\website\app\static\images\product', file3_name))
        img4.save(os.path.join(
            '\home\web\website\app\static\images\product', file4_name))

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
    product = Products.query.filter_by(description=desc).first()
    if product:
        product_name = product.product_name
    if request.method == 'POST':

        quantity = request.form.get('quantity')
        email = request.form.get('email')
        user_subject = 'QUOTES REQUEST'
        owner_subject = 'NEW OREDR REQUEST'
        owner = admin_email
        template_owner = 'emails/notify-owner'
        template_customer = 'emails/notify-customer'
        order_number = order_sn()
        # notify site owner
        send_email(owner_subject, email, owner, template_owner,
                   customer_email=email, quantity=quantity, description=desc,
                   product_name=product_name, order_no=order_number
                   )
        # notify user
        send_email(user_subject, owner, email, template_customer,
                   quantity=quantity, description=desc, customer_email=email,
                   product_name=product_name, order_no=order_number
                   )
    return render_template('shop/preorder.html', quantity=quantity, product=product)
