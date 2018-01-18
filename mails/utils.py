#-*- coding: utf-8 -*-

from django.conf import settings

import twilio
import twilio.rest


def sendsms(to_number, body):
    #message = SmsMessage(body='lolcats make me hungry', from_phone='+221771096893', to=['+221779258627'])
    #message.send()
    #api.send_sms(body='I can haz txt', from_phone='+221771096893', to=['+221779258627'])
    #return HttpResponse(' Sms Envoyé avec Success')

    client = twilio.rest.TwilioRestClient(
        settings.TWILIO_ACCOUNT_SID, settings.TWILIO_AUTH_TOKEN)

    return client.messages.create(
        body=body,
        to=to_number,
        from_=settings.TWILIO_PHONE_NUMBER
    )

