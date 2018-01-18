#-*- coding: utf-8 -*-

from django.shortcuts import render
from django.core.mail import EmailMultiAlternatives
from django.template.loader import render_to_string, get_template
from django.template import Context
from django.http import HttpResponse
#from reportlab.pdfbase.pdfdoc import rect_to_quad
from .models import *
#from easy_pdf.views import PDFTemplateView
from email.mime.image import MIMEImage
from django.conf import settings
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import json as simplejson
from re import split
#from sendsms import api
#from sendsms.message import SmsMessage
from django.conf import settings
#import twilio
#import twilio.rest
#from twilio.rest import TwilioRestClient
from users.models import User




def email(request):
    desti = Destinataire.objects.all()

    for destinataires in desti:

        ctx = {
            'user': 'buddy',
            'purchase': 'Books'
        }

        message = get_template('index.html').render(Context(ctx))
        email = EmailMultiAlternatives('Message de teste', message, to=[destinataires.adresse])


        # send an image
        fp = open('./static/images/Kamal.png', 'rb')
        img = MIMEImage(fp.read())
        fp.close()
        email.attach(img)

        msgAlternative = MIMEMultipart('alternative')

        msgText = MIMEText('<b>Some <i>HTML</i> text</b> and an image.<br><img src="images/Kamal.png"><br>Nifty!', 'html')
        msgAlternative.attach(msgText)
        email.content_subtype = 'html'
        email.send()
    return HttpResponse('Message envoye avec Image')
    #return render(request, 'index.html')



def index(request):
    return render(request, 'index.html')


def group(request, id):

    desti_group = Destinataire_Group.objects.filter(group_id=id)
    for d in desti_group:
        print(" Destinataire et Groupe "+str(d))

        email = EmailMultiAlternatives('Message de teste', 'cc message groupe <img src="http://www.emc2-group.com/templates/emc2/images/logo.gif" alt=""/>',
                                      to = [str(d)])

        email.content_subtype = 'html'
        email.send()
    return HttpResponse(' Message dans le groupe ')
    #return render(request, 'sendgroup.html')



def sendgroup(request):
    group = Group.objects.all()
    return render(request, 'sendgroup.html', {'group': group})



def selectiongroup(request):
    selection = Group.objects.all()

    #return HttpResponse(' Selection du groupe ')
    return render(request, 'selectiongroup.html', {'selection': selection})



# Ancien code correct
# def sendselectiongroup(request, id):
#
#     #if request.is_ajax():
#
#     print('L identifiant est '+id)
#     desti_group = Destinataire_Group.objects.filter(group_id=id)
#     for d in desti_group:
#         print(' Destinataire et Groupe '+str(d))
#         email = EmailMultiAlternatives('Message de teste', 'cc message du groupe séléctionné <img src="http://www.emc2-group.com/templates/emc2/images/logo.gif" alt=""/>',
#                                       to = [str(d)])
#         email.content_subtype = 'html'
#         email.send()
#     return HttpResponse(' Le message a ete envoye au groupe selectionne ')


