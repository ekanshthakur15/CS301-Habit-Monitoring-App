from rest_framework import serializers
from .models import *
from django.contrib.auth.models import User

class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = ("id", "username", 'email', 'password')
        depth = 1

class FriendSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ('id', 'name', 'age', 'gender')
class ProfileSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only = True)
    user = UserSerializer()
    friend = FriendSerializer(many = True, read_only = True)
    gender = serializers.ChoiceField(choices= Profile.gender_choice)
    class Meta:
        model = Profile
        fields = '__all__'

    def create(self, validated_data):
        user_data = validated_data.pop('user')
        profile = Profile.objects.create(**validated_data)
        User.objects.create(**user_data)
        return profile
    def update(self, instance, validated_data):
        instance.name = validated_data.get('name', instance.name)
        instance.age = validated_data.get('age', instance.age)
        instance.gender = validated_data.get('gender', instance.gender)
        instance.image = validated_data.get('image', instance.image)
        instance.save()
        return instance
        
class RewardSerializer(serializers.ModelSerializer):
    class Meta:
        model = Reward
        fields = ('id','name', 'description', 'points_required')

class UserRewardSerializer(serializers.ModelSerializer):
    user = UserSerializer(many = True)
    reward = RewardSerializer(many = True)
    class Meta:
        model = UserReward
        fields = ('user', 'reward', 'redeemed')
class DailyProgressSerializer(serializers.ModelSerializer):
    

    class Meta:
        model = DailyProgress
        fields = ('id','goal','progress_date', 'progress_amount','progress_type')

class GoalSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only = True)
    progress_type = serializers.ChoiceField(choices= Goal.progress_choice)
    class Meta:
        model = Goal
        fields = '__all__'