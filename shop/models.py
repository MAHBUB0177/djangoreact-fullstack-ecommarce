from django.db import models
from django.contrib.auth import get_user_model
from django.db.models.signals import post_save ##signal import
from django.dispatch import receiver ##receiver import 
from rest_framework.authtoken.models import Token  ##token model import django drf built in model

User = get_user_model()


class Customer(models.Model):
    
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=150, blank=True, null=True)
    mobile = models.CharField(max_length=16)
    prof_image= models.ImageField(upload_to='profile/', blank=True, null=True)
    address = models.TextField(blank=True, null=True)
    username = models.CharField(
        max_length=150, unique=True, blank=True, null=True)

    def __str__(self):
        return self.user.email


# @receiver(post_save,sender=User)
# def createCustomer(sender,instance,created,*args,**kwargs):##sender hosse user,instance hisebe user jkn make hbe tkn oi user er instance nitasi,create boolen trye or false return
#     if created:
#         Customer.objects.create(user=instance) ##user field er value hisebe instance ta dilam,cus mdl e akta req fiel seta user
#         Token.objects.create(user=instance)##token mdl e user req field
    
@receiver(post_save, sender=User)
def createCustomer(sender, instance, created, *args, **kwargs):
    if created:
        Customer.objects.create(user=instance)
        Token.objects.create(user=instance)
        
# @receiver(post_save,sender=Customer)
# def createUsername(sender,instance,created,*args,**kwargs):
#     if created:
#         instance.username=f'customer{instance.id}'
        
        
    


@receiver(post_save, sender=Customer)
def createUsername(sender, instance, created, *args, **kwargs):
    if created:
        instance.username = f"customer{instance.id}"
        instance.save()
        
        
        
        
class Category(models.Model):
    title = models.CharField(max_length=150)
    image = models.ImageField(upload_to='category/', blank=True, null=True)
    details = models.TextField(blank=True, null=True)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title


class Brand(models.Model):
    title = models.CharField(max_length=150)
    logo = models.ImageField(upload_to='logo/', blank=True, null=True)
    details = models.TextField(blank=True, null=True)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title


class Product(models.Model):
    title = models.CharField(max_length=150)
    image = models.ImageField(upload_to='product/')
    oldprice = models.PositiveIntegerField(blank=True, null=True)
    price = models.PositiveIntegerField()
    discount = models.PositiveIntegerField(blank=True, null=True)
    category = models.ManyToManyField(Category)
    brand = models.ForeignKey(
        Brand, on_delete=models.CASCADE, blank=True, null=True)
    details = models.TextField()
    tegs = models.TextField(blank=True, null=True)
    time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title


class ProductView(models.Model):
    product = models.OneToOneField(Product, on_delete=models.CASCADE)
    view = models.PositiveIntegerField(default=0)

    def __str__(self):
        return self.product.title


class Review(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    title = models.TextField()


class Slider(models.Model):
    name = models.CharField(max_length=200)
    details = models.TextField()
    image = models.ImageField(upload_to='slider')
    url = models.TextField(default='#')
    product = models.ForeignKey(
        Product, on_delete=models.SET_NULL, blank=True, null=True)

    def __str__(self):
        return self.name


class TrendingProduct(models.Model):
    products = models.ForeignKey(Product, on_delete=models.CASCADE)
    date = models.DateTimeField(auto_now_add=True)


class Cart(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    total = models.PositiveIntegerField()
    complit = models.BooleanField(default=False)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.customer.user.email


class CartProduct(models.Model):
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE)
    product = models.ManyToManyField(Product)
    quantity = models.PositiveIntegerField()
    total = models.PositiveIntegerField()


ORDER_STATUS = (
    ("Order Received", "Order Received"),
    ("Order Processing", "Order Processing"),
    ("On the way", "On the way"),
    ("Order Completed", "Order Completed"),
    ("Order Canceled", "Order Canceled"),
)


class Order(models.Model):
    cart = models.OneToOneField(Cart, on_delete=models.CASCADE)
    name = models.CharField(max_length=150)
    mobile = models.CharField(max_length=16)
    address = models.TextField()
    email = models.CharField(max_length=160)
    order_status = models.CharField(
        max_length=100, choices=ORDER_STATUS, default="Order Received")
    date = models.DateTimeField(auto_now_add=True)
    
class profile(models.Model):
    # name=models.CharField(max_length=300,blank=True)
    prouser = models.OneToOneField(User,on_delete=models.CASCADE)
    prof_image = models.ImageField(upload_to='logo/', blank=True, null=True)
    
    def __str__(self):
        return self.prouser.username