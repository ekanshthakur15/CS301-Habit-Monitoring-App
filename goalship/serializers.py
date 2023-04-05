from rest_framework.serializers import ModelSerializer
from .models import Profile, Reward, UserReward, Friends, Goal, DailyProgress

class ProfileSerializer(ModelSerializer):
    class Meta:
        model = Profile
        fields = ('name', 'age' , 'gender', 'image', 'email')

class RewardSerializer(ModelSerializer):
    class Meta:
        model = Reward
        fields = ('name', 'description', 'points_required')

class FriendSerializer(ModelSerializer):
    class Meta:
        model = Friends
        fields = ('user', 'friend')

class UserRewardSerializer(ModelSerializer):
    class Meta:
        model = UserReward
        fields = ('user', 'reward', 'redeemed')

class GoalSerializer(ModelSerializer):
    class Meta:
        model = Goal
        fields = ('name', 'start_date', 'end_date', 'user', 'progress', 'pregress_type', 'frequency')

class DailyProgressSerializer(ModelSerializer):
    class Meta:
        model = DailyProgress
        fields = ('goal','progress_date', 'progress_amount')