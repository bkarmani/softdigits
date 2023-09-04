from flask_wtf import FlaskForm
from flask_wtf.file import FileAllowed, FileField, FileRequired
from wtforms import StringField, SubmitField, TextAreaField, SelectField, IntegerField
from wtforms.validators import DataRequired


categories =[
'Consumer Electronics',
'Home Appliances',
'Power Generation and Distribution',
'Lighting Products',
'Electrical Tools and Equipment',
'Industrial Equipment',
'Telecommunications and Networking', 
'Renewable Energy Systems',
'Security and Surveillance Systems',
'Medical Electronics',
'Automotive Electronics',
'Entertainment and Gaming Electronics',
'Electronic Components',
'Electrical Accessories',
'Test and Measurement Instruments',
'Electrical Wiring and Accessories',
'Power Electronics',
'Communication Equipment',
'Control Systems',
'Instrumentation and Sensors'
]

class ProductForm(FlaskForm):
    product_name = StringField('product name', validators=[DataRequired()])
    description =  TextAreaField('description', validators=[DataRequired()])
    currency = StringField()
    old_price = StringField('old price', validators=[DataRequired()])
    price = StringField('price', validators=[DataRequired()])
    image1 = FileField('first image', validators=[FileRequired(), FileAllowed(['jpg','webp', 'png', 'jpeg'])])
    image2 = FileField('second image', validators=[FileRequired(), FileAllowed(['jpg','webp', 'png', 'jpeg'])])
    image3 = FileField('third image', validators=[FileRequired(), FileAllowed(['jpg','webp', 'png', 'jpeg'])])
    image4 = FileField('fourth image', validators=[FileRequired(), FileAllowed(['jpg','webp', 'png', 'jpeg'])])
    category = SelectField('choose category', choices=categories, validators=[DataRequired()])
    submit = SubmitField('submit')

class PreOrderForm(FlaskForm):
    quantity = IntegerField('qty', validators=[DataRequired()])
    submit = SubmitField('preorder')