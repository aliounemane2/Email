from users.models import *
from rest_framework import serializers
from fcm.models import Device







class UserSerializer(serializers.ModelSerializer):
    # interest = InterestSerializer(read_only=True)
    class Meta:
        model = User
        fields = '__all__'