def sendselectiongroup(request):
    if request.method == 'POST':
    #if request.is_ajax() and request.POST:
        if 'valeurs' in request.POST:
            # valeurs = request.POST.get('valeurs')
            if request.POST.get('valeurs') is not None and request.POST.get('valeurs') != "":
                valeurs = str(request.POST.get('valeurs')).split(sep=",")
            else:
                valeurs = []

            for item in valeurs:
            #for item in split(",", str(valeurs)):
                if item is not None:
                    print("Valeur "+item)
                    desti_group = Destinataire_Group.objects.filter(group_id=int(item))
                    for d in desti_group:
                        print('  Destinataire et Groupe None '+str(d))
                        #email = EmailMultiAlternatives('Message de teste', 'cc MANE message du groupe séléctionné <img src="http://www.emc2-group.com/templates/emc2/images/logo.gif" alt=""/>',
                        email = EmailMultiAlternatives('Message de teste', 'cc MANE message du groupe séléctionné <img src="http://www.emc2-group.com/templates/emc2/images/logo.gif" alt=""/>',
                                               to = [str(d)])
                        email.content_subtype = 'html'
                        email.send()
                else:
                    print("Split Valeur None ->"+item)



                # desti_group = Destinataire_Group.objects.filter(group_id=int(item))
                # for d in desti_group:
                #     print('  Destinataire et Groupe  '+str(d))
                #     email = EmailMultiAlternatives('Message de teste', 'cc MANE message du groupe séléctionné <img src="http://www.emc2-group.com/templates/emc2/images/logo.gif" alt=""/>',
                #                               to = [str(d)])
                # email.content_subtype = 'html'
                # email.send()


        else:
            valeurs = '1111111111111111'

        #json_response = {'success': True, 'message': 'message envoye au groupe %s'%valeurs}
    return HttpResponse('Message envoyé au groupe séléctionné ')



        # html = render_to_string('sendselectiongroup.html', {'valeurs':valeurs})
        # return HttpResponse(html)
    #return HttpResponse(' Le message a ete envoye au groupe selectionne aaaaa %s'%valeurs)
    #return render(request, 'sendselectiongroup.html',{'valeurs':valeurs})





    # print('L identifiant est '+id)
    # desti_group = Destinataire_Group.objects.filter(group_id=id)
    # for d in desti_group:
    #     print(' Destinataire et Groupe '+str(d))
    #     email = EmailMultiAlternatives('Message de teste', 'cc message du groupe séléctionné <img src="http://www.emc2-group.com/templates/emc2/images/logo.gif" alt=""/>',
    #                                   to = [str(d)])
    #     email.content_subtype = 'html'
    #     email.send()
    # if request.is_ajax():






# def sendsms(to_number, body):
#     #message = SmsMessage(body='lolcats make me hungry', from_phone='+221771096893', to=['+221779258627'])
#     #message.send()
#     #api.send_sms(body='I can haz txt', from_phone='+221771096893', to=['+221779258627'])
#     #return HttpResponse(' Sms Envoyé avec Success')
#
#     client = twilio.rest.TwilioRestClient(
#         settings.TWILIO_ACCOUNT_SID, settings.TWILIO_AUTH_TOKEN)
#
#     return client.messages.create(
#         body=body,
#         to=to_number,
#         from_=settings.TWILIO_PHONE_NUMBER
#     )

#TWILIO_ACCOUNT_SID = 'AC2db9b37a818f6e07945304aaa7eba0df'
#TWILIO_AUTH_TOKEN = '235326af90061c1bdf30af81c594452f'

def sendsms(request):
    account_sid = "AC2db9b37a818f6e07945304aaa7eba0df" # Your Account SID from www.twilio.com/console
    auth_token = "235326af90061c1bdf30af81c594452f"  # Your Auth Token from www.twilio.com/console

    client = TwilioRestClient(account_sid, auth_token)

    message = client.messages.create(body="Hello from Python it is my first test ",
        to="+221771096893",    # Replace with your phone number
        from_="+12568407392") # Replace with your Twilio number
    print(message.sid)
    return HttpResponse(' Sms Envoyé avec Success')




def login(request):
    return render(request, 'login.html', {})


def accueil(request):
    return render(request, 'login.html', {})


def logout_account(request):

    request.session.flush()
    return render(request, 'index.html', {})



def index2(request):

    return render(request, 'index2.html')




def login_account(request):
    # user = authenticate(email=request.POST.get('email'), password=request.POST.get('password'))

    if User.objects.filter(email=request.POST.get('email'), password=request.POST.get('password')).count() == 1:
        page = '#'

        user = User.objects.get(email=request.POST.get('email'), password=request.POST.get('password'))
        request.session['first_name'] = user.first_name
        request.session['last_name'] = user.last_name
        request.session['id'] = user.id
        return render(request, 'dashboard.html', {})

    #     lesevenements = Evenement.objects.filter(utilisateur=user)
    #     if lesevenements.count() > 0:
    #         page = '#page'
    #     if user.type == 'O':
    #         return render(request, 'dashboard.html', locals())
    #     if user.type == 'I':
    #         lespo = Pageofficielle.objects.filter(institution=(Institution.objects.get(utilisateur=user)))
    #         if lespo.count() > 0:
    #             page = '#page'
    #         return render(request, 'dashboard2.html', locals())
    # request.session['connexion'] = True

    return render(request, 'login.html', {'error': 'Echec authentification'})


def contacter(request):

    send_mail('Contact', request.POST['name']+'    '+request.POST['content']+' Message ',
              'aliounemane2@gmail.com', [request.POST['email']])
    return render(request, 'index2.html', {'sucess': ' Votre mail a été bien envoyé '})