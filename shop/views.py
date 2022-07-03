
from urllib import response
from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
# from rest_framework.permissions import isAuthenticated
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication
from django.db.models import Q
from django.utils import timezone
from .models import *
from .serializers import *
from django.contrib.auth.models import User

from django.views.generic import TemplateView, ListView
from rest_framework import generics


class allproductview(APIView):
    def get(self,request):
        prod_obj=Product.objects.all()
        prod_serializers=ProductSerializer(
                prod_obj, many=True, context={'request': request}).data
        return Response(prod_serializers)

class AllproductView(APIView):
    authentication_classes=[TokenAuthentication, ]
    permission_classes = [IsAuthenticated, ]
    # serializer_class = ProductSerializer

    def post(self,request):
        print(request.data)
        serializers = ProductSerializer(data=request.data)
        return Response({})
        # app_user_id = self.request.session.get('app_user_id')
        # branch_code = self.request.session.get('branch_code')
        # id = self.request.query_params.get('item', None)
        # queryset = Product.objects.filter().order_by('-title')
        
        # if id:
        #     queryset=queryset.filter(id=id)
        

        # return queryset

class CategoryProductView(APIView):
    def get(self, request):
        category_obj = Category.objects.all()
        category_serializer = CategorySerializer(category_obj, many=True).data
        data = []
        for cata in category_serializer:
            product_obj = Product.objects.filter(category=cata['id'])
            cata['products'] = ProductSerializer(
                product_obj, many=True, context={'request': request}).data
            data.append(cata)
        return Response(data)




class SingleBrandsProducts(APIView):
    def get(self,request,pk):
        brand_obj=Brand.objects.filter(id=pk)
        brand_serializers=BrandSerializer(brand_obj,many=True,context={'request':request})
        data=[]
        for brand in brand_serializers.data:
            brandProducts=Product.objects.filter(brand=brand['id'])
            brandProducts_serializer=ProductSerializer(brandProducts,many=True,context={'request':request}).data
            brand['products']=brandProducts_serializer
            data.append(brand)
            return Response(data)
        
        
class singleproduct(APIView):
    def get(self,request,pk):
        prod_obj=Product.objects.filter(id=pk)
        prod_serializers=ProductSerializer(
                prod_obj, many=True, context={'request': request}).data
        return Response(prod_serializers)
    
class singleeditproduct(APIView):
    def get(Self,request,update_product = True):
        print(request.data['userId'])
        print(request.data['title'])
        print(request.data['price'])
        
        prod_obj=Product.objects.filter(id=request.data['userId'])
        # if update_product:
        #     prod_obj.title=request.data['title']
        #     prod_obj.price=request.data['price']
        #     prod_obj.save()
            
        prod_serializers=ProductSerializer(
                prod_obj, many=True, context={'request': request}).data
        return Response(prod_serializers)
    
    
    
###############################
class singleeditproductupdate(APIView):
    
    permission_classes=[IsAuthenticated, ]
    authentication_classes=[TokenAuthentication, ]
    
    def get(Self,request,update_product = True):
        # print(request.data['userId'],'mahbub alam is a soft')
        print('mahbub alam is a soft')
        print(request.data['price'])
        
        prod_obj=Product.objects.filter(id=request.data['userId'])
        if update_product:
            prod_obj.title=request.data['title']
            prod_obj.price=request.data['price']
            prod_obj.save()
            
        # prod_serializers=ProductSerializer(
        #         prod_obj, many=True, context={'request': request}).data
        return Response(prod_obj)




#########################

class SingleCategoryView(APIView):
    def get(self, request, pk):
        category_obj = Category.objects.filter(id=pk)
        category_serializer = CategorySerializer(
            category_obj, many=True, context={'request': request}).data
        data = []
        for cata in category_serializer:
            product_obj = Product.objects.filter(category=cata['id'])
            cata['products'] = ProductSerializer(
                product_obj, many=True, context={'request': request}).data
            data.append(cata)
        return Response(data)


