from django.shortcuts import render, redirect
from django.core.paginator import Paginator
from django.contrib.auth import login, logout, authenticate

from Shipment.models import Shipment
from render_forms import AccountRegistration, AccountLoginForm, ShipmentRegistration


CONTEXT = {}
RESULT_PER_PAGE = 20


def accountRegisterView(request):
    # IF this is POST request:
    if request.method == "POST":
        formAccountRegister = AccountRegistration(request.POST, request.FILES)

        if formAccountRegister.is_valid():
            formAccountRegister.save()
            return redirect('account_register')
    # ELSE when this is GET request:
    else:
        formAccountRegister = AccountRegistration()

    CONTEXT["accountRegister"] = formAccountRegister
    return render(request, "accountRegister.html", CONTEXT)


def accountLoginView(request):
    # IF this is POST request:
    if request.method == "POST":
        formAccountLogin = AccountLoginForm(request.POST)

        if formAccountLogin.is_valid():
            username = formAccountLogin.cleaned_data.get('username')
            password = formAccountLogin.cleaned_data.get('password')
            account = authenticate(request, username=username, password=password)
    # ELSE when this is GET request:
    else:
        account = None
        formAccountLogin = AccountLoginForm()

    result = {
        "accountLogin": formAccountLogin,
        "accountExist": account,
    }
    return result


def shipmentRegisterView(request):
    # IF this is POST request:
    if request.method == "POST":
        formShipmentRegister = ShipmentRegistration(request.POST, request.FILES)

        # if formShipmentRegister.is_valid():
        #     formShipmentRegister.save()
        #     formShipmentRegister = ShipmentRegistration()
            # return redirect('shipment_register')
    # ELSE when this is GET request:
    else:
        formShipmentRegister = ShipmentRegistration()

    result = {
        "shipmentRegister": formShipmentRegister,
    }
    return result


def shipmentDisplayView(request):
    shipments = Shipment.objects.all().order_by("-number")
    shipmentList = shipments

    paginator = Paginator(shipmentList, RESULT_PER_PAGE)
    page = request.GET.get('page')
    pagination = paginator.get_page(page)
    account = request.user

    result = {
        "shipmentTotal": shipments,
        "shipmentDisplay": pagination,
        "userChange": account,
    }
    return result


def loginRedirectView(request):
    account = request.user
    CONTEXT["accountAuthenticated"] = account

    return render(request, "loginRedirect.html", CONTEXT)


def logoutRedirectView(request):
    logout(request)

    return redirect('frontpage')


def homepageView(request):
    accountloginview_result = accountLoginView(request)
    CONTEXT.update(accountloginview_result)

    if request.method == "POST":
        # check the button of accountLogin.html
        if "accountloginform" in request.POST:
            # if there exists an account with the authentication
            account = CONTEXT["accountExist"]
            if account is not None:
                login(request, account)
                return redirect('redirect_login')

    return render(request, "frontpage.html", CONTEXT)


def accountClientView(request):
    shipmentregisterview_result = shipmentRegisterView(request)
    CONTEXT.update(shipmentregisterview_result)

    if request.method == "POST":
        # check the button of shipmentRegister.html
        if "shipmentregisterform" in request.POST:
            # load the form from the CONTEXT
            shipmentregisterform = CONTEXT["shipmentRegister"]
            if shipmentregisterform.is_valid():
                shipmentregisterform.save()
                CONTEXT["shipmentRegister"] = ShipmentRegistration()

                shipmentdisplayview_result = shipmentDisplayView(request)
                CONTEXT.update(shipmentdisplayview_result)
                return redirect('account_client')
    else:
        CONTEXT["shipmentRegister"] = ShipmentRegistration()

    shipmentdisplayview_result = shipmentDisplayView(request)
    CONTEXT.update(shipmentdisplayview_result)
    return render(request, "accountClient.html", CONTEXT)
