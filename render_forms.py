from django import forms
from django.contrib.auth import authenticate
from django.contrib.auth.hashers import make_password

from Account.models import Account
from Shipment.models import Shipment

USERNAME_MAX = 30
USERNAME_MIN = 6
PASSWORD_MAX = 30
PASSWORD_MIN = 6
FULLNAME_MAX = 100
FULLNAME_MIN = 30


class AccountRegistration(forms.ModelForm):
    password1st = forms.CharField(max_length=PASSWORD_MAX, min_length=PASSWORD_MIN, label="Password",
                                  help_text="Choose a password, from %d to %d characters" % (PASSWORD_MIN, PASSWORD_MAX),
                                  widget=forms.PasswordInput)
    password2nd = forms.CharField(max_length=PASSWORD_MAX, min_length=PASSWORD_MIN, label="Confirm Password",
                                  help_text="Retype the password to confirm", widget=forms.PasswordInput)

    class Meta:
        model = Account
        fields = ('username', 'fullname', 'email', 'phone', 'password1st', 'password2nd', 'photo')

    def __init__(self, *args, **kwargs):
        super(AccountRegistration, self).__init__(*args, **kwargs)
        self.fields['username'].help_text = "Choose a username for login, maximum at %d characters" % (USERNAME_MAX)
        self.fields['fullname'].help_text = "Enter your full name, maximum at %d characters" % (USERNAME_MAX)
        self.fields['email'].help_text = "Enter your email address"
        self.fields['phone'].help_text = "Enter your phone number"
        self.fields['photo'].help_text = "Optional field, not required"
        # Set up dimension for fields with CSS style
        self.fields['username'].widget.attrs['style'] = 'width: 5.5cm'
        self.fields['fullname'].widget.attrs['style'] = 'width: 5.5cm'
        self.fields['email'].widget.attrs['style'] = 'width: 5.5cm'
        self.fields['phone'].widget.attrs['style'] = 'width: 5.5cm'
        self.fields['photo'].widget.attrs['style'] = 'width: 5.5cm'
        self.fields['password1st'].widget.attrs['style'] = 'width: 5.5cm'
        self.fields['password2nd'].widget.attrs['style'] = 'width: 5.5cm'

    class Meta:
        model = Account
        fields = ['username', 'fullname', 'email', 'phone', 'password1st', 'password2nd', 'photo']

    def clean_fullname(self):
        fullName = self.cleaned_data.get('fullname')

        for ch in fullName:
            if not ch.isdigit() and not ch.isalpha():
                raise forms.ValidationError("Name mustn't have special characters. Please retype!")
            break
        return fullName

    def clean_phone(self):
        phoneNumber = self.cleaned_data.get('phone')

        for no in phoneNumber:
            if not no.isdigit():
                raise forms.ValidationError("Phone number can only contains digits. Please retype!")
            break
        return phoneNumber

    def clean_password2nd(self):
        password1 = self.cleaned_data.get('password1st')
        password2 = self.cleaned_data.get('password2nd')

        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("Two password must match. Please retype!")
        return password2

    def save(self, commit=True):
        # Get the account but not saved yet
        account = super().save(commit=False)
        # Convert the password to hash code
        password = self.cleaned_data.get('password1st')

        if commit:
            account.realPassword = password
            account.set_password(password)
            account.save()
        return account
    ###########################################################


class AccountLoginForm(forms.ModelForm):
    username = forms.CharField(label="Username", widget=forms.TextInput)
    password = forms.CharField(label="Password", widget=forms.PasswordInput)

    class Meta:
        model = Account
        fields = ('username', 'password')

    def clean(self):
        if self.is_valid():
            username = self.cleaned_data.get('username')
            password = self.cleaned_data.get('password')

            if not authenticate(username=username, password=password):
                raise forms.ValidationError("Wrong credentials. Try again")
    ###########################################################


class ShipmentRegistration(forms.ModelForm):
    in_date = forms.DateField(required=False, input_formats=['%Y-%m-%d'], widget=forms.DateInput(format='%Y-%m-%d'), label="IN")
    out_date = forms.DateField(required=False, input_formats=['%Y-%m-%d'], widget=forms.DateInput(format='%Y-%m-%d'), label="OUT")

    class Meta:
        model = Shipment
        fields = ('company', 'vessel', 'docs', 'odr', 'supplier', 'quanty', 'unit', 'size', 'weight', 'in_date',
                  'warehouse', 'by', 'BLno', 'port', 'out_date', 'remark', 'job_number', 'image', 'image1', 'image2',
                  'pdf_file', 'division')

    def __init__(self, *args, **kwargs):
        # Set up dimension for fields with CSS style
        super(ShipmentRegistration, self).__init__(*args, **kwargs)
        self.fields['docs'].widget.attrs['style'] = 'width: 5cm; height:1.5cm;'
        self.fields['odr'].widget.attrs['style'] = 'width: 5cm; height:1.5cm;'
        self.fields['supplier'].widget.attrs['style'] = 'width: 5cm; height:1.5cm;'
        self.fields['size'].widget.attrs['style'] = 'width: 5cm; height:1.5cm;'
        self.fields['remark'].widget.attrs['style'] = 'width: 5cm; height:1.5cm;'

        self.fields['company'].widget.attrs['style'] = 'width: 4cm'
        self.fields['division'].widget.attrs['style'] = 'width: 2cm'
