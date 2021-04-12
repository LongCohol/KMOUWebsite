# Generated by Django 2.2.10 on 2021-04-10 16:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Shipment', '0005_auto_20210410_1638'),
    ]

    operations = [
        migrations.AlterField(
            model_name='shipment',
            name='by',
            field=models.CharField(blank=True, choices=[('AIR', 'AIR'), ('FDX', 'FDX'), ('DHL', 'DHL'), ('TNT', 'TNT'), ('SFX', 'SFX'), ('SEA', 'SEA')], db_column='by1', max_length=50, verbose_name='BY'),
        ),
        migrations.AlterField(
            model_name='shipment',
            name='company',
            field=models.CharField(choices=[('GLOVIS', 'GLOVIS'), ('EUCO', 'EUCO'), ('DORVAL', 'DORVAL'), ('이강공사', '이강공사'), ('SEOYANG', 'SEOYANG'), ('GOWIN', 'GOWIN'), ('GOLTENS', 'GOLTENS'), ('POSSM', 'POSSM'), ('INTERGIS', 'INTERGIS'), ('KSS', 'KSS'), ('SHI OCEAN', 'SHI OCEAN'), ('FORTUNE WILL', 'FORTUNE WILL'), ('KLCSM', 'KLCSM'), ('DAN MO', 'DAN MO'), ('STX', 'STX'), ('SUNRIO', 'SUNRIO'), ('보성상사', '보성상사'), ('MAN', 'MAN'), ('CENTRA', 'CENTRA'), ('KNK', 'KNK'), ('SAEHAN', 'SAEHAN'), ('오션마린', '오션마린'), ('MARUBISHI', 'MARUBISHI'), ('SUNAMI', 'SUNAMI'), ('CMSHIP', 'CMSHIP')], db_column='company', max_length=100, verbose_name='COMPANY'),
        ),
        migrations.AlterField(
            model_name='shipment',
            name='flag_status',
            field=models.CharField(blank=True, choices=[('STAY', 'STAY'), ('COMPLETED', 'COMPLETED'), ('START', 'START'), ('BLANK', 'BLANK')], db_column='flg', max_length=10, verbose_name='STATE'),
        ),
        migrations.AlterField(
            model_name='shipment',
            name='warehouse',
            field=models.CharField(blank=True, choices=[('ICN-IGS', 'ICN-IGS'), ('SL', 'SL'), ('KIM-IGS', 'KIM-IGS')], db_column='whouse', max_length=100, verbose_name='W/H'),
        ),
    ]