class CategorisView(APIView):
    def get(self, request):
        categoris_obj = Category.objects.all()
        category_serializer = CategorySerializer(
            categoris_obj, many=True, context={'request': request}).data
        return Response(category_serializer)

class allproductView(APIView):
    def get(self,request):
        prod_obj=Product.objects.all()
        prod_serializers=ProductSerializer(
                prod_obj, many=True, context={'request': request}).data
        return Response(prod_serializers)
class SingleProductView(APIView):
    def get(self, request, pk):
        product_obj = Product.objects.filter(id=pk)
        data = []
        product_serializer = SingleProductSerializer(
            product_obj, many=True, context={'request': request}).data
        for prod in product_serializer:
            prod_view = ProductView.objects.filter(product=prod['id']).first()
            # print('prod_view', prod_view)
            if prod_view:
                prod['view'] = prod_view.view
            else:
                prod['view'] = 0
            prod_review = Review.objects.filter(product=prod['id'])
            prod_review_serializer = ReviewSerializer(
                prod_review, many=True).data
            prod['review'] = prod_review_serializer

            data.append(prod)
        return Response(data)


class BrandSNameView(APIView):
    def get(self, request):
        brand_obj = Brand.objects.all()
        brand_serializers = BrandSerializer(
            brand_obj, many=True, context={'request': request}).data
        return Response(brand_serializers)
    

# class ProductView(APIView):
#     def get(self, request):
#         prod_obj = Product.objects.all()
#         prod_serializers = ProductSerializer(
#             prod_obj, many=True, context={'request': request}).data
#         return Response(prod_serializers)


class TrandingProductsView(APIView):
    def get(self, request):
        products_obj = TrendingProduct.objects.all()
        product_serializer = TrendingProductSerializer(
            products_obj, many=True,context={'request': request} ).data
        return Response(product_serializer)


class SliderView(APIView):
    def get(self, request):
        slider_obj = Slider.objects.all()
        slider_serializer = SliderSerializer(
            slider_obj, many=True, context={'request': request}).data
        return Response(slider_serializer)



class AddViewProduct(APIView):
    def post(self, request):
        p_id = request.data['id']
        p_obj = Product.objects.get(id=p_id)
        p_view_obj = ProductView.objects.filter(product=p_obj).first()
        if p_view_obj:
            p_view_obj.view += 1
            p_view_obj.save()
        else:
            ProductView.objects.create(product=p_obj, view=1)
        return Response({'error': False, 'message': 'Success'})


class MostViewsProducts(APIView):
    def get(self, request):
        p_obj = ProductView.objects.all().order_by('-view')[:12]
        print(p_obj)
        p_obj_data = ProductViewSerializer(
            p_obj, many=True, context={'request': request}).data
        return Response(p_obj_data)

        
    

class SearchView(APIView):
    def get(self, request, q):
        data = {}
        posts_lookup = (Q(title__icontains=q) |
                        Q(details__icontains=q) |
                        Q(tegs__icontains=q) |
                        Q(price__icontains=q))
        prod_obj = Product.objects.filter(
            time__lte=timezone.now()).filter(posts_lookup)
        data['products'] = ProductSerializer(
            prod_obj, many=True, context={'request': request}).data
        category_lookup = (Q(title__icontains=q) | Q(details__icontains=q))
        category_obj = Category.objects.filter(
            date__lte=timezone.now()).filter(category_lookup)
        data['category'] = CategorySerializer(
            category_obj, many=True, context={'request': request}).data

        brand_lookup = (Q(title__icontains=q) | Q(details__icontains=q))
        brand_obj = Brand.objects.filter(
            date__lte=timezone.now()).filter(category_lookup)
        data['brand'] = BrandSerializer(
            brand_obj, many=True, context={'request': request}).data

        return Response(data)


