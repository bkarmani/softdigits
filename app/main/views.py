from . import main
from flask import render_template, flash, url_for, redirect, request, session
from .forms import NewsLetterForm, AppointmentForm, RequestServiceForm, ReviewForm, ContactForm
from ..models import User, Subscribers
from .. import db
from ..emails import subscribe_user, send_email
import re
from ..models import Products
import smtplib


admin_sender = 'bk.frankie200@gmail.com'

def is_valid_email(email):
    pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    return re.match(pattern, email) is not None

def is_valid_phone(number):
    pattern = re.compile("(0|91)?[6-9][0-9]{9}")
    return pattern.match(number)

@main.route('/', methods=['GET', 'POST'])
def index():
    return render_template('index.html')

@main.route('/news_letter', methods=['GET','POST'])
def news_letter():
    if request.method == 'POST':
        email = request.form.get('sub_email')
        is_a_subscriber = Subscribers.query.filter_by(email=email).first()
        if is_a_subscriber:
            flash('sorry!, you are already a subscriber', category='warning')
        elif not email:
            flash('this field cannot be empty', category='danger')
        elif not is_valid_email(email):
            flash('please enter a valid email', category='warning')
        else:
            user = Subscribers(email=email)
            db.session.add(user)
            db.session.commit()
            subscribe_user(email, 
                        'electron@sandboxa7f55fb25a5444a0addd0fc153c3039c.mailgun.org',
                        '8023f9a76db2402179a28cb1bbd8a16b-4e034d9e-3058ef0c')
            flash('you have successfully subscribed to our newsletter', category='success')
            subject='NEWSLETTER SUBSCRIPTION'
            sender= admin_sender
            recipient = email
            template = 'emails/newsletter'
            send_email(subject,sender, recipient, template, user=email)       
    return redirect(request.referrer)

@main.route('/unsubscribe/<email>')
def unsubscribe(email):
    sub_email = Subscribers.query.filter_by(email=email).first()
    if sub_email:
        db.session.delete(sub_email)
        db.session.commit()
        flash('you have seccessfully unsubscribed from our service',category='success')
    else:
        flash('user unsubscribed or not a subscriber', category='warning') 
    return redirect(url_for('main.index'))

@main.route('/appointment', methods=['GET', 'POST'])
def appointment():
    if request.method == 'POST':
        name = request.form.get('client_name')
        email = request.form.get('client_email')
        phone_number = request.form.get('client_number')
        address = request.form.get('client_Address')
        services = request.form.get('typeofservice')
        date = request.form.get('appointment_date')
        message =  request.form.get('appoint_msg')
        if not is_valid_email(email):
            flash('please enter a valid email', category='danger')
        else:
            sender = email
            subject = f'Appointment Confirmation-{name}'
            template = 'emails/appointment'
            template2 = 'emails/customer-appoint'
            recipient = admin_sender
            # notify owner via email
            send_email(subject,sender, recipient, template, email=email,
                       customer_name=name, phone_number=phone_number, address=address,
                        services=services, date=date, message=message)
            
            #notify customer via email
            send_email(subject,recipient, sender, template2, email=email,
                       customer_name=name, phone_number=phone_number, address=address,
                        services=services, date=date, message=message)
            
            # notify customer when appointment booking is successful
            flash('appointment booked successfully', category='success')
    return redirect(request.referrer)

@main.route('/request_service', methods=['GET', 'POST'])
def request_service():
    if request.method == 'POST':
        name = request.form.get('client_name')
        email = request.form.get('client_email')
        phone_number = request.form.get('client_number')
        date = request.form.get('appointment_date')
        if not is_valid_email(email):
            flash('please enter a valid email', category='danger')
        else:
            subject = 'SERVICE REQUEST'
            sender = email
            recipient = admin_sender
            template = 'mails/service-request'
            template2 = 'mails/service-request2'

            #notify owner via email
            send_email(subject,sender, recipient, template, email=email,
                       customer_name=name, phone_number=phone_number,
                        services=services, date=date)
            
            #notify customer via email
            send_email(subject,recipient, sender, template2, email=email,
                       customer_name=name, phone_number=phone_number,
                        services=services, date=date)
            
            flash('service request success', category='success')
    return redirect(request.referrer)

@main.route('/feedback', methods=['GET', 'POST'])
def feedback():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        phone_number = request.form.get('phonenumber')
        message = request.form.get('message')
        if not is_valid_email(email):
            flash('please enter a valid email', category='danger')
        else:
            subject = f'FEEDBACK-{name}'
            sender = email
            recipient = admin_sender
            template = 'emails/feedback'
            send_email(subject,sender, recipient, template, email=email,
                       customer_name=name, phone_number=phone_number,
                        comments=message)
            flash('success', category='success')
    return redirect(request.referrer)


# @main.route('/appointment', methods=['POST'])
# def appointment():
#     form = AppointmentForm()
#     print(form)
#     name=form.name.data
#     email = form.email.data
#     if request.method == 'POST':
#         user = User(email=email, name=name)
#         db.session.add(user)
#         db.session.commit()
#     return redirect(url_for('main.index'))

# @main.route('/serve', methods=['POST'])
# def serve():
#     services_form = RequestServiceForm()
#     if request.method == 'POST':
#         pass
#     return redirect(url_for('main.index'))

@main.route('/testimonials')
def testimonials():
    return render_template('testimonials.html')

@main.route('/about')
def about():
    return render_template('about.html')

@main.route('/services')
def services():
    return render_template('services.html')

@main.route('/services-item')
def services_item():
    return render_template('services-item.html')

@main.route('/services-item2')
def services_item2():
    return render_template('services-item2.html')

@main.route('/services-item3')
def services_item3():
    return render_template('services-item3.html')

@main.route('/services-item4')
def services_item4():
    return render_template('services-item4.html')

@main.route('/services-item5')
def services_item5():
    return render_template('services-item5.html')

@main.route('/services-item6')
def services_item6():
    return render_template('services-item6.html')

@main.route('/services-item7')
def services_item7():
    return render_template('services-item7.html')

@main.route('/services-item8')
def services_item8():
    return render_template('services-item8.html')

@main.route('/services-item9')
def services_item9():
    return render_template('services-item9.html')   

@main.route('/prices')
def prices():
    return render_template('prices.html')
    

@main.route('/FAQ')
def faq():
    return render_template('faq.html')

@main.route('/gallery')
def gallery():
    return render_template('gallery.html')
    

@main.route('/contacts')
def contacts():
    return render_template('contact.html')

@main.route('/blog')
def blog():
    return render_template('blog.html')


 