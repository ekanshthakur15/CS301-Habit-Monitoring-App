from django.shortcuts import render
from .serializers import *
from .models import *
from django.contrib.auth.models import User
from django.utils import timezone
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from django.db.models import Count
from datetime import datetime, date
from rest_framework.permissions import IsAuthenticated
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import authenticate
from rest_framework.authtoken.models import Token
from django.shortcuts import get_object_or_404
from django.db.models import Q
#from .permissions import IsFriend


# Create your views here.


#Working View to create a new goal and save it

class CreateGoal(APIView):

    def post(self, request, format = None):
        serializer = GoalSerializer(data= request.data, partial = True)
        if serializer.is_valid():
            goal = serializer.save(user=request.user, start_date=date.today())
            daily_progress = DailyProgress(goal = goal, progress_date = date.today(), progress_amount = 0)
            daily_progress.save()
            rewards = Reward.objects.all()
            for reward in rewards:
                user_reward = UserReward(goal = goal, user = request.user, reward = reward, redeemed = False)
                user_reward.save()
            return Response(serializer.data, status= status.HTTP_201_CREATED)
        return Response(serializer.errors, status= status.HTTP_400_BAD_REQUEST)

# Working View to retirieve user info on profile settings page
class ProfileView(APIView):
    permission_classes = [IsAuthenticated]
    
    #function to get the user info
    def get(self, request, format = None):
        user = request.user
        try:
            profile = Profile.objects.get(user = user)
        except Profile.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        
        data = {
            'name': profile.name,
            'age':profile.age,
            'gender' : profile.gender,
            'profile_picture': profile.image,
            'email' : profile.user.email
        }
        return Response(data)
    
    # function to edit the user info
    def put(self, request,*args, **kwargs):
        user = request.user
        profile = get_object_or_404(Profile, user = user)
        serializer = ProfileSerializer(instance = profile, data= request.data, partial = True)

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# View to get all the rewards and their info

class RewardView(APIView):

    def get(self, request):
        queryset = Reward.objects.all()
        serializer = RewardSerializer(queryset, many = True)
        return Response(serializer.data)


#View to show user rewards

class UserRewardView(APIView):
    
    def get(self, request,id):

        try:
            user = User.objects.get(id = id)
        except User.DoesNotExist:
            return Response(status= status.HTTP_404_NOT_FOUND)
        
        user_rewards = UserReward.objects.filter(user = user, redeemed = True)
        rewards = [ur.rewards for ur in user_rewards] #list comprehension to get list of Reward objects
        serializer = RewardSerializer(rewards, many = True)
        return Response(serializer.data)
    

# Working View to show the list of friends and to create user 

class FriendListView(APIView):
    permission_classes = [IsAuthenticated]
    def post(self, request,format = None):
        serializer = ProfileSerializer(data= request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(status= status.HTTP_400_BAD_REQUEST)

    def get(self, request):
        user = request.user
        friends = user.profile.friends.all()
        data = []
        for friend in friends:
            user = friend.user
            user_rewards = UserReward.objects.filter(user = user, redeemed = True)
            rewards_count = user_rewards.count()
            friend_data = {
                'name' : user.profile.name,
                'profile_picture' : friend.image,
                'reward_count': rewards_count,
            }
            data.append(friend_data)
        return Response(data, status= status.HTTP_200_OK)
    
# Working View to display info about a friend and remove them

class UserDetail(APIView):
    permission_classes = [IsAuthenticated]

    def get_object(self, id):
        try:
            return User.objects.get(id=id)
        except User.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)

    def get(self, request,friend_id):
        friend = self.get_object(friend_id)
        friend_profile = Profile.objects.get(user = friend)
        friend_rewards = UserReward.objects.filter(user = friend)

        reward_data = []
        for reward in friend_rewards:
            reward_data.append({
                'name' : reward.reward.name
            })
        data = {
            'name' : friend_profile.name,
            'profile_picture' : friend_profile.image,
            'rewards' : reward_data
        }

        return Response(data)
        
    def delete(self, request, friend_id):
        friend = self.get_object(friend_id).profile

        user = request.user
        user.profile.friends.remove(friend)
        return Response(status = status.HTTP_204_NO_CONTENT)
        
    def post(self, request, friend_id):
        friend = self.get_object(friend_id).profile
        user = request.user
        user.profile.friends.add(friend)
        return Response(status=status.HTTP_201_CREATED)

#View to display the information about the goals of the friends

#Working view for login
class UserLoginView(APIView):
    @csrf_exempt
    def post(self, request, format = None):
        username = request.data.get('username')
        password = request.data.get('password')
        user = authenticate(request, username = username, password = password)

        if user is not None:
            token, created = Token.objects.get_or_create(user = user)
            return Response({'token': token.key})
        return Response(status= status.HTTP_400_BAD_REQUEST)
    
# View to create a dailyprogress object for every goal daily

