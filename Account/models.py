from django.db import models
from django.contrib.auth.models import BaseUserManager, AbstractBaseUser
from override_existing import OverrideExisting

# import barcode for barcode-printer
import barcode
from barcode.writer import ImageWriter
from io import BytesIO
from django.core.files import File


PHOTO_ID_PATH = "photoAccount/"
BARCODE_ID_PATH = "barcodeAccount/"


def photo_path(instance, filename):
    # file will be uploaded to MEDIA_ROOT/user_<id>/<filename>
    return PHOTO_ID_PATH + '/{0}/{1}'.format(instance.username, filename)


def barcode_path(instance, filename):
    # file will be uploaded to MEDIA_ROOT/user_<id>/<filename>
    return BARCODE_ID_PATH + '/{0}/{1}'.format(instance.username, filename)


class CreateAccount(BaseUserManager):
    # MUST DECLARE THE ARGUMENTS AS EXACTLY AS THE FIELDS IN THE MODEL!!
    def create_user(self, username, fullname, email, phone, password=None):
        if not username:
            raise ValueError('Users must have a username')
        if not fullname:
            raise ValueError('Users must have a name')
        if not email:
            raise ValueError('Users must have an email address')
        if not phone:
            raise ValueError('User must have a phone number')

        account = self.model(
            username=username,
            fullname=fullname,
            phone=phone,
            email=self.normalize_email(email),
        )
        account.realPassword = password
        account.set_password(password)
        account.save(using=self._db)

        return account


class Account(AbstractBaseUser):
    USERNAME_MAX = 30
    USERNAME_MIN = 6
    PASSWORD_MAX = 30
    PASSWORD_MIN = 6
    FULLNAME_MAX = 100
    FULLNAME_MIN = 30

    username = models.CharField(verbose_name="Username", max_length=USERNAME_MAX, default="abc",
                                unique=True)

    fullname = models.CharField(verbose_name="Full Name", max_length=FULLNAME_MAX, default="ABC XYZ")
    email = models.EmailField(verbose_name="Email Address", max_length=100, default="abc@def.gh")
    phone = models.CharField(verbose_name="Phone Number", max_length=15, default="012-3456-7890")
    photo = models.ImageField(verbose_name="Photo ID", upload_to=photo_path, blank=True, storage=OverrideExisting())
    barcode = models.ImageField(verbose_name="Barcode ID", upload_to=barcode_path, storage=OverrideExisting(), blank=True)
    password = models.CharField(verbose_name="Password", max_length=80, default="pwd")
    realPassword = models.CharField(verbose_name="Raw Password", max_length=PASSWORD_MAX, default="pwd")
    dateSignUp = models.DateTimeField(verbose_name="Date Signed Up", auto_now=True)
    lastLogin = models.DateTimeField(verbose_name="Last Time Login", auto_now_add=True)
    isAdmin = models.BooleanField(verbose_name="Administrator access", default=False)
    isStaff = models.BooleanField(verbose_name="Staff access", default=False)
    isActive = models.BooleanField(verbose_name="Activated", default=True)
    object = CreateAccount()

    # Identifier:
    USERNAME_FIELD = 'username'
    # # # Required fields for createsuperuser:
    # REQUIRED_FIELDS = ['fullname', 'email', 'phone']

    class Meta:
        db_table = "account_table"

    @property
    def last_login(self):
        return self.lastLogin

    @property
    def is_staff(self):
        return self.isStaff

    def __str__(self):
        return self.username

    def has_perm(self, perm, obj=None):
        return self.isStaff

    def has_module_perms(self, appLabel='Account'):
        return self.isStaff

    @property
    def access_level(self):
        if self.isStaff:
            return "Staff"
        else:
            return "Client"

    def save(self, *args, **kwargs):  # overriding save()
        code128_type = barcode.get_barcode_class('code128')
        byte = BytesIO()
        code = code128_type('{0}_{1}_{2}'.format(self.username, self.email, self.phone), writer=ImageWriter()).write(byte)
        self.barcode.save(f'{self.username}.png', File(byte), save=False)
        return super().save(*args, **kwargs)
