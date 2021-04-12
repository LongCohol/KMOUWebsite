"""WebDesign_2021_03 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from render_views import homepageView, accountClientView, \
    accountRegisterView, shipmentRegisterView, shipmentFilterView, \
    loginRedirectView, logoutRedirectView

urlpatterns = [
    path('admin/', admin.site.urls),

    path('', homepageView, name="frontpage"),
    path('account_register/', accountRegisterView, name="account_register"),
    path('redirect_login/', loginRedirectView, name="redirect_login"),
    path('redirect_logout/', logoutRedirectView, name="redirect_logout"),
    path('account_client/', accountClientView, name="account_client"),
    path('shipment_register/', shipmentRegisterView, name="shipment_register"),
    path('shipment_filter/', shipmentFilterView, name="shipment_filter"),
]