def create_daily_progress():
        goals = Goal.objects.all()

        for goal in goals:
            daily_progress_exists = DailyProgress.objects.filter(
                goal = goal,
                progress_date = timezone.now().today()
            ).exists()
            if not daily_progress_exists:
                DailyProgress.objects.create(goal = goal, progress_date = timezone.now().today(), progress_amount = 0)
        return Response(status= status.HTTP_201_CREATED)

# View for personl progress information page
class PersonalProgressListView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        user = request.user
        progress_counter = 0
        limit_counter = 0
        goals = Goal.objects.filter(user = user)
        today = datetime.now().date()
        all_goal_data = []

        # to get the total progress percentage
        for goal in goals:
            limit_counter += goal.progress
            daily_progress = DailyProgress.objects.filter(goal = goal, progress_date = today).first()
            if daily_progress is not None:
                daily_amount = daily_progress.progress_amount
                progress_counter += daily_amount
        progress_percentage = (progress_counter/limit_counter)*100
        total_date = {
            'name': 'total_progress',
            'progress_amount': progress_percentage,
            'progress_type' : 'percentage'
        }
        all_goal_data.append(total_date)

        # to get the informationn about every goal
        for goal in goals:
           daily_progress = DailyProgress.objects.filter(
               goal=goal, progress_date=today).first()
           daily_amount = daily_progress.progress_amount
           progress_percentage = (daily_amount/goal.progress)*100
           data = {
               'id':goal.id,
               'name': goal.name,
               'icon': goal.image,
               'progress_amount': progress_percentage,
           }
           all_goal_data.append(data)
        return Response(all_goal_data)
    
#View for searching user
class SearchView(APIView):
    
    def get(self, request):
        list = []
        search_query = request.query_params.get('q', '')
        profiles = Profile.objects.filter(Q(name__icontains = search_query))
        for profile in profiles:
            data = {
                "name" : profile.name,
                "profile_picture": profile.image
            }
            list.append(data)
        return Response(list)

#incomplete View
class GoalDetailView(APIView):
    def get(self, request, goal_id):
        try:
            goal = Goal.objects.get(id=goal_id)
        except Goal.DoesNotExist:
            Response(status=status.HTTP_404_NOT_FOUND)
        today = datetime.now().date()
        daily_progress = DailyProgress.objects.get(goal = goal, progress_date = today)
        progress_percentage = (daily_progress.progress_amount)/(goal.progress)*100
        dates = []
        completed_objects = DailyProgress.objects.filter(goal = goal)
        for object in completed_objects:
            if object.progress_amount >= goal.progress:
                date = {
                    "completed_date": object.progress_date,
                }
                dates.append(date)
        detail = {
            "name": goal.name,
            "progress_percentage": progress_percentage,
            "completed_dates": dates,
            "duration":goal.duration,
            "completed": goal.frequency
        }
        return Response(detail)
        
        
    def put(self, request, goal_id):
        try:
            goal = Goal.objects.filter(id=goal_id).first()
        except Goal.DoesNotExist:
            Response(status=status.HTTP_404_NOT_FOUND)
        today = datetime.now().date()
        print('something')
        snippet = DailyProgress.objects.get(goal=goal, progress_date=today)
        serializer = UpdateDailyProgress(snippet, data=request.data)
        rewards = UserReward.objects.filter(user=request.user, goal=goal)
        if serializer.is_valid():
            serializer.save()
            new_progress_amount = serializer.validated_data.get(
                'progress_amount')

            if new_progress_amount >= goal.progress:
                goal.frequency += 1
                goal.save()

                current_frequency = goal.frequency
                for reward in rewards:
                    if (current_frequency >= reward.reward.points_required & reward.redeemed == False):
                        reward.redeemed = True
                        reward.save()

            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# View for Reward detail

class UserRewardDetail(APIView):

    def get(self, request, reward_id):
        reward = Reward.objects.get(id = reward_id)
        user_rewards = UserReward.objects.filter(reward = reward , user = request.user)
        associated_goals = []
        for user_reward in user_rewards:
            goals = {
                "goal_name": user_reward.goal.name,
                "redeemed" : user_reward.redeemed
            }
            associated_goals.append(goals)
        
        data = {
            "name ": reward.name,
            "description":reward.description,
            "image": reward.image,
            "associated_goals": associated_goals
            
        }
        
        return Response(data)
    
class HomePageView(APIView):

    def get(self, request, date_str):
        date = datetime.strptime(date_str, '%Y-%m-%d').date()
        user_profile = get_object_or_404(Profile, user = request.user)

        friend_list = user_profile.friends.all()
        whole_data = []
        
        for friend in friend_list:
            goals = Goal.objects.filter( user = friend.user)
            goal_data = []
            for goal in goals:
                progress = DailyProgress.objects.filter(goal = goal, progress_date = date).first()
                target = goal.progress
                goal_progress = (progress.progress_amount/target)*100
                data = {
                    "goal_name": goal.name,
                    "goal_progress" : goal_progress
                }
                goal_data.append(data)

            friend_data = {
                "name" : friend.name,
                "goals" : goal_data
            }
            whole_data.append(friend_data)


        return Response(whole_data,status=status.HTTP_200_OK)