class ProfileView(APIView):
    permission_classes = [IsAuthenticated, ]
    authentication_classes = [TokenAuthentication, ]

    def get(self, request):
        customer_obj = Customer.objects.get(user=request.user)
        customer_ser = CustomerSerializer(customer_obj,many=True, context={'request': request}).data
        return Response(customer_ser)


class RegisterUserView(APIView):
    def post(self, request):
        data=request.data
        print(data)
        serializers = UserSerializer(data=request.data)
        if serializers.is_valid(raise_exception=True):
            serializers.save()
            return Response({'error': False, 'message': "User Was Crated!!"})
        return Response({'error': True, 'message': "User Was Not Crated!!"})
    

    
class ProfileView(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]
    
    def get(self,request):
        print(request.user)
        customer_obj=Customer.objects.get(user=request.user)
        customer_ser=CustomerSerializer(customer_obj).data
        return Response(customer_ser)




# class Updateuser(APIView):
#     permission_classes=[IsAuthenticated, ]
#     authentication_classes=[TokenAuthentication, ]
    
#     def post(self,request):
#         try:
#             user = request.user
#             print(user)
#             id = request.data['id']
#             print(id)
#             username = request.data['username']
#             print(username)
            
#             # user_obj = Customer.objects.get(username=name)
#             data_obj=Customer.objects.filter(id=10)
#             print(data_obj)
#             user_obj=Customer.objects.filter(id=request.data['id'])
#             print(user_obj,'profile data')
#             user_obj.username = request.data['username']
#             print(request.data,'prfile image')
#             # user_obj.email = data["email"]
#             user_obj.mobile = request.data["mobile"]
#             # user_obj.username.save()
#             user_obj.save()
#             response_data = {"error":False,"message":"User Data is Updated"}
#         except:
#             response_data = {"error":True,"message":"User Data is not Update Try agane !"}
#         return Response(response_data)


class Updateuser(APIView):
    permission_classes=[IsAuthenticated, ]
    authentication_classes=[TokenAuthentication, ]
    
    def post(self,request):
        try:
            user = request.user
            print(user)
            data = request.data['id']
            obj_data=Customer.objects.filter(user_id=request.data['id'])
            print(obj_data,'user data')
            print(data,'user_id')
            # user_obj = Customer.objects.get(username=name)
            user_obj=Customer.objects.get(user_id=request.data['id'])
            user_obj.username = request.data["username"]
            user_obj.email =request.data["email"]
            user_obj.mobile = request.data["phone"]
            user_obj.save()
            
            response_data = {"error":False,"message":"User Data is Updated"}
        except:
            response_data = {"error":True,"message":"User Data is not Update Try agane !"}
        return Response(response_data)
    
    
    
class updateimage(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]
    
    def post(self,request):
        # try:
        
        user_obj=Customer.objects.get(user=request.user)
        print(user_obj,"i am...")
        data=request.data
        print(data)
        customer_ser=CustomerSerializer(user_obj,data=data,context={'request':request})
        if customer_ser.is_valid():
            customer_ser.save()
            # response_data = {"error":False,"message":"User Data is Updated"}
            print(customer_ser,"ok i am..")
        # except:
        #     response_data = {"error":True,"message":"User Data is not Update Try agane !"}
        return Response(customer_ser.data)
            
# class updateimage(APIView):
#     permission_classes = [IsAuthenticated]
#     authentication_classes = [TokenAuthentication]
    
#     def post(self,request):
#         # try:
        
#         data=request.data.id
#         print(data)
#         customer_obj=Customer.objects.get(id=request.user.id)
#         print(customer_obj,"i am...")
#         customer_ser=CustomerSerializer(customer_obj,context={'request':request}).data
#         if customer_ser.is_valid(raise_exception=True):
#             customer_ser.save()
#             # response_data = {"error":False,"message":"User Data is Updated"}
#             print(customer_ser,"ok i am..")
#         # except:
#             # response_data = {"error":True,"message":"User Data is not Update Try agane !"}
#         return Response(customer_ser)
    

    