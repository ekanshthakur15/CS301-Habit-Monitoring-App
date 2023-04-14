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
        serializer = GoalSerializer(data= request.data)
        if serializer.is_valid():
            goal = serializer.save(user=request.user, start_date=date.today())
            daily_progress = DailyProgress(goal = goal, progress_date = date.today(), progress_amount = 0)
            daily_progress.save()
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
            'profile_picture': request.build_absolute_uri(profile.image),
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
            user_rewards = UserReward.objects.filter(user = user)
            rewards_count = user_rewards.count()
            friend_data = {
                'name' : user.profile.name,
                'profile_picture' : request.build_absolute_uri(user.profile.image.url),
                'reward_count': rewards_count,
            }
            data.append(friend_data)
        return Response(data)
    
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
            'profile_picture' : request.build_absolute_uri(friend_profile.image.url),
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

class HomePageView(APIView):

    def get(self, request, date):
        user = request.user
        friends = user.profile.friends.filter(user = user)

        date = datetime.strptime(date, '%Y-%m-%d').date()

        friends_goal = []
        for friend in friends:
            friends_data = {'name': friend.friend_of.name, 'goals': []}
            goals = Goal.objects.filter(user = friend.friend_of)
            for goal in goals:
                goal_data = GoalSerializer(goal).data
                daily_progress = DailyProgress.objects.filter(goal = goal, progress_date = date
                                                              ).first()
                if daily_progress:
                    progress_data = DailyProgressSerializer(daily_progress).data
                    goal_data['today_progress'] = progress_data['progress_amount']
                else:
                    goal_data['today_progress'] = None
                friends_data['goals'].append(goal_data)
            friends_goal.append(friends_data)
        return Response(friends_goal, status= status.HTTP_200_OK)
    

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

        for goal in goals:
           daily_progress = DailyProgress.objects.filter(
               goal=goal, progress_date=today).first()
           daily_amount = daily_progress.progress_amount
           data = {
               'id':goal.id,
               'name': goal.name,
               'progress_amount': daily_amount,
               'progress_type': goal.progress_type
           }
           all_goal_data.append(data)
        return Response(all_goal_data)
    
    def put(self, request, goal_id):
        try:
            goal = Goal.objects.filter(id = goal_id)
        except Goal.DoesNotExist:
            Response(status= status.HTTP_404_NOT_FOUND)
        serializer = UpdateDailyProgress(data= request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializers.data, status= status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
#View for searching user
class SearchView(APIView):
    
    def get(self, request):
        list = []
        search_query = request.query_params.get('q', '')
        profiles = Profile.objects.filter(Q(name__icontains = search_query))
        for profile in profiles:
            data = {
                "name" : profile.name,
                "profile_picture": request.build_absolute_uri(profile.image.url)
            }
            list.append(data)
        return Response(list)
